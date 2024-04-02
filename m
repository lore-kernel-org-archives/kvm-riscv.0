From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 2 Apr 2024 01:42:26 -0700
Subject: [PATCH v4 15/15] KVM: riscv: selftests: Add a test for counter
 overflow
In-Reply-To: <20240302-fb3a4d2c7918a24d10ee4a63@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-16-atishp@rivosinc.com>
 <20240302-fb3a4d2c7918a24d10ee4a63@orel>
Message-ID: <f9bac0a6-5fbe-4928-b6c4-94f70c726cbe@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/2/24 04:35, Andrew Jones wrote:
> On Wed, Feb 28, 2024 at 05:01:30PM -0800, Atish Patra wrote:
>> Add a test for verifying overflow interrupt. Currently, it relies on
>> overflow support on cycle/instret events. This test works for cycle/
>> instret events which support sampling via hpmcounters on the platform.
>> There are no ISA extensions to detect if a platform supports that. Thus,
> 
> Ouch. Are there discussions/proposals as to how we can do better with
> discoverability here? This type of thing sounds like the types of things
> that get new extension names defined for them as part of the profile spec
> work.
> 

There is a Perf events TG started (last month) which will work on 
standardzing perf events for RISC-V.

Perf tool can also rely on the json file to figure out if sampling 
support or not. But for kselftests we don't have any of these 
infrastructure.

>> this test will fail on platform with virtualization but doesn't
>> support overflow on these two events.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   tools/testing/selftests/kvm/riscv/sbi_pmu.c | 126 +++++++++++++++++++-
>>   1 file changed, 125 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu.c b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
>> index 8ea2a6db6610..c0264c636054 100644
>> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu.c
>> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
>> @@ -8,6 +8,7 @@
>>    * Copyright (c) 2024, Rivos Inc.
>>    */
>>   
>> +#include "asm/csr.h"
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>> @@ -16,6 +17,7 @@
>>   #include "kvm_util.h"
>>   #include "test_util.h"
>>   #include "processor.h"
>> +#include "arch_timer.h"
>>   
>>   /* Maximum counters (firmware + hardware)*/
>>   #define RISCV_MAX_PMU_COUNTERS 64
>> @@ -26,6 +28,11 @@ union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
>>   static void *snapshot_gva;
>>   static vm_paddr_t snapshot_gpa;
>>   
>> +static int pmu_irq = IRQ_PMU_OVF;
>> +
>> +static int vcpu_shared_irq_count;
>> +static int counter_in_use;
>> +
>>   /* Cache the available counters in a bitmask */
>>   static unsigned long counter_mask_available;
>>   
>> @@ -69,7 +76,9 @@ unsigned long pmu_csr_read_num(int csr_num)
>>   #undef switchcase_csr_read
>>   }
>>   
>> -static inline void dummy_func_loop(int iter)
>> +static void stop_counter(unsigned long counter, unsigned long stop_flags);
>> +
>> +static inline void dummy_func_loop(uint64_t iter)
>>   {
>>   	int i = 0;
>>   
>> @@ -88,6 +97,26 @@ static void guest_illegal_exception_handler(struct ex_regs *regs)
>>   	regs->epc += 4;
>>   }
>>   
>> +static void guest_irq_handler(struct ex_regs *regs)
>> +{
>> +	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
>> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
>> +	unsigned long overflown_mask;
>> +
>> +	/* Stop all counters first to avoid further interrupts */
>> +	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0, 1UL << counter_in_use,
>> +		  SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT, 0, 0, 0);
>> +
>> +	csr_clear(CSR_SIP, BIT(pmu_irq));
>> +
>> +	overflown_mask = READ_ONCE(snapshot_data->ctr_overflow_mask);
>> +	GUEST_ASSERT(overflown_mask & (1UL << counter_in_use));
>> +
>> +	/* Validate that we are in the correct irq handler */
>> +	GUEST_ASSERT_EQ(irq_num, pmu_irq);
> 
> Should probably do this irq handler assert first.
> 

Done.

>> +	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
>> +}
>> +
>>   static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
>>   				       unsigned long cflags,
>>   				       unsigned long event)
>> @@ -263,6 +292,32 @@ static void test_pmu_event_snapshot(unsigned long event)
>>   	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
>>   }
>>   
>> +static void test_pmu_event_overflow(unsigned long event)
>> +{
>> +	unsigned long counter;
>> +	unsigned long counter_value_post;
>> +	unsigned long counter_init_value = ULONG_MAX - 10000;
>> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
>> +
>> +	counter = get_counter_index(0, counter_mask_available, 0, event);
>> +	counter_in_use = counter;
>> +
>> +	/* The counter value is updated w.r.t relative index of cbase passed to start/stop */
>> +	WRITE_ONCE(snapshot_data->ctr_values[0], counter_init_value);
>> +	start_counter(counter, SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT, 0);
>> +	dummy_func_loop(10000);
>> +	udelay(msecs_to_usecs(2000));
>> +	/* irq handler should have stopped the counter */
>> +
>> +	counter_value_post = READ_ONCE(snapshot_data->ctr_values[counter_in_use]);
>> +	/* The counter value after stopping should be less the init value due to overflow */
>> +	__GUEST_ASSERT(counter_value_post < counter_init_value,
>> +		       "counter_value_post %lx counter_init_value %lx for counter\n",
>> +		       counter_value_post, counter_init_value);
>> +
>> +	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
>> +}
>> +
>>   static void test_invalid_event(void)
>>   {
>>   	struct sbiret ret;
>> @@ -361,6 +416,43 @@ static void test_pmu_events_snaphost(int cpu)
>>   	GUEST_DONE();
>>   }
>>   
>> +static void test_pmu_events_overflow(int cpu)
> 
> no need for cpu
> 

Fixed.

>> +{
>> +	long out_val = 0;
>> +	bool probe;
>> +	int num_counters = 0;
>> +	unsigned long sbi_impl_version;
>> +
>> +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
>> +	GUEST_ASSERT(probe && out_val == 1);
>> +
>> +	sbi_impl_version = get_host_sbi_impl_version();
>> +	if (sbi_impl_version >= sbi_mk_version(2, 0))
>> +		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");
> 
> Identical probe and version check as test_pmu_events_snaphost(). Can
> factor out.
> 

Done.

>> +
>> +	snapshot_set_shmem(snapshot_gpa, 0);
>> +	csr_set(CSR_IE, BIT(pmu_irq));
>> +	local_irq_enable();
>> +
>> +	/* Get the counter details */
>> +	num_counters = get_num_counters();
>> +	update_counter_info(num_counters);
>> +
>> +	/*
>> +	 * Qemu supports overflow for cycle/instruction.
>> +	 * This test may fail on any platform that do not support overflow for these two events.
>> +	 */
>> +	test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
>> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 1);
>> +
>> +	/* Renable the interrupt again for another event */
>> +	csr_set(CSR_IE, BIT(pmu_irq));
>> +	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
>> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
>> +
>> +	GUEST_DONE();
>> +}
>> +
>>   static void run_vcpu(struct kvm_vcpu *vcpu)
>>   {
>>   	struct ucall uc;
>> @@ -449,6 +541,35 @@ static void test_vm_events_snapshot_test(void *guest_code)
>>   	test_vm_destroy(vm);
>>   }
>>   
>> +static void test_vm_events_overflow(void *guest_code)
>> +{
>> +	struct kvm_vm *vm = NULL;
>> +	struct kvm_vcpu *vcpu = NULL;
> 
> nit: no need for NULL
> 
>> +
>> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
>> +	__TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(KVM_RISCV_SBI_EXT_PMU)),
>> +				   "SBI PMU not available, skipping test");
>> +
>> +	__TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_SSCOFPMF)),
>> +				   "Sscofpmf is not available, skipping overflow test");
>> +
>> +
>> +	test_vm_setup_snapshot_mem(vm, vcpu);
>> +	vm_init_vector_tables(vm);
>> +	vm_install_interrupt_handler(vm, guest_irq_handler);
>> +
>> +	vcpu_init_vector_tables(vcpu);
>> +	/* Initialize guest timer frequency. */
>> +	vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency), &timer_freq);
>> +	sync_global_to_guest(vm, timer_freq);
> 
> I just noticed that timer_freq is in arch_timer.h and isn't an extern...
> Fixing that is out of scope for this series though.
> 

Yeah. I can add a patch for that.
But declaring it as an extern requires the definitions to be in either 
common source file (i.e processor.c) or define it in each tests using 
timer_freq.

The first approach is bit odd with header file and definition residing 
two different source/header file.

Any preference ?

>> +
>> +	vcpu_args_set(vcpu, 1, 0);
> 
> no need for args
> 

Fixed.

>> +
>> +	run_vcpu(vcpu);
>> +
>> +	test_vm_destroy(vm);
>> +}
>> +
>>   int main(void)
>>   {
>>   	test_vm_basic_test(test_pmu_basic_sanity);
>> @@ -460,5 +581,8 @@ int main(void)
>>   	test_vm_events_snapshot_test(test_pmu_events_snaphost);
>>   	pr_info("SBI PMU event verification with snapshot test : PASS\n");
>>   
>> +	test_vm_events_overflow(test_pmu_events_overflow);
>> +	pr_info("SBI PMU event verification with overflow test : PASS\n");
>> +
>>   	return 0;
>>   }
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> drew



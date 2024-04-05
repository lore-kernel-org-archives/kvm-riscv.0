From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 5 Apr 2024 15:23:20 +0200
Subject: [PATCH v5 22/22] KVM: riscv: selftests: Add a test for counter
 overflow
In-Reply-To: <20240403080452.1007601-23-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-23-atishp@rivosinc.com>
Message-ID: <20240405-3a20fe10d65368651c2d23fa@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 03, 2024 at 01:04:51AM -0700, Atish Patra wrote:
> Add a test for verifying overflow interrupt. Currently, it relies on
> overflow support on cycle/instret events. This test works for cycle/
> instret events which support sampling via hpmcounters on the platform.
> There are no ISA extensions to detect if a platform supports that. Thus,
> this test will fail on platform with virtualization but doesn't
> support overflow on these two events.

Maybe we should give the user a command line option to disable this test
in case the platform they're testing doesn't support it but they want to
run the rest of the tests without getting a FAIL.

> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 7d195be5c3d9..451db956b885 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -14,6 +14,7 @@
>  #include "test_util.h"
>  #include "processor.h"
>  #include "sbi.h"
> +#include "arch_timer.h"
>  
>  /* Maximum counters(firmware + hardware) */
>  #define RISCV_MAX_PMU_COUNTERS 64
> @@ -24,6 +25,9 @@ union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
>  static void *snapshot_gva;
>  static vm_paddr_t snapshot_gpa;
>  
> +static int vcpu_shared_irq_count;
> +static int counter_in_use;
> +
>  /* Cache the available counters in a bitmask */
>  static unsigned long counter_mask_available;
>  
> @@ -117,6 +121,31 @@ static void guest_illegal_exception_handler(struct ex_regs *regs)
>  	regs->epc += 4;
>  }
>  
> +static void guest_irq_handler(struct ex_regs *regs)
> +{
> +	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
> +	unsigned long overflown_mask;
> +	unsigned long counter_val = 0;
> +
> +	/* Validate that we are in the correct irq handler */
> +	GUEST_ASSERT_EQ(irq_num, IRQ_PMU_OVF);
> +
> +	/* Stop all counters first to avoid further interrupts */
> +	stop_counter(counter_in_use, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
> +
> +	csr_clear(CSR_SIP, BIT(IRQ_PMU_OVF));
> +
> +	overflown_mask = READ_ONCE(snapshot_data->ctr_overflow_mask);
> +	GUEST_ASSERT(overflown_mask & 0x01);
> +
> +	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
> +
> +	counter_val = READ_ONCE(snapshot_data->ctr_values[0]);
> +	/* Now start the counter to mimick the real driver behavior */
> +	start_counter(counter_in_use, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_val);
> +}
> +
>  static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
>  				       unsigned long cflags,
>  				       unsigned long event)
> @@ -276,6 +305,33 @@ static void test_pmu_event_snapshot(unsigned long event)
>  	stop_reset_counter(counter, 0);
>  }
>  
> +static void test_pmu_event_overflow(unsigned long event)
> +{
> +	unsigned long counter;
> +	unsigned long counter_value_post;
> +	unsigned long counter_init_value = ULONG_MAX - 10000;
> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
> +
> +	counter = get_counter_index(0, counter_mask_available, 0, event);
> +	counter_in_use = counter;
> +
> +	/* The counter value is updated w.r.t relative index of cbase passed to start/stop */
> +	WRITE_ONCE(snapshot_data->ctr_values[0], counter_init_value);
> +	start_counter(counter, SBI_PMU_START_FLAG_INIT_SNAPSHOT, 0);
> +	dummy_func_loop(10000);
> +	udelay(msecs_to_usecs(2000));
> +	/* irq handler should have stopped the counter */
> +	stop_counter(counter, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
> +
> +	counter_value_post = READ_ONCE(snapshot_data->ctr_values[0]);
> +	/* The counter value after stopping should be less the init value due to overflow */
> +	__GUEST_ASSERT(counter_value_post < counter_init_value,
> +		       "counter_value_post %lx counter_init_value %lx for counter\n",
> +		       counter_value_post, counter_init_value);
> +
> +	stop_reset_counter(counter, 0);
> +}
> +
>  static void test_invalid_event(void)
>  {
>  	struct sbiret ret;
> @@ -366,6 +422,34 @@ static void test_pmu_events_snaphost(void)
>  	GUEST_DONE();
>  }
>  
> +static void test_pmu_events_overflow(void)
> +{
> +	int num_counters = 0;
> +
> +	/* Verify presence of SBI PMU and minimum requrired SBI version */
> +	verify_sbi_requirement_assert();
> +
> +	snapshot_set_shmem(snapshot_gpa, 0);
> +	csr_set(CSR_IE, BIT(IRQ_PMU_OVF));
> +	local_irq_enable();
> +
> +	/* Get the counter details */
> +	num_counters = get_num_counters();
> +	update_counter_info(num_counters);
> +
> +	/*
> +	 * Qemu supports overflow for cycle/instruction.
> +	 * This test may fail on any platform that do not support overflow for these two events.
> +	 */
> +	test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 1);
> +
> +	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
> +
> +	GUEST_DONE();
> +}
> +
>  static void run_vcpu(struct kvm_vcpu *vcpu)
>  {
>  	struct ucall uc;
> @@ -451,6 +535,33 @@ static void test_vm_events_snapshot_test(void *guest_code)
>  	test_vm_destroy(vm);
>  }
>  
> +static void test_vm_events_overflow(void *guest_code)
> +{
> +	struct kvm_vm *vm = NULL;
> +	struct kvm_vcpu *vcpu;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
> +				   "SBI PMU not available, skipping test");
> +
> +	__TEST_REQUIRE(__vcpu_has_isa_ext(vcpu, KVM_RISCV_ISA_EXT_SSCOFPMF),
> +				   "Sscofpmf is not available, skipping overflow test");
> +
> +

extra blank line here

> +	test_vm_setup_snapshot_mem(vm, vcpu);
> +	vm_init_vector_tables(vm);
> +	vm_install_interrupt_handler(vm, guest_irq_handler);
> +
> +	vcpu_init_vector_tables(vcpu);
> +	/* Initialize guest timer frequency. */
> +	vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency), &timer_freq);
> +	sync_global_to_guest(vm, timer_freq);
> +
> +	run_vcpu(vcpu);
> +
> +	test_vm_destroy(vm);
> +}
> +
>  int main(void)
>  {
>  	pr_info("SBI PMU basic test : starting\n");
> @@ -463,5 +574,8 @@ int main(void)
>  	test_vm_events_snapshot_test(test_pmu_events_snaphost);
>  	pr_info("SBI PMU event verification with snapshot test : PASS\n");
>  
> +	test_vm_events_overflow(test_pmu_events_overflow);
> +	pr_info("SBI PMU event verification with overflow test : PASS\n");
> +
>  	return 0;
>  }
> -- 
> 2.34.1
>

Other than the command line option idea,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


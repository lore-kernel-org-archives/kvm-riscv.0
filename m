From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Apr 2024 01:34:54 -0700
Subject: [PATCH v4 13/15] KVM: riscv: selftests: Add SBI PMU selftest
In-Reply-To: <20240302-ed6c516829dc0ed616f39a45@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com> <20240229010130.1380926-14-atishp@rivosinc.com>
 <20240302-ed6c516829dc0ed616f39a45@orel>
Message-ID: <CAOnJCUK2D6-zP4=DiXRMeFQsMc9iG5nWY-yYHMhg83h_q+OtnQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 2, 2024 at 3:52?AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Feb 28, 2024 at 05:01:28PM -0800, Atish Patra wrote:
> > This test implements basic sanity test and cycle/instret event
> > counting tests.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  tools/testing/selftests/kvm/Makefile        |   1 +
> >  tools/testing/selftests/kvm/riscv/sbi_pmu.c | 340 ++++++++++++++++++++
> >  2 files changed, 341 insertions(+)
> >  create mode 100644 tools/testing/selftests/kvm/riscv/sbi_pmu.c
> >
> > diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> > index 426f85798aea..b2dce6843b9e 100644
> > --- a/tools/testing/selftests/kvm/Makefile
> > +++ b/tools/testing/selftests/kvm/Makefile
> > @@ -195,6 +195,7 @@ TEST_GEN_PROGS_riscv += kvm_create_max_vcpus
> >  TEST_GEN_PROGS_riscv += kvm_page_table_test
> >  TEST_GEN_PROGS_riscv += set_memory_region_test
> >  TEST_GEN_PROGS_riscv += steal_time
> > +TEST_GEN_PROGS_riscv += riscv/sbi_pmu
>
> We put the
>
>  TEST_GEN_PROGS_riscv += riscv/...
>
> lines at the top of the
>
>  TEST_GEN_PROGS_riscv += ...
>

Done.

> set
>
> >
> >  SPLIT_TESTS += arch_timer
> >  SPLIT_TESTS += get-reg-list
> > diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu.c b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
> > new file mode 100644
> > index 000000000000..fc1fc5eea99e
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
> > @@ -0,0 +1,340 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * arch_timer.c - Tests the riscv64 sstc timer IRQ functionality
> > + *
> > + * The test validates the sstc timer IRQs using vstimecmp registers.
> > + * It's ported from the aarch64 arch_timer test.
>
> The header (apparently borrowed from arch_timer.c) needs to be updated
> to talk about the pmu instead of the timer.
>

Oops. Thanks for catching it. Fixed it.

> > + *
> > + * Copyright (c) 2024, Rivos Inc.
> > + */
> > +
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <unistd.h>
> > +#include <sys/types.h>
> > +#include "kvm_util.h"
> > +#include "test_util.h"
> > +#include "processor.h"
> > +
> > +/* Maximum counters (firmware + hardware)*/
>                                             ^ space
>
> > +#define RISCV_MAX_PMU_COUNTERS 64
> > +union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
> > +
> > +/* Cache the available counters in a bitmask */
> > +static unsigned long counter_mask_available;
> > +
> > +unsigned long pmu_csr_read_num(int csr_num)
> > +{
> > +#define switchcase_csr_read(__csr_num, __val)                {\
> > +     case __csr_num:                                 \
> > +             __val = csr_read(__csr_num);            \
> > +             break; }
> > +#define switchcase_csr_read_2(__csr_num, __val)              {\
> > +     switchcase_csr_read(__csr_num + 0, __val)        \
> > +     switchcase_csr_read(__csr_num + 1, __val)}
> > +#define switchcase_csr_read_4(__csr_num, __val)              {\
> > +     switchcase_csr_read_2(__csr_num + 0, __val)      \
> > +     switchcase_csr_read_2(__csr_num + 2, __val)}
> > +#define switchcase_csr_read_8(__csr_num, __val)              {\
> > +     switchcase_csr_read_4(__csr_num + 0, __val)      \
> > +     switchcase_csr_read_4(__csr_num + 4, __val)}
> > +#define switchcase_csr_read_16(__csr_num, __val)     {\
> > +     switchcase_csr_read_8(__csr_num + 0, __val)      \
> > +     switchcase_csr_read_8(__csr_num + 8, __val)}
> > +#define switchcase_csr_read_32(__csr_num, __val)     {\
> > +     switchcase_csr_read_16(__csr_num + 0, __val)     \
> > +     switchcase_csr_read_16(__csr_num + 16, __val)}
> > +
> > +     unsigned long ret = 0;
> > +
> > +     switch (csr_num) {
> > +     switchcase_csr_read_32(CSR_CYCLE, ret)
> > +     switchcase_csr_read_32(CSR_CYCLEH, ret)
> > +     default :
> > +             break;
> > +     }
> > +
> > +     return ret;
> > +#undef switchcase_csr_read_32
> > +#undef switchcase_csr_read_16
> > +#undef switchcase_csr_read_8
> > +#undef switchcase_csr_read_4
> > +#undef switchcase_csr_read_2
> > +#undef switchcase_csr_read
> > +}
> > +
> > +static inline void dummy_func_loop(int iter)
> > +{
> > +     int i = 0;
> > +
> > +     while (i < iter) {
> > +             asm volatile("nop");
> > +             i++;
> > +     }
> > +}
> > +
> > +static void guest_illegal_exception_handler(struct ex_regs *regs)
> > +{
> > +     __GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
> > +                    "Unexpected exception handler %lx\n", regs->cause);
>
> Shouldn't we be reporting somehow that we were here? We seem to be using
> this handler to skip instructions which don't work, which is fine, if
> we have some knowledge we skipped them and then do something else.
> Otherwise I don't understand.
>

This is only used in test_vm_basic_test to validate that the guest
will get an illegal
exception if they try to access without configuring first.

Any other test that validates the functionality will not use it.

> > +
> > +     /* skip the trapping instruction */
> > +     regs->epc += 4;
> > +}
> > +
> > +static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
> > +                                    unsigned long cflags,
> > +                                    unsigned long event)
> > +{
> > +     struct sbiret ret;
> > +
> > +     ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
> > +                     cflags, event, 0, 0);
> > +     __GUEST_ASSERT(ret.error == 0, "config matching failed %ld\n", ret.error);
> > +     GUEST_ASSERT((ret.value < RISCV_MAX_PMU_COUNTERS) &&
> > +                 ((1UL << ret.value) & counter_mask_available));
>
> I'd prefer to break these apart so it's more clear which one fails, if one
> fails.
>
>    GUEST_ASSERT(ret.value < RISCV_MAX_PMU_COUNTERS);
>    GUEST_ASSERT(BIT(ret.value) & counter_mask_available);
>

Done.

> > +
> > +     return ret.value;
> > +}
> > +
> > +static unsigned long get_num_counters(void)
> > +{
> > +     struct sbiret ret;
> > +
> > +     ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_NUM_COUNTERS, 0, 0, 0, 0, 0, 0);
> > +
> > +     __GUEST_ASSERT(ret.error == 0, "Unable to retrieve number of counters from SBI PMU");
> > +
>
> nit: drop this blank line
>
> > +     __GUEST_ASSERT(ret.value < RISCV_MAX_PMU_COUNTERS,
> > +                    "Invalid number of counters %ld\n", ret.value);
> > +
> > +     return ret.value;
> > +}
> > +
> > +static void update_counter_info(int num_counters)
> > +{
> > +     int i = 0;
> > +     struct sbiret ret;
> > +
> > +     for (i = 0; i < num_counters; i++) {
> > +             ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
> > +
> > +             /* There can be gaps in logical counter indicies*/
> > +             if (!ret.error)
> > +                     GUEST_ASSERT_NE(ret.value, 0);
>
> I guess this should be
>
>   if (ret.error)
>     continue;
>   GUEST_ASSERT_NE(ret.value, 0);
>

Fixed it.

> > +
> > +             ctrinfo_arr[i].value = ret.value;
> > +             counter_mask_available |= BIT(i);
> > +     }
> > +
> > +     GUEST_ASSERT(counter_mask_available > 0);
> > +}
> > +
> > +static unsigned long read_counter(int idx, union sbi_pmu_ctr_info ctrinfo)
> > +{
> > +     unsigned long counter_val = 0;
> > +     struct sbiret ret;
> > +
> > +     __GUEST_ASSERT(ctrinfo.type < 2, "Invalid counter type %d", ctrinfo.type);
> > +
> > +     if (ctrinfo.type == SBI_PMU_CTR_TYPE_HW) {
> > +             counter_val = pmu_csr_read_num(ctrinfo.csr);
> > +     } else if (ctrinfo.type == SBI_PMU_CTR_TYPE_FW) {
> > +             ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ, idx, 0, 0, 0, 0, 0);
> > +             GUEST_ASSERT(ret.error == 0);
> > +             counter_val = ret.value;
> > +     }
> > +
> > +     return counter_val;
> > +}
> > +
> > +static void start_counter(unsigned long counter, unsigned long start_flags,
> > +                       unsigned long ival)
> > +{
> > +     struct sbiret ret;
> > +
> > +     ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, counter, 1, start_flags,
> > +                     ival, 0, 0);
> > +     __GUEST_ASSERT(ret.error == 0, "Unable to start counter %ld\n", counter);
> > +}
> > +
> > +static void stop_counter(unsigned long counter, unsigned long stop_flags)
> > +{
> > +     struct sbiret ret;
> > +
> > +     ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, counter, 1, stop_flags,
> > +                     0, 0, 0);
> > +     if (stop_flags & SBI_PMU_STOP_FLAG_RESET)
> > +             __GUEST_ASSERT(ret.error == SBI_ERR_ALREADY_STOPPED,
> > +                            "Unable to stop counter %ld\n", counter);
>
> This looks like we're abusing the SBI_PMU_STOP_FLAG_RESET flag to do the
> already-stopped test. I'd rather helper functions work generally and do
> stuff like this in test code with comments pointing it out. Or just
> cleanly and separately set up an already-stopped test, so it's clear.
>

Doing it in test code adds redundancy. I will create two separate functions.

> > +     else
> > +             __GUEST_ASSERT(ret.error == 0, "Unable to stop counter %ld error %ld\n",
> > +                            counter, ret.error);
> > +}
> > +
> > +static void test_pmu_event(unsigned long event)
> > +{
> > +     unsigned long counter;
> > +     unsigned long counter_value_pre, counter_value_post;
> > +     unsigned long counter_init_value = 100;
> > +
> > +     counter = get_counter_index(0, counter_mask_available, 0, event);
> > +     counter_value_pre = read_counter(counter, ctrinfo_arr[counter]);
> > +
> > +     /* Do not set the initial value */
> > +     start_counter(counter, 0, counter_init_value);
> > +     dummy_func_loop(10000);
> > +
>
> nit: I'd remove this blank line so we have start/dummy/stop all together
> in a group. Same comment below.
>

Fixed it.

> > +     stop_counter(counter, 0);
> > +
> > +     counter_value_post = read_counter(counter, ctrinfo_arr[counter]);
> > +     __GUEST_ASSERT(counter_value_post > counter_value_pre,
> > +                    "counter_value_post %lx counter_value_pre %lx\n",
> > +                    counter_value_post, counter_value_pre);
> > +
> > +     /* Now set the initial value and compare */
> > +     start_counter(counter, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_init_value);
>
> We should try to confirm that we reset the counter, otherwise the check
> below only proves that the value we read is greater than 100, which it
> is possible even if the reset doesn't work.
>

Hmm. There is no way to just update the counter value without starting
it. Reading it without stopping is not reliable.
Maybe we can do this.

1. Reset it to 100. Stop it immediately after and read it. Let's say
the value is X
2. Now reset it to counter  X + 1000.
3. Do the validation with the above reset value in #2.

Wdyt ?

> > +     dummy_func_loop(10000);
> > +
> > +     stop_counter(counter, 0);
> > +
> > +     counter_value_post = read_counter(counter, ctrinfo_arr[counter]);
> > +     __GUEST_ASSERT(counter_value_post > counter_init_value,
> > +                    "counter_value_post %lx counter_init_value %lx\n",
> > +                    counter_value_post, counter_init_value);
> > +
> > +     stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
> > +}
> > +
> > +static void test_invalid_event(void)
> > +{
> > +     struct sbiret ret;
> > +     unsigned long event = 0x1234; /* A random event */
> > +
> > +     ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, 0,
> > +                     counter_mask_available, 0, event, 0, 0);
> > +     GUEST_ASSERT_EQ(ret.error, SBI_ERR_NOT_SUPPORTED);
> > +}
> > +
> > +static void test_pmu_events(int cpu)
>
> cpu is unused so the parameter list can be void. Same comment for
> test_pmu_basic_sanity()
>

Fixed.


> > +{
> > +     int num_counters = 0;
> > +
> > +     /* Get the counter details */
> > +     num_counters = get_num_counters();
> > +     update_counter_info(num_counters);
> > +
> > +     /* Sanity testing for any random invalid event */
> > +     test_invalid_event();
> > +
> > +     /* Only these two events are guranteed to be present */
>
> guaranteed
>
> > +     test_pmu_event(SBI_PMU_HW_CPU_CYCLES);
> > +     test_pmu_event(SBI_PMU_HW_INSTRUCTIONS);
> > +
> > +     GUEST_DONE();
> > +}
> > +
> > +static void test_pmu_basic_sanity(int cpu)
> > +{
> > +     long out_val = 0;
> > +     bool probe;
> > +     struct sbiret ret;
> > +     int num_counters = 0, i;
> > +     unsigned long counter_val = -1;
> > +     union sbi_pmu_ctr_info ctrinfo;
> > +
> > +     probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
> > +     GUEST_ASSERT(probe && out_val == 1);
> > +
> > +     num_counters = get_num_counters();
> > +
> > +     for (i = 0; i < num_counters; i++) {
> > +             ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i,
> > +                             0, 0, 0, 0, 0);
> > +
> > +             /* There can be gaps in logical counter indicies*/
> > +             if (!ret.error)
> > +                     GUEST_ASSERT_NE(ret.value, 0);
> > +             else
> > +                     continue;
>
> nit:
>
>  if (ret.error)
>     continue;
>   GUEST_ASSERT_NE(ret.value, 0);
>

Done.

> > +
> > +             ctrinfo.value = ret.value;
> > +
> > +             /* Accesibility check of hardware and read capability of firmware counters */
>
> Accessibility
>

Fixed.

> > +             counter_val = read_counter(i, ctrinfo);
> > +             /* The spec doesn't mandate any initial value. Verify if a sane value */
> > +             GUEST_ASSERT_NE(counter_val, -1);
>
> Hmm, does -1 have any special meaning? Otherwise it's a member of the set
> of 'any', so there's nothing we can test. Or, maybe we can test that bits
> higher than the ctrinfo bitwidth are zero. Although those bits might also
> be unspecified, which means there's nothing we can test.
>

Yeah. I have removed the validation with a clarification.

> > +     }
> > +
> > +     GUEST_DONE();
> > +}
> > +
> > +static void run_vcpu(struct kvm_vcpu *vcpu)
> > +{
> > +     struct ucall uc;
> > +
> > +     vcpu_run(vcpu);
> > +     switch (get_ucall(vcpu, &uc)) {
> > +     case UCALL_ABORT:
> > +             REPORT_GUEST_ASSERT(uc);
> > +             break;
> > +     case UCALL_DONE:
> > +     case UCALL_SYNC:
> > +             break;
> > +     default:
> > +             TEST_FAIL("Unknown ucall %lu", uc.cmd);
> > +             break;
> > +     }
> > +}
> > +
> > +void test_vm_destroy(struct kvm_vm *vm)
> > +{
> > +     memset(ctrinfo_arr, 0, sizeof(union sbi_pmu_ctr_info) * RISCV_MAX_PMU_COUNTERS);
> > +     counter_mask_available = 0;
> > +     kvm_vm_free(vm);
> > +}
> > +
> > +static void test_vm_basic_test(void *guest_code)
> > +{
> > +     struct kvm_vm *vm;
> > +     struct kvm_vcpu *vcpu;
> > +
> > +     vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> > +     __TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_SBI_EXT_PMU)),
>
> Shouldn't this be checking RISCV_SBI_EXT_REG(KVM_RISCV_SBI_EXT_PMU)?
>

Oops. Fat fingers. Fixed it.

> We should probably create two more helpers
>
>  bool __vcpu_has_isa_ext(struct kvm_vcpu *vcpu, uint64_t isa_ext)
>  {
>     return __vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(isa_ext));
>  }
>  bool __vcpu_has_sbi_ext(struct kvm_vcpu *vcpu, uint64_t sbi_ext)
>  {
>     return __vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(sbi_ext));
>  }
>
> to make the extension checks less verbose and error prone.
>

Good idea. Added the patch.

> > +                                "SBI PMU not available, skipping test");
> > +     vm_init_vector_tables(vm);
> > +     /* Illegal instruction handler is required to verify read access without configuration */
> > +     vm_install_exception_handler(vm, EXC_INST_ILLEGAL, guest_illegal_exception_handler);
> > +
> > +     vcpu_init_vector_tables(vcpu);
> > +     vcpu_args_set(vcpu, 1, 0);
>
> We don't use the arguments in the guest code functions so we don't need
> this call to vcpu_args_set()
>

Done.

> > +     run_vcpu(vcpu);
> > +
> > +     test_vm_destroy(vm);
> > +}
> > +
> > +static void test_vm_events_test(void *guest_code)
> > +{
> > +     struct kvm_vm *vm = NULL;
> > +     struct kvm_vcpu *vcpu = NULL;
> > +
> > +     vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> > +     __TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_SBI_EXT_PMU)),
>
> Same comment as above.
>
> > +                                "SBI PMU not available, skipping test");
> > +     vcpu_args_set(vcpu, 1, 0);
>
> Same comment as above.
>
> > +     run_vcpu(vcpu);
> > +
> > +     test_vm_destroy(vm);
> > +}
> > +
> > +int main(void)
> > +{
> > +     test_vm_basic_test(test_pmu_basic_sanity);
> > +     pr_info("SBI PMU basic test : PASS\n");
> > +
> > +     test_vm_events_test(test_pmu_events);
> > +     pr_info("SBI PMU event verification test : PASS\n");
> > +
> > +     return 0;
> > +}
> > --
> > 2.34.1
> >
>
> Thanks,
> drew



--
Regards,
Atish


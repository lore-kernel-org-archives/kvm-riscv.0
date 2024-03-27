From: Chao Du <duchao@eswincomputing.com>
Date: Wed, 27 Mar 2024 18:17:03 +0800 (GMT+08:00)
Subject: [PATCH v3 3/3] RISC-V: KVM: selftests: Add ebreak test support
In-Reply-To: <20240327-b867e01dab2996d68c15f899@orel>
References: <20240327075526.31855-1-duchao@eswincomputing.com>
 <20240327075526.31855-4-duchao@eswincomputing.com>
 <20240327-b867e01dab2996d68c15f899@orel>
Message-ID: <4bc71b14.1591.18e7f69c9e3.Coremail.duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks Andrew for all the good suggestions.
Will take them in next revision.

Regards,
Chao

On 2024-03-27 17:00, Andrew Jones <ajones@ventanamicro.com> wrote:
> 
> On Wed, Mar 27, 2024 at 07:55:26AM +0000, Chao Du wrote:
> > Initial support for RISC-V KVM ebreak test. Check the exit reason and
> > the PC when guest debug is enabled. Also to make sure the guest could
> > handle the ebreak exception without exiting to the VMM when guest debug
> > is not enabled.
> > 
> > Signed-off-by: Chao Du <duchao@eswincomputing.com>
> > ---
> >  tools/testing/selftests/kvm/Makefile          |  1 +
> >  .../testing/selftests/kvm/riscv/ebreak_test.c | 84 +++++++++++++++++++
> >  2 files changed, 85 insertions(+)
> >  create mode 100644 tools/testing/selftests/kvm/riscv/ebreak_test.c
> > 
> > diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> > index 741c7dc16afc..7f4430242c9e 100644
> > --- a/tools/testing/selftests/kvm/Makefile
> > +++ b/tools/testing/selftests/kvm/Makefile
> > @@ -189,6 +189,7 @@ TEST_GEN_PROGS_s390x += rseq_test
> >  TEST_GEN_PROGS_s390x += set_memory_region_test
> >  TEST_GEN_PROGS_s390x += kvm_binary_stats_test
> >  
> > +TEST_GEN_PROGS_riscv += riscv/ebreak_test
> >  TEST_GEN_PROGS_riscv += arch_timer
> >  TEST_GEN_PROGS_riscv += demand_paging_test
> >  TEST_GEN_PROGS_riscv += dirty_log_test
> > diff --git a/tools/testing/selftests/kvm/riscv/ebreak_test.c b/tools/testing/selftests/kvm/riscv/ebreak_test.c
> > new file mode 100644
> > index 000000000000..4c79c778e026
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/riscv/ebreak_test.c
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RISC-V KVM ebreak test.
> > + *
> > + * Copyright 2024 Beijing ESWIN Computing Technology Co., Ltd.
> > + *
> > + */
> > +#include "kvm_util.h"
> > +
> > +#define PC(v) ((uint64_t)&(v))
> 
> PC() isn't a good name for the function this is doing. It's getting
> the address of a label. LABEL_ADDRESS() would be more appropriate.
> 
> > +
> > +extern unsigned char sw_bp_1, sw_bp_2;
> > +static volatile uint64_t sw_bp_addr;
> 
> Drop volatile here and use READ/WRITE_ONCE on sw_bp_addr when reading and
> writing it.
> 
> > +
> > +static void guest_code(void)
> > +{
> > +	/*
> > +	 * nops are inserted to make sure that the "pc += 4" operation is
> > +	 * compatible with the compressed instructions.
> > +	 */
> > +	asm volatile("sw_bp_1: ebreak\n"
> > +		     "nop\n"
> > +		     "sw_bp_2: ebreak\n"
> > +		     "nop\n");
> 
> The nops are fine, but options should work too, something like
> 
>  asm volatile(
>  ".option push\n"
>  ".option norvc\n"
>  "sw_bp_1: ebreak\n"
>  "sw_bp_2: ebreak\n"
>  ".option pop\n"
>  );
> 
> > +	GUEST_ASSERT_EQ(sw_bp_addr, PC(sw_bp_2));
> > +
> > +	GUEST_DONE();
> > +}
> > +
> > +static void guest_breakpoint_handler(struct ex_regs *regs)
> > +{
> > +	sw_bp_addr = regs->epc;
> > +	regs->epc += 4;
> > +}
> > +
> > +int main(void)
> > +{
> > +	struct kvm_vm *vm;
> > +	struct kvm_vcpu *vcpu;
> > +	uint64_t pc;
> > +	struct kvm_guest_debug debug = {
> > +		.control = KVM_GUESTDBG_ENABLE,
> > +	};
> > +	struct ucall uc;
> 
> You don't use 'uc', so you can drop it and...
> 
> > +
> > +	TEST_REQUIRE(kvm_has_cap(KVM_CAP_SET_GUEST_DEBUG));
> > +
> > +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> > +
> > +	vm_init_vector_tables(vm);
> > +	vcpu_init_vector_tables(vcpu);
> > +	vm_install_exception_handler(vm, EXC_BREAKPOINT,
> > +					guest_breakpoint_handler);
> > +
> > +	/*
> > +	 * Enable the guest debug.
> > +	 * ebreak should exit to the VMM with KVM_EXIT_DEBUG reason.
> > +	 */
> > +	vcpu_guest_debug_set(vcpu, &debug);
> > +	vcpu_run(vcpu);
> > +
> > +	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_DEBUG);
> > +
> > +	vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.pc), &pc);
> > +	TEST_ASSERT_EQ(pc, PC(sw_bp_1));
> > +
> > +	/* skip sw_bp_1 */
> > +	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), pc + 4);
> > +
> > +	/*
> > +	 * Disable all debug controls.
> > +	 * Guest should handle the ebreak without exiting to the VMM.
> > +	 */
> > +	memset(&debug, 0, sizeof(debug));
> > +	vcpu_guest_debug_set(vcpu, &debug);
> > +
> > +	vcpu_run(vcpu);
> > +
> > +	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_DONE);
> 
> ...call get_ucall() with NULL for the second parameter.
> 
> > +
> > +	kvm_vm_free(vm);
> > +
> > +	return 0;
> > +}
> > -- 
> > 2.17.1
> >
> 
> Thanks,
> drew

From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 1 Mar 2024 10:24:53 +0100
Subject: [PATCH v2 3/3] RISC-V: KVM: selftests: Add breakpoints test
 support
In-Reply-To: <20240301013545.10403-4-duchao@eswincomputing.com>
References: <20240301013545.10403-1-duchao@eswincomputing.com>
 <20240301013545.10403-4-duchao@eswincomputing.com>
Message-ID: <20240301-16a75ed14197d3c5e0e7251e@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 01, 2024 at 01:35:45AM +0000, Chao Du wrote:
> Initial support for RISC-V KVM breakpoint test. Check the exit reason
> and the PC when guest debug is enabled.
> 
> Signed-off-by: Chao Du <duchao@eswincomputing.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |  1 +
>  .../testing/selftests/kvm/riscv/breakpoints.c | 49 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/riscv/breakpoints.c
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 492e937fab00..5f9048a740b0 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -184,6 +184,7 @@ TEST_GEN_PROGS_s390x += rseq_test
>  TEST_GEN_PROGS_s390x += set_memory_region_test
>  TEST_GEN_PROGS_s390x += kvm_binary_stats_test
>  
> +TEST_GEN_PROGS_riscv += riscv/breakpoints
>  TEST_GEN_PROGS_riscv += demand_paging_test
>  TEST_GEN_PROGS_riscv += dirty_log_test
>  TEST_GEN_PROGS_riscv += get-reg-list
> diff --git a/tools/testing/selftests/kvm/riscv/breakpoints.c b/tools/testing/selftests/kvm/riscv/breakpoints.c
> new file mode 100644
> index 000000000000..be2d94837c83
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/riscv/breakpoints.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V KVM breakpoint tests.
> + *
> + * Copyright 2024 Beijing ESWIN Computing Technology Co., Ltd.
> + *
> + */
> +#include "kvm_util.h"
> +
> +#define PC(v) ((uint64_t)&(v))
> +
> +extern unsigned char sw_bp;
> +
> +static void guest_code(void)
> +{
> +	asm volatile("sw_bp: ebreak");
> +	asm volatile("nop");
> +	asm volatile("nop");
> +	asm volatile("nop");

What are the nops for? And, since they're all in their own asm()'s the
compiler could be inserting instructions between them and also the ebreak
above. If we need three nops immediately following the ebreak then we
need to put everything in one asm()

  asm volatile(
  "sw_bp:	ebreak\n"
  "		nop\n"
  "		nop\n"
  "		nop\n");

> +
> +	GUEST_DONE();
> +}
> +
> +int main(void)
> +{
> +	struct kvm_vm *vm;
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_guest_debug debug;
> +	uint64_t pc;
> +
> +	TEST_REQUIRE(kvm_has_cap(KVM_CAP_SET_GUEST_DEBUG));
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> +
> +	memset(&debug, 0, sizeof(debug));
> +	debug.control = KVM_GUESTDBG_ENABLE;

nit: The above two lines can be removed if we initialize debug as

  struct kvm_guest_debug debug = {
     .control = KVM_GUESTDBG_ENABLE,
  };

> +	vcpu_guest_debug_set(vcpu, &debug);
> +	vcpu_run(vcpu);
> +
> +	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_DEBUG);

As Anup pointed out, we need to also ensure that without making the
KVM_SET_GUEST_DEBUG ioctl call we get the expected behavior. You
can use GUEST_SYNC() in the guest code to prove that it was able to
issue an ebreak without exiting to the VMM.

> +
> +	vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.pc), &pc);
> +
> +	TEST_ASSERT_EQ(pc, PC(sw_bp));
> +
> +	kvm_vm_free(vm);
> +
> +	return 0;
> +}
> -- 
> 2.17.1
>

Thanks,
drew


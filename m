From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:08:08 -0800
Subject: [PATCH 7/9] RISC-V: KVM: Save mvendorid, marchid, and mimpid when
 creating VCPU
In-Reply-To: <20221128161424.608889-8-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-8-apatel@ventanamicro.com>
Message-ID: <CAOnJCUK3Dffumx0cY7tJbncuinnkLwpGfH7oNXebXM5SeCciQQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 8:15 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should save VCPU mvendorid, marchid, and mimpid at the time
> of creating VCPU so that we don't have to do host SBI call every
> time Guest/VM ask for these details.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  5 +++++
>  arch/riscv/kvm/vcpu.c             |  6 ++++++
>  arch/riscv/kvm/vcpu_sbi_base.c    | 11 +++++------
>  3 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 91c74b09a970..93f43a3e7886 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -165,6 +165,11 @@ struct kvm_vcpu_arch {
>         /* ISA feature bits (similar to MISA) */
>         DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
>
> +       /* Vendor, Arch, and Implementation details */
> +       unsigned long mvendorid;
> +       unsigned long marchid;
> +       unsigned long mimpid;
> +
>         /* SSCRATCH, STVEC, and SCOUNTEREN of Host */
>         unsigned long host_sscratch;
>         unsigned long host_stvec;
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 68c86f632d37..312a8a926867 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -21,6 +21,7 @@
>  #include <asm/csr.h>
>  #include <asm/cacheflush.h>
>  #include <asm/hwcap.h>
> +#include <asm/sbi.h>
>
>  const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
>         KVM_GENERIC_VCPU_STATS(),
> @@ -171,6 +172,11 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>                         set_bit(host_isa, vcpu->arch.isa);
>         }
>
> +       /* Setup vendor, arch, and implementation details */
> +       vcpu->arch.mvendorid = sbi_get_mvendorid();
> +       vcpu->arch.marchid = sbi_get_marchid();
> +       vcpu->arch.mimpid = sbi_get_mimpid();
> +
>         /* Setup VCPU hfence queue */
>         spin_lock_init(&vcpu->arch.hfence_lock);
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 0c806f61c629..5d65c634d301 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -19,7 +19,6 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  {
>         int ret = 0;
>         struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> -       struct sbiret ecall_ret;
>
>         switch (cp->a6) {
>         case SBI_EXT_BASE_GET_SPEC_VERSION:
> @@ -48,13 +47,13 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                         *out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
>                 break;
>         case SBI_EXT_BASE_GET_MVENDORID:
> +               *out_val = vcpu->arch.mvendorid;
> +               break;
>         case SBI_EXT_BASE_GET_MARCHID:
> +               *out_val = vcpu->arch.marchid;
> +               break;
>         case SBI_EXT_BASE_GET_MIMPID:
> -               ecall_ret = sbi_ecall(SBI_EXT_BASE, cp->a6, 0, 0, 0, 0, 0, 0);
> -               if (!ecall_ret.error)
> -                       *out_val = ecall_ret.value;
> -               /*TODO: We are unnecessarily converting the error twice */
> -               ret = sbi_err_map_linux_errno(ecall_ret.error);
> +               *out_val = vcpu->arch.mimpid;
>                 break;
>         default:
>                 ret = -EOPNOTSUPP;
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish


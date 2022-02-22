From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 15:56:30 -0800
Subject: [PATCH 3/6] RISC-V: KVM: Implement SBI v0.3 SRST extension
In-Reply-To: <20220201082227.361967-4-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
 <20220201082227.361967-4-apatel@ventanamicro.com>
Message-ID: <CAOnJCUKPw-kiYZWAECPU5z9QS600s1AUREon=WuB+gPG+rprvw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 1, 2022 at 12:23 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The SBI v0.3 specification defines SRST (System Reset) extension which
> provides a standard poweroff and reboot interface. This patch implements
> SRST extension for the KVM Guest.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_sbi.c         |  2 ++
>  arch/riscv/kvm/vcpu_sbi_replace.c | 44 +++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 11ae4f621f0d..a09ecb97b890 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -45,6 +45,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
> @@ -55,6 +56,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_time,
>         &vcpu_sbi_ext_ipi,
>         &vcpu_sbi_ext_rfence,
> +       &vcpu_sbi_ext_srst,
>         &vcpu_sbi_ext_hsm,
>         &vcpu_sbi_ext_experimental,
>         &vcpu_sbi_ext_vendor,
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> index 1bc0608a5bfd..0f217365c287 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -130,3 +130,47 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
>         .extid_end = SBI_EXT_RFENCE,
>         .handler = kvm_sbi_ext_rfence_handler,
>  };
> +
> +static int kvm_sbi_ext_srst_handler(struct kvm_vcpu *vcpu,
> +                                   struct kvm_run *run,
> +                                   unsigned long *out_val,
> +                                   struct kvm_cpu_trap *utrap, bool *exit)
> +{
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       unsigned long funcid = cp->a6;
> +       u32 reason = cp->a1;
> +       u32 type = cp->a0;
> +       int ret = 0;
> +
> +       switch (funcid) {
> +       case SBI_EXT_SRST_RESET:
> +               switch (type) {
> +               case SBI_SRST_RESET_TYPE_SHUTDOWN:
> +                       kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
> +                                               KVM_SYSTEM_EVENT_SHUTDOWN,
> +                                               reason);
> +                       *exit = true;
> +                       break;
> +               case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> +               case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> +                       kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
> +                                               KVM_SYSTEM_EVENT_RESET,
> +                                               reason);
> +                       *exit = true;
> +                       break;
> +               default:
> +                       ret = -EOPNOTSUPP;
> +               }
> +               break;
> +       default:
> +               ret = -EOPNOTSUPP;
> +       }
> +
> +       return ret;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
> +       .extid_start = SBI_EXT_SRST,
> +       .extid_end = SBI_EXT_SRST,
> +       .handler = kvm_sbi_ext_srst_handler,
> +};
> --
> 2.25.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish


From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 May 2023 22:35:08 +0530
Subject: [PATCH v2 3/3] RISC-V: KVM: Probe for SBI extension status
In-Reply-To: <20230526102540.105013-4-ajones@ventanamicro.com>
References: <20230526102540.105013-1-ajones@ventanamicro.com> <20230526102540.105013-4-ajones@ventanamicro.com>
Message-ID: <CAAhSdy2yYvA4TfeRV0HV2psABxYPdb320qoMgP6RsL6Jra6k1w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 26, 2023 at 3:55?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Rather than defaulting the status to available and allowing the user
> to set availability, default to uninitialized and only allow the user
> to set the status to unavailable. Then, when an extension is first
> used, ensure it is available by invoking its probe function, if it
> has one (an extension is assumed available if it doesn't have a probe
> function). Checking the status in kvm_vcpu_sbi_find_ext() ensures
> extension functions cannot be invoked when they're unavailable.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
>  arch/riscv/kvm/vcpu_sbi.c             | 51 ++++++++++++++++++++-------
>  2 files changed, 40 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index cda99fc3d897..a55b6225aa55 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -15,6 +15,7 @@
>  #define KVM_SBI_VERSION_MINOR 0
>
>  enum KVM_RISCV_SBI_EXT_STATUS {
> +       KVM_RISCV_SBI_EXT_UNINITIALIZED,
>         KVM_RISCV_SBI_EXT_AVAILABLE,
>         KVM_RISCV_SBI_EXT_UNAVAILABLE,
>  };
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 28e55ba023dc..b3e92c11e54f 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -155,8 +155,15 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
>         if (!sext)
>                 return -ENOENT;
>
> -       scontext->ext_status[sext->ext_idx] = reg_val ?
> -               KVM_RISCV_SBI_EXT_AVAILABLE : KVM_RISCV_SBI_EXT_UNAVAILABLE;
> +       /*
> +        * We can't set the extension status to available here, since it may
> +        * have a probe() function which needs to confirm availability first,
> +        * but it may be too early to call that here. We can set the status to
> +        * unavailable, though.
> +        */
> +       if (!reg_val)
> +               scontext->ext_status[sext->ext_idx] =
> +                       KVM_RISCV_SBI_EXT_UNAVAILABLE;
>
>         return 0;
>  }
> @@ -181,8 +188,15 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
>         if (!sext)
>                 return -ENOENT;
>
> -       *reg_val = scontext->ext_status[sext->ext_idx] ==
> -                               KVM_RISCV_SBI_EXT_AVAILABLE;
> +       /*
> +        * If the extension status is still uninitialized, then we should probe
> +        * to determine if it's available, but it may be too early to do that
> +        * here. The best we can do is report that the extension has not been
> +        * disabled, i.e. we return 1 when the extension is available and also
> +        * when it only may be available.
> +        */
> +       *reg_val = scontext->ext_status[sext->ext_idx] !=
> +                               KVM_RISCV_SBI_EXT_UNAVAILABLE;
>
>         return 0;
>  }
> @@ -309,19 +323,32 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
>  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>                                 struct kvm_vcpu *vcpu, unsigned long extid)
>  {
> -       int i;
> -       const struct kvm_riscv_sbi_extension_entry *sext;
>         struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> +       const struct kvm_riscv_sbi_extension_entry *entry;
> +       const struct kvm_vcpu_sbi_extension *ext;
> +       int i;
>
>         for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> -               sext = &sbi_ext[i];
> -               if (sext->ext_ptr->extid_start <= extid &&
> -                   sext->ext_ptr->extid_end >= extid) {
> -                       if (sext->ext_idx < KVM_RISCV_SBI_EXT_MAX &&
> -                           scontext->ext_status[sext->ext_idx] ==
> +               entry = &sbi_ext[i];
> +               ext = entry->ext_ptr;
> +
> +               if (ext->extid_start <= extid && ext->extid_end >= extid) {
> +                       if (entry->ext_idx >= KVM_RISCV_SBI_EXT_MAX ||
> +                           scontext->ext_status[entry->ext_idx] ==
> +                                               KVM_RISCV_SBI_EXT_AVAILABLE)
> +                               return ext;
> +                       if (scontext->ext_status[entry->ext_idx] ==
>                                                 KVM_RISCV_SBI_EXT_UNAVAILABLE)
>                                 return NULL;
> -                       return sbi_ext[i].ext_ptr;
> +                       if (ext->probe && !ext->probe(vcpu)) {
> +                               scontext->ext_status[entry->ext_idx] =
> +                                       KVM_RISCV_SBI_EXT_UNAVAILABLE;
> +                               return NULL;
> +                       }
> +
> +                       scontext->ext_status[entry->ext_idx] =
> +                               KVM_RISCV_SBI_EXT_AVAILABLE;
> +                       return ext;
>                 }
>         }
>
> --
> 2.40.1
>


From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Dec 2023 23:05:32 +0530
Subject: [PATCH v2 3/6] RISC-V: KVM: Make SBI uapi consistent with ISA uapi
In-Reply-To: <20231213170951.93453-11-ajones@ventanamicro.com>
References: <20231213170951.93453-8-ajones@ventanamicro.com> <20231213170951.93453-11-ajones@ventanamicro.com>
Message-ID: <CAAhSdy08sXh_LrGb6=LKvCc1Bvu=hLbRehxKfmMiBj5H=_3MxA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 13, 2023 at 10:39?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When an SBI extension cannot be enabled, that's a distinct state vs.
> enabled and disabled. Modify enum kvm_riscv_sbi_ext_status to
> accommodate it, which allows KVM userspace to tell the difference
> in state too, as the SBI extension register will disappear when it
> cannot be enabled, i.e. accesses to it return ENOENT. get-reg-list is
> updated as well to only add SBI extension registers to the list which
> may be enabled. Returning ENOENT for SBI extension registers which
> cannot be enabled makes them consistent with ISA extension registers.
> Any SBI extensions which were enabled by default are still enabled by
> default, if they can be enabled at all.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 10 ++--
>  arch/riscv/kvm/vcpu_onereg.c          | 23 +++++---
>  arch/riscv/kvm/vcpu_sbi.c             | 75 +++++++++++++++------------
>  arch/riscv/kvm/vcpu_sbi_replace.c     |  2 +-
>  4 files changed, 65 insertions(+), 45 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 6a453f7f8b56..bffda0ac59b6 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -15,9 +15,10 @@
>  #define KVM_SBI_VERSION_MINOR 0
>
>  enum kvm_riscv_sbi_ext_status {
> -       KVM_RISCV_SBI_EXT_UNINITIALIZED,
> -       KVM_RISCV_SBI_EXT_AVAILABLE,
> -       KVM_RISCV_SBI_EXT_UNAVAILABLE,
> +       KVM_RISCV_SBI_EXT_STATUS_UNINITIALIZED,
> +       KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE,
> +       KVM_RISCV_SBI_EXT_STATUS_ENABLED,
> +       KVM_RISCV_SBI_EXT_STATUS_DISABLED,
>  };
>
>  struct kvm_vcpu_sbi_context {
> @@ -36,7 +37,7 @@ struct kvm_vcpu_sbi_extension {
>         unsigned long extid_start;
>         unsigned long extid_end;
>
> -       bool default_unavail;
> +       bool default_disabled;
>
>         /**
>          * SBI extension handler. It can be defined for a given extension or group of
> @@ -61,6 +62,7 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
>                                    const struct kvm_one_reg *reg);
>  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>                                 struct kvm_vcpu *vcpu, unsigned long extid);
> +bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f9bfa8a5db21..48262be73aa0 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -931,27 +931,34 @@ static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
>         return copy_isa_ext_reg_indices(vcpu, NULL);;
>  }
>
> -static inline unsigned long num_sbi_ext_regs(void)
> +static int copy_sbi_ext_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
>  {
> -       return KVM_RISCV_SBI_EXT_MAX;
> -}
> +       unsigned int n = 0;
>
> -static int copy_sbi_ext_reg_indices(u64 __user *uindices)
> -{
>         for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
>                 u64 size = IS_ENABLED(CONFIG_32BIT) ?
>                            KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
>                 u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
>                           KVM_REG_RISCV_SBI_SINGLE | i;
>
> +               if (!riscv_vcpu_supports_sbi_ext(vcpu, i))
> +                       continue;
> +
>                 if (uindices) {
>                         if (put_user(reg, uindices))
>                                 return -EFAULT;
>                         uindices++;
>                 }
> +
> +               n++;
>         }
>
> -       return num_sbi_ext_regs();
> +       return n;
> +}
> +
> +static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
> +{
> +       return copy_sbi_ext_reg_indices(vcpu, NULL);
>  }
>
>  /*
> @@ -970,7 +977,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
>         res += num_fp_f_regs(vcpu);
>         res += num_fp_d_regs(vcpu);
>         res += num_isa_ext_regs(vcpu);
> -       res += num_sbi_ext_regs();
> +       res += num_sbi_ext_regs(vcpu);
>
>         return res;
>  }
> @@ -1018,7 +1025,7 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
>                 return ret;
>         uindices += ret;
>
> -       ret = copy_sbi_ext_reg_indices(uindices);
> +       ret = copy_sbi_ext_reg_indices(vcpu, uindices);
>         if (ret < 0)
>                 return ret;
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index a04ff98085d9..dcdff4458190 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -80,6 +80,34 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
>         },
>  };
>
> +static const struct kvm_riscv_sbi_extension_entry *
> +riscv_vcpu_get_sbi_ext(struct kvm_vcpu *vcpu, unsigned long idx)
> +{
> +       const struct kvm_riscv_sbi_extension_entry *sext = NULL;
> +
> +       if (idx >= KVM_RISCV_SBI_EXT_MAX)
> +               return NULL;
> +
> +       for (int i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +               if (sbi_ext[i].ext_idx == idx) {
> +                       sext = &sbi_ext[i];
> +                       break;
> +               }
> +       }
> +
> +       return sext;
> +}
> +
> +bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
> +{
> +       struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> +       const struct kvm_riscv_sbi_extension_entry *sext;
> +
> +       sext = riscv_vcpu_get_sbi_ext(vcpu, idx);
> +
> +       return sext && scontext->ext_status[sext->ext_idx] != KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
> +}
> +
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
>  {
>         struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> @@ -140,28 +168,19 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
>                                          unsigned long reg_num,
>                                          unsigned long reg_val)
>  {
> -       unsigned long i;
> -       const struct kvm_riscv_sbi_extension_entry *sext = NULL;
>         struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> -
> -       if (reg_num >= KVM_RISCV_SBI_EXT_MAX)
> -               return -ENOENT;
> +       const struct kvm_riscv_sbi_extension_entry *sext;
>
>         if (reg_val != 1 && reg_val != 0)
>                 return -EINVAL;
>
> -       for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> -               if (sbi_ext[i].ext_idx == reg_num) {
> -                       sext = &sbi_ext[i];
> -                       break;
> -               }
> -       }
> -       if (!sext)
> +       sext = riscv_vcpu_get_sbi_ext(vcpu, reg_num);
> +       if (!sext || scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE)
>                 return -ENOENT;
>
>         scontext->ext_status[sext->ext_idx] = (reg_val) ?
> -                       KVM_RISCV_SBI_EXT_AVAILABLE :
> -                       KVM_RISCV_SBI_EXT_UNAVAILABLE;
> +                       KVM_RISCV_SBI_EXT_STATUS_ENABLED :
> +                       KVM_RISCV_SBI_EXT_STATUS_DISABLED;
>
>         return 0;
>  }
> @@ -170,24 +189,16 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
>                                          unsigned long reg_num,
>                                          unsigned long *reg_val)
>  {
> -       unsigned long i;
> -       const struct kvm_riscv_sbi_extension_entry *sext = NULL;
>         struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> +       const struct kvm_riscv_sbi_extension_entry *sext;
>
> -       if (reg_num >= KVM_RISCV_SBI_EXT_MAX)
> -               return -ENOENT;
> -
> -       for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> -               if (sbi_ext[i].ext_idx == reg_num) {
> -                       sext = &sbi_ext[i];
> -                       break;
> -               }
> -       }
> -       if (!sext)
> +       sext = riscv_vcpu_get_sbi_ext(vcpu, reg_num);
> +       if (!sext || scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE)
>                 return -ENOENT;
>
>         *reg_val = scontext->ext_status[sext->ext_idx] ==
> -                               KVM_RISCV_SBI_EXT_AVAILABLE;
> +                               KVM_RISCV_SBI_EXT_STATUS_ENABLED;
> +
>         return 0;
>  }
>
> @@ -325,7 +336,7 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>                 if (ext->extid_start <= extid && ext->extid_end >= extid) {
>                         if (entry->ext_idx >= KVM_RISCV_SBI_EXT_MAX ||
>                             scontext->ext_status[entry->ext_idx] ==
> -                                               KVM_RISCV_SBI_EXT_AVAILABLE)
> +                                               KVM_RISCV_SBI_EXT_STATUS_ENABLED)
>                                 return ext;
>
>                         return NULL;
> @@ -413,12 +424,12 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
>
>                 if (ext->probe && !ext->probe(vcpu)) {
>                         scontext->ext_status[entry->ext_idx] =
> -                               KVM_RISCV_SBI_EXT_UNAVAILABLE;
> +                               KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
>                         continue;
>                 }
>
> -               scontext->ext_status[entry->ext_idx] = ext->default_unavail ?
> -                                       KVM_RISCV_SBI_EXT_UNAVAILABLE :
> -                                       KVM_RISCV_SBI_EXT_AVAILABLE;
> +               scontext->ext_status[entry->ext_idx] = ext->default_disabled ?
> +                                       KVM_RISCV_SBI_EXT_STATUS_DISABLED :
> +                                       KVM_RISCV_SBI_EXT_STATUS_ENABLED;
>         }
>  }
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> index 23b57c931b15..9c2ab3dfa93a 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -204,6 +204,6 @@ static int kvm_sbi_ext_dbcn_handler(struct kvm_vcpu *vcpu,
>  const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn = {
>         .extid_start = SBI_EXT_DBCN,
>         .extid_end = SBI_EXT_DBCN,
> -       .default_unavail = true,
> +       .default_disabled = true,
>         .handler = kvm_sbi_ext_dbcn_handler,
>  };
> --
> 2.43.0
>


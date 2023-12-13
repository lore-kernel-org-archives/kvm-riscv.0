From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Dec 2023 23:12:49 +0530
Subject: [PATCH v2 6/6] RISC-V: KVM: selftests: Treat SBI ext regs like
 ISA ext regs
In-Reply-To: <20231213170951.93453-14-ajones@ventanamicro.com>
References: <20231213170951.93453-8-ajones@ventanamicro.com> <20231213170951.93453-14-ajones@ventanamicro.com>
Message-ID: <CAAhSdy0K6-FQMrawsQRvx3zZFAjrWEM62TBDLJ=t7dAZNFwZag@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 13, 2023 at 10:40?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> SBI extension registers may not be present and indeed when
> running on a platform without sscofpmf the PMU SBI extension
> is not. Move the SBI extension registers from the base set of
> registers to the filter list. Individual configs should test
> for any that may or may not be present separately. Since
> the PMU extension may disappear and the DBCN extension is only
> present in later kernels, separate them from the rest into
> their own configs. The rest are lumped together into the same
> config.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  .../selftests/kvm/include/kvm_util_base.h     |   1 +
>  .../selftests/kvm/riscv/get-reg-list.c        | 105 +++++++++++++++---
>  2 files changed, 92 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index a18db6a7b3cf..e112ee30867f 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -129,6 +129,7 @@ struct vcpu_reg_sublist {
>         const char *name;
>         long capability;
>         int feature;
> +       int feature_type;
>         bool finalize;
>         __u64 *regs;
>         __u64 regs_n;
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 4bcc597d34b9..b8da2e86bf9c 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -12,6 +12,11 @@
>
>  #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK)
>
> +enum {
> +       VCPU_FEATURE_ISA_EXT = 0,
> +       VCPU_FEATURE_SBI_EXT,
> +};
> +
>  static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
>
>  bool filter_reg(__u64 reg)
> @@ -53,6 +58,21 @@ bool filter_reg(__u64 reg)
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIFENCEI:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHPM:
> +       /*
> +        * Like ISA_EXT registers, SBI_EXT registers are only visible when the
> +        * host supports them and disabling them does not affect the visibility
> +        * of the SBI_EXT register itself.
> +        */
> +       case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01:
> +       case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME:
> +       case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI:
> +       case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_RFENCE:
> +       case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST:
> +       case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM:
> +       case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU:
> +       case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN:
> +       case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL:
> +       case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR:
>                 return true;
>         /* AIA registers are always available when Ssaia can't be disabled */
>         case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
> @@ -75,12 +95,12 @@ bool check_reject_set(int err)
>         return err == EINVAL;
>  }
>
> -static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> +static bool vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext_id)
>  {
>         int ret;
>         unsigned long value;
>
> -       ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> +       ret = __vcpu_get_reg(vcpu, ext_id, &value);
>         return (ret) ? false : !!value;
>  }
>
> @@ -88,6 +108,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>  {
>         unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
>         struct vcpu_reg_sublist *s;
> +       uint64_t feature;
>         int rc;
>
>         for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
> @@ -103,15 +124,31 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>                         isa_ext_cant_disable[i] = true;
>         }
>
> +       for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
> +               rc = __vcpu_set_reg(vcpu, RISCV_SBI_EXT_REG(i), 0);
> +               TEST_ASSERT(!rc || (rc == -1 && errno == ENOENT), "Unexpected error");
> +       }
> +
>         for_each_sublist(c, s) {
>                 if (!s->feature)
>                         continue;
>
> +               switch (s->feature_type) {
> +               case VCPU_FEATURE_ISA_EXT:
> +                       feature = RISCV_ISA_EXT_REG(s->feature);
> +                       break;
> +               case VCPU_FEATURE_SBI_EXT:
> +                       feature = RISCV_SBI_EXT_REG(s->feature);
> +                       break;
> +               default:
> +                       TEST_FAIL("Unknown feature type");
> +               }
> +
>                 /* Try to enable the desired extension */
> -               __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(s->feature), 1);
> +               __vcpu_set_reg(vcpu, feature, 1);
>
>                 /* Double check whether the desired extension was enabled */
> -               __TEST_REQUIRE(vcpu_has_ext(vcpu, s->feature),
> +               __TEST_REQUIRE(vcpu_has_ext(vcpu, feature),
>                                "%s not available, skipping tests\n", s->name);
>         }
>  }
> @@ -593,16 +630,6 @@ static __u64 base_regs[] = {
>         KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(time),
>         KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(compare),
>         KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(state),
> -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01,
> -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME,
> -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI,
> -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_RFENCE,
> -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST,
> -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM,
> -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU,
> -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
> -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
>  };
>
>  /*
> @@ -613,6 +640,17 @@ static __u64 base_skips_set[] = {
>         KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(state),
>  };
>
> +static __u64 sbi_base_regs[] = {
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_RFENCE,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
> +};
> +
>  static __u64 zicbom_regs[] = {
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
> @@ -716,6 +754,9 @@ static __u64 fp_d_regs[] = {
>  #define SUBLIST_BASE \
>         {"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
>          .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
> +#define SUBLIST_SBI_BASE \
> +       {"sbi-base", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_V01, \
> +        .regs = sbi_base_regs, .regs_n = ARRAY_SIZE(sbi_base_regs),}
>  #define SUBLIST_ZICBOM \
>         {"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
>  #define SUBLIST_ZICBOZ \
> @@ -750,6 +791,26 @@ static struct vcpu_reg_list config_##ext = {                       \
>         },                                                      \
>  }                                                              \
>
> +#define KVM_SBI_EXT_SIMPLE_CONFIG(ext, extu)                   \
> +static __u64 regs_sbi_##ext[] = {                              \
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG |                    \
> +       KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE |      \
> +       KVM_RISCV_SBI_EXT_##extu,                               \
> +};                                                             \
> +static struct vcpu_reg_list config_sbi_##ext = {               \
> +       .sublists = {                                           \
> +               SUBLIST_BASE,                                   \
> +               {                                               \
> +                       .name = "sbi-"#ext,                     \
> +                       .feature_type = VCPU_FEATURE_SBI_EXT,   \
> +                       .feature = KVM_RISCV_SBI_EXT_##extu,    \
> +                       .regs = regs_sbi_##ext,                 \
> +                       .regs_n = ARRAY_SIZE(regs_sbi_##ext),   \
> +               },                                              \
> +               {0},                                            \
> +       },                                                      \
> +}                                                              \
> +
>  #define KVM_ISA_EXT_SUBLIST_CONFIG(ext, extu)                  \
>  static struct vcpu_reg_list config_##ext = {                   \
>         .sublists = {                                           \
> @@ -759,8 +820,21 @@ static struct vcpu_reg_list config_##ext = {                       \
>         },                                                      \
>  }                                                              \
>
> +#define KVM_SBI_EXT_SUBLIST_CONFIG(ext, extu)                  \
> +static struct vcpu_reg_list config_sbi_##ext = {               \
> +       .sublists = {                                           \
> +               SUBLIST_BASE,                                   \
> +               SUBLIST_SBI_##extu,                             \
> +               {0},                                            \
> +       },                                                      \
> +}                                                              \
> +
>  /* Note: The below list is alphabetically sorted. */
>
> +KVM_SBI_EXT_SUBLIST_CONFIG(base, BASE);
> +KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
> +KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
> +
>  KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
>  KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
>  KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
> @@ -783,6 +857,9 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zihintpause, ZIHINTPAUSE);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
>
>  struct vcpu_reg_list *vcpu_configs[] = {
> +       &config_sbi_base,
> +       &config_sbi_pmu,
> +       &config_sbi_dbcn,
>         &config_aia,
>         &config_fp_f,
>         &config_fp_d,
> --
> 2.43.0
>


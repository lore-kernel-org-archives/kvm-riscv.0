From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Oct 2023 11:29:05 +0530
Subject: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should
 never fail
In-Reply-To: <20230920143713.6896-2-ajones@ventanamicro.com>
References: <20230920143713.6896-2-ajones@ventanamicro.com>
Message-ID: <CAAhSdy0pP8MqiF+MpgxS3ytV+FoGNfF6CvmgfZ8-KTDSpigOEg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 20, 2023 at 8:07?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When outputting the "new" register list we want to print all of the
> new registers, decoding as much as possible of each of them. Also, we
> don't want to assert while listing registers with '--list'. We output
> "/* UNKNOWN */" after each new register (which we were already doing
> for some), which should be enough.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Queued this patch for Linux-6.7

Thanks,
Anup

> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 93 +++++++++----------
>  1 file changed, 42 insertions(+), 51 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 85907c86b835..054706538b9e 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -112,11 +112,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>         }
>  }
>
> -static const char *config_id_to_str(__u64 id)
> +static const char *config_id_to_str(const char *prefix, __u64 id)
>  {
>         /* reg_off is the offset into struct kvm_riscv_config */
>         __u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CONFIG);
>
> +       assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CONFIG);
> +
>         switch (reg_off) {
>         case KVM_REG_RISCV_CONFIG_REG(isa):
>                 return "KVM_REG_RISCV_CONFIG_REG(isa)";
> @@ -134,11 +136,7 @@ static const char *config_id_to_str(__u64 id)
>                 return "KVM_REG_RISCV_CONFIG_REG(satp_mode)";
>         }
>
> -       /*
> -        * Config regs would grow regularly with new pseudo reg added, so
> -        * just show raw id to indicate a new pseudo config reg.
> -        */
> -       return strdup_printf("KVM_REG_RISCV_CONFIG_REG(%lld) /* UNKNOWN */", reg_off);
> +       return strdup_printf("%lld /* UNKNOWN */", reg_off);
>  }
>
>  static const char *core_id_to_str(const char *prefix, __u64 id)
> @@ -146,6 +144,8 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
>         /* reg_off is the offset into struct kvm_riscv_core */
>         __u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CORE);
>
> +       assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CORE);
> +
>         switch (reg_off) {
>         case KVM_REG_RISCV_CORE_REG(regs.pc):
>                 return "KVM_REG_RISCV_CORE_REG(regs.pc)";
> @@ -176,8 +176,7 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
>                 return "KVM_REG_RISCV_CORE_REG(mode)";
>         }
>
> -       TEST_FAIL("%s: Unknown core reg id: 0x%llx", prefix, id);
> -       return NULL;
> +       return strdup_printf("%lld /* UNKNOWN */", reg_off);
>  }
>
>  #define RISCV_CSR_GENERAL(csr) \
> @@ -211,8 +210,7 @@ static const char *general_csr_id_to_str(__u64 reg_off)
>                 return RISCV_CSR_GENERAL(scounteren);
>         }
>
> -       TEST_FAIL("Unknown general csr reg: 0x%llx", reg_off);
> -       return NULL;
> +       return strdup_printf("KVM_REG_RISCV_CSR_GENERAL | %lld /* UNKNOWN */", reg_off);
>  }
>
>  static const char *aia_csr_id_to_str(__u64 reg_off)
> @@ -235,8 +233,7 @@ static const char *aia_csr_id_to_str(__u64 reg_off)
>                 return RISCV_CSR_AIA(iprio2h);
>         }
>
> -       TEST_FAIL("Unknown aia csr reg: 0x%llx", reg_off);
> -       return NULL;
> +       return strdup_printf("KVM_REG_RISCV_CSR_AIA | %lld /* UNKNOWN */", reg_off);
>  }
>
>  static const char *csr_id_to_str(const char *prefix, __u64 id)
> @@ -244,6 +241,8 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
>         __u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CSR);
>         __u64 reg_subtype = reg_off & KVM_REG_RISCV_SUBTYPE_MASK;
>
> +       assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CSR);
> +
>         reg_off &= ~KVM_REG_RISCV_SUBTYPE_MASK;
>
>         switch (reg_subtype) {
> @@ -253,8 +252,7 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
>                 return aia_csr_id_to_str(reg_off);
>         }
>
> -       TEST_FAIL("%s: Unknown csr subtype: 0x%llx", prefix, reg_subtype);
> -       return NULL;
> +       return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
>  }
>
>  static const char *timer_id_to_str(const char *prefix, __u64 id)
> @@ -262,6 +260,8 @@ static const char *timer_id_to_str(const char *prefix, __u64 id)
>         /* reg_off is the offset into struct kvm_riscv_timer */
>         __u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_TIMER);
>
> +       assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER);
> +
>         switch (reg_off) {
>         case KVM_REG_RISCV_TIMER_REG(frequency):
>                 return "KVM_REG_RISCV_TIMER_REG(frequency)";
> @@ -273,8 +273,7 @@ static const char *timer_id_to_str(const char *prefix, __u64 id)
>                 return "KVM_REG_RISCV_TIMER_REG(state)";
>         }
>
> -       TEST_FAIL("%s: Unknown timer reg id: 0x%llx", prefix, id);
> -       return NULL;
> +       return strdup_printf("%lld /* UNKNOWN */", reg_off);
>  }
>
>  static const char *fp_f_id_to_str(const char *prefix, __u64 id)
> @@ -282,6 +281,8 @@ static const char *fp_f_id_to_str(const char *prefix, __u64 id)
>         /* reg_off is the offset into struct __riscv_f_ext_state */
>         __u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_FP_F);
>
> +       assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F);
> +
>         switch (reg_off) {
>         case KVM_REG_RISCV_FP_F_REG(f[0]) ...
>              KVM_REG_RISCV_FP_F_REG(f[31]):
> @@ -290,8 +291,7 @@ static const char *fp_f_id_to_str(const char *prefix, __u64 id)
>                 return "KVM_REG_RISCV_FP_F_REG(fcsr)";
>         }
>
> -       TEST_FAIL("%s: Unknown fp_f reg id: 0x%llx", prefix, id);
> -       return NULL;
> +       return strdup_printf("%lld /* UNKNOWN */", reg_off);
>  }
>
>  static const char *fp_d_id_to_str(const char *prefix, __u64 id)
> @@ -299,6 +299,8 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
>         /* reg_off is the offset into struct __riscv_d_ext_state */
>         __u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_FP_D);
>
> +       assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D);
> +
>         switch (reg_off) {
>         case KVM_REG_RISCV_FP_D_REG(f[0]) ...
>              KVM_REG_RISCV_FP_D_REG(f[31]):
> @@ -307,15 +309,16 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
>                 return "KVM_REG_RISCV_FP_D_REG(fcsr)";
>         }
>
> -       TEST_FAIL("%s: Unknown fp_d reg id: 0x%llx", prefix, id);
> -       return NULL;
> +       return strdup_printf("%lld /* UNKNOWN */", reg_off);
>  }
>
> -static const char *isa_ext_id_to_str(__u64 id)
> +static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
>  {
>         /* reg_off is the offset into unsigned long kvm_isa_ext_arr[] */
>         __u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
>
> +       assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT);
> +
>         static const char * const kvm_isa_ext_reg_name[] = {
>                 "KVM_RISCV_ISA_EXT_A",
>                 "KVM_RISCV_ISA_EXT_C",
> @@ -342,13 +345,8 @@ static const char *isa_ext_id_to_str(__u64 id)
>                 "KVM_RISCV_ISA_EXT_ZIHPM",
>         };
>
> -       if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
> -               /*
> -                * isa_ext regs would grow regularly with new isa extension added, so
> -                * just show "reg" to indicate a new extension.
> -                */
> +       if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name))
>                 return strdup_printf("%lld /* UNKNOWN */", reg_off);
> -       }
>
>         return kvm_isa_ext_reg_name[reg_off];
>  }
> @@ -368,35 +366,27 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
>                 "KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR",
>         };
>
> -       if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name)) {
> -               /*
> -                * sbi_ext regs would grow regularly with new sbi extension added, so
> -                * just show "reg" to indicate a new extension.
> -                */
> +       if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name))
>                 return strdup_printf("KVM_REG_RISCV_SBI_SINGLE | %lld /* UNKNOWN */", reg_off);
> -       }
>
>         return kvm_sbi_ext_reg_name[reg_off];
>  }
>
>  static const char *sbi_ext_multi_id_to_str(__u64 reg_subtype, __u64 reg_off)
>  {
> -       if (reg_off > KVM_REG_RISCV_SBI_MULTI_REG_LAST) {
> -               /*
> -                * sbi_ext regs would grow regularly with new sbi extension added, so
> -                * just show "reg" to indicate a new extension.
> -                */
> -               return strdup_printf("%lld /* UNKNOWN */", reg_off);
> -       }
> +       const char *unknown = "";
> +
> +       if (reg_off > KVM_REG_RISCV_SBI_MULTI_REG_LAST)
> +               unknown = " /* UNKNOWN */";
>
>         switch (reg_subtype) {
>         case KVM_REG_RISCV_SBI_MULTI_EN:
> -               return strdup_printf("KVM_REG_RISCV_SBI_MULTI_EN | %lld", reg_off);
> +               return strdup_printf("KVM_REG_RISCV_SBI_MULTI_EN | %lld%s", reg_off, unknown);
>         case KVM_REG_RISCV_SBI_MULTI_DIS:
> -               return strdup_printf("KVM_REG_RISCV_SBI_MULTI_DIS | %lld", reg_off);
> +               return strdup_printf("KVM_REG_RISCV_SBI_MULTI_DIS | %lld%s", reg_off, unknown);
>         }
>
> -       return NULL;
> +       return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
>  }
>
>  static const char *sbi_ext_id_to_str(const char *prefix, __u64 id)
> @@ -404,6 +394,8 @@ static const char *sbi_ext_id_to_str(const char *prefix, __u64 id)
>         __u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_SBI_EXT);
>         __u64 reg_subtype = reg_off & KVM_REG_RISCV_SUBTYPE_MASK;
>
> +       assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_SBI_EXT);
> +
>         reg_off &= ~KVM_REG_RISCV_SUBTYPE_MASK;
>
>         switch (reg_subtype) {
> @@ -414,8 +406,7 @@ static const char *sbi_ext_id_to_str(const char *prefix, __u64 id)
>                 return sbi_ext_multi_id_to_str(reg_subtype, reg_off);
>         }
>
> -       TEST_FAIL("%s: Unknown sbi ext subtype: 0x%llx", prefix, reg_subtype);
> -       return NULL;
> +       return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
>  }
>
>  void print_reg(const char *prefix, __u64 id)
> @@ -436,14 +427,14 @@ void print_reg(const char *prefix, __u64 id)
>                 reg_size = "KVM_REG_SIZE_U128";
>                 break;
>         default:
> -               TEST_FAIL("%s: Unexpected reg size: 0x%llx in reg id: 0x%llx",
> -                         prefix, (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id);
> +               printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) | 0x%llx /* UNKNOWN */,",
> +                      (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id & REG_MASK);
>         }
>
>         switch (id & KVM_REG_RISCV_TYPE_MASK) {
>         case KVM_REG_RISCV_CONFIG:
>                 printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_CONFIG | %s,\n",
> -                               reg_size, config_id_to_str(id));
> +                               reg_size, config_id_to_str(prefix, id));
>                 break;
>         case KVM_REG_RISCV_CORE:
>                 printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_CORE | %s,\n",
> @@ -467,15 +458,15 @@ void print_reg(const char *prefix, __u64 id)
>                 break;
>         case KVM_REG_RISCV_ISA_EXT:
>                 printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_ISA_EXT | %s,\n",
> -                               reg_size, isa_ext_id_to_str(id));
> +                               reg_size, isa_ext_id_to_str(prefix, id));
>                 break;
>         case KVM_REG_RISCV_SBI_EXT:
>                 printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_SBI_EXT | %s,\n",
>                                 reg_size, sbi_ext_id_to_str(prefix, id));
>                 break;
>         default:
> -               TEST_FAIL("%s: Unexpected reg type: 0x%llx in reg id: 0x%llx", prefix,
> -                               (id & KVM_REG_RISCV_TYPE_MASK) >> KVM_REG_RISCV_TYPE_SHIFT, id);
> +               printf("\tKVM_REG_RISCV | %s | 0x%llx /* UNKNOWN */,",
> +                               reg_size, id & REG_MASK);
>         }
>  }
>
> --
> 2.41.0
>


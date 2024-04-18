From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2024 18:51:42 +0530
Subject: [PATCH v2 12/12] KVM: riscv: selftests: Add Zcmop extension to
 get-reg-list test
In-Reply-To: <20240418124300.1387978-13-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com> <20240418124300.1387978-13-cleger@rivosinc.com>
Message-ID: <CAAhSdy1VTn_etwfYa-pYM-1hFFK02aBvynHJA7JVsOZvSdDx6w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 18, 2024 at 6:14?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> The KVM RISC-V allows Zcmop extension for Guest/VM so add this
> extension to get-reg-list test.
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 61cad4514197..9604c8ece787 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -59,6 +59,7 @@ bool filter_reg(__u64 reg)
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCB:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCD:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCF:
> +       case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCMOP:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFA:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
> @@ -429,6 +430,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>                 KVM_ISA_EXT_ARR(ZCB),
>                 KVM_ISA_EXT_ARR(ZCD),
>                 KVM_ISA_EXT_ARR(ZCF),
> +               KVM_ISA_EXT_ARR(ZCMOP),
>                 KVM_ISA_EXT_ARR(ZFA),
>                 KVM_ISA_EXT_ARR(ZFH),
>                 KVM_ISA_EXT_ARR(ZFHMIN),
> @@ -957,6 +959,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zca, ZCA),
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcb, ZCB),
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD),
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF),
> +KVM_ISA_EXT_SIMPLE_CONFIG(zcmop, ZCMOP);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
> @@ -1017,6 +1020,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>         &config_zcb,
>         &config_zcd,
>         &config_zcf,
> +       &config_zcmop,
>         &config_zfa,
>         &config_zfh,
>         &config_zfhmin,
> --
> 2.43.0
>


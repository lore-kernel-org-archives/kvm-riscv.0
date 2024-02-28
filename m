From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 28 Feb 2024 14:07:44 +0100
Subject: [PATCH 3/5] KVM: riscv: selftests: Add Ztso extension to
 get-reg-list test
In-Reply-To: <20240214123757.305347-4-apatel@ventanamicro.com>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
 <20240214123757.305347-4-apatel@ventanamicro.com>
Message-ID: <20240228-8e0f8611d2f45f71c04ead57@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 14, 2024 at 06:07:55PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Ztso extension for Guest/VM so let us
> add this extension to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 9d9c50b68207..5429453561d7 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -73,6 +73,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKSED:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKSH:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKT:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZTSO:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBB:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBC:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFH:
> @@ -436,6 +437,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(ZKSED),
>  		KVM_ISA_EXT_ARR(ZKSH),
>  		KVM_ISA_EXT_ARR(ZKT),
> +		KVM_ISA_EXT_ARR(ZTSO),
>  		KVM_ISA_EXT_ARR(ZVBB),
>  		KVM_ISA_EXT_ARR(ZVBC),
>  		KVM_ISA_EXT_ARR(ZVFH),
> @@ -957,6 +959,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zkr, ZKR);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zksed, ZKSED);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zksh, ZKSH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
> +KVM_ISA_EXT_SIMPLE_CONFIG(ztso, ZTSO);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvbb, ZVBB);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvbc, ZVBC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvfh, ZVFH);
> @@ -1010,6 +1013,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_zksed,
>  	&config_zksh,
>  	&config_zkt,
> +	&config_ztso,
>  	&config_zvbb,
>  	&config_zvbc,
>  	&config_zvfh,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


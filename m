From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 28 Feb 2024 14:10:27 +0100
Subject: [PATCH 5/5] KVM: riscv: selftests: Add Zacas extension to
 get-reg-list test
In-Reply-To: <20240214123757.305347-6-apatel@ventanamicro.com>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
 <20240214123757.305347-6-apatel@ventanamicro.com>
Message-ID: <20240228-8f3f6703b3c14ceaf169da3b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 14, 2024 at 06:07:57PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Zacas extension for Guest/VM so let us
> add this extension to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 5429453561d7..d334c4c9765f 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -47,6 +47,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBB:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBC:
> @@ -411,6 +412,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(SVINVAL),
>  		KVM_ISA_EXT_ARR(SVNAPOT),
>  		KVM_ISA_EXT_ARR(SVPBMT),
> +		KVM_ISA_EXT_ARR(ZACAS),
>  		KVM_ISA_EXT_ARR(ZBA),
>  		KVM_ISA_EXT_ARR(ZBB),
>  		KVM_ISA_EXT_ARR(ZBC),
> @@ -933,6 +935,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zbb, ZBB);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zbc, ZBC);
> @@ -987,6 +990,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_svinval,
>  	&config_svnapot,
>  	&config_svpbmt,
> +	&config_zacas,
>  	&config_zba,
>  	&config_zbb,
>  	&config_zbc,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


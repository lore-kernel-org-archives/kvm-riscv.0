From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 28 Nov 2024 10:00:02 +0100
Subject: [PATCH 4/4] KVM: riscv: selftests: Add Svvptc/Zabha/Ziccrse exts
 to get-reg-list test
In-Reply-To: <21d3a5314a9cd6ac5b3aa445060ae2679a44c792.1732762121.git.zhouquan@iscas.ac.cn>
References: <cover.1732762121.git.zhouquan@iscas.ac.cn>
 <21d3a5314a9cd6ac5b3aa445060ae2679a44c792.1732762121.git.zhouquan@iscas.ac.cn>
Message-ID: <20241128-846f2b5fdfda9e1aa9e373ee@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 28, 2024 at 11:22:14AM +0800, zhouquan at iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The KVM RISC-V allows Svvptc/Zabha/Ziccrse extensions for Guest/VM
> so add them to get-reg-list test.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 54ab484d0000..a697db1ff411 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -48,8 +48,10 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSNPM:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVVPTC:

Alphabetic order, please.

>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZABHA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAWRS:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
> @@ -69,6 +71,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICOND:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICSR:
> @@ -423,8 +426,10 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(SSNPM),
>  		KVM_ISA_EXT_ARR(SSTC),
>  		KVM_ISA_EXT_ARR(SVINVAL),
> +		KVM_ISA_EXT_ARR(SVVPTC),

Same comment as above.

>  		KVM_ISA_EXT_ARR(SVNAPOT),
>  		KVM_ISA_EXT_ARR(SVPBMT),
> +		KVM_ISA_EXT_ARR(ZABHA),
>  		KVM_ISA_EXT_ARR(ZACAS),
>  		KVM_ISA_EXT_ARR(ZAWRS),
>  		KVM_ISA_EXT_ARR(ZBA),
> @@ -444,6 +449,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(ZFHMIN),
>  		KVM_ISA_EXT_ARR(ZICBOM),
>  		KVM_ISA_EXT_ARR(ZICBOZ),
> +		KVM_ISA_EXT_ARR(ZICCRSE),
>  		KVM_ISA_EXT_ARR(ZICNTR),
>  		KVM_ISA_EXT_ARR(ZICOND),
>  		KVM_ISA_EXT_ARR(ZICSR),
> @@ -956,8 +962,10 @@ KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
>  KVM_ISA_EXT_SIMPLE_CONFIG(ssnpm, SSNPM);
>  KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
> +KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);

Same comment as above.

>  KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zawrs, ZAWRS);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
> @@ -977,6 +985,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
> +KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicond, ZICOND);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
> @@ -1021,8 +1030,10 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_ssnpm,
>  	&config_sstc,
>  	&config_svinval,
> +	&config_svvptc,

Same comment as above.

>  	&config_svnapot,
>  	&config_svpbmt,
> +	&config_zabha,
>  	&config_zacas,
>  	&config_zawrs,
>  	&config_zba,
> @@ -1042,6 +1053,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_zfhmin,
>  	&config_zicbom,
>  	&config_zicboz,
> +	&config_ziccrse,
>  	&config_zicntr,
>  	&config_zicond,
>  	&config_zicsr,
> -- 
> 2.34.1
> 

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


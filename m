From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Dec 2023 15:59:45 +0100
Subject: [PATCH v3 4/4] KVM: riscv: selftests: Add Svadu Extension to
 get-reg-list testt
In-Reply-To: <20231102120129.11261-5-yongxuan.wang@sifive.com>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
 <20231102120129.11261-5-yongxuan.wang@sifive.com>
Message-ID: <20231213-3b68f487a41af1e3f3c96cf2@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 02, 2023 at 12:01:25PM +0000, Yong-Xuan Wang wrote:
> Update the get-reg-list test to test the Svadu Extension is available
> for guest OS.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  .../testing/selftests/kvm/riscv/get-reg-list.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 9f99ea42f45f..972538d76f48 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -49,6 +49,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVADU:
>  		return true;
>  	/* AIA registers are always available when Ssaia can't be disabled */
>  	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
> @@ -340,6 +341,7 @@ static const char *isa_ext_id_to_str(__u64 id)
>  		"KVM_RISCV_ISA_EXT_ZICSR",
>  		"KVM_RISCV_ISA_EXT_ZIFENCEI",
>  		"KVM_RISCV_ISA_EXT_ZIHPM",
> +		"KVM_RISCV_ISA_EXT_SVADU",
>  	};
>  
>  	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
> @@ -700,6 +702,10 @@ static __u64 fp_d_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D,
>  };
>  
> +static __u64 svadu_regs[] = {
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVADU,
> +};
> +
>  #define BASE_SUBLIST \
>  	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
>  	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
> @@ -739,6 +745,9 @@ static __u64 fp_d_regs[] = {
>  #define FP_D_REGS_SUBLIST \
>  	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
>  		.regs_n = ARRAY_SIZE(fp_d_regs),}
> +#define SVADU_REGS_SUBLIST \
> +	{"svadu", .feature = KVM_RISCV_ISA_EXT_SVADU, .regs = svadu_regs, \
> +		.regs_n = ARRAY_SIZE(svadu_regs),}
>  
>  static struct vcpu_reg_list h_config = {
>  	.sublists = {
> @@ -876,6 +885,14 @@ static struct vcpu_reg_list fp_d_config = {
>  	},
>  };
>  
> +static struct vcpu_reg_list svadu_config = {
> +	.sublists = {
> +	BASE_SUBLIST,
> +	SVADU_REGS_SUBLIST,
> +	{0},
> +	},
> +};
> +
>  struct vcpu_reg_list *vcpu_configs[] = {
>  	&h_config,
>  	&zicbom_config,
> @@ -894,5 +911,6 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&aia_config,
>  	&fp_f_config,
>  	&fp_d_config,
> +	&svadu_config,
>  };
>  int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
> -- 
> 2.17.1
>

We should rebase this on [1] since it changes sublist management.

[1] https://lore.kernel.org/all/20231128145357.413321-2-apatel at ventanamicro.com/

Thanks,
drew


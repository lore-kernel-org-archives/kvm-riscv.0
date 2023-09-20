From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Sep 2023 10:13:29 +0200
Subject: [PATCH 6/7] KVM: riscv: selftests: Add smstateen registers to
 get-reg-list test
In-Reply-To: <20230919035343.1399389-7-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-7-apatel@ventanamicro.com>
Message-ID: <20230920-af833495ead3e2f8c32d63cc@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 19, 2023 at 09:23:42AM +0530, Anup Patel wrote:
> We have a new smstateen registers as separate sub-type of CSR ONE_REG
> interface so let us add these registers to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 0928c35470ae..9f464c7996c6 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -49,6 +49,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN:
>  		return true;
>  	/* AIA registers are always available when Ssaia can't be disabled */
>  	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
> @@ -184,6 +185,8 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
>  	"KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(" #csr ")"
>  #define RISCV_CSR_AIA(csr) \
>  	"KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_REG(" #csr ")"
> +#define RISCV_CSR_SMSTATEEN(csr) \
> +	"KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_REG(" #csr ")"
>  
>  static const char *general_csr_id_to_str(__u64 reg_off)
>  {
> @@ -241,6 +244,18 @@ static const char *aia_csr_id_to_str(__u64 reg_off)
>  	return NULL;
>  }
>  
> +static const char *smstateen_csr_id_to_str(__u64 reg_off)
> +{
> +	/* reg_off is the offset into struct kvm_riscv_smstateen_csr */
> +	switch (reg_off) {
> +	case KVM_REG_RISCV_CSR_SMSTATEEN_REG(sstateen0):
> +		return RISCV_CSR_SMSTATEEN(sstateen0);
> +	}
> +
> +	TEST_FAIL("Unknown smstateen csr reg: 0x%llx", reg_off);
> +	return NULL;
> +}
> +
>  static const char *csr_id_to_str(const char *prefix, __u64 id)
>  {
>  	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CSR);
> @@ -253,6 +268,8 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
>  		return general_csr_id_to_str(reg_off);
>  	case KVM_REG_RISCV_CSR_AIA:
>  		return aia_csr_id_to_str(reg_off);
> +	case KVM_REG_RISCV_CSR_SMSTATEEN:
> +		return smstateen_csr_id_to_str(reg_off);
>  	}
>  
>  	TEST_FAIL("%s: Unknown csr subtype: 0x%llx", prefix, reg_subtype);
> @@ -342,6 +359,7 @@ static const char *isa_ext_id_to_str(__u64 id)
>  		"KVM_RISCV_ISA_EXT_ZICSR",
>  		"KVM_RISCV_ISA_EXT_ZIFENCEI",
>  		"KVM_RISCV_ISA_EXT_ZIHPM",
> +		"KVM_RISCV_ISA_EXT_SMSTATEEN",

If we merge [1] first, then this would be added in alphabetical order.

[1] https://lore.kernel.org/all/20230817162344.17076-6-ajones at ventanamicro.com/

>  	};
>  
>  	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
> @@ -629,6 +647,11 @@ static __u64 aia_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA,
>  };
>  
> +static __u64 smstateen_regs[] = {
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_SMSTATEEN_REG(sstateen0),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN,
> +};
> +
>  static __u64 fp_f_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(f[0]),
>  	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(f[1]),
> @@ -736,6 +759,8 @@ static __u64 fp_d_regs[] = {
>  	{"zihpm", .feature = KVM_RISCV_ISA_EXT_ZIHPM, .regs = zihpm_regs, .regs_n = ARRAY_SIZE(zihpm_regs),}
>  #define AIA_REGS_SUBLIST \
>  	{"aia", .feature = KVM_RISCV_ISA_EXT_SSAIA, .regs = aia_regs, .regs_n = ARRAY_SIZE(aia_regs),}
> +#define SMSTATEEN_REGS_SUBLIST \
> +	{"smstateen", .feature = KVM_RISCV_ISA_EXT_SMSTATEEN, .regs = smstateen_regs, .regs_n = ARRAY_SIZE(smstateen_regs),}
>  #define FP_F_REGS_SUBLIST \
>  	{"fp_f", .feature = KVM_RISCV_ISA_EXT_F, .regs = fp_f_regs, \
>  		.regs_n = ARRAY_SIZE(fp_f_regs),}
> @@ -863,6 +888,14 @@ static struct vcpu_reg_list aia_config = {
>  	},
>  };
>  
> +static struct vcpu_reg_list smstateen_config = {
> +	.sublists = {
> +	BASE_SUBLIST,
> +	SMSTATEEN_REGS_SUBLIST,
> +	{0},
> +	},
> +};
> +
>  static struct vcpu_reg_list fp_f_config = {
>  	.sublists = {
>  	BASE_SUBLIST,
> @@ -895,6 +928,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&zifencei_config,
>  	&zihpm_config,
>  	&aia_config,
> +	&smstateen_config,
>  	&fp_f_config,
>  	&fp_d_config,
>  };
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


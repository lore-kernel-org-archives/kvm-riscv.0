From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Sep 2023 10:18:49 +0200
Subject: [PATCH 7/7] KVM: riscv: selftests: Add condops extensions to
 get-reg-list test
In-Reply-To: <20230919035343.1399389-8-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-8-apatel@ventanamicro.com>
Message-ID: <20230920-d30b398a99804418792264c3@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 19, 2023 at 09:23:43AM +0530, Anup Patel wrote:
> We have a new conditional operations related ISA extensions so let us add
> these extensions to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 9f464c7996c6..4ad4bf87fa78 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -50,6 +50,8 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_XVENTANACONDOPS:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICOND:
>  		return true;
>  	/* AIA registers are always available when Ssaia can't be disabled */
>  	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
> @@ -360,6 +362,8 @@ static const char *isa_ext_id_to_str(__u64 id)
>  		"KVM_RISCV_ISA_EXT_ZIFENCEI",
>  		"KVM_RISCV_ISA_EXT_ZIHPM",
>  		"KVM_RISCV_ISA_EXT_SMSTATEEN",
> +		"KVM_RISCV_ISA_EXT_XVENTANACONDOPS",
> +		"KVM_RISCV_ISA_EXT_ZICOND",
>  	};
>  
>  	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
> -- 
> 2.34.1
>

Don't we want to add test configs for these?

Thanks,
drew


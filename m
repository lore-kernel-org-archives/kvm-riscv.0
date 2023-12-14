From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Dec 2023 08:52:35 +0100
Subject: [PATCH v3 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
In-Reply-To: <20231205174509.2238870-4-dbarboza@ventanamicro.com>
References: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
 <20231205174509.2238870-4-dbarboza@ventanamicro.com>
Message-ID: <20231214-315a8cd86b5eeb5a1a4ebd88@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 05, 2023 at 02:45:09PM -0300, Daniel Henrique Barboza wrote:
> Add all vector CSRs (vstart, vl, vtype, vcsr, vlenb) in get-reg-list.

We should add another patch for the test for these
(tools/testing/selftests/kvm/riscv/get-reg-list.c)

Thanks,
drew

> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 55 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f8c9fa0c03c5..2eb4980295ae 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -986,6 +986,55 @@ static int copy_sbi_ext_reg_indices(u64 __user *uindices)
>  	return num_sbi_ext_regs();
>  }
>  
> +static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
> +{
> +	if (!riscv_isa_extension_available(vcpu->arch.isa, v))
> +		return 0;
> +
> +	/* vstart, vl, vtype, vcsr, vlenb and 32 vector regs */
> +	return 37;
> +}
> +
> +static int copy_vector_reg_indices(const struct kvm_vcpu *vcpu,
> +				u64 __user *uindices)
> +{
> +	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
> +	int n = num_vector_regs(vcpu);
> +	u64 reg, size;
> +	int i;
> +
> +	if (n == 0)
> +		return 0;
> +
> +	/* copy vstart, vl, vtype, vcsr and vlenb */
> +	size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> +	for (i = 0; i < 5; i++) {
> +		reg = KVM_REG_RISCV | size | KVM_REG_RISCV_VECTOR | i;
> +
> +		if (uindices) {
> +			if (put_user(reg, uindices))
> +				return -EFAULT;
> +			uindices++;
> +		}
> +	}
> +
> +	/* vector_regs have a variable 'vlenb' size */
> +	size = __builtin_ctzl(cntx->vector.vlenb);
> +	size <<= KVM_REG_SIZE_SHIFT;
> +	for (i = 0; i < 32; i++) {
> +		reg = KVM_REG_RISCV | KVM_REG_RISCV_VECTOR | size |
> +			KVM_REG_RISCV_VECTOR_REG(i);
> +
> +		if (uindices) {
> +			if (put_user(reg, uindices))
> +				return -EFAULT;
> +			uindices++;
> +		}
> +	}
> +
> +	return n;
> +}
> +
>  /*
>   * kvm_riscv_vcpu_num_regs - how many registers do we present via KVM_GET/SET_ONE_REG
>   *
> @@ -1001,6 +1050,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
>  	res += num_timer_regs();
>  	res += num_fp_f_regs(vcpu);
>  	res += num_fp_d_regs(vcpu);
> +	res += num_vector_regs(vcpu);
>  	res += num_isa_ext_regs(vcpu);
>  	res += num_sbi_ext_regs();
>  
> @@ -1045,6 +1095,11 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
>  		return ret;
>  	uindices += ret;
>  
> +	ret = copy_vector_reg_indices(vcpu, uindices);
> +	if (ret < 0)
> +		return ret;
> +	uindices += ret;
> +
>  	ret = copy_isa_ext_reg_indices(vcpu, uindices);
>  	if (ret < 0)
>  		return ret;
> -- 
> 2.41.0
> 


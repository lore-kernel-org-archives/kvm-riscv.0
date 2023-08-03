From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 3 Aug 2023 20:05:47 +0300
Subject: [PATCH v4 09/10] RISC-V: KVM: Improve vector save/restore errors
In-Reply-To: <20230803163302.445167-10-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
 <20230803163302.445167-10-dbarboza@ventanamicro.com>
Message-ID: <20230803-b656c44ee07d661600b8696a@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 03, 2023 at 01:33:01PM -0300, Daniel Henrique Barboza wrote:
> From: Andrew Jones <ajones@ventanamicro.com>
> 
> kvm_riscv_vcpu_(get/set)_reg_vector() now returns ENOENT if V is not
> available, EINVAL if reg type is not of VECTOR type, and any error that
> might be thrown by kvm_riscv_vcpu_vreg_addr().
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_vector.c | 60 ++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
> index edd2eecbddc2..39c5bceb4d1b 100644
> --- a/arch/riscv/kvm/vcpu_vector.c
> +++ b/arch/riscv/kvm/vcpu_vector.c
> @@ -91,44 +91,44 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
>  }
>  #endif
>  
> -static void *kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
> +static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
>  				      unsigned long reg_num,
> -				      size_t reg_size)
> +				      size_t reg_size,
> +				      void **reg_val)
>  {
>  	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
> -	void *reg_val;
>  	size_t vlenb = riscv_v_vsize / 32;
>  
>  	if (reg_num < KVM_REG_RISCV_VECTOR_REG(0)) {
>  		if (reg_size != sizeof(unsigned long))
> -			return NULL;
> +			return -EINVAL;
>  		switch (reg_num) {
>  		case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
> -			reg_val = &cntx->vector.vstart;
> +			*reg_val = &cntx->vector.vstart;
>  			break;
>  		case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
> -			reg_val = &cntx->vector.vl;
> +			*reg_val = &cntx->vector.vl;
>  			break;
>  		case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
> -			reg_val = &cntx->vector.vtype;
> +			*reg_val = &cntx->vector.vtype;
>  			break;
>  		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
> -			reg_val = &cntx->vector.vcsr;
> +			*reg_val = &cntx->vector.vcsr;
>  			break;
>  		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
>  		default:
> -			return NULL;
> +			return -ENOENT;
>  		}
>  	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
>  		if (reg_size != vlenb)
> -			return NULL;
> -		reg_val = cntx->vector.datap
> +			return -EINVAL;
> +		*reg_val = cntx->vector.datap
>  			  + (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
>  	} else {
> -		return NULL;
> +		return -ENOENT;
>  	}
>  
> -	return reg_val;
> +	return 0;
>  }
>  
>  int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
> @@ -141,17 +141,20 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
>  	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>  					    KVM_REG_SIZE_MASK |
>  					    rtype);
> -	void *reg_val = NULL;
>  	size_t reg_size = KVM_REG_SIZE(reg->id);
> +	void *reg_val;
> +	int rc;
>  
> -	if (rtype == KVM_REG_RISCV_VECTOR &&
> -	    riscv_isa_extension_available(isa, v)) {
> -		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
> -	}
> -
> -	if (!reg_val)
> +	if (rtype != KVM_REG_RISCV_VECTOR)
>  		return -EINVAL;
>  
> +	if (!riscv_isa_extension_available(isa, v))
> +		return -ENOENT;
> +
> +	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
> +	if (rc)
> +		return rc;
> +
>  	if (copy_to_user(uaddr, reg_val, reg_size))
>  		return -EFAULT;
>  
> @@ -168,17 +171,20 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
>  	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>  					    KVM_REG_SIZE_MASK |
>  					    rtype);
> -	void *reg_val = NULL;
>  	size_t reg_size = KVM_REG_SIZE(reg->id);
> +	void *reg_val;
> +	int rc;
>  
> -	if (rtype == KVM_REG_RISCV_VECTOR &&
> -	    riscv_isa_extension_available(isa, v)) {
> -		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
> -	}
> -
> -	if (!reg_val)
> +	if (rtype != KVM_REG_RISCV_VECTOR)
>  		return -EINVAL;
>  
> +	if (!riscv_isa_extension_available(isa, v))
> +		return -ENOENT;
> +
> +	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
> +	if (rc)
> +		return rc;
> +
>  	if (copy_from_user(reg_val, uaddr, reg_size))
>  		return -EFAULT;

Ugh, this is totally wrong. We no longer set the register. I need to
rework this rework...



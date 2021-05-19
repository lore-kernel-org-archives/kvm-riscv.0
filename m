From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 May 2021 13:11:49 +0300
Subject: [PATCH v18 14/18] RISC-V: KVM: Implement ONE REG interface for
 FP registers
In-Reply-To: <20210519033553.1110536-15-anup.patel@wdc.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <20210519033553.1110536-15-anup.patel@wdc.com>
Message-ID: <20210519101149.GS1955@kadam>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 19, 2021 at 09:05:49AM +0530, Anup Patel wrote:
>  static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>  				  const struct kvm_one_reg *reg)
>  {
> @@ -427,6 +519,12 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>  		return kvm_riscv_vcpu_set_reg_csr(vcpu, reg);
>  	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
>  		return kvm_riscv_vcpu_set_reg_timer(vcpu, reg);
> +	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
> +		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
> +						 KVM_REG_RISCV_FP_F);
> +	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
> +		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
> +						 KVM_REG_RISCV_FP_D);
>  
>  	return -EINVAL;
>  }
> @@ -442,6 +540,12 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
>  		return kvm_riscv_vcpu_get_reg_csr(vcpu, reg);
>  	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
>  		return kvm_riscv_vcpu_get_reg_timer(vcpu, reg);
> +	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
> +		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
> +						 KVM_REG_RISCV_FP_F);
> +	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
> +		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
> +						 KVM_REG_RISCV_FP_D);

These have become unwieldy.  Use a switch statement:

	switch (reg->id & KVM_REG_RISCV_TYPE_MASK) {
	case KVM_REG_RISCV_TIMER:
		return kvm_riscv_vcpu_get_reg_timer(vcpu, reg);
regards,
dan carpenter



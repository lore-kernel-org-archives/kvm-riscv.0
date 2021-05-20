From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 May 2021 09:09:24 +0300
Subject: [PATCH v18 14/18] RISC-V: KVM: Implement ONE REG interface for
 FP registers
In-Reply-To: <20210519033553.1110536-15-anup.patel@wdc.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <20210519033553.1110536-15-anup.patel@wdc.com>
Message-ID: <20210520060924.GD1955@kadam>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 19, 2021 at 09:05:49AM +0530, Anup Patel wrote:
> +static int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
> +				     const struct kvm_one_reg *reg,
> +				     unsigned long rtype)
> +{
> +	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
> +	unsigned long isa = vcpu->arch.isa;
> +	unsigned long __user *uaddr =
> +			(unsigned long __user *)(unsigned long)reg->addr;
> +	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
> +					    KVM_REG_SIZE_MASK |
> +					    rtype);
> +	void *reg_val;
> +
> +	if ((rtype == KVM_REG_RISCV_FP_F) &&
> +	    riscv_isa_extension_available(&isa, f)) {
> +		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
> +			return -EINVAL;
> +		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
> +			reg_val = &cntx->fp.f.fcsr;
> +		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
> +			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
> +			reg_val = &cntx->fp.f.f[reg_num];
> +		else
> +			return -EINVAL;
> +	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
> +		   riscv_isa_extension_available(&isa, d)) {
> +		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
> +			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
> +				return -EINVAL;
> +			reg_val = &cntx->fp.d.fcsr;
> +		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
> +			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
> +			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
> +				return -EINVAL;
> +			reg_val = &cntx->fp.d.f[reg_num];
> +		} else
> +			return -EINVAL;
> +	} else
> +		return -EINVAL;
> +
> +	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
                           ^^^^^^^
It sort of bothers me that if this copy fails then we have no idea
what garbage is in reg_val.  It would be nicer to copy it to a temporary
buffer and then memcpy it when we know it's going succeed.

> +		return -EFAULT;
> +
> +	return 0;
> +}

regards,
dan carpenter


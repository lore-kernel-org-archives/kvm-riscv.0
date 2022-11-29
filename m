From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 29 Nov 2022 06:46:16 +0100
Subject: [PATCH 8/9] RISC-V: KVM: Add ONE_REG interface for mvendorid,
 marchid, and mimpid
In-Reply-To: <20221128161424.608889-9-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
 <20221128161424.608889-9-apatel@ventanamicro.com>
Message-ID: <20221129054616.4zju5z7ipg6wki7l@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 09:44:23PM +0530, Anup Patel wrote:
> We add ONE_REG interface for VCPU mvendorid, marchid, and mimpid
> so that KVM user-space can change this details to support migration
> across heterogeneous hosts.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  3 +++
>  arch/riscv/kvm/vcpu.c             | 27 +++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 8985ff234c01..92af6f3f057c 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -49,6 +49,9 @@ struct kvm_sregs {
>  struct kvm_riscv_config {
>  	unsigned long isa;
>  	unsigned long zicbom_block_size;
> +	unsigned long mvendorid;
> +	unsigned long marchid;
> +	unsigned long mimpid;
>  };
>  
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 312a8a926867..7c08567097f0 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -276,6 +276,15 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>  			return -EINVAL;
>  		reg_val = riscv_cbom_block_size;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> +		reg_val = vcpu->arch.mvendorid;
> +		break;
> +	case KVM_REG_RISCV_CONFIG_REG(marchid):
> +		reg_val = vcpu->arch.marchid;
> +		break;
> +	case KVM_REG_RISCV_CONFIG_REG(mimpid):
> +		reg_val = vcpu->arch.mimpid;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -338,6 +347,24 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>  		break;
>  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>  		return -EOPNOTSUPP;
> +	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> +		if (!vcpu->arch.ran_atleast_once)
> +			vcpu->arch.mvendorid = reg_val;
> +		else
> +			return -EBUSY;
> +		break;
> +	case KVM_REG_RISCV_CONFIG_REG(marchid):
> +		if (!vcpu->arch.ran_atleast_once)
> +			vcpu->arch.marchid = reg_val;
> +		else
> +			return -EBUSY;
> +		break;
> +	case KVM_REG_RISCV_CONFIG_REG(mimpid):
> +		if (!vcpu->arch.ran_atleast_once)
> +			vcpu->arch.mimpid = reg_val;
> +		else
> +			return -EBUSY;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> -- 
> 2.34.1
>

At some point we should patch Documentation/virt/kvm/api.rst to describe
the possible errors we have. It's missing EOPNOTSUPP and EBUSY.

Also, I see a couple places were we use EOPNOTSUPP that would be better
as EBUSY. And finally I wonder if we shouldn't use ENOENT when the reg_num
is wrong/unknown, which would allow us to differentiate between bad
reg_num and bad reg_val in set-one ioctls.

I can send an RFC series to better describe these thoughts.

And for this patch,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 5 Jul 2023 13:23:26 +0200
Subject: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
In-Reply-To: <20230705091535.237765-1-dbarboza@ventanamicro.com>
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
Message-ID: <20230705-8af7caeededf1b02f0a08d64@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 05, 2023 at 06:15:35AM -0300, Daniel Henrique Barboza wrote:
> KVM userspaces need to be aware of the host SATP to allow them to
> advertise it back to the guest OS.
> 
> Since this information is used to build the guest FDT we can't wait for
> the SATP reg to be readable. We just need to read the SATP mode, thus
> we can use the existing 'satp_mode' global that represents the SATP reg
> with MODE set and both ASID and PPN cleared. E.g. for a 32 bit host
> running with sv32 satp_mode is 0x80000000, for a 64 bit host running
> sv57 satp_mode is 0xa000000000000000, and so on.
> 
> Add a new userspace virtual config register 'satp_mode' to allow
> userspace to read the current SATP mode the host is using with
> GET_ONE_REG API before spinning the vcpu.
> 
> 'satp_mode' can't be changed via KVM, so SET_ONE_REG is allowed as long
> as userspace writes the existing 'satp_mode'.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h      | 2 ++
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 7 +++++++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index b6acb7ed115f..be6e5c305e5b 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -46,6 +46,7 @@
>  #ifndef CONFIG_64BIT
>  #define SATP_PPN	_AC(0x003FFFFF, UL)
>  #define SATP_MODE_32	_AC(0x80000000, UL)
> +#define SATP_MODE_SHIFT	31
>  #define SATP_ASID_BITS	9
>  #define SATP_ASID_SHIFT	22
>  #define SATP_ASID_MASK	_AC(0x1FF, UL)
> @@ -54,6 +55,7 @@
>  #define SATP_MODE_39	_AC(0x8000000000000000, UL)
>  #define SATP_MODE_48	_AC(0x9000000000000000, UL)
>  #define SATP_MODE_57	_AC(0xa000000000000000, UL)
> +#define SATP_MODE_SHIFT	60
>  #define SATP_ASID_BITS	16
>  #define SATP_ASID_SHIFT	44
>  #define SATP_ASID_MASK	_AC(0xFFFF, UL)
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index f92790c9481a..0493c078e64e 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -54,6 +54,7 @@ struct kvm_riscv_config {
>  	unsigned long marchid;
>  	unsigned long mimpid;
>  	unsigned long zicboz_block_size;
> +	unsigned long satp_mode;
>  };
>  
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 8bd9f2a8a0b9..b31acf923802 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -313,6 +313,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>  	case KVM_REG_RISCV_CONFIG_REG(mimpid):
>  		reg_val = vcpu->arch.mimpid;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(satp_mode):
> +		reg_val = satp_mode >> SATP_MODE_SHIFT;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -395,6 +398,10 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>  		else
>  			return -EBUSY;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(satp_mode):
> +		if (reg_val != (satp_mode >> SATP_MODE_SHIFT))
> +			return -EINVAL;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


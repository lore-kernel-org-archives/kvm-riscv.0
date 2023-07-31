From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 31 Jul 2023 14:57:12 +0200
Subject: [PATCH 5/6] RISC-V: KVM: use EBUSY when
 !vcpu->arch.ran_atleast_once
In-Reply-To: <20230731120420.91007-6-dbarboza@ventanamicro.com>
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
 <20230731120420.91007-6-dbarboza@ventanamicro.com>
Message-ID: <20230731-a4cd05af8a738c2d1fe8a120@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 31, 2023 at 09:04:19AM -0300, Daniel Henrique Barboza wrote:
> vcpu_set_reg_config() and vcpu_set_reg_isa_ext() is throwing an
> EOPNOTSUPP error when !vcpu->arch.ran_atleast_once. In similar cases
> we're throwing an EBUSY error, like in mvendorid/marchid/mimpid
> set_reg().
> 
> EOPNOTSUPP has a conotation of finality. EBUSY is more adequate in this
> case since its a condition/error related to the vcpu lifecycle.
> 
> Change these EOPNOTSUPP instances to EBUSY.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 42bf01ab6a8f..07ce747620f9 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -209,7 +209,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>  			vcpu->arch.isa[0] = reg_val;
>  			kvm_riscv_vcpu_fp_reset(vcpu);
>  		} else {
> -			return -EOPNOTSUPP;
> +			return -EBUSY;
>  		}
>  		break;
>  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> @@ -477,7 +477,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
>  			return -EINVAL;
>  		kvm_riscv_vcpu_fp_reset(vcpu);
>  	} else {
> -		return -EOPNOTSUPP;
> +		return -EBUSY;
>  	}

I think we should allow these ran_atleast_once type of registers to be
written when the value matches, as we now do for the other registers.
EBUSY should still be returned when the value doesn't match, though.

Thanks,
drew


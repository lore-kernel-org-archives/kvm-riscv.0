From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 23 May 2024 11:06:03 +0200
Subject: [PATCH] RISC-V: KVM: Fix incorrect reg_subtype labels in
 kvm_riscv_vcpu_set_reg_isa_ext function
In-Reply-To: <ff1c6771a67d660db94372ac9aaa40f51e5e0090.1716429371.git.zhouquan@iscas.ac.cn>
References: <ff1c6771a67d660db94372ac9aaa40f51e5e0090.1716429371.git.zhouquan@iscas.ac.cn>
Message-ID: <20240523-9c0425e6b3c697abc1009123@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 23, 2024 at 10:13:34AM GMT, zhouquan at iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> In the function kvm_riscv_vcpu_set_reg_isa_ext, the original code
> used incorrect reg_subtype labels KVM_REG_RISCV_SBI_MULTI_EN/DIS.
> These have been corrected to KVM_REG_RISCV_ISA_MULTI_EN/DIS respectively.
> Although they are numerically equivalent, the actual processing
> will not result in errors, but it may lead to ambiguous code semantics.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index c676275ea0a0..62874fbca29f 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -724,9 +724,9 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
>  	switch (reg_subtype) {
>  	case KVM_REG_RISCV_ISA_SINGLE:
>  		return riscv_vcpu_set_isa_ext_single(vcpu, reg_num, reg_val);
> -	case KVM_REG_RISCV_SBI_MULTI_EN:
> +	case KVM_REG_RISCV_ISA_MULTI_EN:
>  		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, true);
> -	case KVM_REG_RISCV_SBI_MULTI_DIS:
> +	case KVM_REG_RISCV_ISA_MULTI_DIS:
>  		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, false);
>  	default:
>  		return -ENOENT;
> 
> base-commit: 29c73fc794c83505066ee6db893b2a83ac5fac63
> -- 
> 2.34.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


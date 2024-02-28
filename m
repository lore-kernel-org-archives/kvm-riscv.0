From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 28 Feb 2024 14:03:39 +0100
Subject: [PATCH 1/5] RISC-V: KVM: Forward SEED CSR access to user space
In-Reply-To: <20240214123757.305347-2-apatel@ventanamicro.com>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
 <20240214123757.305347-2-apatel@ventanamicro.com>
Message-ID: <20240228-e87f7a9a9cf6fa701e621f41@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 14, 2024 at 06:07:53PM +0530, Anup Patel wrote:
> The SEED CSR access from VS/VU mode (guest) will always trap to
> HS-mode (KVM) when Zkr extension is available to the Guest/VM.
> 
> We must forward this CSR access to KVM user space so that it
> can be emulated based on the method chosen by VMM.
> 
> Fixes: f370b4e668f0 ("RISC-V: KVM: Allow scalar crypto extensions for Guest/VM")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_insn.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index 7a6abed41bc1..ee7215f4071f 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -7,6 +7,8 @@
>  #include <linux/bitops.h>
>  #include <linux/kvm_host.h>
>  
> +#include <asm/cpufeature.h>
> +
>  #define INSN_OPCODE_MASK	0x007c
>  #define INSN_OPCODE_SHIFT	2
>  #define INSN_OPCODE_SYSTEM	28
> @@ -213,9 +215,20 @@ struct csr_func {
>  		    unsigned long wr_mask);
>  };
>  
> +static int seed_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_num,
> +			unsigned long *val, unsigned long new_val,
> +			unsigned long wr_mask)
> +{
> +	if (!riscv_isa_extension_available(vcpu->arch.isa, ZKR))
> +		return KVM_INSN_ILLEGAL_TRAP;
> +
> +	return KVM_INSN_EXIT_TO_USER_SPACE;
> +}
> +
>  static const struct csr_func csr_funcs[] = {
>  	KVM_RISCV_VCPU_AIA_CSR_FUNCS
>  	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
> +	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
>  };
>  
>  /**
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 21 Nov 2022 11:53:33 +0100
Subject: [PATCH -next] RISC-V: KVM: optimize kvm_arch_hardware_enable()
In-Reply-To: <20221121003915.2817102-1-chenlifu@huawei.com>
References: <20221121003915.2817102-1-chenlifu@huawei.com>
Message-ID: <20221121105333.rap67cpmst3odiid@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 21, 2022 at 08:39:15AM +0800, Chen Lifu wrote:
> The values of CSR_HEDELEG and CSR_HIDELEG registers are constants,
> so change them from variables to macros.
> 
> Signed-off-by: Chen Lifu <chenlifu@huawei.com>
> ---
>  arch/riscv/kvm/main.c | 31 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index df2d8716851f..70196b03b6f9 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -12,10 +12,21 @@
>  #include <linux/kvm_host.h>
>  #include <asm/csr.h>
>  #include <asm/hwcap.h>
>  #include <asm/sbi.h>
>  
> +#define EXC_HEDELEG ((1UL << EXC_INST_MISALIGNED) | \
> +		     (1UL << EXC_BREAKPOINT)      | \
> +		     (1UL << EXC_SYSCALL)         | \
> +		     (1UL << EXC_INST_PAGE_FAULT) | \
> +		     (1UL << EXC_LOAD_PAGE_FAULT) | \
> +		     (1UL << EXC_STORE_PAGE_FAULT))
> +
> +#define IRQ_HIDELEG ((1UL << IRQ_VS_SOFT)  | \
> +		     (1UL << IRQ_VS_TIMER) | \
> +		     (1UL << IRQ_VS_EXT))
> +
>  long kvm_arch_dev_ioctl(struct file *filp,
>  			unsigned int ioctl, unsigned long arg)
>  {
>  	return -EINVAL;
>  }
> @@ -30,29 +41,13 @@ int kvm_arch_hardware_setup(void *opaque)
>  	return 0;
>  }
>  
>  int kvm_arch_hardware_enable(void)
>  {
> -	unsigned long hideleg, hedeleg;
> -
> -	hedeleg = 0;
> -	hedeleg |= (1UL << EXC_INST_MISALIGNED);
> -	hedeleg |= (1UL << EXC_BREAKPOINT);
> -	hedeleg |= (1UL << EXC_SYSCALL);
> -	hedeleg |= (1UL << EXC_INST_PAGE_FAULT);
> -	hedeleg |= (1UL << EXC_LOAD_PAGE_FAULT);
> -	hedeleg |= (1UL << EXC_STORE_PAGE_FAULT);
> -	csr_write(CSR_HEDELEG, hedeleg);
> -
> -	hideleg = 0;
> -	hideleg |= (1UL << IRQ_VS_SOFT);
> -	hideleg |= (1UL << IRQ_VS_TIMER);
> -	hideleg |= (1UL << IRQ_VS_EXT);
> -	csr_write(CSR_HIDELEG, hideleg);
> -
> +	csr_write(CSR_HEDELEG, EXC_HEDELEG);
> +	csr_write(CSR_HIDELEG, IRQ_HIDELEG);
>  	csr_write(CSR_HCOUNTEREN, -1UL);
> -
>  	csr_write(CSR_HVIP, 0);
>  
>  	return 0;
>  }
>  
> -- 
> 2.37.1
>

I don't think this optimizes anything. I'm pretty sure the compiler will
load the input to csr_write() in the most efficient way it can, regardless
of using a constant or building the input out of constants. This could
maybe be considered a code cleanup, but, in this case, it's really in the
eye of the beholder.

Thanks,
drew


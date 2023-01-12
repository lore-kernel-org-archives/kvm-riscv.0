From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 12 Jan 2023 16:47:04 +0100
Subject: [PATCH v2 08/11] RISC-V: KVM: Disable all hpmcounter access for
 VS/VU mode
In-Reply-To: <20221215170046.2010255-9-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-9-atishp@rivosinc.com>
Message-ID: <20230112154704.x6ml27hnsxh25my2@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 15, 2022 at 09:00:43AM -0800, Atish Patra wrote:
> Any guest must not get access to any hpmcounter including cycle/instret
> without any checks. We achieve that by disabling all the bits except TM
> bit in hcountern.

hcounteren

> 
> However, instret and cycle access for guest userspace can be enabled
> upon explicit request (via ONE REG) or on first trap from VU mode
> to maintain ABI requirement in the future. This patch doesn't support
> that as ONE REG inteface is not settled yet.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 58c5489..9c2efd3 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -49,7 +49,8 @@ int kvm_arch_hardware_enable(void)
>  	hideleg |= (1UL << IRQ_VS_EXT);
>  	csr_write(CSR_HIDELEG, hideleg);
>  
> -	csr_write(CSR_HCOUNTEREN, -1UL);
> +	/* VS should access only TM bit. Everything else should trap */

s/TM bit/the time counter/

> +	csr_write(CSR_HCOUNTEREN, 0x02);
>  
>  	csr_write(CSR_HVIP, 0);
>  
> -- 
> 2.25.1
> 

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


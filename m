From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 23 Oct 2023 12:03:59 +0200
Subject: [PATCH 5/5] riscv: kvm: use ".L" local labels in assembly when
 applicable
In-Reply-To: <20231004143054.482091-6-cleger@rivosinc.com>
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-6-cleger@rivosinc.com>
Message-ID: <20231023-c9629db3ee7d3e845030bc26@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 04, 2023 at 04:30:54PM +0200, Cl?ment L?ger wrote:
> For the sake of coherency, use local labels in assembly when
> applicable. This also avoid kprobes being confused when applying a
> kprobe since the size of function is computed by checking where the
> next visible symbol is located. This might end up in computing some
> function size to be way shorter than expected and thus failing to apply
> kprobes to the specified offset.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_switch.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
> index 8b18473780ac..0c26189aa01c 100644
> --- a/arch/riscv/kvm/vcpu_switch.S
> +++ b/arch/riscv/kvm/vcpu_switch.S
> @@ -45,7 +45,7 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
>  	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
>  	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
>  	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> -	la	t4, __kvm_switch_return
> +	la	t4, .Lkvm_switch_return
>  	REG_L	t5, (KVM_ARCH_GUEST_SEPC)(a0)
>  
>  	/* Save Host and Restore Guest SSTATUS */
> @@ -113,7 +113,7 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
>  
>  	/* Back to Host */
>  	.align 2
> -__kvm_switch_return:
> +.Lkvm_switch_return:
>  	/* Swap Guest A0 with SSCRATCH */
>  	csrrw	a0, CSR_SSCRATCH, a0
>  
> -- 
> 2.42.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


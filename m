From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Date: Thu, 28 Nov 2024 13:14:50 +0500
Subject: [PATCH v4 01/16] KVM: Move KVM_REG_SIZE() definition to common
 uAPI header
In-Reply-To: <20241128005547.4077116-2-seanjc@google.com>
References: <20241128005547.4077116-1-seanjc@google.com>
 <20241128005547.4077116-2-seanjc@google.com>
Message-ID: <4431aa18-c518-4396-87e8-04176eabdd49@collabora.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/28/24 5:55 AM, Sean Christopherson wrote:
> Define KVM_REG_SIZE() in the common kvm.h header, and delete the arm64 and
> RISC-V versions.  As evidenced by the surrounding definitions, all aspects
> of the register size encoding are generic, i.e. RISC-V should have moved
> arm64's definition to common code instead of copy+pasting.
> 
> Acked-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  arch/arm64/include/uapi/asm/kvm.h | 3 ---
>  arch/riscv/include/uapi/asm/kvm.h | 3 ---
>  include/uapi/linux/kvm.h          | 4 ++++
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 66736ff04011..568bf858f319 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -43,9 +43,6 @@
>  #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
>  #define KVM_DIRTY_LOG_PAGE_OFFSET 64
>  
> -#define KVM_REG_SIZE(id)						\
> -	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
> -
>  struct kvm_regs {
>  	struct user_pt_regs regs;	/* sp = sp_el0 */
>  
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 3482c9a73d1b..9f60d6185077 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -211,9 +211,6 @@ struct kvm_riscv_sbi_sta {
>  #define KVM_RISCV_TIMER_STATE_OFF	0
>  #define KVM_RISCV_TIMER_STATE_ON	1
>  
> -#define KVM_REG_SIZE(id)		\
> -	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
> -
>  /* If you need to interpret the index values, here is the key: */
>  #define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
>  #define KVM_REG_RISCV_TYPE_SHIFT	24
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 502ea63b5d2e..343de0a51797 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1070,6 +1070,10 @@ struct kvm_dirty_tlb {
>  
>  #define KVM_REG_SIZE_SHIFT	52
>  #define KVM_REG_SIZE_MASK	0x00f0000000000000ULL
> +
> +#define KVM_REG_SIZE(id)		\
> +	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
> +
>  #define KVM_REG_SIZE_U8		0x0000000000000000ULL
>  #define KVM_REG_SIZE_U16	0x0010000000000000ULL
>  #define KVM_REG_SIZE_U32	0x0020000000000000ULL


-- 
BR,
Muhammad Usama Anjum


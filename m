From: Marc Zyngier <maz@kernel.org>
Date: Thu, 27 Jul 2023 11:25:25 +0100
Subject: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <20230722022251.3446223-3-rananta@google.com>
References: <20230722022251.3446223-1-rananta@google.com>
	<20230722022251.3446223-3-rananta@google.com>
Message-ID: <87tttpr6qy.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 22 Jul 2023 03:22:41 +0100,
Raghavendra Rao Ananta <rananta@google.com> wrote:
> 
> Stop depending on CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL and opt to
> standardize on kvm_arch_flush_remote_tlbs() since it avoids
> duplicating the generic TLB stats across architectures that implement
> their own remote TLB flush.
> 
> This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> path, but that is a small cost in comparison to flushing remote TLBs.

Well, there is no such thing as a "remote TLB" anyway. We either have
a non-shareable or inner-shareable invalidation. The notion of remote
would imply that we track who potentially has a TLB, which we
obviously don't.

More x86 nonsense...

>
> In addition, instead of just incrementing remote_tlb_flush_requests
> stat, the generic interface would also increment the
> remote_tlb_flush stat.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h | 3 +++
>  arch/arm64/kvm/Kconfig            | 1 -
>  arch/arm64/kvm/mmu.c              | 6 +++---
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 8b6096753740..7281222f24ef 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1111,6 +1111,9 @@ int __init kvm_set_ipa_limit(void);
>  #define __KVM_HAVE_ARCH_VM_ALLOC
>  struct kvm *kvm_arch_alloc_vm(void);
>  
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> +int kvm_arch_flush_remote_tlbs(struct kvm *kvm);

See my earlier comment about making this prototype global.

	M.

-- 
Without deviation from the norm, progress is not possible.


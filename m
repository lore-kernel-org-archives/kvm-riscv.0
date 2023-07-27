From: Marc Zyngier <maz@kernel.org>
Date: Thu, 27 Jul 2023 13:48:11 +0100
Subject: [PATCH v7 09/12] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
In-Reply-To: <20230722022251.3446223-10-rananta@google.com>
References: <20230722022251.3446223-1-rananta@google.com>
	<20230722022251.3446223-10-rananta@google.com>
Message-ID: <87mszhr050.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 22 Jul 2023 03:22:48 +0100,
Raghavendra Rao Ananta <rananta@google.com> wrote:
> 
> Implement kvm_arch_flush_remote_tlbs_range() for arm64
> to invalidate the given range in the TLB.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>  arch/arm64/include/asm/kvm_host.h | 3 +++
>  arch/arm64/kvm/mmu.c              | 7 +++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 7281222f24ef..52d3ed918893 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1114,6 +1114,9 @@ struct kvm *kvm_arch_alloc_vm(void);
>  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
>  int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
>  
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);

As per the other patches, these prototypes should be global and not
arch-specific.

	M.

-- 
Without deviation from the norm, progress is not possible.


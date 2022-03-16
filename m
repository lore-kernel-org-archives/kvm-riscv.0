From: Peter Xu <peterx@redhat.com>
Date: Wed, 16 Mar 2022 16:49:31 +0800
Subject: [PATCH v2 18/26] KVM: x86/mmu: Zap collapsible SPTEs at all
 levels in the shadow MMU
In-Reply-To: <20220311002528.2230172-19-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-19-dmatlack@google.com>
Message-ID: <YjGkmwBIwe64TjqA@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:20AM +0000, David Matlack wrote:
> Currently KVM only zaps collapsible 4KiB SPTEs in the shadow MMU (i.e.
> in the rmap). This is fine for now KVM never creates intermediate huge
> pages during dirty logging, i.e. a 1GiB page is never partially split to
> a 2MiB page.
> 
> However, this will stop being true once the shadow MMU participates in
> eager page splitting, which can in fact leave behind partially split
> huge pages. In preparation for that change, change the shadow MMU to
> iterate over all necessary levels when zapping collapsible SPTEs.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 89a7a8d7a632..2032be3edd71 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -6142,18 +6142,30 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
>  	return need_tlb_flush;
>  }
>  
> +static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
> +					   const struct kvm_memory_slot *slot)
> +{
> +	bool flush;
> +
> +	/*
> +	 * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1 since there's no need to zap
> +	 * pages that are already mapped at the maximum possible level.
> +	 */
> +	flush = slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
> +				  PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1,
> +				  true);
> +
> +	if (flush)
> +		kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
> +
> +}

Reviewed-by: Peter Xu <peterx@redhat.com>

IMHO it looks cleaner to write it in the old way (drop the flush var).
Maybe even unwrap the helper?

Thanks,

-- 
Peter Xu



From: Will Deacon <will@kernel.org>
Date: Fri, 12 Apr 2024 11:44:09 +0100
Subject: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
In-Reply-To: <20240405115815.3226315-2-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-2-pbonzini@redhat.com>
Message-ID: <20240412104408.GA27645@willie-the-truck>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 07:58:12AM -0400, Paolo Bonzini wrote:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index dc04bc767865..ff17849be9f4 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1768,40 +1768,6 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  	return false;
>  }
>  
> -bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> -{
> -	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
> -
> -	if (!kvm->arch.mmu.pgt)
> -		return false;
> -
> -	WARN_ON(range->end - range->start != 1);
> -
> -	/*
> -	 * If the page isn't tagged, defer to user_mem_abort() for sanitising
> -	 * the MTE tags. The S2 pte should have been unmapped by
> -	 * mmu_notifier_invalidate_range_end().
> -	 */
> -	if (kvm_has_mte(kvm) && !page_mte_tagged(pfn_to_page(pfn)))
> -		return false;
> -
> -	/*
> -	 * We've moved a page around, probably through CoW, so let's treat
> -	 * it just like a translation fault and the map handler will clean
> -	 * the cache to the PoC.
> -	 *
> -	 * The MMU notifiers will have unmapped a huge PMD before calling
> -	 * ->change_pte() (which in turn calls kvm_set_spte_gfn()) and
> -	 * therefore we never need to clear out a huge PMD through this
> -	 * calling path and a memcache is not required.
> -	 */
> -	kvm_pgtable_stage2_map(kvm->arch.mmu.pgt, range->start << PAGE_SHIFT,
> -			       PAGE_SIZE, __pfn_to_phys(pfn),
> -			       KVM_PGTABLE_PROT_R, NULL, 0);
> -
> -	return false;
> -}
> -
>  bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>  	u64 size = (range->end - range->start) << PAGE_SHIFT;

Thanks. It's nice to see this code retire:

Acked-by: Will Deacon <will@kernel.org>

Also, if you're in the business of hacking the MMU notifier code, it
would be really great to change the .clear_flush_young() callback so
that the architecture could handle the TLB invalidation. At the moment,
the core KVM code invalidates the whole VMID courtesy of 'flush_on_ret'
being set by kvm_handle_hva_range(), whereas we could do a much
lighter-weight and targetted TLBI in the architecture page-table code
when we actually update the ptes for small ranges.

Will


From: Marc Zyngier <maz@kernel.org>
Date: Tue, 26 Apr 2022 16:58:07 +0100
Subject: [PATCH v3 4/6] KVM: arm64/mmu: count KVM page table pages in
 pagetable stats
In-Reply-To: <20220426053904.3684293-5-yosryahmed@google.com>
References: <20220426053904.3684293-1-yosryahmed@google.com>
 <20220426053904.3684293-5-yosryahmed@google.com>
Message-ID: <874k2falbk.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 26 Apr 2022 06:39:02 +0100,
Yosry Ahmed <yosryahmed@google.com> wrote:
> 
> Count the pages used by KVM in arm64 for page tables in pagetable stats.
> 
> Account pages allocated for PTEs in pgtable init functions and
> kvm_set_table_pte().
> 
> Since most page table pages are freed using put_page(), add a helper
> function put_pte_page() that checks if this is the last ref for a pte
> page before putting it, and unaccounts stats accordingly.
> 
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> ---
>  arch/arm64/kernel/image-vars.h |  3 ++
>  arch/arm64/kvm/hyp/pgtable.c   | 50 +++++++++++++++++++++-------------
>  2 files changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index 241c86b67d01..25bf058714f6 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -143,6 +143,9 @@ KVM_NVHE_ALIAS(__hyp_rodata_end);
>  /* pKVM static key */
>  KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
>  
> +/* Called by kvm_account_pgtable_pages() to update pagetable stats */
> +KVM_NVHE_ALIAS(__mod_lruvec_page_state);

This cannot be right. It means that this function will be called
directly from the EL2 code when in protected mode, and will result in
extreme fireworks.  There is no way you can call core kernel stuff
like this from this context.

Please do not add random symbols to this list just for the sake of
being able to link the kernel.

> +
>  #endif /* CONFIG_KVM */
>  
>  #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 2cb3867eb7c2..53e13c3313e9 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -152,6 +152,7 @@ static void kvm_set_table_pte(kvm_pte_t *ptep, kvm_pte_t *childp,
>  
>  	WARN_ON(kvm_pte_valid(old));
>  	smp_store_release(ptep, pte);
> +	kvm_account_pgtable_pages((void *)childp, +1);

Why the + sign?

>  }
>  
>  static kvm_pte_t kvm_init_valid_leaf_pte(u64 pa, kvm_pte_t attr, u32 level)
> @@ -326,6 +327,14 @@ int kvm_pgtable_get_leaf(struct kvm_pgtable *pgt, u64 addr,
>  	return ret;
>  }
>  
> +static void put_pte_page(kvm_pte_t *ptep, struct kvm_pgtable_mm_ops *mm_ops)
> +{
> +	/* If this is the last page ref, decrement pagetable stats first. */
> +	if (!mm_ops->page_count || mm_ops->page_count(ptep) == 1)
> +		kvm_account_pgtable_pages((void *)ptep, -1);
> +	mm_ops->put_page(ptep);
> +}
> +
>  struct hyp_map_data {
>  	u64				phys;
>  	kvm_pte_t			attr;
> @@ -488,10 +497,10 @@ static int hyp_unmap_walker(u64 addr, u64 end, u32 level, kvm_pte_t *ptep,
>  
>  	dsb(ish);
>  	isb();
> -	mm_ops->put_page(ptep);
> +	put_pte_page(ptep, mm_ops);
>  
>  	if (childp)
> -		mm_ops->put_page(childp);
> +		put_pte_page(childp, mm_ops);
>  
>  	return 0;
>  }
> @@ -522,6 +531,7 @@ int kvm_pgtable_hyp_init(struct kvm_pgtable *pgt, u32 va_bits,
>  	pgt->pgd = (kvm_pte_t *)mm_ops->zalloc_page(NULL);
>  	if (!pgt->pgd)
>  		return -ENOMEM;
> +	kvm_account_pgtable_pages((void *)pgt->pgd, +1);
>  
>  	pgt->ia_bits		= va_bits;
>  	pgt->start_level	= KVM_PGTABLE_MAX_LEVELS - levels;
> @@ -541,10 +551,10 @@ static int hyp_free_walker(u64 addr, u64 end, u32 level, kvm_pte_t *ptep,
>  	if (!kvm_pte_valid(pte))
>  		return 0;
>  
> -	mm_ops->put_page(ptep);
> +	put_pte_page(ptep, mm_ops);
>  
>  	if (kvm_pte_table(pte, level))
> -		mm_ops->put_page(kvm_pte_follow(pte, mm_ops));
> +		put_pte_page(kvm_pte_follow(pte, mm_ops), mm_ops);

OK, I see the pattern. I don't think this workable as such. I'd rather
the callbacks themselves (put_page, zalloc_page*) call into the
accounting code when it makes sense, rather than spreading the
complexity and having to special case the protected case.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.


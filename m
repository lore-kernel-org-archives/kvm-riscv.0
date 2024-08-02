From: Alex Bennée <alex.bennee@linaro.org>
Date: Fri, 02 Aug 2024 12:16:04 +0100
Subject: [PATCH v12 11/84] KVM: Rename gfn_to_page_many_atomic() to
 kvm_prefetch_pages()
In-Reply-To: <20240726235234.228822-12-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:20 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-12-seanjc@google.com>
Message-ID: <87frrncgzv.fsf@draig.linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Rename gfn_to_page_many_atomic() to kvm_prefetch_pages() to try and
> communicate its true purpose, as the "atomic" aspect is essentially a
> side effect of the fact that x86 uses the API while holding mmu_lock.

It's never too late to start adding some kdoc annotations to a function
and renaming a kvm_host API call seems like a good time to do it.

> E.g. even if mmu_lock weren't held, KVM wouldn't want to fault-in pages,
> as the goal is to opportunistically grab surrounding pages that have
> already been accessed and/or dirtied by the host, and to do so quickly.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
<snip>

/**
 * kvm_prefetch_pages() - opportunistically grab previously accessed pages
 * @slot: which @kvm_memory_slot the pages are in
 * @gfn: guest frame
 * @pages: array to receives page pointers
 * @nr_pages: number of pages
 *
 * Returns the number of pages actually mapped.
 */

?

>  
> -int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
> -			    struct page **pages, int nr_pages)
> +int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
> +		       struct page **pages, int nr_pages)
>  {
>  	unsigned long addr;
>  	gfn_t entry = 0;
> @@ -3075,7 +3075,7 @@ int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
>  
>  	return get_user_pages_fast_only(addr, nr_pages, FOLL_WRITE, pages);
>  }
> -EXPORT_SYMBOL_GPL(gfn_to_page_many_atomic);
> +EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
>  
>  /*
>   * Do not use this helper unless you are absolutely certain the gfn _must_ be

-- 
Alex Benn?e
Virtualisation Tech Lead @ Linaro


From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 30 Jul 2024 13:38:18 +0200
Subject: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns
 that have a "struct page"
In-Reply-To: <20240726235234.228822-85-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-85-seanjc@google.com>
Message-ID: <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/27/24 01:52, Sean Christopherson wrote:
> Now that KVM no longer relies on an ugly heuristic to find its struct page
> references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
> pfns, remove KVM's hack to elevate the refcount for pfns that happen to
> have a valid struct page.  In addition to removing a long-standing wart
> in KVM, this allows KVM to map non-refcounted struct page memory into the
> guest, e.g. for exposing GPU TTM buffers to KVM guests.

Feel free to leave it to me for later, but there are more cleanups that
can be made, given how simple kvm_resolve_pfn() is now:

> @@ -2814,35 +2768,10 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
>   	if (kfp->map_writable)
>   		*kfp->map_writable = writable;
>   
> 	if (pte)
>   		pfn = pte_pfn(*pte);
> 	else
>   		pfn = page_to_pfn(page);
>   
>   	*kfp->refcounted_page = page;
>   

Something like (untested/uncompiled):

--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2758,32 +2758,12 @@ static inline int check_user_page_hwpois
  	return rc == -EHWPOISON;
  }
  
-static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
-				 pte_t *pte, bool writable)
-{
-	kvm_pfn_t pfn;
-
-	WARN_ON_ONCE(!!page == !!pte);
-
-	if (kfp->map_writable)
-		*kfp->map_writable = writable;
-
-	if (pte)
-		pfn = pte_pfn(*pte);
-	else
-		pfn = page_to_pfn(page);
-
-	*kfp->refcounted_page = page;
-
-	return pfn;
-}
-
  /*
   * The fast path to get the writable pfn which will be stored in @pfn,
   * true indicates success, otherwise false is returned.  It's also the
   * only part that runs if we can in atomic context.
   */
-static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
+static bool hva_to_page_fast(struct kvm_follow_pfn *kfp)
  {
  	struct page *page;
  	bool r;
@@ -2799,23 +2779,21 @@ static bool hva_to_pfn_fast(struct kvm_f
  		return false;
  
  	if (kfp->pin)
-		r = pin_user_pages_fast(kfp->hva, 1, FOLL_WRITE, &page) == 1;
+		r = pin_user_pages_fast(kfp->hva, 1, FOLL_WRITE, kfp->refcounted_page) == 1;
  	else
-		r = get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page);
+		r = get_user_page_fast_only(kfp->hva, FOLL_WRITE, kfp->refcounted_page);
  
-	if (r) {
-		*pfn = kvm_resolve_pfn(kfp, page, NULL, true);
-		return true;
-	}
+	if (r)
+		kfp->flags |= FOLL_WRITE;
  
-	return false;
+	return r;
  }
  
  /*
   * The slow path to get the pfn of the specified host virtual address,
   * 1 indicates success, -errno is returned if error is detected.
   */
-static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
+static int hva_to_page(struct kvm_follow_pfn *kfp)
  {
  	/*
  	 * When a VCPU accesses a page that is not mapped into the secondary
@@ -2829,34 +2807,32 @@ static int hva_to_pfn_slow(struct kvm_fo
  	 * implicitly honor NUMA hinting faults and don't need this flag.
  	 */
  	unsigned int flags = FOLL_HWPOISON | FOLL_HONOR_NUMA_FAULT | kfp->flags;
-	struct page *page, *wpage;
+	struct page *wpage;
  	int npages;
  
+	if (hva_to_page_fast(kfp))
+		return 1;
+
  	if (kfp->pin)
-		npages = pin_user_pages_unlocked(kfp->hva, 1, &page, flags);
+		npages = pin_user_pages_unlocked(kfp->hva, 1, kfp->refcounted_page, flags);
  	else
-		npages = get_user_pages_unlocked(kfp->hva, 1, &page, flags);
-	if (npages != 1)
-		return npages;
+		npages = get_user_pages_unlocked(kfp->hva, 1, kfp->refcounted_page, flags);
  
  	/*
-	 * Pinning is mutually exclusive with opportunistically mapping a read
-	 * fault as writable, as KVM should never pin pages when mapping memory
-	 * into the guest (pinning is only for direct accesses from KVM).
+	 * Map read fault as writable if possible; pinning is mutually exclusive
+	 * with opportunistically mapping a read fault as writable, as KVM should
+	 * should never pin pages when mapping memory into the guest (pinning is
+	 * only for direct accesses from KVM).
  	 */
-	if (WARN_ON_ONCE(kfp->map_writable && kfp->pin))
-		goto out;
-
-	/* map read fault as writable if possible */
-	if (!(flags & FOLL_WRITE) && kfp->map_writable &&
+	if (npages == 1 &&
+	    kfp->map_writable && !WARN_ON_ONCE(kfp->pin) &&
+	    !(flags & FOLL_WRITE) &&
  	    get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
-		put_page(page);
-		page = wpage;
-		flags |= FOLL_WRITE;
+		put_page(kfp->refcounted_page);
+		kfp->refcounted_page = wpage;
+		kfp->flags |= FOLL_WRITE;
  	}
  
-out:
-	*pfn = kvm_resolve_pfn(kfp, page, NULL, flags & FOLL_WRITE);
  	return npages;
  }
  
@@ -2915,7 +2891,9 @@ static int hva_to_pfn_remapped(struct vm
  		goto out;
  	}
  
-	*p_pfn = kvm_resolve_pfn(kfp, NULL, &pte, pte_write(pte));
+	if (kfp->map_writable)
+		*kfp->map_writable = pte_write(pte);
+	*p_pfn = pte_pfn(pte);
  out:
  	pte_unmap_unlock(ptep, ptl);
  	return r;
@@ -2932,12 +2910,13 @@ kvm_pfn_t hva_to_pfn(struct kvm_follow_p
  	if (WARN_ON_ONCE(!kfp->refcounted_page))
  		return KVM_PFN_ERR_FAULT;
  
-	if (hva_to_pfn_fast(kfp, &pfn))
-		return pfn;
+	npages = hva_to_page(kfp);
+	if (npages == 1) {
+		if (kfp->map_writable)
+			*kfp->map_writable = kfp->flags & FOLL_WRITE;
+		return page_to_pfn(kfp->refcounted_page);
+	}
  
-	npages = hva_to_pfn_slow(kfp, &pfn);
-	if (npages == 1)
-		return pfn;
  	if (npages == -EINTR)
  		return KVM_PFN_ERR_SIGPENDING;
  


Also, check_user_page_hwpoison() should not be needed anymore, probably
not since commit 234b239bea39 ("kvm: Faults which trigger IO release the
mmap_sem", 2014-09-24) removed get_user_pages_fast() from hva_to_pfn_slow().

The only way that you could get a poisoned page without returning -EHWPOISON,
is if FOLL_HWPOISON was not passed.  But even without these patches,
the cases are:
- npages == 0, then you must have FOLL_NOWAIT and you'd not use
   check_user_page_hwpoison()
- npages == 1 or npages == -EHWPOISON, all good
- npages == -EAGAIN from mmap_read_lock_killable() - should handle that like -EINTR
- everything else including -EFAULT can go downt the vma_lookup() path, because
npages < 0 means we went through hva_to_pfn_slow() which uses FOLL_HWPOISON

This means that you can simply have

	if (npages == -EHWPOISON)
		return KVM_PFN_ERR_HWPOISON;

before the mmap_read_lock() line.  You may either sneak this@the beginning
of the series or leave it for later.

Paolo



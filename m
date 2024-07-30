From: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Jul 2024 13:21:46 -0700
Subject: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns
 that have a "struct page"
In-Reply-To: <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-85-seanjc@google.com>
 <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
Message-ID: <ZqlLWl0R1p41CS0O@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:52, Sean Christopherson wrote:
> > Now that KVM no longer relies on an ugly heuristic to find its struct page
> > references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
> > pfns, remove KVM's hack to elevate the refcount for pfns that happen to
> > have a valid struct page.  In addition to removing a long-standing wart
> > in KVM, this allows KVM to map non-refcounted struct page memory into the
> > guest, e.g. for exposing GPU TTM buffers to KVM guests.
> 
> Feel free to leave it to me for later, but there are more cleanups that
> can be made, given how simple kvm_resolve_pfn() is now:

I'll revisit kvm_resolve_pfn(), Maxim also wasn't a fan of a similar helper that
existed in v11.

> Also, check_user_page_hwpoison() should not be needed anymore, probably
> not since commit 234b239bea39 ("kvm: Faults which trigger IO release the
> mmap_sem", 2014-09-24) removed get_user_pages_fast() from hva_to_pfn_slow().

Ha, I *knew* this sounded familiar.  Past me apparently came to the same
conclusion[*], though I wrongly suspected a memory leak and promptly forgot to
ever send a patch.  I'll tack one on this time around.

[*] https://lore.kernel.org/all/ZGKC9fHoE+kDs0ar at google.com

> The only way that you could get a poisoned page without returning -EHWPOISON,
> is if FOLL_HWPOISON was not passed.  But even without these patches,
> the cases are:
> - npages == 0, then you must have FOLL_NOWAIT and you'd not use
>   check_user_page_hwpoison()
> - npages == 1 or npages == -EHWPOISON, all good
> - npages == -EAGAIN from mmap_read_lock_killable() - should handle that like -EINTR
> - everything else including -EFAULT can go downt the vma_lookup() path, because
> npages < 0 means we went through hva_to_pfn_slow() which uses FOLL_HWPOISON
> 
> This means that you can simply have
> 
> 	if (npages == -EHWPOISON)
> 		return KVM_PFN_ERR_HWPOISON;
> 
> before the mmap_read_lock() line.  You may either sneak this at the beginning
> of the series or leave it for later.
> 
> Paolo
> 


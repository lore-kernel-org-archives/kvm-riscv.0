From: Sean Christopherson <seanjc@google.com>
Date: Thu, 1 Aug 2024 07:43:13 -0700
Subject: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put
 pages that KVM never consumes
In-Reply-To: <87wml0egzo.fsf@draig.linaro.org>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-6-seanjc@google.com>
 <87wml0egzo.fsf@draig.linaro.org>
Message-ID: <ZqufAYyVOa9M1z76@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 01, 2024, Alex Benn?e wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Add an API to release an unused page, i.e. to put a page without marking
> > it accessed or dirty.  The API will be used when KVM faults-in a page but
> > bails before installing the guest mapping (and other similar flows).
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  include/linux/kvm_host.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 3d9617d1de41..c5d39a337aa3 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -1201,6 +1201,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
> >  unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
> >  unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
> >  				      bool *writable);
> > +
> > +static inline void kvm_release_page_unused(struct page *page)
> > +{
> > +	if (!page)
> > +		return;
> > +
> > +	put_page(page);
> > +}
> 
> I guess it's unfamiliarity with the mm layout but I was trying to find
> where the get_pages come from to see the full pattern of allocate and
> return. I guess somewhere in the depths of hva_to_pfn() from
> hva_to_pfn_retry()?

If successful, get_user_page_fast_only() and get_user_pages_unlocked() grab a
reference on behalf of the caller.

As of this patch, hva_to_pfn_remapped() also grabs a reference to pages that
appear to be refcounted, which is the underlying wart this series aims to fix.
In KVM's early days, it _only_ supported GUP, i.e. if KVM got a pfn, that pfn
was (a) backed by struct page and (b) KVM had a reference to said page.  That
led to the current mess, as KVM didn't get reworked to properly track pages vs.
pfns when support for VM_MIXEDMAP was added.

	/*
	 * Get a reference here because callers of *hva_to_pfn* and
	 * *gfn_to_pfn* ultimately call kvm_release_pfn_clean on the
	 * returned pfn.  This is only needed if the VMA has VM_MIXEDMAP
	 * set, but the kvm_try_get_pfn/kvm_release_pfn_clean pair will
	 * simply do nothing for reserved pfns.
	 *
	 * Whoever called remap_pfn_range is also going to call e.g.
	 * unmap_mapping_range before the underlying pages are freed,
	 * causing a call to our MMU notifier.
	 *
	 * Certain IO or PFNMAP mappings can be backed with valid
	 * struct pages, but be allocated without refcounting e.g.,
	 * tail pages of non-compound higher order allocations, which
	 * would then underflow the refcount when the caller does the
	 * required put_page. Don't allow those pages here.
	 */
	if (!kvm_try_get_pfn(pfn))
		r = -EFAULT;


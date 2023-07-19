From: Sean Christopherson <seanjc@google.com>
Date: Wed, 19 Jul 2023 10:47:41 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <CAGtprH9a2jX-hdww9GPuMrO9noNeXkoqE8oejtVn2vD0AZa3zA@mail.gmail.com>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <CAGtprH9a2jX-hdww9GPuMrO9noNeXkoqE8oejtVn2vD0AZa3zA@mail.gmail.com>
Message-ID: <ZLghvU4QzE0PtfNG@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 19, 2023, Vishal Annapurve wrote:
> On Tue, Jul 18, 2023 at 4:49?PM Sean Christopherson <seanjc@google.com> wrote:
> > ...
> > +static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
> > +{
> > +       struct list_head *gmem_list = &mapping->private_list;
> > +       struct kvm_memory_slot *slot;
> > +       struct kvm_gmem *gmem;
> > +       unsigned long index;
> > +       pgoff_t start, end;
> > +       gfn_t gfn;
> > +
> > +       filemap_invalidate_lock_shared(mapping);
> > +
> > +       start = page->index;
> > +       end = start + thp_nr_pages(page);
> > +
> > +       list_for_each_entry(gmem, gmem_list, entry) {
> > +               xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
> > +                       for (gfn = start; gfn < end; gfn++) {
> > +                               if (WARN_ON_ONCE(gfn < slot->base_gfn ||
> > +                                               gfn >= slot->base_gfn + slot->npages))
> > +                                       continue;
> > +
> > +                               /*
> > +                                * FIXME: Tell userspace that the *private*
> > +                                * memory encountered an error.
> > +                                */
> > +                               send_sig_mceerr(BUS_MCEERR_AR,
> > +                                               (void __user *)gfn_to_hva_memslot(slot, gfn),
> > +                                               PAGE_SHIFT, current);
> 
> Does it make sense to replicate what happens with MCE handling on
> tmpfs backed guest memory:
> 1) Unmap gpa from guest
> 2) On the next guest EPT fault, exit to userspace to handle/log the
> mce error for the gpa.

Hmm, yes, that would be much better.  Ah, and kvm_gmem_get_pfn() needs to check
folio_test_hwpoison() and potentially PageHWPoison().  E.g. if the folio is huge,
KVM needs to restrict the mapping to order-0 (target page isn't poisoned), or
return KVM_PFN_ERR_HWPOISON (taget page IS poisoned).

Alternatively, KVM could punch a hole in kvm_gmem_error_page(), but I don't think
we want to do that because that would prevent forwarding the #MC to the guest.


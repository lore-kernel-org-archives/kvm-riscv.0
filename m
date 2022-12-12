From: David Matlack <dmatlack@google.com>
Date: Mon, 12 Dec 2022 14:30:28 -0800
Subject: [RFC PATCH 10/37] KVM: MMU: Move struct kvm_page_fault to common
 code
In-Reply-To: <CANgfPd-DaxszBe6vLQGe=LKNKx8bDX-AC_30qLVAyYkQXwN7WA@mail.gmail.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-11-dmatlack@google.com>
 <CANgfPd-DaxszBe6vLQGe=LKNKx8bDX-AC_30qLVAyYkQXwN7WA@mail.gmail.com>
Message-ID: <Y5erhA1QOBhqnO5C@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 10:24:31AM -0800, Ben Gardon wrote:
> On Thu, Dec 8, 2022 at 11:39 AM David Matlack <dmatlack@google.com> wrote:
> >
> > Move struct kvm_page_fault to common code. This will be used in a future
> > commit to move the TDP MMU to common code.
> >
> > No functional change intended.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
[...]
> > diff --git a/include/kvm/mmu_types.h b/include/kvm/mmu_types.h
> > index a9da33d4baa8..9f0ca920bf68 100644
> > --- a/include/kvm/mmu_types.h
> > +++ b/include/kvm/mmu_types.h
> > @@ -66,4 +66,48 @@ struct kvm_mmu_page {
> >         struct kvm_mmu_page_arch arch;
> >  };
> >
> > +struct kvm_page_fault {
> > +       /* The raw faulting address. */
> > +       const gpa_t addr;
> > +
> > +       /* Whether the fault was synthesized to prefetch a mapping. */
> > +       const bool prefetch;
> > +
> > +       /* Information about the cause of the fault. */
> > +       const bool write;
> > +       const bool exec;
> > +
> > +       /* Shifted addr, or result of guest page table walk if shadow paging. */
> > +       gfn_t gfn;
> 
> Is this redundant to have in common code? If we're not doing common
> shadow paging, then this is just addr shifted. Would this be better
> placed in the arch specific struct?

Yes it's redundant but it is actually used by the TDP MMU, unlike @addr.
So if anything I would rather move @addr to kvm_page_fault_arch.

> 
> > +
> > +       /* The memslot that contains @gfn. May be NULL. */
> > +       struct kvm_memory_slot *slot;
> > +
> > +       /* Maximum page size that can be created for this fault. */
> > +       u8 max_level;
> > +
> > +       /*
> > +        * Page size that can be created based on the max_level and the page
> > +        * size used by the host mapping.
> > +        */
> > +       u8 req_level;
> > +
> > +       /* Final page size that will be created. */
> > +       u8 goal_level;
> > +
> > +       /*
> > +        * The value of kvm->mmu_invalidate_seq before fetching the host
> > +        * mapping. Used to verify that the host mapping has not changed
> > +        * after grabbing the MMU lock.
> > +        */
> > +       unsigned long mmu_seq;
> 
> Should this be ifdef'ed with  KVM_ARCH_WANT_MMU_NOTIFIER?

I'll have to take a closer look, but probably yes.

> 
> > +
> > +       /* Information about the host mapping. */
> > +       kvm_pfn_t pfn;
> > +       hva_t hva;
> > +       bool map_writable;
> > +
> > +       struct kvm_page_fault_arch arch;
> > +};
> > +
> >  #endif /* !__KVM_MMU_TYPES_H */
> > --
> > 2.39.0.rc1.256.g54fd8350bd-goog
> >


From: Peter Xu <peterx@redhat.com>
Date: Wed, 30 Mar 2022 14:34:21 -0400
Subject: [PATCH v2 20/26] KVM: x86/mmu: Extend Eager Page Splitting to
 the shadow MMU
In-Reply-To: <CALzav=fRFzbGEVhdMSwhX1Gs1++DGW6MOWvKzeQ-RTtLsus=SQ@mail.gmail.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-21-dmatlack@google.com>
 <YjG7Zh4zwTDsO3L1@xz-m1.local>
 <CALzav=fRFzbGEVhdMSwhX1Gs1++DGW6MOWvKzeQ-RTtLsus=SQ@mail.gmail.com>
Message-ID: <YkSirYT6s8YtUr4w@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 22, 2022 at 04:58:08PM -0700, David Matlack wrote:
> > > +static int prepare_to_split_huge_page(struct kvm *kvm,
> > > +                                   const struct kvm_memory_slot *slot,
> > > +                                   u64 *huge_sptep,
> > > +                                   struct kvm_mmu_page **spp,
> > > +                                   bool *flush,
> > > +                                   bool *dropped_lock)
> > > +{
> > > +     int r = 0;
> > > +
> > > +     *dropped_lock = false;
> > > +
> > > +     if (kvm_mmu_available_pages(kvm) <= KVM_MIN_FREE_MMU_PAGES)
> > > +             return -ENOSPC;
> > > +
> > > +     if (need_resched() || rwlock_needbreak(&kvm->mmu_lock))
> > > +             goto drop_lock;
> > > +
> >
> > Not immediately clear on whether there'll be case that *spp is set within
> > the current function.  Some sanity check might be nice?
> 
> Sorry I'm not sure what you mean here. What kind of sanity check did
> you have in mind?

Something like "WARN_ON_ONCE(*spp);"?

> 
> >
> > > +     *spp = kvm_mmu_alloc_direct_sp_for_split(true);
> > > +     if (r)
> > > +             goto drop_lock;
> > > +
> > > +     return 0;

Thanks,

-- 
Peter Xu



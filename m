From: Sean Christopherson <seanjc@google.com>
Date: Mon, 9 May 2022 22:47:14 +0000
Subject: [PATCH v4 20/20] KVM: x86/mmu: Extend Eager Page Splitting to
 nested MMUs
In-Reply-To: <CALzav=fTTf8=u1i0pePxAHtuHr4Q_+N1-d8x09MtRk+6y250rw@mail.gmail.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-21-dmatlack@google.com>
 <YnlFzMpJZNfFuFic@google.com>
 <CALzav=fTTf8=u1i0pePxAHtuHr4Q_+N1-d8x09MtRk+6y250rw@mail.gmail.com>
Message-ID: <YnmZ8jUaWHCuQ++r@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 09, 2022, David Matlack wrote:
> On Mon, May 9, 2022 at 9:48 AM Sean Christopherson <seanjc@google.com> wrote:
> > > +static void kvm_nested_mmu_try_split_huge_pages(struct kvm *kvm,
> > > +                                             const struct kvm_memory_slot *slot,
> > > +                                             gfn_t start, gfn_t end,
> > > +                                             int target_level)
> > > +{
> > > +     int level;
> > > +
> > > +     /*
> > > +      * Split huge pages starting with KVM_MAX_HUGEPAGE_LEVEL and working
> > > +      * down to the target level. This ensures pages are recursively split
> > > +      * all the way to the target level. There's no need to split pages
> > > +      * already at the target level.
> > > +      */
> > > +     for (level = KVM_MAX_HUGEPAGE_LEVEL; level > target_level; level--) {
> >
> > Unnecessary braces.
> 
> The brace is unnecessary, but when the inner statement is split across
> multiple lines I tend to prefer using braces. (That's why I did the
> same in the other patch and you had the same feedback.) I couldn't
> find any guidance about this in CodingStyle so I'm fine with getting
> rid of the braces if that's what you prefer.

The style varies by subsystem, e.g. I believe perf requires braces in this case.
Absent a "hard" rule, I value consistency above all else, e.g. because KVM doesn't
(usually) include the braces, I started looking for the second statement, i.e. the
lack of an opening brace is an indicator (to me at elast) that a loop/if contains
a single statement.

I actually like Golang's forced braces, but mostly because they are 100% mandatory
and so all code is consistent.
 
> > > +             slot_handle_level_range(kvm, slot,
> > > +                                     nested_mmu_try_split_huge_pages,
> > > +                                     level, level, start, end - 1,
> > > +                                     true, false);
> >
> > IMO it's worth running over by 4 chars to drop 2 lines:
> 
> Will do.
> 
> >
> >         for (level = KVM_MAX_HUGEPAGE_LEVEL; level > target_level; level--)
> >                 slot_handle_level_range(kvm, slot, nested_mmu_try_split_huge_pages,
> >                                         level, level, start, end - 1, true, false);
> > > +     }
> > > +}
> > > +
> > >  /* Must be called with the mmu_lock held in write-mode. */
> >
> > Add a lockdep assertion, not a comment.
> 
> Agreed but this is an existing comment, so better left to a separate patch.

Doh, I mistook the /* for a +.


From: Sean Christopherson <seanjc@google.com>
Date: Mon, 3 Jun 2024 16:03:05 -0700
Subject: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
In-Reply-To: <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com> <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
Message-ID: <Zl5LqcusZ88QOGQY@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 03, 2024, James Houghton wrote:
> On Thu, May 30, 2024 at 11:06?PM Yu Zhao <yuzhao@google.com> wrote:
> > What I don't think is acceptable is simplifying those optimizations
> > out without documenting your justifications (I would even call it a
> > design change, rather than simplification, from v3 to v4).
> 
> I'll put back something similar to what you had before (like a
> test_clear_young() with a "fast" parameter instead of "bitmap"). I
> like the idea of having a new mmu notifier, like
> fast_test_clear_young(), while leaving test_young() and clear_young()
> unchanged (where "fast" means "prioritize speed over accuracy").

Those two statements are contradicting each other, aren't they?  Anyways, I vote
for a "fast only" variant, e.g. test_clear_young_fast_only() or so.  gup() has
already established that terminology in mm/, so hopefully it would be familiar
to readers.  We could pass a param, but then the MGLRU code would likely end up
doing a bunch of useless indirect calls into secondary MMUs, whereas a dedicated
hook allows implementations to nullify the pointer if the API isn't supported
for whatever reason.

And pulling in Oliver's comments about locking, I think it's important that the
mmu_notifier API express it's requirement that the operation be "fast", not that
it be lockless.  E.g. if a secondary MMU can guarantee that a lock will be
contented only in rare, slow cases, then taking a lock is a-ok.  Or a secondary
MMU could do try-lock and bail if the lock is contended.

That way KVM can honor the intent of the API with an implementation that works
best for KVM _and_ for MGRLU.  I'm sure there will be future adjustments and fixes,
but that's just more motivation for using something like "fast only" instead of
"lockless".

> > > I made this logic change as part of removing batching.
> > >
> > > I'd really appreciate guidance on what the correct thing to do is.
> > >
> > > In my mind, what would work great is: by default, do aging exactly
> > > when KVM can do it locklessly, and then have a Kconfig to always have
> > > MGLRU to do aging with KVM if a user really cares about proactive
> > > reclaim (when the feature bit is set). The selftest can check the
> > > Kconfig + feature bit to know for sure if aging will be done.
> >
> > I still don't see how that Kconfig helps. Or why the new static branch
> > isn't enough?
> 
> Without a special Kconfig, the feature bit just tells us that aging
> with KVM is possible, not that it will necessarily be done. For the
> self-test, it'd be good to know exactly when aging is being done or
> not, so having a Kconfig like LRU_GEN_ALWAYS_WALK_SECONDARY_MMU would
> help make the self-test set the right expectations for aging.
> 
> The Kconfig would also allow a user to know that, no matter what,
> we're going to get correct age data for VMs, even if, say, we're using
> the shadow MMU.

Heh, unless KVM flushes, you won't get "correct" age data.

> This is somewhat important for me/Google Cloud. Is that reasonable? Maybe
> there's a better solution.

Hmm, no?  There's no reason to use a Kconfig, e.g. if we _really_ want to prioritize
accuracy over speed, then a KVM (x86?) module param to have KVM walk nested TDP
page tables would give us what we want.

But before we do that, I think we need to perform due dilegence (or provide data)
showing that having KVM take mmu_lock for write in the "fast only" API provides
better total behavior.  I.e. that the additional accuracy is indeed worth the cost.


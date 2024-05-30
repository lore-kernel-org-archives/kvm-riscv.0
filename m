From: James Houghton <jthoughton@google.com>
Date: Wed, 29 May 2024 18:08:06 -0700
Subject: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
In-Reply-To: <Zley-u_dOlZ-S-a6@google.com>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com>
Message-ID: <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 29, 2024 at 3:58?PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, May 29, 2024, Yu Zhao wrote:
> > On Wed, May 29, 2024 at 3:59?PM Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Wed, May 29, 2024, Yu Zhao wrote:
> > > > On Wed, May 29, 2024 at 12:05?PM James Houghton <jthoughton@google.com> wrote:
> > > > >
> > > > > Secondary MMUs are currently consulted for access/age information at
> > > > > eviction time, but before then, we don't get accurate age information.
> > > > > That is, pages that are mostly accessed through a secondary MMU (like
> > > > > guest memory, used by KVM) will always just proceed down to the oldest
> > > > > generation, and then at eviction time, if KVM reports the page to be
> > > > > young, the page will be activated/promoted back to the youngest
> > > > > generation.
> > > >
> > > > Correct, and as I explained offline, this is the only reasonable
> > > > behavior if we can't locklessly walk secondary MMUs.
> > > >
> > > > Just for the record, the (crude) analogy I used was:
> > > > Imagine a large room with many bills ($1, $5, $10, ...) on the floor,
> > > > but you are only allowed to pick up 10 of them (and put them in your
> > > > pocket). A smart move would be to survey the room *first and then*
> > > > pick up the largest ones. But if you are carrying a 500 lbs backpack,
> > > > you would just want to pick up whichever that's in front of you rather
> > > > than walk the entire room.
> > > >
> > > > MGLRU should only scan (or lookaround) secondary MMUs if it can be
> > > > done lockless. Otherwise, it should just fall back to the existing
> > > > approach, which existed in previous versions but is removed in this
> > > > version.
> > >
> > > IIUC, by "existing approach" you mean completely ignore secondary MMUs that
> > > don't implement a lockless walk?
> >
> > No, the existing approach only checks secondary MMUs for LRU folios,
> > i.e., those at the end of the LRU list. It might not find the best
> > candidates (the coldest ones) on the entire list, but it doesn't pay
> > as much for the locking. MGLRU can *optionally* scan MMUs (secondary
> > included) to find the best candidates, but it can only be a win if the
> > scanning incurs a relatively low overhead, e.g., done locklessly for
> > the secondary MMU. IOW, this is a balance between the cost of
> > reclaiming not-so-cold (warm) folios and that of finding the coldest
> > folios.
>
> Gotcha.
>
> I tend to agree with Yu, driving the behavior via a Kconfig may generate simpler
> _code_, but I think it increases the overall system complexity.  E.g. distros
> will likely enable the Kconfig, and in my experience people using KVM with a
> distro kernel usually aren't kernel experts, i.e. likely won't know that there's
> even a decision to be made, let alone be able to make an informed decision.
>
> Having an mmu_notifier hook that is conditionally implemented doesn't seem overly
> complex, e.g. even if there's a runtime aspect at play, it'd be easy enough for
> KVM to nullify its mmu_notifier hook during initialization.  The hardest part is
> likely going to be figuring out the threshold for how much overhead is too much.

Hi Yu, Sean,

Perhaps I "simplified" this bit of the series a little bit too much.
Being able to opportunistically do aging with KVM (even without
setting the Kconfig) is valuable.

IIUC, we have the following possibilities:
- v4: aging with KVM is done if the new Kconfig is set.
- v3: aging with KVM is always done.
- v2: aging with KVM is done when the architecture reports that it can
probably be done locklessly, set at KVM MMU init time.
- Another possibility?: aging with KVM is only done exactly when it
can be done locklessly (i.e., mmu_notifier_test/clear_young() called
such that it will not grab any locks).

I like the v4 approach because:
1. We can choose whether or not to do aging with KVM no matter what
architecture we're using (without requiring userspace be aware to
disable the feature at runtime with sysfs to avoid regressing
performance if they don't care about proactive reclaim).
2. If we check the new feature bit (0x8) in sysfs, we can know for
sure if aging is meant to be working or not. The selftest changes I
made won't work properly unless there is a way to be sure that aging
is working with KVM.

For look-around at eviction time:
- v4: done if the main mm PTE was young and no MMU notifiers are subscribed.
- v2/v3: done if the main mm PTE was young or (the SPTE was young and
the MMU notifier was lockless/fast).

I made this logic change as part of removing batching.

I'd really appreciate guidance on what the correct thing to do is.

In my mind, what would work great is: by default, do aging exactly
when KVM can do it locklessly, and then have a Kconfig to always have
MGLRU to do aging with KVM if a user really cares about proactive
reclaim (when the feature bit is set). The selftest can check the
Kconfig + feature bit to know for sure if aging will be done.

I'm not sure what the exact right thing to do for look-around is.

Thanks for the quick feedback.


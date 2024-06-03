From: James Houghton <jthoughton@google.com>
Date: Mon, 3 Jun 2024 15:45:59 -0700
Subject: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
In-Reply-To: <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
Message-ID: <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 30, 2024 at 11:06?PM Yu Zhao <yuzhao@google.com> wrote:
>
> On Wed, May 29, 2024 at 7:08?PM James Houghton <jthoughton@google.com> wrote:
> >
> > Hi Yu, Sean,
> >
> > Perhaps I "simplified" this bit of the series a little bit too much.
> > Being able to opportunistically do aging with KVM (even without
> > setting the Kconfig) is valuable.
> >
> > IIUC, we have the following possibilities:
> > - v4: aging with KVM is done if the new Kconfig is set.
> > - v3: aging with KVM is always done.
>
> This is not true -- in v3, MGLRU only scans secondary MMUs if it can
> be done locklessly on x86. It uses a bitmap to imply this requirement.
>
> > - v2: aging with KVM is done when the architecture reports that it can
> > probably be done locklessly, set at KVM MMU init time.
>
> Not really -- it's only done if it can be done locklessly on both x86 and arm64.
>
> > - Another possibility?: aging with KVM is only done exactly when it
> > can be done locklessly (i.e., mmu_notifier_test/clear_young() called
> > such that it will not grab any locks).
>
> This is exactly the case for v2.

Thanks for clarifying; sorry for getting this wrong.

>
> > I like the v4 approach because:
> > 1. We can choose whether or not to do aging with KVM no matter what
> > architecture we're using (without requiring userspace be aware to
> > disable the feature at runtime with sysfs to avoid regressing
> > performance if they don't care about proactive reclaim).
> > 2. If we check the new feature bit (0x8) in sysfs, we can know for
> > sure if aging is meant to be working or not. The selftest changes I
> > made won't work properly unless there is a way to be sure that aging
> > is working with KVM.
>
> I'm not convinced, but it doesn't mean your point of view is invalid.
> If you fully understand the implications of your design choice and
> document them, I will not object.
>
> All optimizations in v2 were measured step by step. Even that bitmap,
> which might be considered overengineered, brought a readily
> measuarable 4% improvement in memcached throughput on Altra Max
> swapping to Optane:
>
> Using the bitmap (64 KVM PTEs for each call)
> ============================================================================================================================
> Type         Ops/sec     Hits/sec   Misses/sec    Avg. Latency     p50
> Latency     p99 Latency   p99.9 Latency       KB/sec
> ----------------------------------------------------------------------------------------------------------------------------
> Sets            0.00          ---          ---             ---
>     ---             ---             ---         0.00
> Gets      1012801.92    431436.92     14965.11         0.06246
> 0.04700         0.16700         4.31900     39635.83
> Waits           0.00          ---          ---             ---
>     ---             ---             ---          ---
> Totals    1012801.92    431436.92     14965.11         0.06246
> 0.04700         0.16700         4.31900     39635.83
>
>
> Not using the bitmap (1 KVM PTEs for each call)
> ============================================================================================================================
> Type         Ops/sec     Hits/sec   Misses/sec    Avg. Latency     p50
> Latency     p99 Latency   p99.9 Latency       KB/sec
> ----------------------------------------------------------------------------------------------------------------------------
> Sets            0.00          ---          ---             ---
>     ---             ---             ---         0.00
> Gets       968210.02    412443.85     14303.89         0.06517
> 0.04700         0.15900         7.42300     37890.74
> Waits           0.00          ---          ---             ---
>     ---             ---             ---          ---
> Totals     968210.02    412443.85     14303.89         0.06517
> 0.04700         0.15900         7.42300     37890.74
>
>
> FlameGraphs with bitmap (1.svg) and without bitmap (2.svg) attached.
>
> What I don't think is acceptable is simplifying those optimizations
> out without documenting your justifications (I would even call it a
> design change, rather than simplification, from v3 to v4).

I'll put back something similar to what you had before (like a
test_clear_young() with a "fast" parameter instead of "bitmap"). I
like the idea of having a new mmu notifier, like
fast_test_clear_young(), while leaving test_young() and clear_young()
unchanged (where "fast" means "prioritize speed over accuracy"). It
seems a little more straightforward that way.

>
> > For look-around at eviction time:
> > - v4: done if the main mm PTE was young and no MMU notifiers are subscribed.
> > - v2/v3: done if the main mm PTE was young or (the SPTE was young and
> > the MMU notifier was lockless/fast).
>
> The host and secondary MMUs are two *independent* cases, IMO:
> 1. lookaround the host MMU if the PTE mapping the folio under reclaim is young.
> 2. lookaround the secondary MMU if it can be done locklessly.
>
> So the v2/v3 behavior sounds a lot more reasonable to me.

I'll restore the v2/v3 behavior. I initially removed it because,
without batching, we (mostly) lose the spatial locality that, IIUC,
look-around is designed to exploit.

>
> Also a nit -- don't use 'else' in the following case (should_look_around()):
>
>   if (foo)
>     return bar;
>   else
>     do_something();

Oh, yes, sorry. I wrote and rewrote should_look_around() quite a few
times while trying to figure out what made sense in a no-batching
series. I'll fix this.

>
> > I made this logic change as part of removing batching.
> >
> > I'd really appreciate guidance on what the correct thing to do is.
> >
> > In my mind, what would work great is: by default, do aging exactly
> > when KVM can do it locklessly, and then have a Kconfig to always have
> > MGLRU to do aging with KVM if a user really cares about proactive
> > reclaim (when the feature bit is set). The selftest can check the
> > Kconfig + feature bit to know for sure if aging will be done.
>
> I still don't see how that Kconfig helps. Or why the new static branch
> isn't enough?

Without a special Kconfig, the feature bit just tells us that aging
with KVM is possible, not that it will necessarily be done. For the
self-test, it'd be good to know exactly when aging is being done or
not, so having a Kconfig like LRU_GEN_ALWAYS_WALK_SECONDARY_MMU would
help make the self-test set the right expectations for aging.

The Kconfig would also allow a user to know that, no matter what,
we're going to get correct age data for VMs, even if, say, we're using
the shadow MMU. This is somewhat important for me/Google Cloud. Is
that reasonable? Maybe there's a better solution.


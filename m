From: Oliver Upton <oliver.upton@linux.dev>
Date: Fri, 31 May 2024 21:18:12 +0000
Subject: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs
 participate in aging
In-Reply-To: <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com>
 <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <Zll7IuGYGG5uI20W@linux.dev>
 <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
Message-ID: <Zlo-lKbrshZmT0mx@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 31, 2024 at 02:31:17PM -0600, Yu Zhao wrote:
> On Fri, May 31, 2024 at 1:24?AM Oliver Upton <oliver.upton@linux.dev> wrote:

[...]

> > Grabbing the MMU lock for write to scan sucks, no argument there. But
> > can you please be specific about the impact of read lock v. RCU in the
> > case of arm64? I had asked about this before and you never replied.
> >
> > My concern remains that adding support for software table walkers
> > outside of the MMU lock entirely requires more work than just deferring
> > the deallocation to an RCU callback. Walkers that previously assumed
> > 'exclusive' access while holding the MMU lock for write must now cope
> > with volatile PTEs.
> >
> > Yes, this problem already exists when hardware sets the AF, but the
> > lock-free walker implementation needs to be generic so it can be applied
> > for other PTE bits.
> 
> Direct reclaim is multi-threaded and each reclaimer can take the mmu
> lock for read (testing the A-bit) or write (unmapping before paging
> out) on arm64. The fundamental problem of using the readers-writer
> lock in this case is priority inversion: the readers have lower
> priority than the writers, so ideally, we don't want the readers to
> block the writers at all.

So we already have this sort of problem of stage-2 fault handling v.
secondary MMU invalidations, which is why I've been doubtful of the
perceived issue. In fact, I'd argue that needing to wait for faults is
worse than aging participation since those can be trivially influenced
by userspace/guest.

In any case, we shouldn't ever be starved since younger readers cannot
enter the critical section with a pending writer.

> As I said earlier, I prefer we drop the arm64 support for now, but I
> will not object to taking the mmu lock for read when clearing the
> A-bit, as long as we fully understand the problem here and document it
> clearly.

I'd be convinced of this if there's data that shows read lock
acquisition is in fact consequential. Otherwise, I'm not sure the added
complexity of RCU table walkers (per my statement above) is worth the
effort / maintenance burden.

-- 
Thanks,
Oliver


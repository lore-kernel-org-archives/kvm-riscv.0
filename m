From: Oliver Upton <oliver.upton@linux.dev>
Date: Fri, 31 May 2024 00:24:18 -0700
Subject: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs
 participate in aging
In-Reply-To: <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com>
 <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
Message-ID: <Zll7IuGYGG5uI20W@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 29, 2024 at 03:03:21PM -0600, Yu Zhao wrote:
> On Wed, May 29, 2024 at 12:05?PM James Houghton <jthoughton@google.com> wrote:
> >
> > Secondary MMUs are currently consulted for access/age information at
> > eviction time, but before then, we don't get accurate age information.
> > That is, pages that are mostly accessed through a secondary MMU (like
> > guest memory, used by KVM) will always just proceed down to the oldest
> > generation, and then at eviction time, if KVM reports the page to be
> > young, the page will be activated/promoted back to the youngest
> > generation.
> 
> Correct, and as I explained offline, this is the only reasonable
> behavior if we can't locklessly walk secondary MMUs.
> 
> Just for the record, the (crude) analogy I used was:
> Imagine a large room with many bills ($1, $5, $10, ...) on the floor,
> but you are only allowed to pick up 10 of them (and put them in your
> pocket). A smart move would be to survey the room *first and then*
> pick up the largest ones. But if you are carrying a 500 lbs backpack,
> you would just want to pick up whichever that's in front of you rather
> than walk the entire room.
> 
> MGLRU should only scan (or lookaround) secondary MMUs if it can be
> done lockless. Otherwise, it should just fall back to the existing
> approach, which existed in previous versions but is removed in this
> version.

Grabbing the MMU lock for write to scan sucks, no argument there. But
can you please be specific about the impact of read lock v. RCU in the
case of arm64? I had asked about this before and you never replied.

My concern remains that adding support for software table walkers
outside of the MMU lock entirely requires more work than just deferring
the deallocation to an RCU callback. Walkers that previously assumed
'exclusive' access while holding the MMU lock for write must now cope
with volatile PTEs.

Yes, this problem already exists when hardware sets the AF, but the
lock-free walker implementation needs to be generic so it can be applied
for other PTE bits.

-- 
Thanks,
Oliver


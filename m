From: David Matlack <dmatlack@google.com>
Date: Mon, 24 Apr 2023 15:33:40 -0700
Subject: RFC: Common MMU Recommendation
Message-ID: <CALzav=eBXp7CBN1hLVmyH0A4Ukt3MXR7=0__xPSOx1X1tw4iSw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Apologies for the long delay since the last Common MMU update. I've
been swamped with Google-internal stuff the past few months. But I
have some updates to share on the strategy I think we should take
going forward.

The "Common TDP MMU" Approach
=============================

In December 2022 I sent an RFC[1] to demonstrate that it is possible
to refactor the KVM/x86 TDP MMU into common code, i.e. introduce a
Common TDP MMU. The intent behind this was to eventually use this to
replace the KVM/ARM and KVM/RISC-V MMU code. This may be a viable
approach for sharing code with RISC-V, but after further
consideration, this is a dead-end for ARM.

The KVM/x86 TDP MMU does not support all of the ARM use-cases
(notably, managing Stage-1 page tables or compiling into the hyp). So
a Common TDP MMU would have to exist alongside the current ARM page
table code (not replace it) for years. This would increase our
maintenance costs by having to support both the Common MMU and ARM MMU
when adding support for new ARM architectural features.

The Common TDP MMU approach is too all-or-nothing, rather than
providing incremental benefit. ARM and x86 are constantly evolving
(e.g. ARM support for Nested Virtualization and Confidential Computing
are under development, both of which require changes to the page table
code). And we know 128-bit ARM page tables are coming. The Common TDP
MMU would be constantly trying to "catch-up" to the ARM MMU, and might
never get there.

Lastly, ARM and x86 have significantly different TLB and cache
maintenance requirements. Future versions of the ARM architecture make
it behave more like x86, but KVM still has to support older versions.
It's highly likely that certain optimizations and patterns we use in
the TDP MMU won't work for ARM.

For all these reasons, continuing to invest in refactoring the KVM/x86
TDP MMU common right now is not worth it for ARM. It still could be
viable for RISC-V, but we (Google) don't have enough resources to
continue this work. I'd be happy to help provide reviews and guidance
to anyone that wants to pick it up.

Looking Forward
===============
I still believe that sharing KVM MMU code across architectures is a
worthwhile pursuit. But I think we should look for more incremental
ways to do it.

For new features, we (Google) plan to upstream both x86 and ARM
support whenever possible, to limit further divergence and to increase
the probability of sharing code whenever possible. Note: x86 and ARM
support won't be upstreamed in a single series due to
architecture-specific maintainers and trees. But we aim to design them
considering both architectures from the beginning.

As for de-duplicating existing code, there will be opportunities to
organically share more code that we should take. The new common
range-based TLB flushing APIs is one example[2].

I also think there are two areas that would be worth investing in:

Determining Host Huge Page Size
-------------------------------
When handling a fault, KVM needs to figure out what size mapping it
can use to map the memory. KVM/x86 figures this out (in part) by
walking the Linux stage-1 page tables. KVM/ARM and KVM/RISC-V perform
a vma_lookup() under the mmap_lock and inspect the VMA.

The latter approach has scalability downsides (mmap_lock) and also
does not work with HugeTLB High Granularity Mapping[3], where Linux
can map HugeTLB memory with smaller mappings to enable demand fetching
4KiB at a time (and KVM must do the same).

I'd like to unify the architectures to use a common Linux stage-1 page
table walk to fix the HGM use-case, and share more code. It may even
be possible to avoid the vma_lookup() eventually [4].

KVM Page Table Iterators
------------------------
To have any hope of sharing MMU code, we have to invest in sharing
page table code.

A good place to start here would be a common page table walker (x86
folks: think tdp_iter.c). Page tables are relatively simple data
structures, and walking through them is just a tree traversal.
Differences in page table layout can be parameterized in the walker
and architecture-specific code can handle parsing the PTEs. But the
actual walking and, more perhaps importantly, the _interface_ for
walking the page tables can be common.

Consider the x86 and ARM MMU code today. They use very different code
for walking page tables: x86 uses pre-order traversals with for-loop
macros. ARM uses pre-order and post-order traversals using callbacks
and function recursion. The stark difference in how the tables are
walked makes it very difficult to work across the architectures.

Next Steps
==========
I will be on paternity leave from May to September. So there likely
won't be much progress from me for a while. But I'm going to see if we
can find someone to work on the common Linux stage-1 walker while I'm
out.

---

Thanks to Oliver Upton, Sean Christopherson, and Marc Zyngier for
their input on this recommendation.

[1] https://lore.kernel.org/kvm/20221208193857.4090582-1-dmatlack at google.com/
[2] https://lore.kernel.org/kvm/20230126184025.2294823-1-dmatlack at google.com/
[3] https://lore.kernel.org/linux-mm/20230218002819.1486479-1-jthoughton at google.com/
[4] ARM also uses the VMA lookup to map PFNMAP VMAs with huge pages.
We might need to keep that around until Linux Stage-1 also uses huge
pages for PFNMAP VMAs (if it doesn't already).


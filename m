From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:43:01 +0100
Subject: [PATCH v5.5 00/30] KVM: Scalable memslots implementation
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <cb4f5d6e-9535-dd57-d8ee-3b593a81f3a6@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> This series is an iteration of Maciej's scalable memslots work.  It
> addresses most, but not all, of my feedback from v5, hence the "5.5"
> moniker.  Specifically, I did not touch the iteration over gfn and hva
> ranges as I would likely do more harm than good, especially in the gfn
> iterator.
> 
> The core functionality of the series is unchanged from v5 (or at least,
> it should be).  Patches "Resolve memslot ID via a hash table" and "Keep
> memslots in tree-based structures" are heavily reworked (the latter in
> particular) to provide better continuity between patches and to avoid
> the swap() logic when working with the "inactive" set of memslots.  But
> again, the changes are intended to be purely cosmetic.
> 
> Paolo, ideally I'd like get to patch 03 (and therefore patch 02) into 5.16.
> The patch technically breaks backwards compatibility with 32-bit KVM, but
> I'm quite confident none of the existing 32-bit architectures can possibly
> work.  RISC-V is the one exception where it's not obvious that creating
> more guest memslot pages than can fit in an unsigned long won't fall on its
> face.  Since RISC-V is new in 5.16, I'd like to get that change in before
> RISC-V can gain any users doing bizarre things.
> 
> s390 folks, please look closely at patch 11, "KVM: s390: Use "new" memslot
> instead of userspace memory region".  There's a subtle/weird functional
> change in there that I can't imagine would negatively affect userspace,
> but the end result is odd nonetheless.
> 
> Claudio, I dropped your R-b from "KVM: Integrate gfn_to_memslot_approx()
> into search_memslots()" because I changed the code enough to break the s390
> build at least once :-)
> 
> Patches 01 and 02 are bug fixes.
> 
> Patch 03 is fix of sorts to require that the total number of pages across
> all memslots fit in an unsigned long.  The existing 32-bit KVM
> architectures don't correctly handle this case, and fixing those issues
> would quite gross and a waste of time.
> 
> Patches 04-18 are cleanups throughout common KVM and all architectures
> to fix some warts in the memslot APIs that allow for a cleaner (IMO)
> of the tree-based memslots code.  They also prep for more improvements
> that are realized in the final patch.
> 
> Patches 19-28 are the core of Maciej's scalable memslots work.
> 
> Patches 29-30 take advantage of the tree-based memslots to avoid creating
> a dummy "new" memslot on the stack, which simplifies the MOVE case and
> aligns it with the other three memslot update cases.

Thanks for the updated series Sean - that's an impressive amount of
cleanups for the existing KVM code.

I've reviewed the non-arch-specific and x86-specific patches till patch 22
(inclusive).
Further patches are more invasive and require a more through review -
will try to do this in coming days.

The arch-specific but non-x86-ones patches look OK to me, too, at the
first glance but here it would be better if maintainers or reviewers
from particular arch gave their acks.

By the way, do you want your patches and my non-invasive patches (patches
below number 23) merged without waiting for the rest of the series to be
fully ready?

This way there is less risk of conflicting changes to KVM being merged
in meantime while we are still discussing the remaining patches.
Or worse - changes that don't conflict but subtly break some assumptions
that the code relies on.

For this reason I am strongly for merging them independently from the
more invasive parts.

Thanks,
Maciej


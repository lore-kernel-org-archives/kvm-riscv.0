From: Oliver Upton <oliver.upton@linux.dev>
Date: Wed, 25 Jan 2023 00:51:33 +0000
Subject: [PATCH 0/7] KVM: Add a common API for range-based TLB
 invalidation
In-Reply-To: <Y9B8A+/FSPCrAANT@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com>
 <Y9B8A+/FSPCrAANT@google.com>
Message-ID: <Y9B9FZReDVwdNNrS@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 12:46:59AM +0000, Sean Christopherson wrote:
> On Thu, Jan 19, 2023, David Matlack wrote:
> > This series introduces a common API for performing range-based TLB
> > invalidation. This is then used to supplant
> > kvm_arch_flush_remote_tlbs_memslot() and pave the way for two other
> > patch series:
> > 
> > 1. https://lore.kernel.org/kvm/20230109215347.3119271-1-rananta at google.com/
> > 
> >   Adds ARM support for range-based TLB invalidation and needs a
> >   mechanism to invoke it from common code. This series provides such a
> >   mechanism via kvm_arch_flush_remote_tlbs_range().
> > 
> > 2. https://lore.kernel.org/kvm/20221208193857.4090582-1-dmatlack at google.com/
> > 
> >   Refactors the TDP MMU into common code, which requires an API for
> >   range-based TLB invaliation.
> > 
> > This series is based on patches 29-33 from (2.), but I made some further
> > cleanups after looking at it a second time.
> > 
> > Tested on x86_64 and ARM64 using KVM selftests.
> 
> Did a quick read through, didn't see anything I disagree with.

LGTM for the tiny amount of arm64 changes, though I imagine David will
do a v2 to completely get rid of the affected Kconfig.

> Is there any urgency to getting this merged?  If not, due to the dependencies
> with x86 stuff queued for 6.3, and because of the cross-architecture changes, it
> might be easiest to plan on landing this in 6.4.  That would allow Paolo to create
> an immutable topic branch fairly early on.

+1, that buys us some time to go through the rounds on the arm64 side
such that we could possibly stack the TLBIRANGE work on top.

--
Thanks,
Oliver


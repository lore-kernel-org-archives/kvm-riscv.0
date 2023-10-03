From: Sean Christopherson <seanjc@google.com>
Date: Tue, 3 Oct 2023 16:46:26 -0700
Subject: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to
 report faults to userspace
In-Reply-To: <CAF7b7mqyU059YpBBVYjTMNXf9VHSc6tbKrQ8avFXYtP6LWMh8Q@mail.gmail.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-8-seanjc@google.com>
 <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com> <ZQ3AmLO2SYv3DszH@google.com>
 <CAF7b7mrf-y9DNdsreOAedGJueOThnYE=ascFd4=rvW0Z4rhTQg@mail.gmail.com>
 <ZRtxoaJdVF1C2Mvy@google.com> <CAF7b7mqyU059YpBBVYjTMNXf9VHSc6tbKrQ8avFXYtP6LWMh8Q@mail.gmail.com>
Message-ID: <ZRyn0nPQpbVpz8ah@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 03, 2023, Anish Moorthy wrote:
> On Mon, Oct 2, 2023 at 6:43?PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > > - I should go drop the patches annotating kvm_vcpu_read/write_page
> > > from my series
> >
> > Hold up on that.  I'd prefer to keep them as there's still value in giving userspace
> > debug information.  All I'm proposing is that we would firmly state in the
> > documentation that those paths must be treated as informational-only.
> 
> Userspace would then need to know whether annotations were performed
> from reliable/unreliable paths though, right? That'd imply another
> flag bit beyond the current R/W/E bits.

No, what's missing is a guarantee in KVM that every attempt to exit will actually
make it to userspace.  E.g. if a different exit, including another memory_fault
exit, clobbers an attempt to exit, the "unreliable" annotation will never be seen
by userspace.

The only way a KVM_EXIT_MEMORY_FAULT that actually reaches userspace could be
"unreliable" is if something other than a memory_fault exit clobbered the union,
but didn't signal its KVM_EXIT_* reason.  And that would be an egregious bug that
isn't unique to KVM_EXIT_MEMORY_FAULT, i.e. the same data corruption would affect
each and every other KVM_EXIT_* reason.

The "informational only" part is that userspace can't develop features that
*require* KVM to exit.

> > > - The helper function [a] for filling the memory_fault field
> > > (downgraded back into the current union) can drop the "has the field
> > > already been filled?" check/WARN.
> >
> > That would need to be dropped regardless because it's user-triggered (sadly).
> 
> Well the current v5 of the series uses a non-userspace visible canary-
> it seems like there'd still be value in that if we were to keep the
> annotations in potentially unreliable spots. Although perhaps that
> test failure you noticed [1] is a good counter-argument, since it
> shows a known case where a current flow does multiple writes to the
> memory_fault member.

The problem is that anything but a WARN will go unnoticed, and we can't have any
WARNs that are user-triggerable, at least not in upstream.  Internally, we can
and probably should add a canary, and an aggressive one at that, but I can't think
of a sane way to add a canary in upstream while avoiding the known offenders. :-(

> [1] https://lore.kernel.org/all/202309141107.30863e9d-oliver.sang at intel.com
> 
> > Anyways, don't do anything just yet.
> 
> :salutes:

LOL


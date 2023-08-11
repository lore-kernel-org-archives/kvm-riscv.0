From: Sean Christopherson <seanjc@google.com>
Date: Fri, 11 Aug 2023 10:44:11 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <CAGtprH9YE50RtqhW-U+wK0Vv6aKfqqtOPn8q4s8or=UZwPXZoA@mail.gmail.com>
References: <20230718234512.1690985-13-seanjc@google.com> <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
 <ZNKv9ul2I7A4V7IF@google.com> <CAGtprH9YE50RtqhW-U+wK0Vv6aKfqqtOPn8q4s8or=UZwPXZoA@mail.gmail.com>
Message-ID: <ZNZza/emWldkJC6X@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 10, 2023, Vishal Annapurve wrote:
> On Tue, Aug 8, 2023 at 2:13?PM Sean Christopherson <seanjc@google.com> wrote:
> > ...
> 
> > > + When binding a memslot to the file, if a kvm pointer exists, it must
> > >   be the same kvm as the one in this binding
> > > + When the binding to the last memslot is removed from a file, NULL the
> > >   kvm pointer.
> >
> > Nullifying the KVM pointer isn't sufficient, because without additional actions
> > userspace could extract data from a VM by deleting its memslots and then binding
> > the guest_memfd to an attacker controlled VM.  Or more likely with TDX and SNP,
> > induce badness by coercing KVM into mapping memory into a guest with the wrong
> > ASID/HKID.
> >
> 
> TDX/SNP have mechanisms i.e. PAMT/RMP tables to ensure that the same
> memory is not assigned to two different VMs.

One of the main reasons we pivoted away from using a flag in "struct page" to
indicate that a page was private was so that KVM could enforce 1:1 VM:page ownership
*without* relying on hardware.

And FWIW, the PAMT provides no protection in this specific case because KVM does
TDH.MEM.PAGE.REMOVE when zapping S-EPT entries, and that marks the page clear in
the PAMT.  The danger there is that physical memory is still encrypted with the
guest's HKID, and so mapping the memory into a different VM, which might not be
a TDX guest!, could lead to corruption and/or poison #MCs.

The HKID issues wouldn't be a problem if v15 is merged as-is, because zapping
S-EPT entries also fully purges and reclaims the page, but as we discussed in
one of the many threads, reclaiming physical memory should be tied to the inode,
i.e. to memory truly being freed, and not to S-EPTs being zapped.  And there is
a very good reason for wanting to do that, as it allows KVM to do the expensive
cache flush + clear outside of mmu_lock.

> Deleting memslots should also clear out the contents of the memory as the EPT
> tables will be zapped in the process

No, deleting a memslot should not clear memory.  As I said in my previous response,
the fact that zapping S-EPT entries is destructive is a limitiation of TDX, not a
feature we want to apply to other VM types.  And that's not even a fundamental
property of TDX, e.g. TDX could remove the limitation, at the cost of consuming
quite a bit more memory, by tracking the exact owner by HKID in the PAMT and
decoupling S-EPT entries from page ownership.

Or in theory, KVM could workaround the limitation by only doing TDH.MEM.RANGE.BLOCK
when zapping S-EPTs.  Hmm, that might actually be worth looking at.

> and the host will reclaim the memory.

There are no guarantees that the host will reclaim the memory.  E.g. QEMU will
delete and re-create memslots for "regular" VMs when emulating option ROMs.  Even
if that use case is nonsensical for confidential VMs (and it probably is nonsensical),
I don't want to define KVM's ABI based on what we *think* userspace will do.


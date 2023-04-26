From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 26 Apr 2023 16:00:30 +0530
Subject: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap hooks
In-Reply-To: <CAHBxVyEkcGwcxB+oDWywJuAwkC-k-_0gMC-mXqSEHy_MyTcN4A@mail.gmail.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com> <20230419221716.3603068-46-atishp@rivosinc.com>
 <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com> <CAHBxVyFhDapAeMQ8quBqWZ10jWSHw1CdE227ciyKQpULHYzffA@mail.gmail.com>
 <81c476f4-ef62-e4a6-0033-8a46a15379fd@intel.com> <CAHBxVyHg7vTaQJWKoVSD8budVZEYSo1eDOyZyZK7gcJApR7SbA@mail.gmail.com>
 <fe1a849a-3276-5fad-869b-bad54bc918f6@intel.com> <CAHBxVyEkcGwcxB+oDWywJuAwkC-k-_0gMC-mXqSEHy_MyTcN4A@mail.gmail.com>
Message-ID: <CAK9=C2XwPx-0jqE+Wz+zYja9oPkTF+7CD8baBYYLpOWLeCpeXQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 26, 2023 at 1:32?PM Atish Kumar Patra <atishp@rivosinc.com> wrote:
>
> On Tue, Apr 25, 2023 at 6:40?PM Dave Hansen <dave.hansen@intel.com> wrote:
> >
> > On 4/25/23 01:00, Atish Kumar Patra wrote:
> > > On Mon, Apr 24, 2023 at 7:18?PM Dave Hansen <dave.hansen@intel.com> wrote:
> > >> On 4/21/23 12:24, Atish Kumar Patra wrote:
> > >> I'm not _quite_ sure what "guest initiated" means.  But SEV and TDX
> > >> don't require an ioremap hook like this.  So, even if they *are* "guest
> > >> initiated", the question still remains how they work without this patch,
> > >> or what they are missing without it.
> > >
> > > Maybe I misunderstood your question earlier. Are you concerned about guests
> > > invoking any MMIO region specific calls in the ioremap path or passing
> > > that information to the host ?
> >
> > My concern is that I don't know why this patch is here.  There should be
> > a very simple answer to the question: Why does RISC-V need this patch
> > but x86 does not?
> >
> > > Earlier, I assumed the former but it seems you are also concerned
> > > about the latter as well. Sorry for the confusion in that case.
> > > The guest initiation is necessary while the host notification can be
> > > made optional.
> > > The "guest initiated" means the guest tells the TSM (equivalent of TDX
> > > module in RISC-V) the MMIO region details.
> > > The TSM keeps a track of this and any page faults that happen in that
> > > region are forwarded
> > > to the host by the TSM after the instruction decoding. Thus TSM can
> > > make sure that only ioremapped regions are
> > > considered MMIO regions. Otherwise, all memory outside the guest
> > > physical region will be considered as the MMIO region.
> >
> > Ahh, OK, that's a familiar problem.  I see the connection to device
> > filtering now.
> >
> > Is this functionality in the current set?  I went looking for it and all
> > I found was the host notification side.
> >
>
> The current series doesn't have the guest filtering feature enabled.
> However, we implemented guest filtering and is maintained in a separate tree
>
> https://github.com/rivosinc/linux/tree/cove-integration-device-filtering
>
> We did not include those in this series because the tdx patches are
> still undergoing
> development. We are planning to rebase our changes once the revised
> patches are available.
>
> > Is this the only mechanism by which the guest tells the TSM which parts
> > of the guest physical address space can be exposed to the host?
> >
>
> This is the current approach defined in CoVE spec. Guest informs about both
> shared memory & mmio regions via dedicated SBI calls (
> e.g sbi_covg_[add/remove]_mmio_region and
> sbi_covg_[share/unshare]_memory_region)
>
> > For TDX and SEV, that information is inferred from a bit in the page
> > tables.  Essentially, there are dedicated guest physical addresses that
> > tell the hardware how to treat the mappings: should the secure page
> > tables or the host's EPT/NPT be consulted?
> >
>
> Yes. We don't have such a mechanism defined in CoVE yet.
> Having said that, there is nothing in ISA to prevent that and it is doable.
> Some specific bits in the PTE entry can also be used to encode for
> shared & mmio physical memory addresses.
> The TSM implementation will probably need to implement a software page
> walker in that case.

We can certainly use PTE bits defined by Svpmbt extension to
differentiate between IO and memory. Also, we can use the PTE
SW bits to differentiate between shared and non-shared memory.

>
> Are there any performance advantages between the two approaches ?
> As per my understanding, we are saving some boot time privilege
> transitions & less ABIs but
> adds the cost of software walk at runtime faults.

Performance wise both approaches will be the same because in
case of PTE based approach, the TSM can on-demand map the
shared memory and do software walk upon first access.

>
> > If that mechanism is different for RISC-V, it would go a long way to
> > explaining why RISC-V needs this patch.
> >
> > > In the current CoVE implementation, that MMIO region information is also
> > > passed to the host to provide additional flexibility. The host may
> > > choose to do additional
> > > sanity check and bail if the fault address does not belong to
> > > requested MMIO regions without
> > > going to the userspace. This is purely an optimization and may not be mandatory.
> >
> > Makes sense, thanks for the explanation.
> >
> > >>> It can be a subset of the region's host provided the layout. The
> > >>> guest device filtering solution is based on this idea as well [1].
> > >>>
> > >>> [1] https://lore.kernel.org/all/20210930010511.3387967-1-sathyanarayanan.kuppuswamy at linux.intel.com/
> > >>
> > >> I don't really see the connection.  Even if that series was going
> > >> forward (I'm not sure it is) there is no ioremap hook there.  There's
> > >> also no guest->host communication in that series.  The guest doesn't
> > >> _tell_ the host where the MMIO is, it just declines to run code for
> > >> devices that it didn't expect to see.
> > >
> > > This is a recent version of the above series from tdx github. This is
> > > a WIP as well and has not been posted to
> > > the mailing list. Thus, it may be going under revisions as well.
> > > As per my understanding the above ioremap changes for TDX mark the
> > > ioremapped pages as shared.
> > > The guest->host communication happen in the #VE exception handler
> > > where the guest converts this to a hypercall by invoking TDG.VP.VMCALL
> > > with an EPT violation set. The host would emulate an MMIO address if
> > > it gets an VMCALL with EPT violation.
> > > Please correct me if I am wrong.
> >
> > Yeah, TDX does:
> >
> > 1. Guest MMIO access
> > 2. Guest #VE handler (if the access faults)
> > 3. Guest hypercall->host
> > 4. Host fixes the fault
> > 5. Hypercall returns, guest returns from #VE via IRET
> > 6. Guest retries MMIO instruction
> >
> > From what you said, RISC-V appears to do:
> >
> > 1. Guest MMIO access
> > 2. Host MMIO handler
> > 3. Host handles the fault, returns
> > 4. Guest retries MMIO instruction
> >
> > In other words, this mechanism does the same thing but short-circuits
> > the trip through #VE and the hypercall.
> >
>
> Yes. Thanks for summarizing the tdx approach.
>
> > What happens if this ioremap() hook is not in place?  Does the hardware
> > (or TSM) generate an exception like TDX gets?  If so, it's probably
> > possible to move this "notify the TSM" code to that exception handler
> > instead of needing an ioremap() hook.
> >
>
> We don't have a #VE like exception mechanism in RISC-V.
>
> > I'm not saying that it's _better_ to do that, but it would allow you to
> > get rid of this patch for now and get me to shut up. :)
> >
> > > As I said above, the objective here is to notify the TSM where the
> > > MMIO is. Notifying the host is just an optimization that we choose to
> > > add. In fact, in this series the KVM code doesn't do anything with
> > > that information. The commit text probably can be improved to clarify
> > > that.
> >
> > Just to close the loop here, please go take a look at
> > pgprot_decrypted().  That's where the x86 guest page table bit gets to
> > tell the hardware that the mapping might cause a #VE and is under the
> > control of the host.  That's the extent of what x86 does at ioremap() time.
> >
> > So, to summarize, we have:
> >
> > x86:
> > 1. Guest page table bit to mark shared (host) vs. private (guest)
> >    control
> > 2. #VE if there is a fault on a shared mapping to call into the host
> >
> > RISC-V:
> > 1. Guest->TSM call to mark MMIO vs. private
> > 2. Faults in the MMIO area are then transparent to the guest
> >
>
> Yup. This discussion raised a very valid design aspect of the CoVE spec.
> To summarize, we need to investigate whether using PTE bits instead of
> additional ABI
> for managing shared/confidential/ioremapped pages makes more sense.
>
> Thanks for putting up with my answers and the feedback :).

I think we should re-evaluate the PTE (or software walk) based approach
for CoVE spec. It is better to keep the CoVE spec as minimal as possible
and define SBI calls only if absolutely required.

>
> > That design difference would, indeed, help explain why this patch is
> > here.  I'm still not 100% convinced that the patch is *required*, but I
> > at least understand how we arrived here.

Regards,
Anup


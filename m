From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 25 Apr 2023 13:30:06 +0530
Subject: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap hooks
In-Reply-To: <81c476f4-ef62-e4a6-0033-8a46a15379fd@intel.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com> <20230419221716.3603068-46-atishp@rivosinc.com>
 <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com> <CAHBxVyFhDapAeMQ8quBqWZ10jWSHw1CdE227ciyKQpULHYzffA@mail.gmail.com>
 <81c476f4-ef62-e4a6-0033-8a46a15379fd@intel.com>
Message-ID: <CAHBxVyHg7vTaQJWKoVSD8budVZEYSo1eDOyZyZK7gcJApR7SbA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 24, 2023 at 7:18?PM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 4/21/23 12:24, Atish Kumar Patra wrote:
> > On Fri, Apr 21, 2023 at 3:46?AM Dave Hansen <dave.hansen@intel.com> wrote:>> This callback appears to say to the host:
> >>
> >>         Hey, I (the guest) am treating this guest physical area as MMIO.
> >>
> >> But the host and guest have to agree _somewhere_ what the MMIO is used
> >> for, not just that it is being used as MMIO.
> >
> > Yes. The TSM (TEE Security Manager) which is equivalent to TDX also
> > needs to be aware of the MMIO regions so that it can forward the
> > faults accordingly. Most of the MMIO is emulated in the host
> > (userspace or kernel emulation if present). The host is outside the
> > trust boundary of the guest. Thus, guest needs to make sure the host
> > only emulates the designated MMIO region. Otherwise, it opens an
> > attack surface from a malicious host.
> How does this mechanism stop the host from emulating something outside
> the designated region?
>
> On TDX, for instance, the guest page table have a shared/private bit.
> Private pages get TDX protections to (among other things) keep the page
> contents confidential from the host.  Shared pages can be used for MMIO
> and don't have those protections.
>
> If the host goes and tries to flip a page from private->shared, TDX
> protections will kick in and prevent it.
>
> None of this requires the guest to tell the host where it expects MMIO
> to be located.
>
> > All other confidential computing solutions also depend on guest
> > initiated MMIO as well. AFAIK, the TDX & SEV relies on #VE like
> > exceptions to invoke that while this patch is similar to what pkvm
> > does. This approach lets the enlightened guest control which MMIO
> > regions it wants the host to emulate.
>
> I'm not _quite_ sure what "guest initiated" means.  But SEV and TDX
> don't require an ioremap hook like this.  So, even if they *are* "guest
> initiated", the question still remains how they work without this patch,
> or what they are missing without it.
>

Maybe I misunderstood your question earlier. Are you concerned about guests
invoking any MMIO region specific calls in the ioremap path or passing
that information to the host ?
Earlier, I assumed the former but it seems you are also concerned
about the latter as well. Sorry for the confusion in that case.
The guest initiation is necessary while the host notification can be
made optional.
The "guest initiated" means the guest tells the TSM (equivalent of TDX
module in RISC-V) the MMIO region details.
The TSM keeps a track of this and any page faults that happen in that
region are forwarded
to the host by the TSM after the instruction decoding. Thus TSM can
make sure that only ioremapped regions are
considered MMIO regions. Otherwise, all memory outside the guest
physical region will be considered as the MMIO region.

In the current CoVE implementation, that MMIO region information is also
passed to the host to provide additional flexibility. The host may
choose to do additional
sanity check and bail if the fault address does not belong to
requested MMIO regions without
going to the userspace. This is purely an optimization and may not be mandatory.


> > It can be a subset of the region's host provided the layout. The
> > guest device filtering solution is based on this idea as well [1].
> >
> > [1] https://lore.kernel.org/all/20210930010511.3387967-1-sathyanarayanan.kuppuswamy at linux.intel.com/
>
> I don't really see the connection.  Even if that series was going
> forward (I'm not sure it is) there is no ioremap hook there.  There's
> also no guest->host communication in that series.  The guest doesn't
> _tell_ the host where the MMIO is, it just declines to run code for
> devices that it didn't expect to see.
>

This is a recent version of the above series from tdx github. This is
a WIP as well and has not been posted to
the mailing list. Thus, it may be going under revisions as well.
As per my understanding the above ioremap changes for TDX mark the
ioremapped pages as shared.
The guest->host communication happen in the #VE exception handler
where the guest converts this to a hypercall by invoking TDG.VP.VMCALL
with an EPT violation set. The host would emulate an MMIO address if
it gets an VMCALL with EPT violation.
Please correct me if I am wrong.

As I said above, the objective here is to notify the TSM where the
MMIO is. Notifying the host
is just an optimization that we choose to add. In fact, in this series
the KVM code doesn't do anything with that information.
The commit text probably can be improved to clarify that.


> I'm still rather confused here.


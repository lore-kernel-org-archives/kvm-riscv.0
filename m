From: Sean Christopherson <seanjc@google.com>
Date: Mon, 12 Dec 2022 17:39:38 +0000
Subject: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
In-Reply-To: <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
Message-ID: <Y5dnWgJ0ine55/hN@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 09, 2022, David Matlack wrote:
> On Fri, Dec 9, 2022 at 9:25 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> >
> > On Fri, Dec 09, 2022 at 10:37:47AM +0800, Yang, Weijiang wrote:
> > > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > > index 4d188f056933..f375b719f565 100644
> > > > --- a/arch/x86/kvm/mmu/mmu.c
> > > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > > @@ -5056,7 +5056,7 @@ kvm_calc_cpu_role(struct kvm_vcpu *vcpu, const struct kvm_mmu_role_regs *regs)
> > > >     union kvm_cpu_role role = {0};
> > > >     role.base.access = ACC_ALL;
> > > > -   role.base.smm = is_smm(vcpu);
> > > > +   role.base.as_id = is_smm(vcpu);
> > >
> > > I'm not familiar with other architectures, is there similar conception as
> > > x86 smm mode?
> 
> The notion of address spaces is already existing architecture-neutral
> concept in KVM (e.g. see uses of KVM_ADDRESS_SPACE_NUM in
> virt/kvm/kvm_main.c), although SMM is the only use-case I'm aware of.

Yes, SMM is currently the only use-case.

> Architectures that do not use multiple address spaces will just leave
> as_id is as always 0.

My preference would be to leave .smm in x86's page role.  IMO, defining multiple
address spaces to support SMM emulation was a mistake that should be contained to
SMM, i.e. should never be used for any other feature.  And with CONFIG_KVM_SMM,
even x86 can opt out.

For all potential use cases I'm aware of, SMM included, separate address spaces
are overkill.  The SMM use case is to define a region of guest memory that is
accessible if and only if the vCPU is operating in SMM.  Emulating something like
TrustZone or EL3 would be quite similar.  Ditto for Intel's TXT Private Space
(though I can't imagine KVM ever emulating TXT :-) ).

Using separate address spaces means that userspace needs to define the overlapping
GPA areas multiple times, which is inefficient for both memory and CPU usage.
E.g. for SMM,  userspace needs to redefine all of "regular" memory for SMM in
addition to memory that is SMM-only.  And more bizarelly, nothing prevents userspace
from defining completely different memslot layouts for each address space, which
might may not add complexity in terms of code, but does make it more difficult to
reason about KVM behavior at the boundaries between modes.

Unless I'm missing something, e.g. a need to map GPAs differently for SMM vs.
non-SMM, SMM could have been implemented with a simple flag in a memslot to mark
the memslot as SMM-only.  Or likely even better, as an overlay to track attributes,
e.g. similar to how private vs. shared memory will be handled for protected VMs.
That would be slightly less efficient for memslot searches for use cases where all
memory is mutually exclusive, but simpler and more efficient overall.

And separate address spaces become truly nasty if the CPU can access multiple
protected regions, e.g. if the CPU can access type X and type Y at the same time,
then there would need to be memslots for "regular", X, Y, and X+Y.


From: Oliver Upton <oliver.upton@linux.dev>
Date: Mon, 12 Dec 2022 18:17:36 +0000
Subject: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
In-Reply-To: <Y5dnWgJ0ine55/hN@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
 <Y5dnWgJ0ine55/hN@google.com>
Message-ID: <Y5dwQEJHNiTPE+jz@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 05:39:38PM +0000, Sean Christopherson wrote:
> On Fri, Dec 09, 2022, David Matlack wrote:
> > On Fri, Dec 9, 2022 at 9:25 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> > >
> > > On Fri, Dec 09, 2022 at 10:37:47AM +0800, Yang, Weijiang wrote:
> > > > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > > > index 4d188f056933..f375b719f565 100644
> > > > > --- a/arch/x86/kvm/mmu/mmu.c
> > > > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > > > @@ -5056,7 +5056,7 @@ kvm_calc_cpu_role(struct kvm_vcpu *vcpu, const struct kvm_mmu_role_regs *regs)
> > > > >     union kvm_cpu_role role = {0};
> > > > >     role.base.access = ACC_ALL;
> > > > > -   role.base.smm = is_smm(vcpu);
> > > > > +   role.base.as_id = is_smm(vcpu);
> > > >
> > > > I'm not familiar with other architectures, is there similar conception as
> > > > x86 smm mode?
> > 
> > The notion of address spaces is already existing architecture-neutral
> > concept in KVM (e.g. see uses of KVM_ADDRESS_SPACE_NUM in
> > virt/kvm/kvm_main.c), although SMM is the only use-case I'm aware of.
> 
> Yes, SMM is currently the only use-case.
> 
> > Architectures that do not use multiple address spaces will just leave
> > as_id is as always 0.
> 
> My preference would be to leave .smm in x86's page role.  IMO, defining multiple
> address spaces to support SMM emulation was a mistake that should be contained to
> SMM, i.e. should never be used for any other feature.  And with CONFIG_KVM_SMM,
> even x86 can opt out.

+1

I don't think something is architecture-neutral by virtue of it existing
in virt/kvm/*.

> Emulating something like TrustZone or EL3 would be quite similar.

/me shudders

I know it is for the sake of discussion, but for posterity: please no!

-- 
Best,
Oliver


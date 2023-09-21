From: Sean Christopherson <seanjc@google.com>
Date: Thu, 21 Sep 2023 07:59:10 -0700
Subject: [RFC PATCH v12 18/33] KVM: x86/mmu: Handle page fault for private memory
In-Reply-To: <ZQef3zAEYjZMkn9k@yzhao56-desk.sh.intel.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-19-seanjc@google.com>
 <ZQPuMK6D/7UzDH+D@yzhao56-desk.sh.intel.com> <ZQRpiOd1DNDDJQ3r@google.com> <ZQef3zAEYjZMkn9k@yzhao56-desk.sh.intel.com>
Message-ID: <ZQxaPsNiFgfXH7aq@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 18, 2023, Yan Zhao wrote:
> On Fri, Sep 15, 2023 at 07:26:16AM -0700, Sean Christopherson wrote:
> > On Fri, Sep 15, 2023, Yan Zhao wrote:
> > > >  static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> > > >  {
> > > >  	struct kvm_memory_slot *slot = fault->slot;
> > > > @@ -4293,6 +4356,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
> > > >  			return RET_PF_EMULATE;
> > > >  	}
> > > >  
> > > > +	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
> > > In patch 21,
> > > fault->is_private is set as:
> > > 	".is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT)",
> > > then, the inequality here means memory attribute has been updated after
> > > last check.
> > > So, why an exit to user space for converting is required instead of a mere retry?
> > > 
> > > Or, is it because how .is_private is assigned in patch 21 is subjected to change
> > > in future? 
> > 
> > This.  Retrying on SNP or TDX would hang the guest.  I suppose we could special
> Is this because if the guest access a page in private way (e.g. via
> private key in TDX), the returned page must be a private page?

Yes, the returned page must be private, because the GHCI (TDX) and GHCB (SNP)
require that the host allow implicit conversions.  I.e. if the guest accesses
memory as private (or shared), then the host must map memory as private (or shared).
Simply resuming the guest will not change the guest access, nor will it change KVM's
memory attributes.

Ideally (IMO), implicit conversions would be disallowed, but even if implicit
conversions weren't a thing, retrying would still be wrong as KVM would either
inject an exception into the guest or exit to userspace to let userspace handle
the illegal access.

> > case VMs where .is_private is derived from the memory attributes, but the
> > SW_PROTECTED_VM type is primary a development vehicle at this point.  I'd like to
> > have it mimic SNP/TDX as much as possible; performance is a secondary concern.
> Ok. But this mimic is somewhat confusing as it may be problematic in below scenario,
> though sane guest should ensure no one is accessing a page before doing memory
> conversion.
> 
> 
> CPU 0                           CPU 1
> access GFN A in private way
> fault->is_private=true
>                                 convert GFN A to shared
> 			        set memory attribute of A to shared
> 
> faultin, mismatch and exit
> set memory attribute of A
> to private
> 
>                                 vCPU access GFN A in shared way
>                                 fault->is_private = true
>                                 faultin, match and map a private PFN B
> 
>                                 vCPU accesses private PFN B in shared way

If this is a TDX or SNP VM, then the private vs. shared information comes from
the guest itself, e.g. this sequence

                                   vCPU access GFN A in shared way
                                   fault->is_private = true

cannot happen because is_private will be false based on the error code (SNP) or
the GPA (TDX).

And when hardware doesn't generate page faults based on private vs. shared, i.e.
for non-TDX/SNP VMs, from a fault handling perspective there is no concept of the
guest accessing a GFN in a "private way" or a "shared way".  I.e. there are no
implicit conversions.

For SEV and SEV-ES, the guest can access memory as private vs. shared, but the
and the host VMM absolutely must be in agreement and synchronized with respect to
the state of a page, otherwise guest memory will be corrupted.  But that has
nothing to do with the fault handling, e.g. creating aliases in the guest to access
a single GFN as shared and private from two CPUs will create incoherent cache
entries and/or corrupt data without any involvement from KVM.

In other words, the above isn't possible for TDX/SNP, and for all other types,
the conflict between CPU0 and CPU1 is unequivocally a guest bug.


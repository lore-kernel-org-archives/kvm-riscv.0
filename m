From: Sean Christopherson <seanjc@google.com>
Date: Mon, 6 Nov 2023 07:56:03 -0800
Subject: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private memory
In-Reply-To: <ZUjqJjz0Epf7ii8F@yilunxu-OptiPlex-7050>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-21-seanjc@google.com>
 <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050> <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
 <ZUjqJjz0Epf7ii8F@yilunxu-OptiPlex-7050>
Message-ID: <ZUkMk6b6vZe2ANkK@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 06, 2023, Xu Yilun wrote:
> On Sun, Nov 05, 2023 at 05:19:36PM +0100, Paolo Bonzini wrote:
> > On Sun, Nov 5, 2023 at 2:04?PM Xu Yilun <yilun.xu@linux.intel.com> wrote:
> > >
> > > > +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > > > +                                           struct kvm_page_fault *fault)
> > > > +{
> > > > +     kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> > > > +                                   PAGE_SIZE, fault->write, fault->exec,
> > > > +                                   fault->is_private);
> > > > +}
> > > > +
> > > > +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > > > +                                struct kvm_page_fault *fault)
> > > > +{
> > > > +     int max_order, r;
> > > > +
> > > > +     if (!kvm_slot_can_be_private(fault->slot)) {
> > > > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > > > +             return -EFAULT;
> > > > +     }
> > > > +
> > > > +     r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
> > > > +                          &max_order);
> > > > +     if (r) {
> > > > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > > > +             return r;
> > >
> > > Why report KVM_EXIT_MEMORY_FAULT here? even with a ret != -EFAULT?
> > 
> > The cases are EFAULT, EHWPOISON (which can report
> > KVM_EXIT_MEMORY_FAULT) and ENOMEM. I think it's fine
> > that even -ENOMEM can return KVM_EXIT_MEMORY_FAULT,
> > and it doesn't violate the documentation.  The docs tell you "what
> > can you do if error if EFAULT or EHWPOISON?"; they don't
> > exclude that other errnos result in KVM_EXIT_MEMORY_FAULT,
> > it's just that you're not supposed to look at it
> 
> Thanks, it's OK for ENOMEM + KVM_EXIT_MEMORY_FAULT.
> 
> Another concern is, now 3 places to report EFAULT + KVM_EXIT_MEMORY_FAULT:
> 
>   if (!kvm_slot_can_be_private(fault->slot)) {
> 	kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> 	return -EFAULT;
>   }
> 
>   file = kvm_gmem_get_file(slot);
>   if (!file)
> 	return -EFAULT;
> 
>   if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
> 	kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> 	return -EFAULT;
>   }
> 
> They are different cases, and seems userspace should handle them
> differently, but not enough information to distinguish them.

For the first, the memory_fault exit will inform userspace that the guest wants
to map memory as private, and userspace will see that the memslot isn't configured
to support private mappings.  Userspace may not even need to query memslots, e.g.
if the gfn in question has been enumerated to the guest as something that can only
be mapped shared.

For the second (no valid guest_memfd file), userspace put the last reference to
the guest_memfd file without informing the guest or creating a memslot.  That's
firmly a userspace bug.

For the third and last, userspace will see that the guest is requesting a private
mapping but the gfn is configured for shared mappings.

In all cases, userspace has the necessary information to resolve the issue, where
"resolving the issue" may mean terminating the guest.  If userspace isn't tracking
memslots or the private attribute, then userspace has far bigger problems.


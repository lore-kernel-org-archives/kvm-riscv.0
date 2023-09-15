From: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 Sep 2023 07:26:16 -0700
Subject: [RFC PATCH v12 18/33] KVM: x86/mmu: Handle page fault for private memory
In-Reply-To: <ZQPuMK6D/7UzDH+D@yzhao56-desk.sh.intel.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-19-seanjc@google.com>
 <ZQPuMK6D/7UzDH+D@yzhao56-desk.sh.intel.com>
Message-ID: <ZQRpiOd1DNDDJQ3r@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 15, 2023, Yan Zhao wrote:
> On Wed, Sep 13, 2023 at 06:55:16PM -0700, Sean Christopherson wrote:
> ....
> > +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > +					      struct kvm_page_fault *fault)
> > +{
> > +	kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> > +				      PAGE_SIZE, fault->write, fault->exec,
> > +				      fault->is_private);
> > +}
> > +
> > +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > +				   struct kvm_page_fault *fault)
> > +{
> > +	int max_order, r;
> > +
> > +	if (!kvm_slot_can_be_private(fault->slot)) {
> > +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > +		return -EFAULT;
> > +	}
> > +
> > +	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
> > +			     &max_order);
> > +	if (r) {
> > +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > +		return r;
> > +	}
> > +
> > +	fault->max_level = min(kvm_max_level_for_order(max_order),
> > +			       fault->max_level);
> > +	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
> > +
> > +	return RET_PF_CONTINUE;
> > +}
> > +
> >  static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> >  {
> >  	struct kvm_memory_slot *slot = fault->slot;
> > @@ -4293,6 +4356,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
> >  			return RET_PF_EMULATE;
> >  	}
> >  
> > +	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
> In patch 21,
> fault->is_private is set as:
> 	".is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT)",
> then, the inequality here means memory attribute has been updated after
> last check.
> So, why an exit to user space for converting is required instead of a mere retry?
> 
> Or, is it because how .is_private is assigned in patch 21 is subjected to change
> in future? 

This.  Retrying on SNP or TDX would hang the guest.  I suppose we could special
case VMs where .is_private is derived from the memory attributes, but the
SW_PROTECTED_VM type is primary a development vehicle at this point.  I'd like to
have it mimic SNP/TDX as much as possible; performance is a secondary concern.

E.g. userspace needs to be prepared for "spurious" exits due to races on SNP and
TDX, which this can theoretically exercise.  Though the window is quite small so
I doubt that'll actually happen in practice; which of course also makes it less
important to retry instead of exiting.


From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 29 Nov 2021 18:53:48 +0100
Subject: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
In-Reply-To: <YaUNBfJh35WXMV0M@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
Message-ID: <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/29/21 18:25, Sean Christopherson wrote:
> If a posted interrupt arrives after KVM has done its final search through the vIRR,
> but before avic_update_iommu_vcpu_affinity() is called, the posted interrupt will
> be set in the vIRR without triggering a host IRQ to wake the vCPU via the GA log.
> 
> I.e. KVM is missing an equivalent to VMX's posted interrupt check for an outstanding
> notification after switching to the wakeup vector.

BTW Maxim reported that it can break even without assigned devices.

> For now, the least awful approach is sadly to keep the vcpu_(un)blocking() hooks.

I agree that the hooks cannot be dropped but the bug is reproducible 
with this patch, where the hooks are still there.

With the hooks in place, you have:

	kvm_vcpu_blocking(vcpu)
	  avic_set_running(vcpu, false)
	    avic_vcpu_put(vcpu)
	      avic_update_iommu_vcpu_affinity()
	      WRITE_ONCE(...) // clear IS_RUNNING bit

	set_current_state()
	  smp_mb()

	kvm_vcpu_check_block()
	  return kvm_arch_vcpu_runnable() || ...
	    return kvm_vcpu_has_events() || ...
	      return kvm_cpu_has_interrupt() || ...
		return kvm_apic_has_interrupt() || ...
		  return apic_has_interrupt_for_ppr()
		    apic_find_highest_irr()
		      scan vIRR

This covers the barrier between the write of is_running and the read of 
vIRR, and the other side should be correct as well.  in particular, 
reads of is_running always come after an atomic write to vIRR, and hence 
after an implicit full memory barrier.  svm_deliver_avic_intr() has an 
smp_mb__after_atomic() after writing IRR; avic_kick_target_vcpus() even 
has an explicit barrier in srcu_read_lock(), between the microcode's 
write to vIRR and its own call to avic_vcpu_is_running().

Still it does seem to be a race that happens when IS_RUNNING=true but 
vcpu->mode == OUTSIDE_GUEST_MODE.  This patch makes the race easier to 
trigger because it moves IS_RUNNING=false later.

Paolo


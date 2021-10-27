From: Sean Christopherson <seanjc@google.com>
Date: Wed, 27 Oct 2021 16:04:40 +0000
Subject: [PATCH v2 39/43] KVM: VMX: Don't do full kick when triggering
 posted interrupt "fails"
In-Reply-To: <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-40-seanjc@google.com>
 <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
Message-ID: <YXl4mK7CyUBnPaQV@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> On 09/10/21 04:12, Sean Christopherson wrote:
> > +		/*
> > +		 * The smp_wmb() in kvm_make_request() pairs with the smp_mb_*()
> > +		 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU
> > +		 * is guaranteed to see the event request if triggering a posted
> > +		 * interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
> 
> This explanation doesn't make much sense to me.  This is just the usual
> request/kick pattern explained in Documentation/virt/kvm/vcpu-requests.rst;
> except that we don't bother with a "kick" out of guest mode because the
> entry always goes through kvm_check_request (in the nVMX case) or
> sync_pir_to_irr (if non-nested) and completes the delivery itself.
> 
> In other word, it is a similar idea as patch 43/43.
> 
> What this smp_wmb() pair with, is the smp_mb__after_atomic in
> kvm_check_request(KVM_REQ_EVENT, vcpu).

I don't think that's correct.  There is no kvm_check_request() in the relevant path.
kvm_vcpu_exit_request() uses kvm_request_pending(), which is just a READ_ONCE()
without a barrier.  The smp_mb__after_atomic ensures that any assets that were
modified prior to making the request are seen by the vCPU handling the request.
It does not provide any guarantees for a different vCPU/task making a request
and checking vcpu->mode versus the target vCPU setting vcpu->mode and checking
for a pending request.

> Setting the interrupt in the PIR orders before kvm_make_request in this
> thread, and orders after kvm_make_request in the vCPU thread.
>
> Here, instead:
> 
> > +	/*
> > +	 * The implied barrier in pi_test_and_set_on() pairs with the smp_mb_*()
> > +	 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU is
> > +	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
> > +	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
> > +	 */
> >  	if (vcpu != kvm_get_running_vcpu() &&
> >  	    !kvm_vcpu_trigger_posted_interrupt(vcpu, false))
> > -		kvm_vcpu_kick(vcpu);
> > +		kvm_vcpu_wake_up(vcpu);
> 
> it pairs with the smp_mb__after_atomic in vmx_sync_pir_to_irr().  As
> explained again in vcpu-requests.rst, the ON bit has the same function as
> vcpu->request in the previous case.

Same as above, I don't think that's correct.  The smp_mb__after_atomic() ensures
that there's no race between the IOMMU writing vIRR and setting ON, and KVM
clearing ON and processing the vIRR.

pi_test_on() is not an atomic operation, and there's no memory barrier if ON=0.
It's the same behavior as kvm_check_request(), but again the ordering with respect
to vcpu->mode isn't being handled by PID.ON/kvm_check_request().

AIUI, this is the barrier that's paired with the PI barriers.  This is even called
out in (2).

	vcpu->mode = IN_GUEST_MODE;

	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);

	/*
	 * 1) We should set ->mode before checking ->requests.  Please see
	 * the comment in kvm_vcpu_exiting_guest_mode().
	 *
	 * 2) For APICv, we should set ->mode before checking PID.ON. This
	 * pairs with the memory barrier implicit in pi_test_and_set_on
	 * (see vmx_deliver_posted_interrupt).
	 *
	 * 3) This also orders the write to mode from any reads to the page
	 * tables done while the VCPU is running.  Please see the comment
	 * in kvm_flush_remote_tlbs.
	 */
	smp_mb__after_srcu_read_unlock();


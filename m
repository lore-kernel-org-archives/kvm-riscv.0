From: Sean Christopherson <seanjc@google.com>
Date: Thu, 28 Oct 2021 17:06:43 +0000
Subject: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
In-Reply-To: <b2ba4c4e6a9083f3fa0b9af4504f9f54e72ca24c.camel@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-36-seanjc@google.com>
 <b2ba4c4e6a9083f3fa0b9af4504f9f54e72ca24c.camel@redhat.com>
Message-ID: <YXrYo9mtueDT0bnu@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 28, 2021, Maxim Levitsky wrote:
> On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> > Signal the AVIC doorbell iff the vCPU is running in the guest.  If the vCPU
> > is not IN_GUEST_MODE, it's guaranteed to pick up any pending IRQs on the
> > next VMRUN, which unconditionally processes the vIRR.
> > 
> > Add comments to document the logic.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/svm/avic.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> > index 208c5c71e827..cbf02e7e20d0 100644
> > --- a/arch/x86/kvm/svm/avic.c
> > +++ b/arch/x86/kvm/svm/avic.c
> > @@ -674,7 +674,12 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
> >  	kvm_lapic_set_irr(vec, vcpu->arch.apic);
> >  	smp_mb__after_atomic();
> >  
> > -	if (avic_vcpu_is_running(vcpu)) {
> > +	/*
> > +	 * Signal the doorbell to tell hardware to inject the IRQ if the vCPU
> > +	 * is in the guest.  If the vCPU is not in the guest, hardware will
> > +	 * automatically process AVIC interrupts at VMRUN.
> > +	 */
> > +	if (vcpu->mode == IN_GUEST_MODE) {
> >  		int cpu = READ_ONCE(vcpu->cpu);
> >  
> >  		/*
> > @@ -687,8 +692,13 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
> >  		if (cpu != get_cpu())
> >  			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
> >  		put_cpu();
> > -	} else
> > +	} else {
> > +		/*
> > +		 * Wake the vCPU if it was blocking.  KVM will then detect the
> > +		 * pending IRQ when checking if the vCPU has a wake event.
> > +		 */
> >  		kvm_vcpu_wake_up(vcpu);
> > +	}
> >  
> >  	return 0;
> >  }
> 
> It makes sense indeed to avoid ringing the doorbell when the vCPU is not in
> the guest mode.
> 
> I do wonder if we want to call kvm_vcpu_wake_up always otherwise, as the vCPU
> might be just outside of the guest mode and not scheduled out. I don't know
> how expensive is kvm_vcpu_wake_up in this case.

IIUC, you're asking if we should do something like:

	if (vcpu->mode == IN_GUEST_MODE) {
		<signal doorbell>
	} else if (!is_vcpu_loaded(vcpu)) {
		kvm_vcpu_wake_up();
	}

The answer is that kvm_vcpu_wake_up(), which is effectively rcuwait_wake_up(),
is very cheap except for specific configurations that may or may not be valid for
production[*].  Practically speaking, is_vcpu_loaded() doesn't exist and should
never exist because it's inherently racy.  The closest we have would be

	else if (vcpu != kvm_get_running_vcpu()) {
		kvm_vcpu_wake_up();
	}

but that's extremely unlikely to be a net win because getting the current vCPU
requires atomics to disable/re-enable preemption, especially if rcuwait_wake_up()
is modified to avoid the rcu lock/unlock.

TL;DR: rcuwait_wake_up() is cheap, and if it's too expensive, a better optimization
would be to make it less expensive.

[*] https://lkml.kernel.org/r/20211020110638.797389-1-pbonzini at redhat.com
 
> Before this patch, the avic_vcpu_is_running would only be false when the vCPU
> is scheduled out (e.g when vcpu_put was done on it)
> 
> Best regards,
> 	Maxim Levitsky
> 


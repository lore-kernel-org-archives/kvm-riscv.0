From: Sean Christopherson <seanjc@google.com>
Date: Wed, 27 Oct 2021 15:06:57 +0000
Subject: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
In-Reply-To: <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-36-seanjc@google.com>
 <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
Message-ID: <YXlrEWmBohaDXmqL@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> On 09/10/21 04:12, Sean Christopherson wrote:
> > +	 */
> > +	if (vcpu->mode == IN_GUEST_MODE) {
> >   		int cpu = READ_ONCE(vcpu->cpu);
> >   		/*
> > @@ -687,8 +692,13 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
> >   		if (cpu != get_cpu())
> >   			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
> >   		put_cpu();
> > -	} else
> > +	} else {
> > +		/*
> > +		 * Wake the vCPU if it was blocking.  KVM will then detect the
> > +		 * pending IRQ when checking if the vCPU has a wake event.
> > +		 */
> >   		kvm_vcpu_wake_up(vcpu);
> > +	}
> 
> Does this still need to check the "running" flag?  That should be a strict
> superset of vcpu->mode == IN_GUEST_MODE.

No.  Signalling the doorbell when "running" is set but the vCPU is not in the
guest is just an expensive nop.  So even if KVM were to rework its handling of
"running" to set the flag immediately before VMRUN and clear it immediately after,
keying off IN_GUEST_MODE and not "running" would not be wrong, just sub-optimal.

I doubt KVM will ever make the "running" flag super precise, because keeping the
flag set when the vCPU is loaded avoids VM-Exits on other vCPUs due to undelivered
IPIs.  But the flip side is that it means the flag has terrible granularity, and
is arguably inaccurate when viewed from a software perspective.  Anyways, if the
treatment of "running" were ever changed, then this code should also be changed
to essentially revert this commit since vcpu->mode would then be redundant.

And IMO, it makes sense to intentionally separate KVM's delivery of interrupts
from hardware's delivery of interrupts.  I.e. use the same core rules as
kvm_vcpu_kick() for when to send interrupts and when to wake for the AVIC.


From: Sean Christopherson <seanjc@google.com>
Date: Wed, 27 Oct 2021 16:08:10 +0000
Subject: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
In-Reply-To: <185502d7-861e-fa5c-b225-419710fe77ed@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-36-seanjc@google.com>
 <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
 <YXlrEWmBohaDXmqL@google.com>
 <185502d7-861e-fa5c-b225-419710fe77ed@redhat.com>
Message-ID: <YXl5anv0Lyjx1cws@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 27, 2021, Paolo Bonzini wrote:
> On 27/10/21 17:06, Sean Christopherson wrote:
> > > Does this still need to check the "running" flag?  That should be a strict
> > > superset of vcpu->mode == IN_GUEST_MODE.
> > 
> > No.  Signalling the doorbell when "running" is set but the vCPU is not in the
> > guest is just an expensive nop.  So even if KVM were to rework its handling of
> > "running" to set the flag immediately before VMRUN and clear it immediately after,
> > keying off IN_GUEST_MODE and not "running" would not be wrong, just sub-optimal.
> > 
> > I doubt KVM will ever make the "running" flag super precise, because keeping the
> > flag set when the vCPU is loaded avoids VM-Exits on other vCPUs due to undelivered
> > IPIs.
> 
> Right, so should we drop the "if (running)" check in this patch, at the same
> time as it's adding the IN_GUEST_MODE check?

LOL, I think we have a Three^WTwo Stooges routine going on.  This patch does
remove avic_vcpu_is_running() and replaces it with the vcpu->mode check.  Or am
I completely misunderstanding what your referring to?

-       if (avic_vcpu_is_running(vcpu)) {
+       /*
+        * Signal the doorbell to tell hardware to inject the IRQ if the vCPU
+        * is in the guest.  If the vCPU is not in the guest, hardware will
+        * automatically process AVIC interrupts at VMRUN.
+        */
+       if (vcpu->mode == IN_GUEST_MODE) {
                int cpu = READ_ONCE(vcpu->cpu);


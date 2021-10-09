From: Sean Christopherson <seanjc@google.com>
Date: Fri,  8 Oct 2021 19:12:32 -0700
Subject: [PATCH v2 39/43] KVM: VMX: Don't do full kick when triggering posted
 interrupt "fails"
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
Message-ID: <20211009021236.4122790-40-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace the full "kick" with just the "wake" in the fallback path when
triggering a virtual interrupt via a posted interrupt fails because the
guest is not IN_GUEST_MODE.  If the guest transitions into guest mode
between the check and the kick, then it's guaranteed to see the pending
interrupt as KVM syncs the PIR to IRR (and onto GUEST_RVI) after setting
IN_GUEST_MODE.  Kicking the guest in this case is nothing more than an
unnecessary VM-Exit (and host IRQ).

Opportunistically update comments to explain the various ordering rules
and barriers at play.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 16 ++++++++++++++--
 arch/x86/kvm/x86.c     |  5 +++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 13e732a818f3..44d760dde0f9 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3978,10 +3978,16 @@ static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
 		 * we will accomplish it in the next vmentry.
 		 */
 		vmx->nested.pi_pending = true;
+		/*
+		 * The smp_wmb() in kvm_make_request() pairs with the smp_mb_*()
+		 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU
+		 * is guaranteed to see the event request if triggering a posted
+		 * interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
+		 */
 		kvm_make_request(KVM_REQ_EVENT, vcpu);
 		/* the PIR and ON have been set by L1. */
 		if (!kvm_vcpu_trigger_posted_interrupt(vcpu, true))
-			kvm_vcpu_kick(vcpu);
+			kvm_vcpu_wake_up(vcpu);
 		return 0;
 	}
 	return -1;
@@ -4012,9 +4018,15 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
 	if (pi_test_and_set_on(&vmx->pi_desc))
 		return 0;
 
+	/*
+	 * The implied barrier in pi_test_and_set_on() pairs with the smp_mb_*()
+	 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU is
+	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
+	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
+	 */
 	if (vcpu != kvm_get_running_vcpu() &&
 	    !kvm_vcpu_trigger_posted_interrupt(vcpu, false))
-		kvm_vcpu_kick(vcpu);
+		kvm_vcpu_wake_up(vcpu);
 
 	return 0;
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9643f23c28c7..274d295cabfb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9752,8 +9752,9 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	smp_mb__after_srcu_read_unlock();
 
 	/*
-	 * This handles the case where a posted interrupt was
-	 * notified with kvm_vcpu_kick.
+	 * Process pending posted interrupts to handle the case where the
+	 * notification IRQ arrived in the host, or was never sent (because the
+	 * target vCPU wasn't running).
 	 */
 	if (kvm_lapic_enabled(vcpu) && vcpu->arch.apicv_active)
 		static_call(kvm_x86_sync_pir_to_irr)(vcpu);
-- 
2.33.0.882.g93a45727a2-goog



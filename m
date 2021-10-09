From: Sean Christopherson <seanjc@google.com>
Date: Fri,  8 Oct 2021 19:12:34 -0700
Subject: [PATCH v2 41/43] KVM: VMX: Pass desired vector instead of bool for
 triggering posted IRQ
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
Message-ID: <20211009021236.4122790-42-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Refactor the posted interrupt helper to take the desired notification
vector instead of a bool so that the callers are self-documenting.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 78c8bc7f1b3b..f505fee3cf5c 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3928,11 +3928,9 @@ static void vmx_msr_filter_changed(struct kvm_vcpu *vcpu)
 }
 
 static inline bool kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
-						     bool nested)
+						     int pi_vec)
 {
 #ifdef CONFIG_SMP
-	int pi_vec = nested ? POSTED_INTR_NESTED_VECTOR : POSTED_INTR_VECTOR;
-
 	if (vcpu->mode == IN_GUEST_MODE) {
 		/*
 		 * The vector of interrupt to be delivered to vcpu had
@@ -3986,7 +3984,7 @@ static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
 		 */
 		kvm_make_request(KVM_REQ_EVENT, vcpu);
 		/* the PIR and ON have been set by L1. */
-		if (!kvm_vcpu_trigger_posted_interrupt(vcpu, true))
+		if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR))
 			kvm_vcpu_wake_up(vcpu);
 		return 0;
 	}
@@ -4024,7 +4022,7 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
 	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
 	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
 	 */
-	if (!kvm_vcpu_trigger_posted_interrupt(vcpu, false))
+	if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR))
 		kvm_vcpu_wake_up(vcpu);
 
 	return 0;
-- 
2.33.0.882.g93a45727a2-goog



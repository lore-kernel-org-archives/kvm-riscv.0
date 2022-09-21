From: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Sep 2022 00:31:50 +0000
Subject: [PATCH v4 01/12] KVM: x86: make vendor code check for all nested events
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com>
Message-ID: <20220921003201.1441511-2-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Paolo Bonzini <pbonzini@redhat.com>

Interrupts, NMIs etc. sent while in guest mode are already handled
properly by the *_interrupt_allowed callbacks, but other events can
cause a vCPU to be runnable that are specific to guest mode.

In the case of VMX there are two, the preemption timer and the
monitor trap.  The VMX preemption timer is already special cased via
the hv_timer_pending callback, but the purpose of the callback can be
easily extended to MTF or in fact any other event that can occur only
in guest mode.

Rename the callback and add an MTF check; kvm_arch_vcpu_runnable()
now can return true if an MTF is pending, without relying on
kvm_vcpu_running()'s call to kvm_check_nested_events().  Until that call
is removed, however, the patch introduces no functional change.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 2 +-
 arch/x86/kvm/vmx/nested.c       | 8 +++++++-
 arch/x86/kvm/x86.c              | 8 ++++----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index ee940c4c0f64..c03590d1c5e1 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1649,7 +1649,7 @@ struct kvm_x86_nested_ops {
 	bool (*is_exception_vmexit)(struct kvm_vcpu *vcpu, u8 vector,
 				    u32 error_code);
 	int (*check_events)(struct kvm_vcpu *vcpu);
-	bool (*hv_timer_pending)(struct kvm_vcpu *vcpu);
+	bool (*has_events)(struct kvm_vcpu *vcpu);
 	void (*triple_fault)(struct kvm_vcpu *vcpu);
 	int (*get_state)(struct kvm_vcpu *vcpu,
 			 struct kvm_nested_state __user *user_kvm_nested_state,
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 4da0558943ce..85318d803f4f 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -3929,6 +3929,12 @@ static bool nested_vmx_preemption_timer_pending(struct kvm_vcpu *vcpu)
 	       to_vmx(vcpu)->nested.preemption_timer_expired;
 }
 
+static bool vmx_has_nested_events(struct kvm_vcpu *vcpu)
+{
+	return nested_vmx_preemption_timer_pending(vcpu) ||
+	       to_vmx(vcpu)->nested.mtf_pending;
+}
+
 /*
  * Per the Intel SDM's table "Priority Among Concurrent Events", with minor
  * edits to fill in missing examples, e.g. #DB due to split-lock accesses,
@@ -6971,7 +6977,7 @@ struct kvm_x86_nested_ops vmx_nested_ops = {
 	.leave_nested = vmx_leave_nested,
 	.is_exception_vmexit = nested_vmx_is_exception_vmexit,
 	.check_events = vmx_check_nested_events,
-	.hv_timer_pending = nested_vmx_preemption_timer_pending,
+	.has_events = vmx_has_nested_events,
 	.triple_fault = nested_vmx_triple_fault,
 	.get_state = vmx_get_nested_state,
 	.set_state = vmx_set_nested_state,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5b8328cb6c14..e1a25e46dbf7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9966,8 +9966,8 @@ static int kvm_check_and_inject_events(struct kvm_vcpu *vcpu,
 	}
 
 	if (is_guest_mode(vcpu) &&
-	    kvm_x86_ops.nested_ops->hv_timer_pending &&
-	    kvm_x86_ops.nested_ops->hv_timer_pending(vcpu))
+	    kvm_x86_ops.nested_ops->has_events &&
+	    kvm_x86_ops.nested_ops->has_events(vcpu))
 		*req_immediate_exit = true;
 
 	WARN_ON(kvm_is_exception_pending(vcpu));
@@ -12792,8 +12792,8 @@ static inline bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 		return true;
 
 	if (is_guest_mode(vcpu) &&
-	    kvm_x86_ops.nested_ops->hv_timer_pending &&
-	    kvm_x86_ops.nested_ops->hv_timer_pending(vcpu))
+	    kvm_x86_ops.nested_ops->has_events &&
+	    kvm_x86_ops.nested_ops->has_events(vcpu))
 		return true;
 
 	if (kvm_xen_has_pending_events(vcpu))
-- 
2.37.3.968.ga6b4b080e4-goog



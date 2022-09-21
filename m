From: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Sep 2022 00:31:52 +0000
Subject: [PATCH v4 03/12] KVM: x86: Rename and expose helper to detect if
 INIT/SIPI are allowed
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com>
Message-ID: <20220921003201.1441511-4-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename and invert kvm_vcpu_latch_init() to kvm_apic_init_sipi_allowed()
so as to match the behavior of {interrupt,nmi,smi}_allowed(), and expose
the helper so that it can be used by kvm_vcpu_has_events() to determine
whether or not an INIT or SIPI is pending _and_ can be taken immediately.

Opportunistically replaced usage of the "latch" terminology with "blocked"
and/or "allowed", again to align with KVM's terminology used for all other
event types.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 4 ++--
 arch/x86/kvm/lapic.h | 7 +++++++
 arch/x86/kvm/x86.c   | 9 +++++----
 arch/x86/kvm/x86.h   | 5 -----
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 9dda989a1cf0..2bd90effc653 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -3051,14 +3051,14 @@ int kvm_apic_accept_events(struct kvm_vcpu *vcpu)
 	}
 
 	/*
-	 * INITs are latched while CPU is in specific states
+	 * INITs are blocked while CPU is in specific states
 	 * (SMM, VMX root mode, SVM with GIF=0).
 	 * Because a CPU cannot be in these states immediately
 	 * after it has processed an INIT signal (and thus in
 	 * KVM_MP_STATE_INIT_RECEIVED state), just eat SIPIs
 	 * and leave the INIT pending.
 	 */
-	if (kvm_vcpu_latch_init(vcpu)) {
+	if (!kvm_apic_init_sipi_allowed(vcpu)) {
 		WARN_ON_ONCE(vcpu->arch.mp_state == KVM_MP_STATE_INIT_RECEIVED);
 		if (test_bit(KVM_APIC_SIPI, &pe))
 			clear_bit(KVM_APIC_SIPI, &apic->pending_events);
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 117a46df5cc1..c3ce6b0b1ea3 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -7,6 +7,7 @@
 #include <linux/kvm_host.h>
 
 #include "hyperv.h"
+#include "kvm_cache_regs.h"
 
 #define KVM_APIC_INIT		0
 #define KVM_APIC_SIPI		1
@@ -228,6 +229,12 @@ static inline bool kvm_apic_has_events(struct kvm_vcpu *vcpu)
 	return lapic_in_kernel(vcpu) && vcpu->arch.apic->pending_events;
 }
 
+static inline bool kvm_apic_init_sipi_allowed(struct kvm_vcpu *vcpu)
+{
+	return !is_smm(vcpu) &&
+	       !static_call(kvm_x86_apic_init_signal_blocked)(vcpu);
+}
+
 static inline bool kvm_lowest_prio_delivery(struct kvm_lapic_irq *irq)
 {
 	return (irq->delivery_mode == APIC_DM_LOWEST ||
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e1a25e46dbf7..59be7b16b92f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11293,11 +11293,12 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 		goto out;
 
 	/*
-	 * KVM_MP_STATE_INIT_RECEIVED means the processor is in
-	 * INIT state; latched init should be reported using
-	 * KVM_SET_VCPU_EVENTS, so reject it here.
+	 * Pending INITs are reported using KVM_SET_VCPU_EVENTS, disallow
+	 * forcing the guest into INIT/SIPI if those events are supposed to be
+	 * blocked.  KVM prioritizes SMI over INIT, so reject INIT/SIPI state
+	 * if an SMI is pending as well.
 	 */
-	if ((kvm_vcpu_latch_init(vcpu) || vcpu->arch.smi_pending) &&
+	if ((!kvm_apic_init_sipi_allowed(vcpu) || vcpu->arch.smi_pending) &&
 	    (mp_state->mp_state == KVM_MP_STATE_SIPI_RECEIVED ||
 	     mp_state->mp_state == KVM_MP_STATE_INIT_RECEIVED))
 		goto out;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index a784ff90740b..829d3134c1eb 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -275,11 +275,6 @@ static inline bool kvm_check_has_quirk(struct kvm *kvm, u64 quirk)
 	return !(kvm->arch.disabled_quirks & quirk);
 }
 
-static inline bool kvm_vcpu_latch_init(struct kvm_vcpu *vcpu)
-{
-	return is_smm(vcpu) || static_call(kvm_x86_apic_init_signal_blocked)(vcpu);
-}
-
 void kvm_inject_realmode_interrupt(struct kvm_vcpu *vcpu, int irq, int inc_eip);
 
 u64 get_kvmclock_ns(struct kvm *kvm);
-- 
2.37.3.968.ga6b4b080e4-goog



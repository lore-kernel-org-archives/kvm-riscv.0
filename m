From: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Sep 2022 00:31:58 +0000
Subject: [PATCH v4 09/12] KVM: x86: Don't snapshot pending INIT/SIPI prior to
 checking nested events
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com>
Message-ID: <20220921003201.1441511-10-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't snapshot pending INIT/SIPI events prior to checking nested events,
architecturally there's nothing wrong with KVM processing (dropping) a
SIPI that is received immediately after synthesizing a VM-Exit.  Taking
and consuming the snapshot makes the flow way more subtle than it needs
to be, e.g. nVMX consumes/clears events that trigger VM-Exit (INIT/SIPI),
and so at first glance it appears that KVM is double-dipping on pending
INITs and SIPIs.  But that's not the case because INIT is blocked
unconditionally in VMX root mode the CPU cannot be in wait-for_SIPI after
VM-Exit, i.e. the paths that truly consume the snapshot are unreachable
if apic->pending_events is modified by kvm_check_nested_events().

nSVM is a similar story as GIF is cleared by the CPU on VM-Exit; INIT is
blocked regardless of whether or not it was pending prior to VM-Exit.

Drop the snapshot logic so that a future fix doesn't create weirdness
when kvm_vcpu_running()'s call to kvm_check_nested_events() is moved to
vcpu_block().  In that case, kvm_check_nested_events() will be called
immediately before kvm_apic_accept_events(), which raises the obvious
question of why that change doesn't break the snapshot logic.

Note, there is a subtle functional change.  Previously, KVM would clear
pending SIPIs if and only SIPI was pending prior to VM-Exit, whereas now
KVM clears pending SIPI unconditionally if INIT+SIPI are blocked.  The
latter is architecturally allowed, as SIPI is ignored if the CPU is not
in wait-for-SIPI mode (arguably, KVM should be even more aggressive in
dropping SIPIs).  It is software's responsibility to ensure the SIPI is
delivered, i.e. software shouldn't be firing INIT-SIPI at a CPU until
it knows with 100% certaining that the target CPU isn't in VMX root mode.

Furthermore, the existing code is extra weird as SIPIs that arrive after
VM-Exit _are_ dropped if there also happened to be a pending SIPI before
VM-Exit.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 2bd90effc653..d7639d126e6c 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -3025,17 +3025,8 @@ int kvm_apic_accept_events(struct kvm_vcpu *vcpu)
 	struct kvm_lapic *apic = vcpu->arch.apic;
 	u8 sipi_vector;
 	int r;
-	unsigned long pe;
 
-	if (!lapic_in_kernel(vcpu))
-		return 0;
-
-	/*
-	 * Read pending events before calling the check_events
-	 * callback.
-	 */
-	pe = smp_load_acquire(&apic->pending_events);
-	if (!pe)
+	if (!kvm_apic_has_pending_init_or_sipi(vcpu))
 		return 0;
 
 	if (is_guest_mode(vcpu)) {
@@ -3043,38 +3034,31 @@ int kvm_apic_accept_events(struct kvm_vcpu *vcpu)
 		if (r < 0)
 			return r == -EBUSY ? 0 : r;
 		/*
-		 * If an event has happened and caused a vmexit,
-		 * we know INITs are latched and therefore
-		 * we will not incorrectly deliver an APIC
-		 * event instead of a vmexit.
+		 * Continue processing INIT/SIPI even if a nested VM-Exit
+		 * occurred, e.g. pending SIPIs should be dropped if INIT+SIPI
+		 * are blocked as a result of transitioning to VMX root mode.
 		 */
 	}
 
 	/*
-	 * INITs are blocked while CPU is in specific states
-	 * (SMM, VMX root mode, SVM with GIF=0).
-	 * Because a CPU cannot be in these states immediately
-	 * after it has processed an INIT signal (and thus in
-	 * KVM_MP_STATE_INIT_RECEIVED state), just eat SIPIs
-	 * and leave the INIT pending.
+	 * INITs are blocked while CPU is in specific states (SMM, VMX root
+	 * mode, SVM with GIF=0), while SIPIs are dropped if the CPU isn't in
+	 * wait-for-SIPI (WFS).
 	 */
 	if (!kvm_apic_init_sipi_allowed(vcpu)) {
 		WARN_ON_ONCE(vcpu->arch.mp_state == KVM_MP_STATE_INIT_RECEIVED);
-		if (test_bit(KVM_APIC_SIPI, &pe))
-			clear_bit(KVM_APIC_SIPI, &apic->pending_events);
+		clear_bit(KVM_APIC_SIPI, &apic->pending_events);
 		return 0;
 	}
 
-	if (test_bit(KVM_APIC_INIT, &pe)) {
-		clear_bit(KVM_APIC_INIT, &apic->pending_events);
+	if (test_and_clear_bit(KVM_APIC_INIT, &apic->pending_events)) {
 		kvm_vcpu_reset(vcpu, true);
 		if (kvm_vcpu_is_bsp(apic->vcpu))
 			vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
 		else
 			vcpu->arch.mp_state = KVM_MP_STATE_INIT_RECEIVED;
 	}
-	if (test_bit(KVM_APIC_SIPI, &pe)) {
-		clear_bit(KVM_APIC_SIPI, &apic->pending_events);
+	if (test_and_clear_bit(KVM_APIC_SIPI, &apic->pending_events)) {
 		if (vcpu->arch.mp_state == KVM_MP_STATE_INIT_RECEIVED) {
 			/* evaluate pending_events before reading the vector */
 			smp_rmb();
-- 
2.37.3.968.ga6b4b080e4-goog



From: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Sep 2022 00:31:56 +0000
Subject: [PATCH v4 07/12] KVM: nVMX: Make an event request if INIT or SIPI is
 pending on VM-Enter
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com>
Message-ID: <20220921003201.1441511-8-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Evaluate interrupts, i.e. set KVM_REQ_EVENT, if INIT or SIPI is pending
when emulating nested VM-Enter.  INIT is blocked while the CPU is in VMX
root mode, but not in VMX non-root, i.e. becomes unblocked on VM-Enter.
This bug has been masked by KVM calling ->check_nested_events() in the
core run loop, but that hack will be fixed in the near future.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 3a080051a4ec..5922531f6c52 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -3377,6 +3377,8 @@ enum nvmx_vmentry_status nested_vmx_enter_non_root_mode(struct kvm_vcpu *vcpu,
 		(CPU_BASED_INTR_WINDOW_EXITING | CPU_BASED_NMI_WINDOW_EXITING);
 	if (likely(!evaluate_pending_interrupts) && kvm_vcpu_apicv_active(vcpu))
 		evaluate_pending_interrupts |= vmx_has_apicv_interrupt(vcpu);
+	if (!evaluate_pending_interrupts)
+		evaluate_pending_interrupts |= kvm_apic_has_pending_init_or_sipi(vcpu);
 
 	if (!vmx->nested.nested_run_pending ||
 	    !(vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS))
@@ -3457,18 +3459,10 @@ enum nvmx_vmentry_status nested_vmx_enter_non_root_mode(struct kvm_vcpu *vcpu,
 	}
 
 	/*
-	 * If L1 had a pending IRQ/NMI until it executed
-	 * VMLAUNCH/VMRESUME which wasn't delivered because it was
-	 * disallowed (e.g. interrupts disabled), L0 needs to
-	 * evaluate if this pending event should cause an exit from L2
-	 * to L1 or delivered directly to L2 (e.g. In case L1 don't
-	 * intercept EXTERNAL_INTERRUPT).
-	 *
-	 * Usually this would be handled by the processor noticing an
-	 * IRQ/NMI window request, or checking RVI during evaluation of
-	 * pending virtual interrupts.  However, this setting was done
-	 * on VMCS01 and now VMCS02 is active instead. Thus, we force L0
-	 * to perform pending event evaluation by requesting a KVM_REQ_EVENT.
+	 * Re-evaluate pending events if L1 had a pending IRQ/NMI/INIT/SIPI
+	 * when it executed VMLAUNCH/VMRESUME, as entering non-root mode can
+	 * effectively unblock various events, e.g. INIT/SIPI cause VM-Exit
+	 * unconditionally.
 	 */
 	if (unlikely(evaluate_pending_interrupts))
 		kvm_make_request(KVM_REQ_EVENT, vcpu);
-- 
2.37.3.968.ga6b4b080e4-goog



From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:08:56 +0000
Subject: [PATCH v2 12/50] KVM: VMX: Move Hyper-V eVMCS initialization to helper
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-13-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move Hyper-V's eVMCS initialization to a dedicated helper to clean up
vmx_init(), and add a comment to call out that the Hyper-V init code
doesn't need to be unwound if vmx_init() ultimately fails.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 73 +++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 30 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index c0de7160700b..b8bf95b9710d 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -523,6 +523,8 @@ static inline void vmx_segment_cache_clear(struct vcpu_vmx *vmx)
 static unsigned long host_idt_base;
 
 #if IS_ENABLED(CONFIG_HYPERV)
+static struct kvm_x86_ops vmx_x86_ops __initdata;
+
 static bool __read_mostly enlightened_vmcs = true;
 module_param(enlightened_vmcs, bool, 0444);
 
@@ -551,6 +553,43 @@ static int hv_enable_l2_tlb_flush(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static __init void hv_init_evmcs(void)
+{
+	int cpu;
+
+	if (!enlightened_vmcs)
+		return;
+
+	/*
+	 * Enlightened VMCS usage should be recommended and the host needs
+	 * to support eVMCS v1 or above.
+	 */
+	if (ms_hyperv.hints & HV_X64_ENLIGHTENED_VMCS_RECOMMENDED &&
+	    (ms_hyperv.nested_features & HV_X64_ENLIGHTENED_VMCS_VERSION) >=
+	     KVM_EVMCS_VERSION) {
+
+		/* Check that we have assist pages on all online CPUs */
+		for_each_online_cpu(cpu) {
+			if (!hv_get_vp_assist_page(cpu)) {
+				enlightened_vmcs = false;
+				break;
+			}
+		}
+
+		if (enlightened_vmcs) {
+			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
+			static_branch_enable(&enable_evmcs);
+		}
+
+		if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH)
+			vmx_x86_ops.enable_l2_tlb_flush
+				= hv_enable_l2_tlb_flush;
+
+	} else {
+		enlightened_vmcs = false;
+	}
+}
+
 static void hv_reset_evmcs(void)
 {
 	struct hv_vp_assist_page *vp_ap;
@@ -577,6 +616,7 @@ static void hv_reset_evmcs(void)
 }
 
 #else /* IS_ENABLED(CONFIG_HYPERV) */
+static void hv_init_evmcs(void) {}
 static void hv_reset_evmcs(void) {}
 #endif /* IS_ENABLED(CONFIG_HYPERV) */
 
@@ -8500,38 +8540,11 @@ static int __init vmx_init(void)
 {
 	int r, cpu;
 
-#if IS_ENABLED(CONFIG_HYPERV)
 	/*
-	 * Enlightened VMCS usage should be recommended and the host needs
-	 * to support eVMCS v1 or above. We can also disable eVMCS support
-	 * with module parameter.
+	 * Note, hv_init_evmcs() touches only VMX knobs, i.e. there's nothing
+	 * to unwind if a later step fails.
 	 */
-	if (enlightened_vmcs &&
-	    ms_hyperv.hints & HV_X64_ENLIGHTENED_VMCS_RECOMMENDED &&
-	    (ms_hyperv.nested_features & HV_X64_ENLIGHTENED_VMCS_VERSION) >=
-	    KVM_EVMCS_VERSION) {
-
-		/* Check that we have assist pages on all online CPUs */
-		for_each_online_cpu(cpu) {
-			if (!hv_get_vp_assist_page(cpu)) {
-				enlightened_vmcs = false;
-				break;
-			}
-		}
-
-		if (enlightened_vmcs) {
-			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
-			static_branch_enable(&enable_evmcs);
-		}
-
-		if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH)
-			vmx_x86_ops.enable_l2_tlb_flush
-				= hv_enable_l2_tlb_flush;
-
-	} else {
-		enlightened_vmcs = false;
-	}
-#endif
+	hv_init_evmcs();
 
 	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
-- 
2.38.1.584.g0f3c55d4c2-goog



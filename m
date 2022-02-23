From: Oliver Upton <oupton@google.com>
Date: Wed, 23 Feb 2022 04:18:33 +0000
Subject: [PATCH v3 08/19] KVM: arm64: Add reset helper that accepts
 caller-provided reset state
In-Reply-To: <20220223041844.3984439-1-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
Message-ID: <20220223041844.3984439-9-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To date, struct vcpu_reset_state has been used to implement PSCI CPU_ON,
as callers of this function provide context for the targeted vCPU. A
subsequent change to KVM will require that a vCPU can populate its own
reset context.

Extract the vCPU reset implementation into a new function to separate
the locked read of shared data (vcpu->arch.reset_state) from the use of
the reset context.

No functional change intended.

Signed-off-by: Oliver Upton <oupton@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 16 ++++++-----
 arch/arm64/kvm/reset.c            | 44 +++++++++++++++++++------------
 2 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3e8bfecaa95b..33ecec755310 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -67,6 +67,15 @@ extern unsigned int kvm_sve_max_vl;
 int kvm_arm_init_sve(void);
 
 u32 __attribute_const__ kvm_target_cpu(void);
+
+struct vcpu_reset_state {
+	unsigned long	pc;
+	unsigned long	r0;
+	bool		be;
+	bool		reset;
+};
+
+int __kvm_reset_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reset_state *reset_state);
 int kvm_reset_vcpu(struct kvm_vcpu *vcpu);
 void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu);
 
@@ -271,13 +280,6 @@ extern s64 kvm_nvhe_sym(hyp_physvirt_offset);
 extern u64 kvm_nvhe_sym(hyp_cpu_logical_map)[NR_CPUS];
 #define hyp_cpu_logical_map CHOOSE_NVHE_SYM(hyp_cpu_logical_map)
 
-struct vcpu_reset_state {
-	unsigned long	pc;
-	unsigned long	r0;
-	bool		be;
-	bool		reset;
-};
-
 struct kvm_vcpu_arch {
 	struct kvm_cpu_context ctxt;
 	void *sve_state;
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index ecc40c8cd6f6..f879a8f6a99c 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -205,35 +205,32 @@ static bool vcpu_allowed_register_width(struct kvm_vcpu *vcpu)
 }
 
 /**
- * kvm_reset_vcpu - sets core registers and sys_regs to reset value
+ * __kvm_reset_vcpu - sets core registers and sys_regs to reset value
  * @vcpu: The VCPU pointer
+ * @reset_state: Context to use to reset the vCPU
  *
  * This function sets the registers on the virtual CPU struct to their
  * architecturally defined reset values, except for registers whose reset is
  * deferred until kvm_arm_vcpu_finalize().
  *
- * Note: This function can be called from two paths: The KVM_ARM_VCPU_INIT
- * ioctl or as part of handling a request issued by another VCPU in the PSCI
- * handling code.  In the first case, the VCPU will not be loaded, and in the
- * second case the VCPU will be loaded.  Because this function operates purely
- * on the memory-backed values of system registers, we want to do a full put if
+ * Note: This function can be called from two paths:
+ *  - The KVM_ARM_VCPU_INIT ioctl
+ *  - handling a request issued by another VCPU in the PSCI handling code
+ *
+ * In the first case, the VCPU will not be loaded, and in the second case the
+ * VCPU will be loaded.  Because this function operates purely on the
+ * memory-backed values of system registers, we want to do a full put if
  * we were loaded (handling a request) and load the values back at the end of
  * the function.  Otherwise we leave the state alone.  In both cases, we
  * disable preemption around the vcpu reset as we would otherwise race with
  * preempt notifiers which also call put/load.
  */
-int kvm_reset_vcpu(struct kvm_vcpu *vcpu)
+int __kvm_reset_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reset_state *reset_state)
 {
-	struct vcpu_reset_state reset_state;
 	int ret;
 	bool loaded;
 	u32 pstate;
 
-	mutex_lock(&vcpu->kvm->lock);
-	reset_state = vcpu->arch.reset_state;
-	WRITE_ONCE(vcpu->arch.reset_state.reset, false);
-	mutex_unlock(&vcpu->kvm->lock);
-
 	/* Reset PMU outside of the non-preemptible section */
 	kvm_pmu_vcpu_reset(vcpu);
 
@@ -296,8 +293,8 @@ int kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	 * Additional reset state handling that PSCI may have imposed on us.
 	 * Must be done after all the sys_reg reset.
 	 */
-	if (reset_state.reset) {
-		unsigned long target_pc = reset_state.pc;
+	if (reset_state->reset) {
+		unsigned long target_pc = reset_state->pc;
 
 		/* Gracefully handle Thumb2 entry point */
 		if (vcpu_mode_is_32bit(vcpu) && (target_pc & 1)) {
@@ -306,11 +303,11 @@ int kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 		}
 
 		/* Propagate caller endianness */
-		if (reset_state.be)
+		if (reset_state->be)
 			kvm_vcpu_set_be(vcpu);
 
 		*vcpu_pc(vcpu) = target_pc;
-		vcpu_set_reg(vcpu, 0, reset_state.r0);
+		vcpu_set_reg(vcpu, 0, reset_state->r0);
 	}
 
 	/* Reset timer */
@@ -320,6 +317,19 @@ int kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 		kvm_arch_vcpu_load(vcpu, smp_processor_id());
 	preempt_enable();
 	return ret;
+
+}
+
+int kvm_reset_vcpu(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_reset_state reset_state;
+
+	mutex_lock(&vcpu->kvm->lock);
+	reset_state = vcpu->arch.reset_state;
+	WRITE_ONCE(vcpu->arch.reset_state.reset, false);
+	mutex_unlock(&vcpu->kvm->lock);
+
+	return __kvm_reset_vcpu(vcpu, &reset_state);
 }
 
 u32 get_kvm_ipa_limit(void)
-- 
2.35.1.473.g83b2b277ed-goog



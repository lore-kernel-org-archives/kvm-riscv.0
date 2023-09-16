From: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 Sep 2023 17:31:17 -0700
Subject: [PATCH 25/26] KVM: PPC: Rearrange code in kvm_ppc.h to isolate
 "public" information
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
Message-ID: <20230916003118.2540661-26-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move all declarations and definitions in kvm_ppc.h that are consumed by
things other than KVM to the top of the file.  This will allow wrapping
the parts of kvm_ppc.h that are intended only for KVM, i.e. are intended
to be "private" to KVM, with an #ifdef to hide KVM's internal details from
the kernel at-large.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 302 +++++++++++++++--------------
 1 file changed, 153 insertions(+), 149 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 72fee202d3ec..ead2ad892ebc 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -30,6 +30,159 @@
 #endif
 #include <asm/inst.h>
 
+struct openpic;
+
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+extern void kvm_cma_reserve(void) __init;
+static inline void kvmppc_set_xics_phys(int cpu, unsigned long addr)
+{
+	paca_ptrs[cpu]->kvm_hstate.xics_phys = (void __iomem *)addr;
+}
+
+static inline void kvmppc_set_xive_tima(int cpu,
+					unsigned long phys_addr,
+					void __iomem *virt_addr)
+{
+	paca_ptrs[cpu]->kvm_hstate.xive_tima_phys = (void __iomem *)phys_addr;
+	paca_ptrs[cpu]->kvm_hstate.xive_tima_virt = virt_addr;
+}
+
+static inline u32 kvmppc_get_xics_latch(void)
+{
+	u32 xirr;
+
+	xirr = get_paca()->kvm_hstate.saved_xirr;
+	get_paca()->kvm_hstate.saved_xirr = 0;
+	return xirr;
+}
+
+/*
+ * To avoid the need to unnecessarily exit fully to the host kernel, an IPI to
+ * a CPU thread that's running/napping inside of a guest is by default regarded
+ * as a request to wake the CPU (if needed) and continue execution within the
+ * guest, potentially to process new state like externally-generated
+ * interrupts or IPIs sent from within the guest itself (e.g. H_PROD/H_IPI).
+ *
+ * To force an exit to the host kernel, kvmppc_set_host_ipi() must be called
+ * prior to issuing the IPI to set the corresponding 'host_ipi' flag in the
+ * target CPU's PACA. To avoid unnecessary exits to the host, this flag should
+ * be immediately cleared via kvmppc_clear_host_ipi() by the IPI handler on
+ * the receiving side prior to processing the IPI work.
+ *
+ * NOTE:
+ *
+ * We currently issue an smp_mb() at the beginning of kvmppc_set_host_ipi().
+ * This is to guard against sequences such as the following:
+ *
+ *      CPU
+ *        X: smp_muxed_ipi_set_message():
+ *        X:   smp_mb()
+ *        X:   message[RESCHEDULE] = 1
+ *        X: doorbell_global_ipi(42):
+ *        X:   kvmppc_set_host_ipi(42)
+ *        X:   ppc_msgsnd_sync()/smp_mb()
+ *        X:   ppc_msgsnd() -> 42
+ *       42: doorbell_exception(): // from CPU X
+ *       42:   ppc_msgsync()
+ *      105: smp_muxed_ipi_set_message():
+ *      105:   smb_mb()
+ *           // STORE DEFERRED DUE TO RE-ORDERING
+ *    --105:   message[CALL_FUNCTION] = 1
+ *    | 105: doorbell_global_ipi(42):
+ *    | 105:   kvmppc_set_host_ipi(42)
+ *    |  42:   kvmppc_clear_host_ipi(42)
+ *    |  42: smp_ipi_demux_relaxed()
+ *    |  42: // returns to executing guest
+ *    |      // RE-ORDERED STORE COMPLETES
+ *    ->105:   message[CALL_FUNCTION] = 1
+ *      105:   ppc_msgsnd_sync()/smp_mb()
+ *      105:   ppc_msgsnd() -> 42
+ *       42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
+ *      105: // hangs waiting on 42 to process messages/call_single_queue
+ *
+ * We also issue an smp_mb() at the end of kvmppc_clear_host_ipi(). This is
+ * to guard against sequences such as the following (as well as to create
+ * a read-side pairing with the barrier in kvmppc_set_host_ipi()):
+ *
+ *      CPU
+ *        X: smp_muxed_ipi_set_message():
+ *        X:   smp_mb()
+ *        X:   message[RESCHEDULE] = 1
+ *        X: doorbell_global_ipi(42):
+ *        X:   kvmppc_set_host_ipi(42)
+ *        X:   ppc_msgsnd_sync()/smp_mb()
+ *        X:   ppc_msgsnd() -> 42
+ *       42: doorbell_exception(): // from CPU X
+ *       42:   ppc_msgsync()
+ *           // STORE DEFERRED DUE TO RE-ORDERING
+ *    -- 42:   kvmppc_clear_host_ipi(42)
+ *    |  42: smp_ipi_demux_relaxed()
+ *    | 105: smp_muxed_ipi_set_message():
+ *    | 105:   smb_mb()
+ *    | 105:   message[CALL_FUNCTION] = 1
+ *    | 105: doorbell_global_ipi(42):
+ *    | 105:   kvmppc_set_host_ipi(42)
+ *    |      // RE-ORDERED STORE COMPLETES
+ *    -> 42:   kvmppc_clear_host_ipi(42)
+ *       42: // returns to executing guest
+ *      105:   ppc_msgsnd_sync()/smp_mb()
+ *      105:   ppc_msgsnd() -> 42
+ *       42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
+ *      105: // hangs waiting on 42 to process messages/call_single_queue
+ */
+static inline void kvmppc_set_host_ipi(int cpu)
+{
+	/*
+	 * order stores of IPI messages vs. setting of host_ipi flag
+	 *
+	 * pairs with the barrier in kvmppc_clear_host_ipi()
+	 */
+	smp_mb();
+	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 1);
+}
+
+static inline void kvmppc_clear_host_ipi(int cpu)
+{
+	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 0);
+	/*
+	 * order clearing of host_ipi flag vs. processing of IPI messages
+	 *
+	 * pairs with the barrier in kvmppc_set_host_ipi()
+	 */
+	smp_mb();
+}
+
+extern void kvmppc_xics_ipi_action(void);
+
+extern void kvm_hv_vm_activated(void);
+extern void kvm_hv_vm_deactivated(void);
+extern bool kvm_hv_mode_active(void);
+#else
+static inline void __init kvm_cma_reserve(void)
+{}
+
+static inline void kvmppc_set_xics_phys(int cpu, unsigned long addr)
+{}
+
+static inline void kvmppc_set_xive_tima(int cpu,
+					unsigned long phys_addr,
+					void __iomem *virt_addr)
+{}
+
+static inline u32 kvmppc_get_xics_latch(void)
+{
+	return 0;
+}
+
+static inline void kvmppc_set_host_ipi(int cpu)
+{}
+
+static inline void kvmppc_clear_host_ipi(int cpu)
+{}
+
+static inline bool kvm_hv_mode_active(void)		{ return false; }
+#endif
+
 /*
  * KVMPPC_INST_SW_BREAKPOINT is debug Instruction
  * for supporting software breakpoint.
@@ -443,166 +596,18 @@ void kvmppc_set_pid(struct kvm_vcpu *vcpu, u32 pid);
 struct openpic;
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-extern void kvm_cma_reserve(void) __init;
-static inline void kvmppc_set_xics_phys(int cpu, unsigned long addr)
-{
-	paca_ptrs[cpu]->kvm_hstate.xics_phys = (void __iomem *)addr;
-}
-
-static inline void kvmppc_set_xive_tima(int cpu,
-					unsigned long phys_addr,
-					void __iomem *virt_addr)
-{
-	paca_ptrs[cpu]->kvm_hstate.xive_tima_phys = (void __iomem *)phys_addr;
-	paca_ptrs[cpu]->kvm_hstate.xive_tima_virt = virt_addr;
-}
-
-static inline u32 kvmppc_get_xics_latch(void)
-{
-	u32 xirr;
-
-	xirr = get_paca()->kvm_hstate.saved_xirr;
-	get_paca()->kvm_hstate.saved_xirr = 0;
-	return xirr;
-}
-
-/*
- * To avoid the need to unnecessarily exit fully to the host kernel, an IPI to
- * a CPU thread that's running/napping inside of a guest is by default regarded
- * as a request to wake the CPU (if needed) and continue execution within the
- * guest, potentially to process new state like externally-generated
- * interrupts or IPIs sent from within the guest itself (e.g. H_PROD/H_IPI).
- *
- * To force an exit to the host kernel, kvmppc_set_host_ipi() must be called
- * prior to issuing the IPI to set the corresponding 'host_ipi' flag in the
- * target CPU's PACA. To avoid unnecessary exits to the host, this flag should
- * be immediately cleared via kvmppc_clear_host_ipi() by the IPI handler on
- * the receiving side prior to processing the IPI work.
- *
- * NOTE:
- *
- * We currently issue an smp_mb() at the beginning of kvmppc_set_host_ipi().
- * This is to guard against sequences such as the following:
- *
- *      CPU
- *        X: smp_muxed_ipi_set_message():
- *        X:   smp_mb()
- *        X:   message[RESCHEDULE] = 1
- *        X: doorbell_global_ipi(42):
- *        X:   kvmppc_set_host_ipi(42)
- *        X:   ppc_msgsnd_sync()/smp_mb()
- *        X:   ppc_msgsnd() -> 42
- *       42: doorbell_exception(): // from CPU X
- *       42:   ppc_msgsync()
- *      105: smp_muxed_ipi_set_message():
- *      105:   smb_mb()
- *           // STORE DEFERRED DUE TO RE-ORDERING
- *    --105:   message[CALL_FUNCTION] = 1
- *    | 105: doorbell_global_ipi(42):
- *    | 105:   kvmppc_set_host_ipi(42)
- *    |  42:   kvmppc_clear_host_ipi(42)
- *    |  42: smp_ipi_demux_relaxed()
- *    |  42: // returns to executing guest
- *    |      // RE-ORDERED STORE COMPLETES
- *    ->105:   message[CALL_FUNCTION] = 1
- *      105:   ppc_msgsnd_sync()/smp_mb()
- *      105:   ppc_msgsnd() -> 42
- *       42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
- *      105: // hangs waiting on 42 to process messages/call_single_queue
- *
- * We also issue an smp_mb() at the end of kvmppc_clear_host_ipi(). This is
- * to guard against sequences such as the following (as well as to create
- * a read-side pairing with the barrier in kvmppc_set_host_ipi()):
- *
- *      CPU
- *        X: smp_muxed_ipi_set_message():
- *        X:   smp_mb()
- *        X:   message[RESCHEDULE] = 1
- *        X: doorbell_global_ipi(42):
- *        X:   kvmppc_set_host_ipi(42)
- *        X:   ppc_msgsnd_sync()/smp_mb()
- *        X:   ppc_msgsnd() -> 42
- *       42: doorbell_exception(): // from CPU X
- *       42:   ppc_msgsync()
- *           // STORE DEFERRED DUE TO RE-ORDERING
- *    -- 42:   kvmppc_clear_host_ipi(42)
- *    |  42: smp_ipi_demux_relaxed()
- *    | 105: smp_muxed_ipi_set_message():
- *    | 105:   smb_mb()
- *    | 105:   message[CALL_FUNCTION] = 1
- *    | 105: doorbell_global_ipi(42):
- *    | 105:   kvmppc_set_host_ipi(42)
- *    |      // RE-ORDERED STORE COMPLETES
- *    -> 42:   kvmppc_clear_host_ipi(42)
- *       42: // returns to executing guest
- *      105:   ppc_msgsnd_sync()/smp_mb()
- *      105:   ppc_msgsnd() -> 42
- *       42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
- *      105: // hangs waiting on 42 to process messages/call_single_queue
- */
-static inline void kvmppc_set_host_ipi(int cpu)
-{
-	/*
-	 * order stores of IPI messages vs. setting of host_ipi flag
-	 *
-	 * pairs with the barrier in kvmppc_clear_host_ipi()
-	 */
-	smp_mb();
-	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 1);
-}
-
-static inline void kvmppc_clear_host_ipi(int cpu)
-{
-	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 0);
-	/*
-	 * order clearing of host_ipi flag vs. processing of IPI messages
-	 *
-	 * pairs with the barrier in kvmppc_set_host_ipi()
-	 */
-	smp_mb();
-}
-
 static inline void kvmppc_fast_vcpu_kick(struct kvm_vcpu *vcpu)
 {
 	vcpu->kvm->arch.kvm_ops->fast_vcpu_kick(vcpu);
 }
 
-extern void kvm_hv_vm_activated(void);
-extern void kvm_hv_vm_deactivated(void);
-extern bool kvm_hv_mode_active(void);
-
 extern void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu);
 
 #else
-static inline void __init kvm_cma_reserve(void)
-{}
-
-static inline void kvmppc_set_xics_phys(int cpu, unsigned long addr)
-{}
-
-static inline void kvmppc_set_xive_tima(int cpu,
-					unsigned long phys_addr,
-					void __iomem *virt_addr)
-{}
-
-static inline u32 kvmppc_get_xics_latch(void)
-{
-	return 0;
-}
-
-static inline void kvmppc_set_host_ipi(int cpu)
-{}
-
-static inline void kvmppc_clear_host_ipi(int cpu)
-{}
-
 static inline void kvmppc_fast_vcpu_kick(struct kvm_vcpu *vcpu)
 {
 	kvm_vcpu_kick(vcpu);
 }
-
-static inline bool kvm_hv_mode_active(void)		{ return false; }
-
 #endif
 
 #ifdef CONFIG_PPC_PSERIES
@@ -642,7 +647,6 @@ extern u64 kvmppc_xics_get_icp(struct kvm_vcpu *vcpu);
 extern int kvmppc_xics_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
 extern int kvmppc_xics_connect_vcpu(struct kvm_device *dev,
 			struct kvm_vcpu *vcpu, u32 cpu);
-extern void kvmppc_xics_ipi_action(void);
 extern void kvmppc_xics_set_mapped(struct kvm *kvm, unsigned long guest_irq,
 				   unsigned long host_irq);
 extern void kvmppc_xics_clr_mapped(struct kvm *kvm, unsigned long guest_irq,
-- 
2.42.0.459.ge4e396fd5e-goog



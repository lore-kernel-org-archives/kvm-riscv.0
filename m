From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:31 -0800
Subject: [RFC PATCH 11/37] KVM: MMU: Move RET_PF_* into common code
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-12-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the RET_PF_* enum into common code in preparation for moving the
TDP MMU into common code.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu_internal.h | 28 ----------------------------
 include/kvm/mmu_types.h         | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 4abb80a3bd01..d3c1d08002af 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -79,34 +79,6 @@ static inline bool is_nx_huge_page_enabled(struct kvm *kvm)
 
 int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
 
-/*
- * Return values of handle_mmio_page_fault(), mmu.page_fault(), fast_page_fault(),
- * and of course kvm_mmu_do_page_fault().
- *
- * RET_PF_CONTINUE: So far, so good, keep handling the page fault.
- * RET_PF_RETRY: let CPU fault again on the address.
- * RET_PF_EMULATE: mmio page fault, emulate the instruction directly.
- * RET_PF_INVALID: the spte is invalid, let the real page fault path update it.
- * RET_PF_FIXED: The faulting entry has been fixed.
- * RET_PF_SPURIOUS: The faulting entry was already fixed, e.g. by another vCPU.
- *
- * Any names added to this enum should be exported to userspace for use in
- * tracepoints via TRACE_DEFINE_ENUM() in mmutrace.h
- *
- * Note, all values must be greater than or equal to zero so as not to encroach
- * on -errno return values.  Somewhat arbitrarily use '0' for CONTINUE, which
- * will allow for efficient machine code when checking for CONTINUE, e.g.
- * "TEST %rax, %rax, JNZ", as all "stop!" values are non-zero.
- */
-enum {
-	RET_PF_CONTINUE = 0,
-	RET_PF_RETRY,
-	RET_PF_EMULATE,
-	RET_PF_INVALID,
-	RET_PF_FIXED,
-	RET_PF_SPURIOUS,
-};
-
 static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 					u32 err, bool prefetch)
 {
diff --git a/include/kvm/mmu_types.h b/include/kvm/mmu_types.h
index 9f0ca920bf68..07c9962f9aea 100644
--- a/include/kvm/mmu_types.h
+++ b/include/kvm/mmu_types.h
@@ -110,4 +110,30 @@ struct kvm_page_fault {
 	struct kvm_page_fault_arch arch;
 };
 
+/*
+ * Return values for page fault handling routines.
+ *
+ * RET_PF_CONTINUE: So far, so good, keep handling the page fault.
+ * RET_PF_RETRY: let CPU fault again on the address.
+ * RET_PF_EMULATE: mmio page fault, emulate the instruction directly.
+ * RET_PF_INVALID: the spte is invalid, let the real page fault path update it.
+ * RET_PF_FIXED: The faulting entry has been fixed.
+ * RET_PF_SPURIOUS: The faulting entry was already fixed, e.g. by another vCPU.
+ *
+ * Any names added to this enum should be exported to userspace for use in
+ * tracepoints via TRACE_DEFINE_ENUM() in arch/x86/kvm/mmu/mmutrace.h.
+ *
+ * Note, all values must be greater than or equal to zero so as not to encroach
+ * on -errno return values.  Somewhat arbitrarily use '0' for CONTINUE, which
+ * will allow for efficient machine code when checking for CONTINUE.
+ */
+enum {
+	RET_PF_CONTINUE = 0,
+	RET_PF_RETRY,
+	RET_PF_EMULATE,
+	RET_PF_INVALID,
+	RET_PF_FIXED,
+	RET_PF_SPURIOUS,
+};
+
 #endif /* !__KVM_MMU_TYPES_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog



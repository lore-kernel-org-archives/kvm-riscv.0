From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:33 -0800
Subject: [RFC PATCH 13/37] KVM: MMU: Move sptep_to_sp() to common code
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-14-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move sptep_to_sp() to common code in preparation for moving the TDP MMU
to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/spte.h | 14 ++------------
 include/kvm/mmu.h       | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 12 deletions(-)
 create mode 100644 include/kvm/mmu.h

diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index ad84c549fe96..4c5d518e3ac6 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -3,6 +3,8 @@
 #ifndef KVM_X86_MMU_SPTE_H
 #define KVM_X86_MMU_SPTE_H
 
+#include <kvm/mmu.h>
+
 #include "mmu_internal.h"
 
 /*
@@ -219,23 +221,11 @@ static inline int spte_index(u64 *sptep)
  */
 extern u64 __read_mostly shadow_nonpresent_or_rsvd_lower_gfn_mask;
 
-static inline struct kvm_mmu_page *to_shadow_page(hpa_t shadow_page)
-{
-	struct page *page = pfn_to_page((shadow_page) >> PAGE_SHIFT);
-
-	return (struct kvm_mmu_page *)page_private(page);
-}
-
 static inline struct kvm_mmu_page *spte_to_child_sp(u64 spte)
 {
 	return to_shadow_page(spte & SPTE_BASE_ADDR_MASK);
 }
 
-static inline struct kvm_mmu_page *sptep_to_sp(u64 *sptep)
-{
-	return to_shadow_page(__pa(sptep));
-}
-
 static inline bool is_mmio_spte(u64 spte)
 {
 	return (spte & shadow_mmio_mask) == shadow_mmio_value &&
diff --git a/include/kvm/mmu.h b/include/kvm/mmu.h
new file mode 100644
index 000000000000..425db8e4f8e9
--- /dev/null
+++ b/include/kvm/mmu.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_MMU_H
+#define __KVM_MMU_H
+
+#include <kvm/mmu_types.h>
+
+static inline struct kvm_mmu_page *to_shadow_page(hpa_t shadow_page)
+{
+	struct page *page = pfn_to_page((shadow_page) >> PAGE_SHIFT);
+
+	return (struct kvm_mmu_page *)page_private(page);
+}
+
+static inline struct kvm_mmu_page *sptep_to_sp(u64 *sptep)
+{
+	return to_shadow_page(__pa(sptep));
+}
+
+#endif /* !__KVM_MMU_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog



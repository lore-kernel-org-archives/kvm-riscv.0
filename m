From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:56 -0800
Subject: [RFC PATCH 36/37] KVM: x86/mmu: Move is_tdp_mmu_page() to mmu_internal.h
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-37-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move is_tdp_mmu_page(), which is x86-specific, into mmu_internal.h. This
prepares for moving tdp_mmu.h into common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu_internal.h | 9 +++++++++
 arch/x86/kvm/mmu/tdp_mmu.h      | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index df815cb84bd2..51aef9624521 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -147,4 +147,13 @@ void *mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
 void track_possible_nx_huge_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 void untrack_possible_nx_huge_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 
+#ifdef CONFIG_X86_64
+static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp)
+{
+	return !sp->arch.shadow_mmu_page;
+}
+#else
+static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
+#endif
+
 #endif /* __KVM_X86_MMU_INTERNAL_H */
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 897608be7f75..607c1417abd1 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -71,13 +71,4 @@ int kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
 u64 *kvm_tdp_mmu_fast_pf_get_last_sptep(struct kvm_vcpu *vcpu, u64 addr,
 					u64 *spte);
 
-#ifdef CONFIG_X86_64
-static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp)
-{
-	return !sp->arch.shadow_mmu_page;
-}
-#else
-static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
-#endif
-
 #endif /* __KVM_X86_MMU_TDP_MMU_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog



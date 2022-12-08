From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:37 -0800
Subject: [RFC PATCH 17/37] KVM: Move struct kvm_gfn_range to kvm_types.h
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-18-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move struct kvm_gfn_range to kvm_types.h so that it's definition can be
accessed in a future commit by arch/x86/include/asm/kvm/tdp_pgtable.h
without needing to include the mega-header kvm_host.h.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h  | 7 -------
 include/linux/kvm_types.h | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 22ecb7ce4d31..469ff4202a0d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -256,13 +256,6 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
 #ifdef KVM_ARCH_WANT_MMU_NOTIFIER
-struct kvm_gfn_range {
-	struct kvm_memory_slot *slot;
-	gfn_t start;
-	gfn_t end;
-	pte_t pte;
-	bool may_block;
-};
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 59cf958d69df..001aad9ea987 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -132,4 +132,12 @@ struct kvm_vcpu_stat_generic {
 
 #define KVM_STATS_NAME_SIZE	48
 
+struct kvm_gfn_range {
+	struct kvm_memory_slot *slot;
+	gfn_t start;
+	gfn_t end;
+	pte_t pte;
+	bool may_block;
+};
+
 #endif /* __KVM_TYPES_H__ */
-- 
2.39.0.rc1.256.g54fd8350bd-goog



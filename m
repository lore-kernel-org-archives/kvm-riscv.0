From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:52 -0800
Subject: [RFC PATCH 32/37] KVM: Allow range-based TLB invalidation from common code
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-33-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make kvm_flush_remote_tlbs_range() visible in common code and create a
default implementation that just invalidates the whole TLB. This will be
used in future commits to clean up kvm_arch_flush_remote_tlbs_memslot()
and to move the KVM/x86 TDP MMU to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu_internal.h | 1 -
 include/linux/kvm_host.h        | 1 +
 virt/kvm/kvm_main.c             | 9 +++++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index e44fe7ad3cfb..df815cb84bd2 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -65,7 +65,6 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
 bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
 unsigned int pte_list_count(struct kvm_rmap_head *rmap_head);
 
 extern int nx_huge_pages;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ec3a6de6d54e..d9a7f559d2c5 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1365,6 +1365,7 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target);
 void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool usermode_vcpu_not_eligible);
 
 void kvm_flush_remote_tlbs(struct kvm *kvm);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
 
 #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
 int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0f1d48ed7d57..662ca280c0cf 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -379,6 +379,15 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
 #endif
 
+/*
+ * Architectures that support range-based TLB invalidation can override this
+ * function.
+ */
+void __weak kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
+{
+	kvm_flush_remote_tlbs(kvm);
+}
+
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
 	kvm_arch_flush_shadow_all(kvm);
-- 
2.39.0.rc1.256.g54fd8350bd-goog



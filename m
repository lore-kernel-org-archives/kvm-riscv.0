From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:29 -0800
Subject: [RFC PATCH 09/37] KVM: Move page size stats into common code
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-10-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the page size stats into common code. This will be used in a future
commit to move the TDP MMU, which populates these stats, into common
code. Architectures can also start populating these stats if they wish,
and export different stats depending on the page size.

Continue to only expose these stats on x86, since that's currently the
only architecture that populates them.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_host.h | 8 --------
 arch/x86/kvm/mmu.h              | 5 -----
 arch/x86/kvm/x86.c              | 6 +++---
 include/linux/kvm_host.h        | 5 +++++
 include/linux/kvm_types.h       | 9 +++++++++
 5 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f5743a652e10..9cf8f956bac3 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1363,14 +1363,6 @@ struct kvm_vm_stat {
 	u64 mmu_recycled;
 	u64 mmu_cache_miss;
 	u64 mmu_unsync;
-	union {
-		struct {
-			atomic64_t pages_4k;
-			atomic64_t pages_2m;
-			atomic64_t pages_1g;
-		};
-		atomic64_t pages[KVM_NR_PAGE_SIZES];
-	};
 	u64 nx_lpage_splits;
 	u64 max_mmu_page_hash_collisions;
 	u64 max_mmu_rmap_size;
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 168c46fd8dd1..ec662108d2eb 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -261,11 +261,6 @@ kvm_mmu_slot_lpages(struct kvm_memory_slot *slot, int level)
 	return __kvm_mmu_slot_lpages(slot, slot->npages, level);
 }
 
-static inline void kvm_update_page_stats(struct kvm *kvm, int level, int count)
-{
-	atomic64_add(count, &kvm->stat.pages[level - 1]);
-}
-
 gpa_t translate_nested_gpa(struct kvm_vcpu *vcpu, gpa_t gpa, u64 access,
 			   struct x86_exception *exception);
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2bfe060768fc..517c8ed33542 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -231,6 +231,9 @@ EXPORT_SYMBOL_GPL(host_xss);
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS(),
+	STATS_DESC_ICOUNTER(VM_GENERIC, pages_4k),
+	STATS_DESC_ICOUNTER(VM_GENERIC, pages_2m),
+	STATS_DESC_ICOUNTER(VM_GENERIC, pages_1g),
 	STATS_DESC_COUNTER(VM, mmu_shadow_zapped),
 	STATS_DESC_COUNTER(VM, mmu_pte_write),
 	STATS_DESC_COUNTER(VM, mmu_pde_zapped),
@@ -238,9 +241,6 @@ const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	STATS_DESC_COUNTER(VM, mmu_recycled),
 	STATS_DESC_COUNTER(VM, mmu_cache_miss),
 	STATS_DESC_ICOUNTER(VM, mmu_unsync),
-	STATS_DESC_ICOUNTER(VM, pages_4k),
-	STATS_DESC_ICOUNTER(VM, pages_2m),
-	STATS_DESC_ICOUNTER(VM, pages_1g),
 	STATS_DESC_ICOUNTER(VM, nx_lpage_splits),
 	STATS_DESC_PCOUNTER(VM, max_mmu_rmap_size),
 	STATS_DESC_PCOUNTER(VM, max_mmu_page_hash_collisions)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f16c4689322b..22ecb7ce4d31 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2280,4 +2280,9 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+static inline void kvm_update_page_stats(struct kvm *kvm, int level, int count)
+{
+	atomic64_add(count, &kvm->stat.generic.pages[level - 1]);
+}
+
 #endif
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 76de36e56cdf..59cf958d69df 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -20,6 +20,7 @@ enum kvm_mr_change;
 
 #include <linux/bits.h>
 #include <linux/mutex.h>
+#include <linux/pgtable.h>
 #include <linux/types.h>
 #include <linux/spinlock_types.h>
 
@@ -105,6 +106,14 @@ struct kvm_mmu_memory_cache {
 struct kvm_vm_stat_generic {
 	u64 remote_tlb_flush;
 	u64 remote_tlb_flush_requests;
+	union {
+		struct {
+			atomic64_t pages_4k;
+			atomic64_t pages_2m;
+			atomic64_t pages_1g;
+		};
+		atomic64_t pages[PG_LEVEL_NUM - 1];
+	};
 };
 
 struct kvm_vcpu_stat_generic {
-- 
2.39.0.rc1.256.g54fd8350bd-goog



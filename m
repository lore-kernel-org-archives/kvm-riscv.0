From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:47 -0800
Subject: [RFC PATCH 27/37] KVM: MMU: Move mmu_page_header_cache to common code
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-28-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move vcpu->arch.mmu_page_header_cache and its backing kmem_cache to common code
in preparation for moving the TDP MMU to common code in a future commit.

The kmem_cache is still only initialized and used on x86 for the time being to
avoid affecting other architectures. A future commit can move the code to
manage this cache to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 11 +++++------
 arch/x86/kvm/mmu/mmu_internal.h |  2 --
 arch/x86/kvm/mmu/tdp_mmu.c      |  2 +-
 include/kvm/mmu.h               |  2 ++
 include/linux/kvm_host.h        |  3 +++
 virt/kvm/kvm_main.c             |  1 +
 6 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a845e9141ad4..f01ee01f3509 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -163,7 +163,6 @@ struct kvm_shadow_walk_iterator {
 	     __shadow_walk_next(&(_walker), spte))
 
 static struct kmem_cache *pte_list_desc_cache;
-struct kmem_cache *mmu_page_header_cache;
 static struct percpu_counter kvm_total_used_mmu_pages;
 
 static void mmu_spte_set(u64 *sptep, u64 spte);
@@ -674,7 +673,7 @@ static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu, bool maybe_indirect)
 		if (r)
 			return r;
 	}
-	return kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_page_header_cache,
+	return kvm_mmu_topup_memory_cache(&vcpu->mmu_page_header_cache,
 					  PT64_ROOT_MAX_LEVEL);
 }
 
@@ -683,7 +682,7 @@ static void mmu_free_memory_caches(struct kvm_vcpu *vcpu)
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_pte_list_desc_cache);
 	kvm_mmu_free_memory_cache(&vcpu->mmu_page_table_cache);
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_shadowed_info_cache);
-	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_header_cache);
+	kvm_mmu_free_memory_cache(&vcpu->mmu_page_header_cache);
 }
 
 static void mmu_free_pte_list_desc(struct pte_list_desc *pte_list_desc)
@@ -2217,7 +2216,7 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 						    union kvm_mmu_page_role role)
 {
 	struct shadow_page_caches caches = {
-		.page_header_cache = &vcpu->arch.mmu_page_header_cache,
+		.page_header_cache = &vcpu->mmu_page_header_cache,
 		.shadow_page_cache = &vcpu->mmu_page_table_cache,
 		.shadowed_info_cache = &vcpu->arch.mmu_shadowed_info_cache,
 	};
@@ -5917,8 +5916,8 @@ int kvm_mmu_create(struct kvm_vcpu *vcpu)
 	vcpu->arch.mmu_pte_list_desc_cache.kmem_cache = pte_list_desc_cache;
 	vcpu->arch.mmu_pte_list_desc_cache.gfp_zero = __GFP_ZERO;
 
-	vcpu->arch.mmu_page_header_cache.kmem_cache = mmu_page_header_cache;
-	vcpu->arch.mmu_page_header_cache.gfp_zero = __GFP_ZERO;
+	vcpu->mmu_page_header_cache.kmem_cache = mmu_page_header_cache;
+	vcpu->mmu_page_header_cache.gfp_zero = __GFP_ZERO;
 
 	vcpu->mmu_page_table_cache.gfp_zero = __GFP_ZERO;
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index d3c1d08002af..4aa60d5d87b0 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -44,8 +44,6 @@ extern bool dbg;
 #define INVALID_PAE_ROOT	0
 #define IS_VALID_PAE_ROOT(x)	(!!(x))
 
-extern struct kmem_cache *mmu_page_header_cache;
-
 static inline bool kvm_mmu_page_ad_need_write_protect(struct kvm_mmu_page *sp)
 {
 	/*
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 922815407b7e..891877a6fb78 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -263,7 +263,7 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
 {
 	struct kvm_mmu_page *sp;
 
-	sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
+	sp = kvm_mmu_memory_cache_alloc(&vcpu->mmu_page_header_cache);
 	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->mmu_page_table_cache);
 
 	return sp;
diff --git a/include/kvm/mmu.h b/include/kvm/mmu.h
index 425db8e4f8e9..f1416828f8fe 100644
--- a/include/kvm/mmu.h
+++ b/include/kvm/mmu.h
@@ -4,6 +4,8 @@
 
 #include <kvm/mmu_types.h>
 
+extern struct kmem_cache *mmu_page_header_cache;
+
 static inline struct kvm_mmu_page *to_shadow_page(hpa_t shadow_page)
 {
 	struct page *page = pfn_to_page((shadow_page) >> PAGE_SHIFT);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 0a9baa493760..ec3a6de6d54e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -391,6 +391,9 @@ struct kvm_vcpu {
 #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
 	/* Cache used to allocate pages for use as page tables. */
 	struct kvm_mmu_memory_cache mmu_page_table_cache;
+
+	/* Cache used to allocate kvm_mmu_page structs. */
+	struct kvm_mmu_memory_cache mmu_page_header_cache;
 #endif
 };
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 954ab969f55e..0f1d48ed7d57 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -108,6 +108,7 @@ static int kvm_usage_count;
 static atomic_t hardware_enable_failed;
 
 static struct kmem_cache *kvm_vcpu_cache;
+struct kmem_cache *mmu_page_header_cache;
 
 static __read_mostly struct preempt_ops kvm_preempt_ops;
 static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_running_vcpu);
-- 
2.39.0.rc1.256.g54fd8350bd-goog



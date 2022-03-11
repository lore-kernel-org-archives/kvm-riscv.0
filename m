From: David Matlack <dmatlack@google.com>
Date: Fri, 11 Mar 2022 00:25:27 +0000
Subject: [PATCH v2 25/26] KVM: x86/mmu: Drop NULL pte_list_desc_cache fallback
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
Message-ID: <20220311002528.2230172-26-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the eager page splitting code no longer passes in NULL cache
pointers we can get rid of the debug WARN_ON() and allocation fallback.
While here, also drop the helper function mmu_alloc_pte_list_desc() as
it no longer serves any purpose.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 68785b422a08..d2ffebb659e0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -725,16 +725,6 @@ static void mmu_free_memory_caches(struct kvm_vcpu *vcpu)
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_header_cache);
 }
 
-static struct pte_list_desc *mmu_alloc_pte_list_desc(struct kvm_mmu_memory_cache *cache)
-{
-	static const gfp_t gfp_nocache = GFP_ATOMIC | __GFP_ACCOUNT | __GFP_ZERO;
-
-	if (WARN_ON_ONCE(!cache))
-		return kmem_cache_alloc(pte_list_desc_cache, gfp_nocache);
-
-	return kvm_mmu_memory_cache_alloc(cache);
-}
-
 static void mmu_free_pte_list_desc(struct pte_list_desc *pte_list_desc)
 {
 	kmem_cache_free(pte_list_desc_cache, pte_list_desc);
@@ -914,7 +904,7 @@ static int pte_list_add(struct kvm_mmu_memory_cache *cache, u64 *spte,
 		rmap_head->val = (unsigned long)spte;
 	} else if (!(rmap_head->val & 1)) {
 		rmap_printk("%p %llx 1->many\n", spte, *spte);
-		desc = mmu_alloc_pte_list_desc(cache);
+		desc = kvm_mmu_memory_cache_alloc(cache);
 		desc->sptes[0] = (u64 *)rmap_head->val;
 		desc->sptes[1] = spte;
 		desc->spte_count = 2;
@@ -926,7 +916,7 @@ static int pte_list_add(struct kvm_mmu_memory_cache *cache, u64 *spte,
 		while (desc->spte_count == PTE_LIST_EXT) {
 			count += PTE_LIST_EXT;
 			if (!desc->more) {
-				desc->more = mmu_alloc_pte_list_desc(cache);
+				desc->more = kvm_mmu_memory_cache_alloc(cache);
 				desc = desc->more;
 				desc->spte_count = 0;
 				break;
-- 
2.35.1.723.g4982287a31-goog



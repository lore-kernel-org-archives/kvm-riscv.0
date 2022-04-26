From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 26 Apr 2022 05:39:03 +0000
Subject: [PATCH v3 5/6] KVM: riscv/mmu: count KVM page table pages in
 pagetable stats
In-Reply-To: <20220426053904.3684293-1-yosryahmed@google.com>
References: <20220426053904.3684293-1-yosryahmed@google.com>
Message-ID: <20220426053904.3684293-6-yosryahmed@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Count the pages used by KVM in riscv for page tables in pagetable stats.

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---
 arch/riscv/kvm/mmu.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f80a34fbf102..fcfb75713750 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -152,6 +152,7 @@ static int stage2_set_pte(struct kvm *kvm, u32 level,
 			next_ptep = kvm_mmu_memory_cache_alloc(pcache);
 			if (!next_ptep)
 				return -ENOMEM;
+			kvm_account_pgtable_pages((void *)next_ptep, +1);
 			*ptep = pfn_pte(PFN_DOWN(__pa(next_ptep)),
 					__pgprot(_PAGE_TABLE));
 		} else {
@@ -229,6 +230,7 @@ static void stage2_op_pte(struct kvm *kvm, gpa_t addr,
 	pte_t *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
+	struct page *p;
 
 	ret = stage2_level_to_page_size(ptep_level, &page_size);
 	if (ret)
@@ -252,8 +254,13 @@ static void stage2_op_pte(struct kvm *kvm, gpa_t addr,
 		for (i = 0; i < PTRS_PER_PTE; i++)
 			stage2_op_pte(kvm, addr + i * next_page_size,
 					&next_ptep[i], next_ptep_level, op);
-		if (op == STAGE2_OP_CLEAR)
-			put_page(virt_to_page(next_ptep));
+		if (op == STAGE2_OP_CLEAR) {
+			p = virt_to_page(next_ptep);
+			if (page_count(p) == 1)
+				kvm_account_pgtable_pages((void *)next_ptep,
+							  -1);
+			put_page(p);
+		}
 	} else {
 		if (op == STAGE2_OP_CLEAR)
 			set_pte(ptep, __pte(0));
@@ -700,25 +707,27 @@ int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
 int kvm_riscv_stage2_alloc_pgd(struct kvm *kvm)
 {
 	struct page *pgd_page;
+	int order;
 
 	if (kvm->arch.pgd != NULL) {
 		kvm_err("kvm_arch already initialized?\n");
 		return -EINVAL;
 	}
 
-	pgd_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
-				get_order(stage2_pgd_size));
+	order = get_order(stage2_pgd_size);
+	pgd_page = alloc_pages(GFP_KERNEL | __GFP_ZERO, order);
 	if (!pgd_page)
 		return -ENOMEM;
 	kvm->arch.pgd = page_to_virt(pgd_page);
 	kvm->arch.pgd_phys = page_to_phys(pgd_page);
-
+	kvm_account_pgtable_pages((void *)kvm->arch.pgd, +(1UL << order));
 	return 0;
 }
 
 void kvm_riscv_stage2_free_pgd(struct kvm *kvm)
 {
 	void *pgd = NULL;
+	int order;
 
 	spin_lock(&kvm->mmu_lock);
 	if (kvm->arch.pgd) {
@@ -729,8 +738,11 @@ void kvm_riscv_stage2_free_pgd(struct kvm *kvm)
 	}
 	spin_unlock(&kvm->mmu_lock);
 
-	if (pgd)
-		free_pages((unsigned long)pgd, get_order(stage2_pgd_size));
+	if (pgd) {
+		order = get_order(stage2_pgd_size);
+		kvm_account_pgtable_pages((void *)pgd, -(1UL << order));
+		free_pages((unsigned long)pgd, order);
+	}
 }
 
 void kvm_riscv_stage2_update_hgatp(struct kvm_vcpu *vcpu)
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog



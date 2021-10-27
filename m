From: Bixuan Cui <cuibixuan@linux.alibaba.com>
Date: Wed, 27 Oct 2021 15:20:53 +0800
Subject: [PATCH -next] RISC-V: KVM: fix boolreturn.cocci warnings
Message-ID: <1635319253-100581-1-git-send-email-cuibixuan@linux.alibaba.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix boolreturn.cocci warnings:
./arch/riscv/kvm/mmu.c:603:9-10: WARNING: return of 0/1 in function
'kvm_age_gfn' with return type bool
./arch/riscv/kvm/mmu.c:582:9-10: WARNING: return of 0/1 in function
'kvm_set_spte_gfn' with return type bool
./arch/riscv/kvm/mmu.c:621:9-10: WARNING: return of 0/1 in function
'kvm_test_age_gfn' with return type bool
./arch/riscv/kvm/mmu.c:568:9-10: WARNING: return of 0/1 in function
'kvm_unmap_gfn_range' with return type bool

Signed-off-by: Bixuan Cui <cuibixuan@linux.alibaba.com>
---
 arch/riscv/kvm/mmu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3a00c2d..d81bae8 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -565,12 +565,12 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	if (!kvm->arch.pgd)
-		return 0;
+		return false;
 
 	stage2_unmap_range(kvm, range->start << PAGE_SHIFT,
 			   (range->end - range->start) << PAGE_SHIFT,
 			   range->may_block);
-	return 0;
+	return false;
 }
 
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
@@ -579,7 +579,7 @@ bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	kvm_pfn_t pfn = pte_pfn(range->pte);
 
 	if (!kvm->arch.pgd)
-		return 0;
+		return false;
 
 	WARN_ON(range->end - range->start != 1);
 
@@ -587,10 +587,10 @@ bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 			      __pfn_to_phys(pfn), PAGE_SIZE, true, true);
 	if (ret) {
 		kvm_debug("Failed to map stage2 page (error %d)\n", ret);
-		return 1;
+		return true;
 	}
 
-	return 0;
+	return false;
 }
 
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
@@ -600,13 +600,13 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
 	if (!kvm->arch.pgd)
-		return 0;
+		return false;
 
 	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
 
 	if (!stage2_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
 				   &ptep, &ptep_level))
-		return 0;
+		return false;
 
 	return ptep_test_and_clear_young(NULL, 0, ptep);
 }
@@ -618,13 +618,13 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
 	if (!kvm->arch.pgd)
-		return 0;
+		return false;
 
 	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
 
 	if (!stage2_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
 				   &ptep, &ptep_level))
-		return 0;
+		return false;
 
 	return pte_young(*ptep);
 }
-- 
1.8.3.1



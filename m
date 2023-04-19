From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:41 -0700
Subject: [RFC 13/48] RISC-V: KVM: Return early for gstage modifications
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-14-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The gstage entries for CoVE VM is managed by the TSM. Return
early for any gstage pte modification operations.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/mmu.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 6b037f7..9693897 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -16,6 +16,9 @@
 #include <linux/kvm_host.h>
 #include <linux/sched/signal.h>
 #include <asm/kvm_nacl.h>
+#include <asm/csr.h>
+#include <asm/kvm_host.h>
+#include <asm/kvm_cove.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
 
@@ -356,6 +359,11 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 		.gfp_zero = __GFP_ZERO,
 	};
 
+	if (is_cove_vm(kvm)) {
+		kvm_debug("%s: KVM doesn't support ioremap for TVM io regions\n", __func__);
+		return -EPERM;
+	}
+
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
 	pfn = __phys_to_pfn(hpa);
 
@@ -385,6 +393,10 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 
 void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
 {
+	/* KVM doesn't map any IO region in gstage for TVM */
+	if (is_cove_vm(kvm))
+		return;
+
 	spin_lock(&kvm->mmu_lock);
 	gstage_unmap_range(kvm, gpa, size, false);
 	spin_unlock(&kvm->mmu_lock);
@@ -431,6 +443,10 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 	gpa_t gpa = slot->base_gfn << PAGE_SHIFT;
 	phys_addr_t size = slot->npages << PAGE_SHIFT;
 
+	/* No need to unmap gstage as it is managed by TSM */
+	if (is_cove_vm(kvm))
+		return;
+
 	spin_lock(&kvm->mmu_lock);
 	gstage_unmap_range(kvm, gpa, size, false);
 	spin_unlock(&kvm->mmu_lock);
@@ -547,7 +563,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	if (!kvm->arch.pgd)
+	if (!kvm->arch.pgd || is_cove_vm(kvm))
 		return false;
 
 	gstage_unmap_range(kvm, range->start << PAGE_SHIFT,
@@ -561,7 +577,7 @@ bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	int ret;
 	kvm_pfn_t pfn = pte_pfn(range->pte);
 
-	if (!kvm->arch.pgd)
+	if (!kvm->arch.pgd || is_cove_vm(kvm))
 		return false;
 
 	WARN_ON(range->end - range->start != 1);
@@ -582,7 +598,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u32 ptep_level = 0;
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
-	if (!kvm->arch.pgd)
+	if (!kvm->arch.pgd || is_cove_vm(kvm))
 		return false;
 
 	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
@@ -600,7 +616,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u32 ptep_level = 0;
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
-	if (!kvm->arch.pgd)
+	if (!kvm->arch.pgd || is_cove_vm(kvm))
 		return false;
 
 	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
@@ -737,6 +753,10 @@ void kvm_riscv_gstage_free_pgd(struct kvm *kvm)
 {
 	void *pgd = NULL;
 
+	/* PGD is mapped in TSM */
+	if (is_cove_vm(kvm))
+		return;
+
 	spin_lock(&kvm->mmu_lock);
 	if (kvm->arch.pgd) {
 		gstage_unmap_range(kvm, 0UL, gstage_gpa_size, false);
-- 
2.25.1



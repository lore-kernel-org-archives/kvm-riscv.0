From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jun 2022 15:27:10 -0400
Subject: [PATCH v7 23/23] KVM: x86/mmu: Avoid unnecessary flush on eager page split
In-Reply-To: <20220622192710.2547152-1-pbonzini@redhat.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com>
Message-ID: <20220622192710.2547152-24-pbonzini@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The TLB flush before installing the newly-populated lower level
page table is unnecessary if the lower-level page table maps
the huge page identically.  KVM knows it is if it did not reuse
an existing shadow page table, tell drop_large_spte() to skip
the flush in that case.

Extracted from a patch by David Matlack.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 22681931921f..79c6a821ea0d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1135,7 +1135,7 @@ static void drop_spte(struct kvm *kvm, u64 *sptep)
 		rmap_remove(kvm, sptep);
 }
 
-static void drop_large_spte(struct kvm *kvm, u64 *sptep)
+static void drop_large_spte(struct kvm *kvm, u64 *sptep, bool flush)
 {
 	struct kvm_mmu_page *sp;
 
@@ -1143,7 +1143,9 @@ static void drop_large_spte(struct kvm *kvm, u64 *sptep)
 	WARN_ON(sp->role.level == PG_LEVEL_4K);
 
 	drop_spte(kvm, sptep);
-	kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
+
+	if (flush)
+		kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
 			KVM_PAGES_PER_HPAGE(sp->role.level));
 }
 
@@ -2283,7 +2285,7 @@ static void shadow_walk_next(struct kvm_shadow_walk_iterator *iterator)
 
 static void __link_shadow_page(struct kvm *kvm,
 			       struct kvm_mmu_memory_cache *cache, u64 *sptep,
-			       struct kvm_mmu_page *sp)
+			       struct kvm_mmu_page *sp, bool flush)
 {
 	u64 spte;
 
@@ -2291,10 +2293,11 @@ static void __link_shadow_page(struct kvm *kvm,
 
 	/*
 	 * If an SPTE is present already, it must be a leaf and therefore
-	 * a large one.  Drop it and flush the TLB before installing sp.
+	 * a large one.  Drop it, and flush the TLB if needed, before
+	 * installing sp.
 	 */
 	if (is_shadow_present_pte(*sptep))
-		drop_large_spte(kvm, sptep);
+		drop_large_spte(kvm, sptep, flush);
 
 	spte = make_nonleaf_spte(sp->spt, sp_ad_disabled(sp));
 
@@ -2309,7 +2312,7 @@ static void __link_shadow_page(struct kvm *kvm,
 static void link_shadow_page(struct kvm_vcpu *vcpu, u64 *sptep,
 			     struct kvm_mmu_page *sp)
 {
-	__link_shadow_page(vcpu->kvm, &vcpu->arch.mmu_pte_list_desc_cache, sptep, sp);
+	__link_shadow_page(vcpu->kvm, &vcpu->arch.mmu_pte_list_desc_cache, sptep, sp, true);
 }
 
 static void validate_direct_spte(struct kvm_vcpu *vcpu, u64 *sptep,
@@ -6172,6 +6175,7 @@ static void shadow_mmu_split_huge_page(struct kvm *kvm,
 	struct kvm_mmu_memory_cache *cache = &kvm->arch.split_desc_cache;
 	u64 huge_spte = READ_ONCE(*huge_sptep);
 	struct kvm_mmu_page *sp;
+	bool flush = false;
 	u64 *sptep, spte;
 	gfn_t gfn;
 	int index;
@@ -6189,20 +6193,24 @@ static void shadow_mmu_split_huge_page(struct kvm *kvm,
 		 * gfn-to-pfn translation since the SP is direct, so no need to
 		 * modify them.
 		 *
-		 * If a given SPTE points to a lower level page table, installing
-		 * such SPTEs would effectively unmap a potion of the huge page.
-		 * This is not an issue because __link_shadow_page() flushes the TLB
-		 * when the passed sp replaces a large SPTE.
+		 * However, if a given SPTE points to a lower level page table,
+		 * that lower level page table may only be partially populated.
+		 * Installing such SPTEs would effectively unmap a potion of the
+		 * huge page. Unmapping guest memory always requires a TLB flush
+		 * since a subsequent operation on the unmapped regions would
+		 * fail to detect the need to flush.
 		 */
-		if (is_shadow_present_pte(*sptep))
+		if (is_shadow_present_pte(*sptep)) {
+			flush |= !is_last_spte(*sptep, sp->role.level);
 			continue;
+		}
 
 		spte = make_huge_page_split_spte(kvm, huge_spte, sp->role, index);
 		mmu_spte_set(sptep, spte);
 		__rmap_add(kvm, cache, slot, sptep, gfn, sp->role.access);
 	}
 
-	__link_shadow_page(kvm, cache, huge_sptep, sp);
+	__link_shadow_page(kvm, cache, huge_sptep, sp, flush);
 }
 
 static int shadow_mmu_try_split_huge_page(struct kvm *kvm,
-- 
2.31.1



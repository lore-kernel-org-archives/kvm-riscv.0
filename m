From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:31 -0700
Subject: [PATCH v12 82/84] KVM: arm64: Don't mark "struct page" accessed when
 making SPTE young
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-83-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't mark pages/folios as accessed in the primary MMU when making a SPTE
young in KVM's secondary MMU, as doing so relies on
kvm_pfn_to_refcounted_page(), and generally speaking is unnecessary and
wasteful.  KVM participates in page aging via mmu_notifiers, so there's no
need to push "accessed" updates to the primary MMU.

Dropping use of kvm_set_pfn_accessed() also paves the way for removing
kvm_pfn_to_refcounted_page() and all its users.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +---
 arch/arm64/kvm/hyp/pgtable.c         | 7 ++-----
 arch/arm64/kvm/mmu.c                 | 6 +-----
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 19278dfe7978..676d80723c38 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -632,10 +632,8 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
  *
  * If there is a valid, leaf page-table entry used to translate @addr, then
  * set the access flag in that entry.
- *
- * Return: The old page-table entry prior to setting the flag, 0 on failure.
  */
-kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
 
 /**
  * kvm_pgtable_stage2_test_clear_young() - Test and optionally clear the access
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9e2bbee77491..6679e02a02c4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1287,19 +1287,16 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 					NULL, NULL, 0);
 }
 
-kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
 {
-	kvm_pte_t pte = 0;
 	int ret;
 
 	ret = stage2_update_leaf_attrs(pgt, addr, 1, KVM_PTE_LEAF_ATTR_LO_S2_AF, 0,
-				       &pte, NULL,
+				       NULL, NULL,
 				       KVM_PGTABLE_WALK_HANDLE_FAULT |
 				       KVM_PGTABLE_WALK_SHARED);
 	if (!ret)
 		dsb(ishst);
-
-	return pte;
 }
 
 struct stage2_age_data {
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 756fc856ab44..8fd8ea5b5795 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1699,18 +1699,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 /* Resolve the access fault by making the page young again. */
 static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 {
-	kvm_pte_t pte;
 	struct kvm_s2_mmu *mmu;
 
 	trace_kvm_access_fault(fault_ipa);
 
 	read_lock(&vcpu->kvm->mmu_lock);
 	mmu = vcpu->arch.hw_mmu;
-	pte = kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
+	kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
 	read_unlock(&vcpu->kvm->mmu_lock);
-
-	if (kvm_pte_valid(pte))
-		kvm_set_pfn_accessed(kvm_pte_to_pfn(pte));
 }
 
 /**
-- 
2.46.0.rc1.232.g9752f9e123-goog



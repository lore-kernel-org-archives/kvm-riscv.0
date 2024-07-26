From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:48 -0700
Subject: [PATCH v12 39/84] KVM: x86/mmu: Add common helper to handle
 prefetching SPTEs
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-40-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Deduplicate the prefetching code for indirect and direct MMUs.  The core
logic is the same, the only difference is that indirect MMUs need to
prefetch SPTEs one-at-a-time, as contiguous guest virtual addresses aren't
guaranteed to yield contiguous guest physical addresses.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 40 +++++++++++++++++++++-------------
 arch/x86/kvm/mmu/paging_tmpl.h | 13 +----------
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 0def1444c01c..e76f64f55c4a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2897,32 +2897,41 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	return ret;
 }
 
-static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
-				    struct kvm_mmu_page *sp,
-				    u64 *start, u64 *end)
+static bool kvm_mmu_prefetch_sptes(struct kvm_vcpu *vcpu, gfn_t gfn, u64 *sptep,
+				   int nr_pages, unsigned int access)
 {
 	struct page *pages[PTE_PREFETCH_NUM];
 	struct kvm_memory_slot *slot;
-	unsigned int access = sp->role.access;
-	int i, ret;
-	gfn_t gfn;
+	int i;
+
+	if (WARN_ON_ONCE(nr_pages > PTE_PREFETCH_NUM))
+		return false;
 
-	gfn = kvm_mmu_page_get_gfn(sp, spte_index(start));
 	slot = gfn_to_memslot_dirty_bitmap(vcpu, gfn, access & ACC_WRITE_MASK);
 	if (!slot)
-		return -1;
+		return false;
 
-	ret = kvm_prefetch_pages(slot, gfn, pages, end - start);
-	if (ret <= 0)
-		return -1;
+	nr_pages = kvm_prefetch_pages(slot, gfn, pages, nr_pages);
+	if (nr_pages <= 0)
+		return false;
 
-	for (i = 0; i < ret; i++, gfn++, start++) {
-		mmu_set_spte(vcpu, slot, start, access, gfn,
+	for (i = 0; i < nr_pages; i++, gfn++, sptep++) {
+		mmu_set_spte(vcpu, slot, sptep, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
 		kvm_release_page_clean(pages[i]);
 	}
 
-	return 0;
+	return true;
+}
+
+static bool direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
+				     struct kvm_mmu_page *sp,
+				     u64 *start, u64 *end)
+{
+	gfn_t gfn = kvm_mmu_page_get_gfn(sp, spte_index(start));
+	unsigned int access = sp->role.access;
+
+	return kvm_mmu_prefetch_sptes(vcpu, gfn, start, end - start, access);
 }
 
 static void __direct_pte_prefetch(struct kvm_vcpu *vcpu,
@@ -2940,8 +2949,9 @@ static void __direct_pte_prefetch(struct kvm_vcpu *vcpu,
 		if (is_shadow_present_pte(*spte) || spte == sptep) {
 			if (!start)
 				continue;
-			if (direct_pte_prefetch_many(vcpu, sp, start, spte) < 0)
+			if (!direct_pte_prefetch_many(vcpu, sp, start, spte))
 				return;
+
 			start = NULL;
 		} else if (!start)
 			start = spte;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index b02d0abfca68..e1c2f098d9d5 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -533,9 +533,7 @@ static bool
 FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		     u64 *spte, pt_element_t gpte)
 {
-	struct kvm_memory_slot *slot;
 	unsigned pte_access;
-	struct page *page;
 	gfn_t gfn;
 
 	if (FNAME(prefetch_invalid_gpte)(vcpu, sp, spte, gpte))
@@ -545,16 +543,7 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	pte_access = sp->role.access & FNAME(gpte_access)(gpte);
 	FNAME(protect_clean_gpte)(vcpu->arch.mmu, &pte_access, gpte);
 
-	slot = gfn_to_memslot_dirty_bitmap(vcpu, gfn, pte_access & ACC_WRITE_MASK);
-	if (!slot)
-		return false;
-
-	if (kvm_prefetch_pages(slot, gfn, &page, 1) != 1)
-		return false;
-
-	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
-	kvm_release_page_clean(page);
-	return true;
+	return kvm_mmu_prefetch_sptes(vcpu, gfn, spte, 1, pte_access);
 }
 
 static bool FNAME(gpte_changed)(struct kvm_vcpu *vcpu,
-- 
2.46.0.rc1.232.g9752f9e123-goog



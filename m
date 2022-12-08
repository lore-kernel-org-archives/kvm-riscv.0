From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:39 -0800
Subject: [RFC PATCH 19/37] KVM: x86/mmu: Add arch hooks for NX Huge Pages
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-20-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Abstract away the handling for NX Huge Pages down to arch-specific
hooks. This will be used in a future commit to move the TDP MMU to
common code despite NX Huge Pages, which is x86-specific.

NX Huge Pages is by far the most disruptive feature in terms of needing
the most arch hooks in the TDP MMU.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c     | 57 +++++++++++++++++++---------------
 arch/x86/kvm/mmu/tdp_pgtable.c | 52 +++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 0172b0e44817..7670fbd8e72d 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -269,17 +269,21 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
 	return sp;
 }
 
+__weak void tdp_mmu_arch_init_sp(struct kvm_mmu_page *sp)
+{
+}
+
 static void tdp_mmu_init_sp(struct kvm_mmu_page *sp, tdp_ptep_t sptep,
 			    gfn_t gfn, union kvm_mmu_page_role role)
 {
-	INIT_LIST_HEAD(&sp->arch.possible_nx_huge_page_link);
-
 	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
 
 	sp->role = role;
 	sp->gfn = gfn;
 	sp->ptep = sptep;
 
+	tdp_mmu_arch_init_sp(sp);
+
 	trace_kvm_mmu_get_page(sp, true);
 }
 
@@ -373,6 +377,11 @@ static void tdp_unaccount_mmu_page(struct kvm *kvm, struct kvm_mmu_page *sp)
 	atomic64_dec(&kvm->arch.tdp_mmu_pages);
 }
 
+__weak void tdp_mmu_arch_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp,
+				   bool shared)
+{
+}
+
 /**
  * tdp_mmu_unlink_sp() - Remove a shadow page from the list of used pages
  *
@@ -386,20 +395,7 @@ static void tdp_mmu_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp,
 			      bool shared)
 {
 	tdp_unaccount_mmu_page(kvm, sp);
-
-	if (!sp->arch.nx_huge_page_disallowed)
-		return;
-
-	if (shared)
-		spin_lock(&kvm->arch.tdp_mmu_pages_lock);
-	else
-		lockdep_assert_held_write(&kvm->mmu_lock);
-
-	sp->arch.nx_huge_page_disallowed = false;
-	untrack_possible_nx_huge_page(kvm, sp);
-
-	if (shared)
-		spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
+	tdp_mmu_arch_unlink_sp(kvm, sp, shared);
 }
 
 /**
@@ -1129,6 +1125,23 @@ static int tdp_mmu_link_sp(struct kvm *kvm, struct tdp_iter *iter,
 	return 0;
 }
 
+__weak void tdp_mmu_arch_adjust_map_level(struct kvm_page_fault *fault,
+					  struct tdp_iter *iter)
+{
+}
+
+__weak void tdp_mmu_arch_pre_link_sp(struct kvm *kvm,
+				     struct kvm_mmu_page *sp,
+				     struct kvm_page_fault *fault)
+{
+}
+
+__weak void tdp_mmu_arch_post_link_sp(struct kvm *kvm,
+				      struct kvm_mmu_page *sp,
+				      struct kvm_page_fault *fault)
+{
+}
+
 static int tdp_mmu_split_huge_page(struct kvm *kvm, struct tdp_iter *iter,
 				   struct kvm_mmu_page *sp, bool shared);
 
@@ -1153,8 +1166,7 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	for_each_tdp_pte(iter, root, fault->gfn, fault->gfn + 1) {
 		int r;
 
-		if (fault->arch.nx_huge_page_workaround_enabled)
-			disallowed_hugepage_adjust(fault, iter.old_spte, iter.level);
+		tdp_mmu_arch_adjust_map_level(fault, &iter);
 
 		if (iter.level == fault->goal_level)
 			break;
@@ -1178,7 +1190,7 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		sp = tdp_mmu_alloc_sp(vcpu);
 		tdp_mmu_init_child_sp(sp, &iter);
 
-		sp->arch.nx_huge_page_disallowed = fault->arch.huge_page_disallowed;
+		tdp_mmu_arch_pre_link_sp(kvm, sp, fault);
 
 		if (tdp_pte_is_present(iter.old_spte))
 			r = tdp_mmu_split_huge_page(kvm, &iter, sp, true);
@@ -1194,12 +1206,7 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 			goto retry;
 		}
 
-		if (fault->arch.huge_page_disallowed &&
-		    fault->req_level >= iter.level) {
-			spin_lock(&kvm->arch.tdp_mmu_pages_lock);
-			track_possible_nx_huge_page(kvm, sp);
-			spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
-		}
+		tdp_mmu_arch_post_link_sp(kvm, sp, fault);
 	}
 
 	/*
diff --git a/arch/x86/kvm/mmu/tdp_pgtable.c b/arch/x86/kvm/mmu/tdp_pgtable.c
index e036ba0c6bee..b07ed99b4ab1 100644
--- a/arch/x86/kvm/mmu/tdp_pgtable.c
+++ b/arch/x86/kvm/mmu/tdp_pgtable.c
@@ -111,3 +111,55 @@ u64 tdp_mmu_make_huge_page_split_pte(struct kvm *kvm, u64 huge_spte,
 {
 	return make_huge_page_split_spte(kvm, huge_spte, sp->role, index);
 }
+
+void tdp_mmu_arch_adjust_map_level(struct kvm_page_fault *fault,
+				   struct tdp_iter *iter)
+{
+	if (fault->arch.nx_huge_page_workaround_enabled)
+		disallowed_hugepage_adjust(fault, iter->old_spte, iter->level);
+}
+
+void tdp_mmu_arch_init_sp(struct kvm_mmu_page *sp)
+{
+	INIT_LIST_HEAD(&sp->arch.possible_nx_huge_page_link);
+}
+
+void tdp_mmu_arch_pre_link_sp(struct kvm *kvm,
+			      struct kvm_mmu_page *sp,
+			      struct kvm_page_fault *fault)
+{
+	sp->arch.nx_huge_page_disallowed = fault->arch.huge_page_disallowed;
+}
+
+void tdp_mmu_arch_post_link_sp(struct kvm *kvm,
+			       struct kvm_mmu_page *sp,
+			       struct kvm_page_fault *fault)
+{
+	if (!fault->arch.huge_page_disallowed)
+		return;
+
+	if (fault->req_level < sp->role.level)
+		return;
+
+	spin_lock(&kvm->arch.tdp_mmu_pages_lock);
+	track_possible_nx_huge_page(kvm, sp);
+	spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
+}
+
+void tdp_mmu_arch_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp,
+			    bool shared)
+{
+	if (!sp->arch.nx_huge_page_disallowed)
+		return;
+
+	if (shared)
+		spin_lock(&kvm->arch.tdp_mmu_pages_lock);
+	else
+		lockdep_assert_held_write(&kvm->mmu_lock);
+
+	sp->arch.nx_huge_page_disallowed = false;
+	untrack_possible_nx_huge_page(kvm, sp);
+
+	if (shared)
+		spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
+}
-- 
2.39.0.rc1.256.g54fd8350bd-goog



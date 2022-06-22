From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jun 2022 18:50:11 +0200
Subject: [PATCH v6 20/22] KVM: x86/mmu: Refactor drop_large_spte()
In-Reply-To: <4665c87b-4983-7e15-9262-290d2969b10f@redhat.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-21-dmatlack@google.com> <Yqy1v59ZDJ7EkCix@google.com>
 <4665c87b-4983-7e15-9262-290d2969b10f@redhat.com>
Message-ID: <41f1f405-fa2b-0022-c4ba-58a8d0ff3bad@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/22/22 18:13, Paolo Bonzini wrote:
> Even better, drop_large_spte() is always called right before 
> kvm_mmu_get_child_sp(), so:

Actually, we can even include the call from eager page splitting if
__link_shadow_page() is the one that takes care of dropping the large
SPTE:

 From bea344e409bb8329ca69aca0a63f97537a7ec798 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jun 2022 12:11:44 -0400
Subject: [PATCH] KVM: MMU: pull call to drop_large_spte() into
  __link_shadow_page()

Before allocating a child shadow page table, all callers check
whether the parent already points to a huge page and, if so, they
drop that SPTE.  This is done by drop_large_spte().

However, the act that requires dropping the large SPTE is the
installation of the sp that is returned by kvm_mmu_get_child_sp(),
which happens in __link_shadow_page().  Move the call there
instead of having it in each and every caller.

To ensure that the shadow page is not linked twice if it was
present, do _not_ opportunistically make kvm_mmu_get_child_sp()
idempotent: instead, return an error value if the shadow page
already existed.  This is a bit more verbose, but clearer than
NULL.

Now that the drop_large_spte() name is not taken anymore,
remove the two underscores in front of __drop_large_spte().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 36bc49f08d60..64c1191be4ae 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1135,26 +1135,16 @@ static void drop_spte(struct kvm *kvm, u64 *sptep)
  		rmap_remove(kvm, sptep);
  }
  
-
-static bool __drop_large_spte(struct kvm *kvm, u64 *sptep)
+static void drop_large_spte(struct kvm *kvm, u64 *sptep)
  {
-	if (is_large_pte(*sptep)) {
-		WARN_ON(sptep_to_sp(sptep)->role.level == PG_LEVEL_4K);
-		drop_spte(kvm, sptep);
-		return true;
-	}
-
-	return false;
-}
+	struct kvm_mmu_page *sp;
  
-static void drop_large_spte(struct kvm_vcpu *vcpu, u64 *sptep)
-{
-	if (__drop_large_spte(vcpu->kvm, sptep)) {
-		struct kvm_mmu_page *sp = sptep_to_sp(sptep);
+	sp = sptep_to_sp(sptep);
+	WARN_ON(sp->role.level == PG_LEVEL_4K);
  
-		kvm_flush_remote_tlbs_with_address(vcpu->kvm, sp->gfn,
+	drop_spte(kvm, sptep);
+	kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
  			KVM_PAGES_PER_HPAGE(sp->role.level));
-	}
  }
  
  /*
@@ -2221,6 +2211,9 @@ static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
  {
  	union kvm_mmu_page_role role;
  
+	if (is_shadow_present_pte(*sptep) && !is_large_pte(*sptep))
+		return ERR_PTR(-EEXIST);
+
  	role = kvm_mmu_child_role(sptep, direct, access);
  	return kvm_mmu_get_shadow_page(vcpu, gfn, role);
  }
@@ -2295,6 +2288,13 @@ static void __link_shadow_page(struct kvm_mmu_memory_cache *cache, u64 *sptep,
  
  	BUILD_BUG_ON(VMX_EPT_WRITABLE_MASK != PT_WRITABLE_MASK);
  
+	/*
+	 * If an SPTE is present already, it must be a leaf and therefore
+	 * a large one.  Drop it and flush the TLB before installing sp.
+	 */
+	if (is_shadow_present_pte(*sptep)
+		drop_large_spte(vcpu->kvm, sptep);
+
  	spte = make_nonleaf_spte(sp->spt, sp_ad_disabled(sp));
  
  	mmu_spte_set(sptep, spte);
@@ -3080,11 +3080,9 @@ static int __direct_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
  		if (it.level == fault->goal_level)
  			break;
  
-		drop_large_spte(vcpu, it.sptep);
-		if (is_shadow_present_pte(*it.sptep))
-			continue;
-
  		sp = kvm_mmu_get_child_sp(vcpu, it.sptep, base_gfn, true, ACC_ALL);
+		if (sp == ERR_PTR(-EEXIST))
+			continue;
  
  		link_shadow_page(vcpu, it.sptep, sp);
  		if (fault->is_tdp && fault->huge_page_disallowed &&
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 24f292f3f93f..2448fa8d8438 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -648,15 +648,13 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
  		gfn_t table_gfn;
  
  		clear_sp_write_flooding_count(it.sptep);
-		drop_large_spte(vcpu, it.sptep);
  
-		sp = NULL;
-		if (!is_shadow_present_pte(*it.sptep)) {
-			table_gfn = gw->table_gfn[it.level - 2];
-			access = gw->pt_access[it.level - 2];
-			sp = kvm_mmu_get_child_sp(vcpu, it.sptep, table_gfn,
-						  false, access);
+		table_gfn = gw->table_gfn[it.level - 2];
+		access = gw->pt_access[it.level - 2];
+		sp = kvm_mmu_get_child_sp(vcpu, it.sptep, table_gfn,
+					  false, access);
  
+		if (sp != ERR_PTR(-EEXIST)) {
  			/*
  			 * We must synchronize the pagetable before linking it
  			 * because the guest doesn't need to flush tlb when
@@ -685,7 +683,7 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
  		if (FNAME(gpte_changed)(vcpu, gw, it.level - 1))
  			goto out_gpte_changed;
  
-		if (sp)
+		if (sp != ERR_PTR(-EEXIST))
  			link_shadow_page(vcpu, it.sptep, sp);
  	}
  
@@ -709,16 +707,15 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
  
  		validate_direct_spte(vcpu, it.sptep, direct_access);
  
-		drop_large_spte(vcpu, it.sptep);
+		sp = kvm_mmu_get_child_sp(vcpu, it.sptep, base_gfn,
+					  true, direct_access);
+		if (sp == ERR_PTR(-EEXIST))
+			continue;
  
-		if (!is_shadow_present_pte(*it.sptep)) {
-			sp = kvm_mmu_get_child_sp(vcpu, it.sptep, base_gfn,
-						  true, direct_access);
-			link_shadow_page(vcpu, it.sptep, sp);
-			if (fault->huge_page_disallowed &&
-			    fault->req_level >= it.level)
-				account_huge_nx_page(vcpu->kvm, sp);
-		}
+		link_shadow_page(vcpu, it.sptep, sp);
+		if (fault->huge_page_disallowed &&
+		    fault->req_level >= it.level)
+			account_huge_nx_page(vcpu->kvm, sp);
  	}
  
  	if (WARN_ON_ONCE(it.level != fault->goal_level))


I'll test the resulting series and then send a v7.

Paolo



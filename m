From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jun 2022 18:13:13 +0200
Subject: [PATCH v6 20/22] KVM: x86/mmu: Refactor drop_large_spte()
In-Reply-To: <Yqy1v59ZDJ7EkCix@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-21-dmatlack@google.com> <Yqy1v59ZDJ7EkCix@google.com>
Message-ID: <4665c87b-4983-7e15-9262-290d2969b10f@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/17/22 19:11, Sean Christopherson wrote:
> since the shortlog is already
> a somewhat vague "do a refactor", I vote to opportunistically:
> 
>    - rename drop_large_spte() to drop_spte_if_huge()
>    - rename __drop_large_spte() to drop_huge_spte()
>    - move "if (!is_large_pte(*sptep))" to drop_spte_if_huge() since the split path
>      should never pass in a non-huge SPTE.
> 
> That last point will also clean up an oddity with with "flush" parameter; given
> the command-like name of "flush", it's a bit weird that __drop_large_spte() doesn't
> flush when the SPTE is large.

Even better, drop_large_spte() is always called right before 
kvm_mmu_get_child_sp(), so:

 From 86a9490972a1e959a4df114678719494b5475720 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jun 2022 12:11:44 -0400
Subject: [PATCH] KVM: MMU: pull drop_large_spte into kvm_mmu_get_child_sp

Before allocating a child shadow page table, all callers need to
check whether the parent already points to a huge page and, if so,
drop it.  This is done by drop_large_spte(), but it can be moved
to kvm_mmu_get_child_sp().

To ensure that the shadow page is not linked twice if it was
present, do _not_ opportunistically make kvm_mmu_get_child_sp()
idempotent: instead, return an error value if the shadow page
already existed.  This is a bit more verbose, but clearer than
NULL.

Now that the drop_large_spte() name is not taken anymore,
remove the two underscores in front of __drop_large_spte().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 36bc49f08d60..7f52870ee062 100644
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
@@ -2221,6 +2211,13 @@ static struct kvm_mmu_page 
*kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
  {
  	union kvm_mmu_page_role role;

+	if (is_shadow_present_pte(*sptep)) {
+		if (!is_large_pte(*sptep))
+			return ERR_PTR(-EEXIST);
+
+		drop_large_spte(vcpu->kvm, sptep, true);
+	}
+
  	role = kvm_mmu_child_role(sptep, direct, access);
  	return kvm_mmu_get_shadow_page(vcpu, gfn, role);
  }
@@ -3080,11 +3077,9 @@ static int __direct_map(struct kvm_vcpu *vcpu, 
struct kvm_page_fault *fault)
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
@@ -648,15 +648,13 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, 
struct kvm_page_fault *fault,
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
@@ -685,7 +683,7 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, 
struct kvm_page_fault *fault,
  		if (FNAME(gpte_changed)(vcpu, gw, it.level - 1))
  			goto out_gpte_changed;

-		if (sp)
+		if (sp != ERR_PTR(-EEXIST))
  			link_shadow_page(vcpu, it.sptep, sp);
  	}

@@ -709,16 +707,15 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, 
struct kvm_page_fault *fault,

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

with the obvious patch on top to add the flush argument.

The ERR_PTR(-EEXIST) is a bit heavy, but at least conveys what's going 
on.  Thoughts?

Paolo


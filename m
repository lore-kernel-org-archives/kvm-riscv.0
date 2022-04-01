From: David Matlack <dmatlack@google.com>
Date: Fri,  1 Apr 2022 17:55:34 +0000
Subject: [PATCH v3 03/23] KVM: x86/mmu: Derive shadow MMU page role from parent
In-Reply-To: <20220401175554.1931568-1-dmatlack@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
Message-ID: <20220401175554.1931568-4-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of computing the shadow page role from scratch for every new
page, we can derive most of the information from the parent shadow page.
This avoids redundant calculations and reduces the number of parameters
to kvm_mmu_get_page().

Preemptively split out the role calculation to a separate function for
use in a following commit.

No functional change intended.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 96 +++++++++++++++++++++++-----------
 arch/x86/kvm/mmu/paging_tmpl.h |  9 ++--
 2 files changed, 71 insertions(+), 34 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 1c8d157c097b..8253d68cc30b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2027,30 +2027,14 @@ static void clear_sp_write_flooding_count(u64 *spte)
 	__clear_sp_write_flooding_count(sptep_to_sp(spte));
 }
 
-static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
-					     gfn_t gfn,
-					     gva_t gaddr,
-					     unsigned level,
-					     bool direct,
-					     unsigned int access)
+static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
+					     union kvm_mmu_page_role role)
 {
-	union kvm_mmu_page_role role;
 	struct hlist_head *sp_list;
-	unsigned quadrant;
 	struct kvm_mmu_page *sp;
 	int collisions = 0;
 	LIST_HEAD(invalid_list);
 
-	role = vcpu->arch.mmu->mmu_role.base;
-	role.level = level;
-	role.direct = direct;
-	role.access = access;
-	if (role.has_4_byte_gpte) {
-		quadrant = gaddr >> (PAGE_SHIFT + (PT64_PT_BITS * level));
-		quadrant &= (1 << ((PT32_PT_BITS - PT64_PT_BITS) * level)) - 1;
-		role.quadrant = quadrant;
-	}
-
 	sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
 	for_each_valid_sp(vcpu->kvm, sp, sp_list) {
 		if (sp->gfn != gfn) {
@@ -2068,7 +2052,7 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 			 * Unsync pages must not be left as is, because the new
 			 * upper-level page will be write-protected.
 			 */
-			if (level > PG_LEVEL_4K && sp->unsync)
+			if (role.level > PG_LEVEL_4K && sp->unsync)
 				kvm_mmu_prepare_zap_page(vcpu->kvm, sp,
 							 &invalid_list);
 			continue;
@@ -2107,14 +2091,14 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 
 	++vcpu->kvm->stat.mmu_cache_miss;
 
-	sp = kvm_mmu_alloc_page(vcpu, direct);
+	sp = kvm_mmu_alloc_page(vcpu, role.direct);
 
 	sp->gfn = gfn;
 	sp->role = role;
 	hlist_add_head(&sp->hash_link, sp_list);
-	if (!direct) {
+	if (!role.direct) {
 		account_shadowed(vcpu->kvm, sp);
-		if (level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
+		if (role.level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
 			kvm_flush_remote_tlbs_with_address(vcpu->kvm, gfn, 1);
 	}
 	trace_kvm_mmu_get_page(sp, true);
@@ -2126,6 +2110,51 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 	return sp;
 }
 
+static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
+{
+	struct kvm_mmu_page *parent_sp = sptep_to_sp(sptep);
+	union kvm_mmu_page_role role;
+
+	role = parent_sp->role;
+	role.level--;
+	role.access = access;
+	role.direct = direct;
+
+	/*
+	 * If the guest has 4-byte PTEs then that means it's using 32-bit,
+	 * 2-level, non-PAE paging. KVM shadows such guests using 4 PAE page
+	 * directories, each mapping 1/4 of the guest's linear address space
+	 * (1GiB). The shadow pages for those 4 page directories are
+	 * pre-allocated and assigned a separate quadrant in their role.
+	 *
+	 * Since we are allocating a child shadow page and there are only 2
+	 * levels, this must be a PG_LEVEL_4K shadow page. Here the quadrant
+	 * will either be 0 or 1 because it maps 1/2 of the address space mapped
+	 * by the guest's PG_LEVEL_4K page table (or 4MiB huge page) that it
+	 * is shadowing. In this case, the quadrant can be derived by the index
+	 * of the SPTE that points to the new child shadow page in the page
+	 * directory (parent_sp). Specifically, every 2 SPTEs in parent_sp
+	 * shadow one half of a guest's page table (or 4MiB huge page) so the
+	 * quadrant is just the parity of the index of the SPTE.
+	 */
+	if (role.has_4_byte_gpte) {
+		WARN_ON_ONCE(role.level != PG_LEVEL_4K);
+		role.quadrant = (sptep - parent_sp->spt) % 2;
+	}
+
+	return role;
+}
+
+static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
+						 u64 *sptep, gfn_t gfn,
+						 bool direct, u32 access)
+{
+	union kvm_mmu_page_role role;
+
+	role = kvm_mmu_child_role(sptep, direct, access);
+	return kvm_mmu_get_page(vcpu, gfn, role);
+}
+
 static void shadow_walk_init_using_root(struct kvm_shadow_walk_iterator *iterator,
 					struct kvm_vcpu *vcpu, hpa_t root,
 					u64 addr)
@@ -2930,8 +2959,7 @@ static int __direct_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		if (is_shadow_present_pte(*it.sptep))
 			continue;
 
-		sp = kvm_mmu_get_page(vcpu, base_gfn, it.addr,
-				      it.level - 1, true, ACC_ALL);
+		sp = kvm_mmu_get_child_sp(vcpu, it.sptep, base_gfn, true, ACC_ALL);
 
 		link_shadow_page(vcpu, it.sptep, sp);
 		if (fault->is_tdp && fault->huge_page_disallowed &&
@@ -3313,12 +3341,21 @@ static int mmu_check_root(struct kvm_vcpu *vcpu, gfn_t root_gfn)
 	return ret;
 }
 
-static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, gva_t gva,
+static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, int quadrant,
 			    u8 level, bool direct)
 {
+	union kvm_mmu_page_role role;
 	struct kvm_mmu_page *sp;
 
-	sp = kvm_mmu_get_page(vcpu, gfn, gva, level, direct, ACC_ALL);
+	role = vcpu->arch.mmu->mmu_role.base;
+	role.level = level;
+	role.direct = direct;
+	role.access = ACC_ALL;
+
+	if (role.has_4_byte_gpte)
+		role.quadrant = quadrant;
+
+	sp = kvm_mmu_get_page(vcpu, gfn, role);
 	++sp->root_count;
 
 	return __pa(sp->spt);
@@ -3352,8 +3389,8 @@ static int mmu_alloc_direct_roots(struct kvm_vcpu *vcpu)
 		for (i = 0; i < 4; ++i) {
 			WARN_ON_ONCE(IS_VALID_PAE_ROOT(mmu->pae_root[i]));
 
-			root = mmu_alloc_root(vcpu, i << (30 - PAGE_SHIFT),
-					      i << 30, PT32_ROOT_LEVEL, true);
+			root = mmu_alloc_root(vcpu, i << (30 - PAGE_SHIFT), i,
+					      PT32_ROOT_LEVEL, true);
 			mmu->pae_root[i] = root | PT_PRESENT_MASK |
 					   shadow_me_mask;
 		}
@@ -3522,8 +3559,7 @@ static int mmu_alloc_shadow_roots(struct kvm_vcpu *vcpu)
 			root_gfn = pdptrs[i] >> PAGE_SHIFT;
 		}
 
-		root = mmu_alloc_root(vcpu, root_gfn, i << 30,
-				      PT32_ROOT_LEVEL, false);
+		root = mmu_alloc_root(vcpu, root_gfn, i, PT32_ROOT_LEVEL, false);
 		mmu->pae_root[i] = root | pm_mask;
 	}
 
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 8621188b46df..729394de2658 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -683,8 +683,9 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
 		if (!is_shadow_present_pte(*it.sptep)) {
 			table_gfn = gw->table_gfn[it.level - 2];
 			access = gw->pt_access[it.level - 2];
-			sp = kvm_mmu_get_page(vcpu, table_gfn, fault->addr,
-					      it.level-1, false, access);
+			sp = kvm_mmu_get_child_sp(vcpu, it.sptep, table_gfn,
+						  false, access);
+
 			/*
 			 * We must synchronize the pagetable before linking it
 			 * because the guest doesn't need to flush tlb when
@@ -740,8 +741,8 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
 		drop_large_spte(vcpu, it.sptep);
 
 		if (!is_shadow_present_pte(*it.sptep)) {
-			sp = kvm_mmu_get_page(vcpu, base_gfn, fault->addr,
-					      it.level - 1, true, direct_access);
+			sp = kvm_mmu_get_child_sp(vcpu, it.sptep, base_gfn,
+						  true, direct_access);
 			link_shadow_page(vcpu, it.sptep, sp);
 			if (fault->huge_page_disallowed &&
 			    fault->req_level >= it.level)
-- 
2.35.1.1094.g7c7d902a7c-goog



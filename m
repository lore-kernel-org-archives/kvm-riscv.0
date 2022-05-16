From: David Matlack <dmatlack@google.com>
Date: Mon, 16 May 2022 23:21:22 +0000
Subject: [PATCH v6 06/22] KVM: x86/mmu: Decompose kvm_mmu_get_page() into
 separate functions
In-Reply-To: <20220516232138.1783324-1-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
Message-ID: <20220516232138.1783324-7-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Decompose kvm_mmu_get_page() into separate helper functions to increase
readability and prepare for allocating shadow pages without a vcpu
pointer.

Specifically, pull the guts of kvm_mmu_get_page() into 2 helper
functions:

kvm_mmu_find_shadow_page() -
  Walks the page hash checking for any existing mmu pages that match the
  given gfn and role.

kvm_mmu_alloc_shadow_page()
  Allocates and initializes an entirely new kvm_mmu_page. This currently
  requries a vcpu pointer for allocation and looking up the memslot but
  that will be removed in a future commit.

No functional change intended.

Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 52 +++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 8508c4bfddb5..c8ee92e45e8b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2019,16 +2019,16 @@ static void clear_sp_write_flooding_count(u64 *spte)
 	__clear_sp_write_flooding_count(sptep_to_sp(spte));
 }
 
-static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
-					     union kvm_mmu_page_role role)
+static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
+						     gfn_t gfn,
+						     struct hlist_head *sp_list,
+						     union kvm_mmu_page_role role)
 {
-	struct hlist_head *sp_list;
 	struct kvm_mmu_page *sp;
 	int ret;
 	int collisions = 0;
 	LIST_HEAD(invalid_list);
 
-	sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
 	for_each_valid_sp(vcpu->kvm, sp, sp_list) {
 		if (sp->gfn != gfn) {
 			collisions++;
@@ -2053,7 +2053,7 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
 
 		/* unsync and write-flooding only apply to indirect SPs. */
 		if (sp->role.direct)
-			goto trace_get_page;
+			goto out;
 
 		if (sp->unsync) {
 			/*
@@ -2079,14 +2079,26 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
 
 		__clear_sp_write_flooding_count(sp);
 
-trace_get_page:
-		trace_kvm_mmu_get_page(sp, false);
 		goto out;
 	}
 
+	sp = NULL;
 	++vcpu->kvm->stat.mmu_cache_miss;
 
-	sp = kvm_mmu_alloc_page(vcpu, role.direct);
+out:
+	kvm_mmu_commit_zap_page(vcpu->kvm, &invalid_list);
+
+	if (collisions > vcpu->kvm->stat.max_mmu_page_hash_collisions)
+		vcpu->kvm->stat.max_mmu_page_hash_collisions = collisions;
+	return sp;
+}
+
+static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
+						      gfn_t gfn,
+						      struct hlist_head *sp_list,
+						      union kvm_mmu_page_role role)
+{
+	struct kvm_mmu_page *sp = kvm_mmu_alloc_page(vcpu, role.direct);
 
 	sp->gfn = gfn;
 	sp->role = role;
@@ -2096,12 +2108,26 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
 		if (role.level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
 			kvm_flush_remote_tlbs_with_address(vcpu->kvm, gfn, 1);
 	}
-	trace_kvm_mmu_get_page(sp, true);
-out:
-	kvm_mmu_commit_zap_page(vcpu->kvm, &invalid_list);
 
-	if (collisions > vcpu->kvm->stat.max_mmu_page_hash_collisions)
-		vcpu->kvm->stat.max_mmu_page_hash_collisions = collisions;
+	return sp;
+}
+
+static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
+					     union kvm_mmu_page_role role)
+{
+	struct hlist_head *sp_list;
+	struct kvm_mmu_page *sp;
+	bool created = false;
+
+	sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
+
+	sp = kvm_mmu_find_shadow_page(vcpu, gfn, sp_list, role);
+	if (!sp) {
+		created = true;
+		sp = kvm_mmu_alloc_shadow_page(vcpu, gfn, sp_list, role);
+	}
+
+	trace_kvm_mmu_get_page(sp, created);
 	return sp;
 }
 
-- 
2.36.0.550.gb090851708-goog



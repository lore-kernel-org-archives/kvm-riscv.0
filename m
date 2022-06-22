From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jun 2022 15:26:55 -0400
Subject: [PATCH v7 08/23] KVM: x86/mmu: Rename shadow MMU functions that deal with shadow pages
In-Reply-To: <20220622192710.2547152-1-pbonzini@redhat.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com>
Message-ID: <20220622192710.2547152-9-pbonzini@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Matlack <dmatlack@google.com>

Rename 2 functions:

  kvm_mmu_get_page() -> kvm_mmu_get_shadow_page()
  kvm_mmu_free_page() -> kvm_mmu_free_shadow_page()

This change makes it clear that these functions deal with shadow pages
rather than struct pages. It also aligns these functions with the naming
scheme for kvm_mmu_find_shadow_page() and kvm_mmu_alloc_shadow_page().

Prefer "shadow_page" over the shorter "sp" since these are core
functions and the line lengths aren't terrible.

No functional change intended.

Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Message-Id: <20220516232138.1783324-9-dmatlack@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 8b84cdd8c6cd..bd45364bf465 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1626,7 +1626,7 @@ static inline void kvm_mod_used_mmu_pages(struct kvm *kvm, long nr)
 	percpu_counter_add(&kvm_total_used_mmu_pages, nr);
 }
 
-static void kvm_mmu_free_page(struct kvm_mmu_page *sp)
+static void kvm_mmu_free_shadow_page(struct kvm_mmu_page *sp)
 {
 	MMU_WARN_ON(!is_empty_shadow_page(sp->spt));
 	hlist_del(&sp->hash_link);
@@ -2081,8 +2081,9 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
 	return sp;
 }
 
-static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
-					     union kvm_mmu_page_role role)
+static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
+						    gfn_t gfn,
+						    union kvm_mmu_page_role role)
 {
 	struct hlist_head *sp_list;
 	struct kvm_mmu_page *sp;
@@ -2146,7 +2147,7 @@ static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
 	union kvm_mmu_page_role role;
 
 	role = kvm_mmu_child_role(sptep, direct, access);
-	return kvm_mmu_get_page(vcpu, gfn, role);
+	return kvm_mmu_get_shadow_page(vcpu, gfn, role);
 }
 
 static void shadow_walk_init_using_root(struct kvm_shadow_walk_iterator *iterator,
@@ -2422,7 +2423,7 @@ static void kvm_mmu_commit_zap_page(struct kvm *kvm,
 
 	list_for_each_entry_safe(sp, nsp, invalid_list, link) {
 		WARN_ON(!sp->role.invalid || sp->root_count);
-		kvm_mmu_free_page(sp);
+		kvm_mmu_free_shadow_page(sp);
 	}
 }
 
@@ -3415,7 +3416,7 @@ static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, int quadrant,
 	WARN_ON_ONCE(quadrant && !role.has_4_byte_gpte);
 	WARN_ON_ONCE(role.direct && role.has_4_byte_gpte);
 
-	sp = kvm_mmu_get_page(vcpu, gfn, role);
+	sp = kvm_mmu_get_shadow_page(vcpu, gfn, role);
 	++sp->root_count;
 
 	return __pa(sp->spt);
-- 
2.31.1




From: David Matlack <dmatlack@google.com>
Date: Fri, 22 Apr 2022 21:05:35 +0000
Subject: [PATCH v4 09/20] KVM: x86/mmu: Replace vcpu with kvm in
 kvm_mmu_alloc_shadow_page()
In-Reply-To: <20220422210546.458943-1-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
Message-ID: <20220422210546.458943-10-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The vcpu pointer in kvm_mmu_alloc_shadow_page() is only used to get the
kvm pointer. So drop the vcpu pointer and just pass in the kvm pointer.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 943595ed0ba1..df110e0d57cf 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2084,7 +2084,7 @@ struct shadow_page_caches {
 	struct kvm_mmu_memory_cache *gfn_array_cache;
 };
 
-static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
+static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
 						      struct shadow_page_caches *caches,
 						      gfn_t gfn,
 						      struct hlist_head *sp_list,
@@ -2104,16 +2104,16 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
 	 * depends on valid pages being added to the head of the list.  See
 	 * comments in kvm_zap_obsolete_pages().
 	 */
-	sp->mmu_valid_gen = vcpu->kvm->arch.mmu_valid_gen;
-	list_add(&sp->link, &vcpu->kvm->arch.active_mmu_pages);
-	kvm_mod_used_mmu_pages(vcpu->kvm, +1);
+	sp->mmu_valid_gen = kvm->arch.mmu_valid_gen;
+	list_add(&sp->link, &kvm->arch.active_mmu_pages);
+	kvm_mod_used_mmu_pages(kvm, +1);
 
 	sp->gfn = gfn;
 	sp->role = role;
 	hlist_add_head(&sp->hash_link, sp_list);
 
 	if (!role.direct)
-		account_shadowed(vcpu->kvm, sp);
+		account_shadowed(kvm, sp);
 
 	return sp;
 }
@@ -2132,7 +2132,7 @@ static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 	sp = kvm_mmu_find_shadow_page(vcpu, gfn, sp_list, role);
 	if (!sp) {
 		created = true;
-		sp = kvm_mmu_alloc_shadow_page(vcpu, caches, gfn, sp_list, role);
+		sp = kvm_mmu_alloc_shadow_page(vcpu->kvm, caches, gfn, sp_list, role);
 	}
 
 	trace_kvm_mmu_get_page(sp, created);
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog



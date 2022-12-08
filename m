From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:21 -0800
Subject: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID directly
 in kvm_mmu_page_role
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-2-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename kvm_mmu_page_role.smm with kvm_mmu_page_role.as_id and use it
directly as the address space ID throughout the KVM MMU code. This
eliminates a needless level of indirection, kvm_mmu_role_as_id(), and
prepares for making kvm_mmu_page_role architecture-neutral.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_host.h |  4 ++--
 arch/x86/kvm/mmu/mmu.c          |  6 +++---
 arch/x86/kvm/mmu/mmu_internal.h | 10 ----------
 arch/x86/kvm/mmu/tdp_iter.c     |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      | 12 ++++++------
 5 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index aa4eb8cfcd7e..0a819d40131a 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -348,7 +348,7 @@ union kvm_mmu_page_role {
 		 * simple shift.  While there is room, give it a whole
 		 * byte so it is also faster to load it from memory.
 		 */
-		unsigned smm:8;
+		unsigned as_id:8;
 	};
 };
 
@@ -2056,7 +2056,7 @@ enum {
 # define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
 # define KVM_ADDRESS_SPACE_NUM 2
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
-# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
+# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).as_id)
 #else
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
 #endif
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4d188f056933..f375b719f565 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5056,7 +5056,7 @@ kvm_calc_cpu_role(struct kvm_vcpu *vcpu, const struct kvm_mmu_role_regs *regs)
 	union kvm_cpu_role role = {0};
 
 	role.base.access = ACC_ALL;
-	role.base.smm = is_smm(vcpu);
+	role.base.as_id = is_smm(vcpu);
 	role.base.guest_mode = is_guest_mode(vcpu);
 	role.ext.valid = 1;
 
@@ -5112,7 +5112,7 @@ kvm_calc_tdp_mmu_root_page_role(struct kvm_vcpu *vcpu,
 	role.access = ACC_ALL;
 	role.cr0_wp = true;
 	role.efer_nx = true;
-	role.smm = cpu_role.base.smm;
+	role.as_id = cpu_role.base.as_id;
 	role.guest_mode = cpu_role.base.guest_mode;
 	role.ad_disabled = !kvm_ad_enabled();
 	role.level = kvm_mmu_get_tdp_level(vcpu);
@@ -5233,7 +5233,7 @@ kvm_calc_shadow_ept_root_page_role(struct kvm_vcpu *vcpu, bool accessed_dirty,
 
 	/*
 	 * KVM does not support SMM transfer monitors, and consequently does not
-	 * support the "entry to SMM" control either.  role.base.smm is always 0.
+	 * support the "entry to SMM" control either.  role.base.as_id is always 0.
 	 */
 	WARN_ON_ONCE(is_smm(vcpu));
 	role.base.level = level;
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index ac00bfbf32f6..5427f65117b4 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -133,16 +133,6 @@ struct kvm_mmu_page {
 
 extern struct kmem_cache *mmu_page_header_cache;
 
-static inline int kvm_mmu_role_as_id(union kvm_mmu_page_role role)
-{
-	return role.smm ? 1 : 0;
-}
-
-static inline int kvm_mmu_page_as_id(struct kvm_mmu_page *sp)
-{
-	return kvm_mmu_role_as_id(sp->role);
-}
-
 static inline bool kvm_mmu_page_ad_need_write_protect(struct kvm_mmu_page *sp)
 {
 	/*
diff --git a/arch/x86/kvm/mmu/tdp_iter.c b/arch/x86/kvm/mmu/tdp_iter.c
index 39b48e7d7d1a..4a7d58bf81c4 100644
--- a/arch/x86/kvm/mmu/tdp_iter.c
+++ b/arch/x86/kvm/mmu/tdp_iter.c
@@ -52,7 +52,7 @@ void tdp_iter_start(struct tdp_iter *iter, struct kvm_mmu_page *root,
 	iter->root_level = root_level;
 	iter->min_level = min_level;
 	iter->pt_path[iter->root_level - 1] = (tdp_ptep_t)root->spt;
-	iter->as_id = kvm_mmu_page_as_id(root);
+	iter->as_id = root->role.as_id;
 
 	tdp_iter_restart(iter);
 }
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 764f7c87286f..7ccac1aa8df6 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -237,7 +237,7 @@ static struct kvm_mmu_page *tdp_mmu_next_root(struct kvm *kvm,
 	     _root;								\
 	     _root = tdp_mmu_next_root(_kvm, _root, _shared, _only_valid))	\
 		if (kvm_lockdep_assert_mmu_lock_held(_kvm, _shared) &&		\
-		    kvm_mmu_page_as_id(_root) != _as_id) {			\
+		    _root->role.as_id != _as_id) {			\
 		} else
 
 #define for_each_valid_tdp_mmu_root_yield_safe(_kvm, _root, _as_id, _shared)	\
@@ -256,7 +256,7 @@ static struct kvm_mmu_page *tdp_mmu_next_root(struct kvm *kvm,
 #define for_each_tdp_mmu_root(_kvm, _root, _as_id)			\
 	list_for_each_entry(_root, &_kvm->arch.tdp_mmu_roots, link)	\
 		if (kvm_lockdep_assert_mmu_lock_held(_kvm, false) &&	\
-		    kvm_mmu_page_as_id(_root) != _as_id) {		\
+		    _root->role.as_id != _as_id) {		\
 		} else
 
 static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
@@ -310,7 +310,7 @@ hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu)
 	 * Check for an existing root before allocating a new one.  Note, the
 	 * role check prevents consuming an invalid root.
 	 */
-	for_each_tdp_mmu_root(kvm, root, kvm_mmu_role_as_id(role)) {
+	for_each_tdp_mmu_root(kvm, root, role.as_id) {
 		if (root->role.word == role.word &&
 		    kvm_tdp_mmu_get_root(root))
 			goto out;
@@ -496,8 +496,8 @@ static void handle_removed_pt(struct kvm *kvm, tdp_ptep_t pt, bool shared)
 			old_spte = kvm_tdp_mmu_write_spte(sptep, old_spte,
 							  REMOVED_SPTE, level);
 		}
-		handle_changed_spte(kvm, kvm_mmu_page_as_id(sp), gfn,
-				    old_spte, REMOVED_SPTE, level, shared);
+		handle_changed_spte(kvm, sp->role.as_id, gfn, old_spte,
+				    REMOVED_SPTE, level, shared);
 	}
 
 	call_rcu(&sp->rcu_head, tdp_mmu_free_sp_rcu_callback);
@@ -923,7 +923,7 @@ bool kvm_tdp_mmu_zap_sp(struct kvm *kvm, struct kvm_mmu_page *sp)
 	if (WARN_ON_ONCE(!is_shadow_present_pte(old_spte)))
 		return false;
 
-	__tdp_mmu_set_spte(kvm, kvm_mmu_page_as_id(sp), sp->ptep, old_spte, 0,
+	__tdp_mmu_set_spte(kvm, sp->role.as_id, sp->ptep, old_spte, 0,
 			   sp->gfn, sp->role.level + 1, true, true);
 
 	return true;
-- 
2.39.0.rc1.256.g54fd8350bd-goog



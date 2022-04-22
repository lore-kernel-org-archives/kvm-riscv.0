From: David Matlack <dmatlack@google.com>
Date: Fri, 22 Apr 2022 21:05:37 +0000
Subject: [PATCH v4 11/20] KVM: x86/mmu: Allow for NULL vcpu pointer in
 __kvm_mmu_get_shadow_page()
In-Reply-To: <20220422210546.458943-1-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
Message-ID: <20220422210546.458943-12-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allow the vcpu pointer in __kvm_mmu_get_shadow_page() to be NULL. Rename
it to vcpu_or_null to prevent future commits from accidentally taking
dependency on it without first considering the NULL case.

The vcpu pointer is only used for syncing indirect shadow pages in
kvm_mmu_find_shadow_page(). A vcpu pointer it not required for
correctness since unsync pages can simply be zapped. But this should
never occur in practice, since the only use-case for passing a NULL vCPU
pointer is eager page splitting which will only request direct shadow
pages (which can never be unsync).

Even though __kvm_mmu_get_shadow_page() can gracefully handle a NULL
vcpu, add a WARN() that will fire if __kvm_mmu_get_shadow_page() is ever
called to get an indirect shadow page with a NULL vCPU pointer, since
zapping unsync SPs is a performance overhead that should be considered.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 40 ++++++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 04029c01aebd..21407bd4435a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1845,16 +1845,27 @@ static void kvm_mmu_commit_zap_page(struct kvm *kvm,
 	  &(_kvm)->arch.mmu_page_hash[kvm_page_table_hashfn(_gfn)])	\
 		if ((_sp)->gfn != (_gfn) || (_sp)->role.direct) {} else
 
-static int kvm_sync_page(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
-			 struct list_head *invalid_list)
+static int __kvm_sync_page(struct kvm *kvm, struct kvm_vcpu *vcpu_or_null,
+			   struct kvm_mmu_page *sp,
+			   struct list_head *invalid_list)
 {
-	int ret = vcpu->arch.mmu->sync_page(vcpu, sp);
+	int ret = -1;
+
+	if (vcpu_or_null)
+		ret = vcpu_or_null->arch.mmu->sync_page(vcpu_or_null, sp);
 
 	if (ret < 0)
-		kvm_mmu_prepare_zap_page(vcpu->kvm, sp, invalid_list);
+		kvm_mmu_prepare_zap_page(kvm, sp, invalid_list);
+
 	return ret;
 }
 
+static int kvm_sync_page(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
+			 struct list_head *invalid_list)
+{
+	return __kvm_sync_page(vcpu->kvm, vcpu, sp, invalid_list);
+}
+
 static bool kvm_mmu_remote_flush_or_zap(struct kvm *kvm,
 					struct list_head *invalid_list,
 					bool remote_flush)
@@ -2004,7 +2015,7 @@ static void clear_sp_write_flooding_count(u64 *spte)
 }
 
 static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
-						     struct kvm_vcpu *vcpu,
+						     struct kvm_vcpu *vcpu_or_null,
 						     gfn_t gfn,
 						     struct hlist_head *sp_list,
 						     union kvm_mmu_page_role role)
@@ -2053,7 +2064,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
 			 * If the sync fails, the page is zapped.  If so, break
 			 * in order to rebuild it.
 			 */
-			ret = kvm_sync_page(vcpu, sp, &invalid_list);
+			ret = __kvm_sync_page(kvm, vcpu_or_null, sp, &invalid_list);
 			if (ret < 0)
 				break;
 
@@ -2120,7 +2131,7 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
 }
 
 static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm *kvm,
-						      struct kvm_vcpu *vcpu,
+						      struct kvm_vcpu *vcpu_or_null,
 						      struct shadow_page_caches *caches,
 						      gfn_t gfn,
 						      union kvm_mmu_page_role role)
@@ -2129,9 +2140,22 @@ static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm *kvm,
 	struct kvm_mmu_page *sp;
 	bool created = false;
 
+	/*
+	 * A vCPU pointer should always be provided when getting indirect
+	 * shadow pages, as that shadow page may already exist and need to be
+	 * synced using the vCPU pointer (see __kvm_sync_page()). Direct shadow
+	 * pages are never unsync and thus do not require a vCPU pointer.
+	 *
+	 * No need to panic here as __kvm_sync_page() falls back to zapping an
+	 * unsync page if the vCPU pointer is NULL. But still WARN() since
+	 * such zapping will impact performance and this situation is never
+	 * expected to occur in practice.
+	 */
+	WARN_ON(!vcpu_or_null && !role.direct);
+
 	sp_list = &kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
 
-	sp = kvm_mmu_find_shadow_page(kvm, vcpu, gfn, sp_list, role);
+	sp = kvm_mmu_find_shadow_page(kvm, vcpu_or_null, gfn, sp_list, role);
 	if (!sp) {
 		created = true;
 		sp = kvm_mmu_alloc_shadow_page(kvm, caches, gfn, sp_list, role);
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog



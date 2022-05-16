From: David Matlack <dmatlack@google.com>
Date: Mon, 16 May 2022 23:21:29 +0000
Subject: [PATCH v6 13/22] KVM: x86/mmu: Allow NULL @vcpu in
 kvm_mmu_find_shadow_page()
In-Reply-To: <20220516232138.1783324-1-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
Message-ID: <20220516232138.1783324-14-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allow @vcpu to be NULL in kvm_mmu_find_shadow_page() (and its only
caller __kvm_mmu_get_shadow_page()). @vcpu is only required to sync
indirect shadow pages, so it's safe to pass in NULL when looking up
direct shadow pages.

This will be used for doing eager page splitting, which allocates direct
shadow pages from the context of a VM ioctl without access to a vCPU
pointer.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4fbc2da47428..acb54d6e0ea5 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1850,6 +1850,7 @@ static int kvm_sync_page(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 
 	if (ret < 0)
 		kvm_mmu_prepare_zap_page(vcpu->kvm, sp, invalid_list);
+
 	return ret;
 }
 
@@ -2001,6 +2002,7 @@ static void clear_sp_write_flooding_count(u64 *spte)
 	__clear_sp_write_flooding_count(sptep_to_sp(spte));
 }
 
+/* Note, @vcpu may be NULL if @role.direct is true. */
 static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
 						     struct kvm_vcpu *vcpu,
 						     gfn_t gfn,
@@ -2039,6 +2041,16 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
 			goto out;
 
 		if (sp->unsync) {
+			/*
+			 * A vCPU pointer should always be provided when finding
+			 * indirect shadow pages, as that shadow page may
+			 * already exist and need to be synced using the vCPU
+			 * pointer. Direct shadow pages are never unsync and
+			 * thus do not require a vCPU pointer.
+			 */
+			if (KVM_BUG_ON(!vcpu, kvm))
+				break;
+
 			/*
 			 * The page is good, but is stale.  kvm_sync_page does
 			 * get the latest guest state, but (unlike mmu_unsync_children)
@@ -2116,6 +2128,7 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
 	return sp;
 }
 
+/* Note, @vcpu may be NULL if @role.direct is true. */
 static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm *kvm,
 						      struct kvm_vcpu *vcpu,
 						      struct shadow_page_caches *caches,
-- 
2.36.0.550.gb090851708-goog



From: David Matlack <dmatlack@google.com>
Date: Fri,  1 Apr 2022 17:55:42 +0000
Subject: [PATCH v3 11/23] KVM: x86/mmu: Use common code to allocate shadow
 pages from vCPU caches
In-Reply-To: <20220401175554.1931568-1-dmatlack@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
Message-ID: <20220401175554.1931568-12-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that allocating shadow pages is isolated to a helper function, use
it in the TDP MMU as well. Keep tdp_mmu_alloc_sp() to avoid hard-coding
direct=true in multiple places.

No functional change intended.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 3 +--
 arch/x86/kvm/mmu/mmu_internal.h | 1 +
 arch/x86/kvm/mmu/tdp_mmu.c      | 8 +-------
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 27996fdb0e7e..37385835c399 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1704,8 +1704,7 @@ static void drop_parent_pte(struct kvm_mmu_page *sp,
 	mmu_spte_clear_no_track(parent_pte);
 }
 
-static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
-						      bool direct)
+struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu, bool direct)
 {
 	struct kvm_mmu_page *sp;
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 5f91e4d07a95..d4e2de5f2a6d 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -173,6 +173,7 @@ void unaccount_huge_nx_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 
 struct kvm_mmu_page *kvm_mmu_alloc_direct_sp_for_split(bool locked);
 
+struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu, bool direct);
 void kvm_mmu_free_shadow_page(struct kvm_mmu_page *sp);
 
 #endif /* __KVM_X86_MMU_INTERNAL_H */
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 8b00c868405b..f6201b89045b 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -269,13 +269,7 @@ static struct kvm_mmu_page *tdp_mmu_next_root(struct kvm *kvm,
 
 static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
 {
-	struct kvm_mmu_page *sp;
-
-	sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
-	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
-	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
-
-	return sp;
+	return kvm_mmu_alloc_shadow_page(vcpu, true);
 }
 
 static void tdp_mmu_init_sp(struct kvm_mmu_page *sp, tdp_ptep_t sptep,
-- 
2.35.1.1094.g7c7d902a7c-goog



From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:45 -0800
Subject: [RFC PATCH 25/37] KVM: x86/mmu: Pass root role to kvm_tdp_mmu_get_vcpu_root_hpa()
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-26-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Pass the root role from the caller rather than grabbing it from
vcpu->arch.mmu. This will enable the TDP MMU to be moved to common code
in a future commit by removing a dependency on vcpu->arch.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 2 +-
 arch/x86/kvm/mmu/tdp_mmu.c | 4 ++--
 arch/x86/kvm/mmu/tdp_mmu.h | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 9307608ae975..aea7df3c2dcb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3612,7 +3612,7 @@ static int mmu_alloc_direct_roots(struct kvm_vcpu *vcpu)
 		goto out_unlock;
 
 	if (tdp_mmu_enabled) {
-		root = kvm_tdp_mmu_get_vcpu_root_hpa(vcpu);
+		root = kvm_tdp_mmu_get_vcpu_root_hpa(vcpu, mmu->root_role);
 		mmu->root.hpa = root;
 	} else if (shadow_root_level >= PT64_ROOT_4LEVEL) {
 		root = mmu_alloc_root(vcpu, 0, 0, shadow_root_level);
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index e6708829714c..c5d1c9010d21 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -301,9 +301,9 @@ static void tdp_mmu_init_child_sp(struct kvm_mmu_page *child_sp,
 	tdp_mmu_init_sp(child_sp, iter->sptep, iter->gfn, role);
 }
 
-hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu)
+hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu,
+				    union kvm_mmu_page_role role)
 {
-	union kvm_mmu_page_role role = vcpu->arch.mmu->root_role;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_mmu_page *root;
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index e6a929089715..897608be7f75 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -10,7 +10,8 @@
 int kvm_mmu_init_tdp_mmu(struct kvm *kvm);
 void kvm_mmu_uninit_tdp_mmu(struct kvm *kvm);
 
-hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu);
+hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu,
+				    union kvm_mmu_page_role role);
 
 __must_check static inline bool kvm_tdp_mmu_get_root(struct kvm_mmu_page *root)
 {
-- 
2.39.0.rc1.256.g54fd8350bd-goog



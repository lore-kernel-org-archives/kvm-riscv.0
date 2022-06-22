From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jun 2022 15:26:50 -0400
Subject: [PATCH v7 03/23] KVM: x86/mmu: Stop passing "direct" to mmu_alloc_root()
In-Reply-To: <20220622192710.2547152-1-pbonzini@redhat.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com>
Message-ID: <20220622192710.2547152-4-pbonzini@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Matlack <dmatlack@google.com>

The "direct" argument is vcpu->arch.mmu->root_role.direct,
because unlike non-root page tables, it's impossible to have
a direct root in an indirect MMU.  So just use that.

Suggested-by: Lai Jiangshan <jiangshanlai@gmail.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Message-Id: <20220516232138.1783324-4-dmatlack@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 844b58ddb3bb..2e30398fe59f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3369,8 +3369,9 @@ static int mmu_check_root(struct kvm_vcpu *vcpu, gfn_t root_gfn)
 }
 
 static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, gva_t gva,
-			    u8 level, bool direct)
+			    u8 level)
 {
+	bool direct = vcpu->arch.mmu->root_role.direct;
 	struct kvm_mmu_page *sp;
 
 	sp = kvm_mmu_get_page(vcpu, gfn, gva, level, direct, ACC_ALL);
@@ -3396,7 +3397,7 @@ static int mmu_alloc_direct_roots(struct kvm_vcpu *vcpu)
 		root = kvm_tdp_mmu_get_vcpu_root_hpa(vcpu);
 		mmu->root.hpa = root;
 	} else if (shadow_root_level >= PT64_ROOT_4LEVEL) {
-		root = mmu_alloc_root(vcpu, 0, 0, shadow_root_level, true);
+		root = mmu_alloc_root(vcpu, 0, 0, shadow_root_level);
 		mmu->root.hpa = root;
 	} else if (shadow_root_level == PT32E_ROOT_LEVEL) {
 		if (WARN_ON_ONCE(!mmu->pae_root)) {
@@ -3408,7 +3409,7 @@ static int mmu_alloc_direct_roots(struct kvm_vcpu *vcpu)
 			WARN_ON_ONCE(IS_VALID_PAE_ROOT(mmu->pae_root[i]));
 
 			root = mmu_alloc_root(vcpu, i << (30 - PAGE_SHIFT),
-					      i << 30, PT32_ROOT_LEVEL, true);
+					      i << 30, PT32_ROOT_LEVEL);
 			mmu->pae_root[i] = root | PT_PRESENT_MASK |
 					   shadow_me_value;
 		}
@@ -3532,7 +3533,7 @@ static int mmu_alloc_shadow_roots(struct kvm_vcpu *vcpu)
 	 */
 	if (mmu->cpu_role.base.level >= PT64_ROOT_4LEVEL) {
 		root = mmu_alloc_root(vcpu, root_gfn, 0,
-				      mmu->root_role.level, false);
+				      mmu->root_role.level);
 		mmu->root.hpa = root;
 		goto set_root_pgd;
 	}
@@ -3578,7 +3579,7 @@ static int mmu_alloc_shadow_roots(struct kvm_vcpu *vcpu)
 		}
 
 		root = mmu_alloc_root(vcpu, root_gfn, i << 30,
-				      PT32_ROOT_LEVEL, false);
+				      PT32_ROOT_LEVEL);
 		mmu->pae_root[i] = root | pm_mask;
 	}
 
-- 
2.31.1




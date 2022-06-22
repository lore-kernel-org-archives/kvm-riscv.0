From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jun 2022 15:26:52 -0400
Subject: [PATCH v7 05/23] KVM: x86/mmu: Always pass 0 for @quadrant when gptes are 8 bytes
In-Reply-To: <20220622192710.2547152-1-pbonzini@redhat.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com>
Message-ID: <20220622192710.2547152-6-pbonzini@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Matlack <dmatlack@google.com>

The quadrant is only used when gptes are 4 bytes, but
mmu_alloc_{direct,shadow}_roots() pass in a non-zero quadrant for PAE
page directories regardless. Make this less confusing by only passing in
a non-zero quadrant when it is actually necessary.

Signed-off-by: David Matlack <dmatlack@google.com>
Message-Id: <20220516232138.1783324-6-dmatlack@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index fd1b479bf7fc..f4e7978a6c6a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3389,9 +3389,10 @@ static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, int quadrant,
 	struct kvm_mmu_page *sp;
 
 	role.level = level;
+	role.quadrant = quadrant;
 
-	if (role.has_4_byte_gpte)
-		role.quadrant = quadrant;
+	WARN_ON_ONCE(quadrant && !role.has_4_byte_gpte);
+	WARN_ON_ONCE(role.direct && role.has_4_byte_gpte);
 
 	sp = kvm_mmu_get_page(vcpu, gfn, role);
 	++sp->root_count;
@@ -3427,7 +3428,7 @@ static int mmu_alloc_direct_roots(struct kvm_vcpu *vcpu)
 		for (i = 0; i < 4; ++i) {
 			WARN_ON_ONCE(IS_VALID_PAE_ROOT(mmu->pae_root[i]));
 
-			root = mmu_alloc_root(vcpu, i << (30 - PAGE_SHIFT), i,
+			root = mmu_alloc_root(vcpu, i << (30 - PAGE_SHIFT), 0,
 					      PT32_ROOT_LEVEL);
 			mmu->pae_root[i] = root | PT_PRESENT_MASK |
 					   shadow_me_value;
@@ -3512,9 +3513,8 @@ static int mmu_alloc_shadow_roots(struct kvm_vcpu *vcpu)
 	struct kvm_mmu *mmu = vcpu->arch.mmu;
 	u64 pdptrs[4], pm_mask;
 	gfn_t root_gfn, root_pgd;
+	int quadrant, i, r;
 	hpa_t root;
-	unsigned i;
-	int r;
 
 	root_pgd = mmu->get_guest_pgd(vcpu);
 	root_gfn = root_pgd >> PAGE_SHIFT;
@@ -3597,7 +3597,15 @@ static int mmu_alloc_shadow_roots(struct kvm_vcpu *vcpu)
 			root_gfn = pdptrs[i] >> PAGE_SHIFT;
 		}
 
-		root = mmu_alloc_root(vcpu, root_gfn, i, PT32_ROOT_LEVEL);
+		/*
+		 * If shadowing 32-bit non-PAE page tables, each PAE page
+		 * directory maps one quarter of the guest's non-PAE page
+		 * directory. Othwerise each PAE page direct shadows one guest
+		 * PAE page directory so that quadrant should be 0.
+		 */
+		quadrant = (mmu->cpu_role.base.level == PT32_ROOT_LEVEL) ? i : 0;
+
+		root = mmu_alloc_root(vcpu, root_gfn, quadrant, PT32_ROOT_LEVEL);
 		mmu->pae_root[i] = root | pm_mask;
 	}
 
-- 
2.31.1




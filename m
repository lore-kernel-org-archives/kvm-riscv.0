From: David Matlack <dmatlack@google.com>
Date: Fri, 11 Mar 2022 00:25:09 +0000
Subject: [PATCH v2 07/26] KVM: x86/mmu: Separate shadow MMU sp allocation from
 initialization
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
Message-ID: <20220311002528.2230172-8-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Separate the code that allocates a new shadow page from the vCPU caches
from the code that initializes it. This is in preparation for creating
new shadow pages from VM ioctls for eager page splitting, where we do
not have access to the vCPU caches.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 519910938478..e866e05c4ba5 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1716,16 +1716,9 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
 	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
 	if (!direct)
 		sp->gfns = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_gfn_array_cache);
+
 	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
 
-	/*
-	 * active_mmu_pages must be a FIFO list, as kvm_zap_obsolete_pages()
-	 * depends on valid pages being added to the head of the list.  See
-	 * comments in kvm_zap_obsolete_pages().
-	 */
-	sp->mmu_valid_gen = vcpu->kvm->arch.mmu_valid_gen;
-	list_add(&sp->link, &vcpu->kvm->arch.active_mmu_pages);
-	kvm_mod_used_mmu_pages(vcpu->kvm, +1);
 	return sp;
 }
 
@@ -2127,27 +2120,31 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 	return sp;
 }
 
-static struct kvm_mmu_page *kvm_mmu_new_shadow_page(struct kvm_vcpu *vcpu,
-						    struct kvm_memory_slot *slot,
-						    gfn_t gfn,
-						    union kvm_mmu_page_role role)
+static void init_shadow_page(struct kvm *kvm, struct kvm_mmu_page *sp,
+			     struct kvm_memory_slot *slot, gfn_t gfn,
+			     union kvm_mmu_page_role role)
 {
-	struct kvm_mmu_page *sp;
 	struct hlist_head *sp_list;
 
-	++vcpu->kvm->stat.mmu_cache_miss;
+	++kvm->stat.mmu_cache_miss;
 
-	sp = kvm_mmu_alloc_shadow_page(vcpu, role.direct);
 	sp->gfn = gfn;
 	sp->role = role;
+	sp->mmu_valid_gen = kvm->arch.mmu_valid_gen;
 
-	sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
+	/*
+	 * active_mmu_pages must be a FIFO list, as kvm_zap_obsolete_pages()
+	 * depends on valid pages being added to the head of the list.  See
+	 * comments in kvm_zap_obsolete_pages().
+	 */
+	list_add(&sp->link, &kvm->arch.active_mmu_pages);
+	kvm_mod_used_mmu_pages(kvm, 1);
+
+	sp_list = &kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
 	hlist_add_head(&sp->hash_link, sp_list);
 
 	if (!role.direct)
-		account_shadowed(vcpu->kvm, slot, sp);
-
-	return sp;
+		account_shadowed(kvm, slot, sp);
 }
 
 static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
@@ -2164,7 +2161,8 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 
 	created = true;
 	slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
-	sp = kvm_mmu_new_shadow_page(vcpu, slot, gfn, role);
+	sp = kvm_mmu_alloc_shadow_page(vcpu, role.direct);
+	init_shadow_page(vcpu->kvm, sp, slot, gfn, role);
 
 out:
 	trace_kvm_mmu_get_page(sp, created);
-- 
2.35.1.723.g4982287a31-goog



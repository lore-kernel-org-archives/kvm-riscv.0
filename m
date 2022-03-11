From: David Matlack <dmatlack@google.com>
Date: Fri, 11 Mar 2022 00:25:08 +0000
Subject: [PATCH v2 06/26] KVM: x86/mmu: Pass memslot to
 kvm_mmu_new_shadow_page()
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
Message-ID: <20220311002528.2230172-7-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Passing the memslot to kvm_mmu_new_shadow_page() avoids the need for the
vCPU pointer when write-protecting indirect 4k shadow pages. This moves
us closer to being able to create new shadow pages during VM ioctls for
eager page splitting, where there is not vCPU pointer.

This change does not negatively impact "Populate memory time" for ept=Y
or ept=N configurations since kvm_vcpu_gfn_to_memslot() caches the last
use slot. So even though we now look up the slot more often, it is a
very cheap check.

Opportunistically move the code to write-protect GFNs shadowed by
PG_LEVEL_4K shadow pages into account_shadowed() to reduce indentation
and consolidate the code. This also eliminates a memslot lookup.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b6fb50e32291..519910938478 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -793,16 +793,14 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn)
 	update_gfn_disallow_lpage_count(slot, gfn, -1);
 }
 
-static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
+static void account_shadowed(struct kvm *kvm,
+			     struct kvm_memory_slot *slot,
+			     struct kvm_mmu_page *sp)
 {
-	struct kvm_memslots *slots;
-	struct kvm_memory_slot *slot;
 	gfn_t gfn;
 
 	kvm->arch.indirect_shadow_pages++;
 	gfn = sp->gfn;
-	slots = kvm_memslots_for_spte_role(kvm, sp->role);
-	slot = __gfn_to_memslot(slots, gfn);
 
 	/* the non-leaf shadow pages are keeping readonly. */
 	if (sp->role.level > PG_LEVEL_4K)
@@ -810,6 +808,9 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
 						    KVM_PAGE_TRACK_WRITE);
 
 	kvm_mmu_gfn_disallow_lpage(slot, gfn);
+
+	if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
+		kvm_flush_remote_tlbs_with_address(kvm, gfn, 1);
 }
 
 void account_huge_nx_page(struct kvm *kvm, struct kvm_mmu_page *sp)
@@ -2127,6 +2128,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 }
 
 static struct kvm_mmu_page *kvm_mmu_new_shadow_page(struct kvm_vcpu *vcpu,
+						    struct kvm_memory_slot *slot,
 						    gfn_t gfn,
 						    union kvm_mmu_page_role role)
 {
@@ -2142,11 +2144,8 @@ static struct kvm_mmu_page *kvm_mmu_new_shadow_page(struct kvm_vcpu *vcpu,
 	sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
 	hlist_add_head(&sp->hash_link, sp_list);
 
-	if (!role.direct) {
-		account_shadowed(vcpu->kvm, sp);
-		if (role.level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
-			kvm_flush_remote_tlbs_with_address(vcpu->kvm, gfn, 1);
-	}
+	if (!role.direct)
+		account_shadowed(vcpu->kvm, slot, sp);
 
 	return sp;
 }
@@ -2155,6 +2154,7 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 						    gfn_t gfn,
 						    union kvm_mmu_page_role role)
 {
+	struct kvm_memory_slot *slot;
 	struct kvm_mmu_page *sp;
 	bool created = false;
 
@@ -2163,7 +2163,8 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 		goto out;
 
 	created = true;
-	sp = kvm_mmu_new_shadow_page(vcpu, gfn, role);
+	slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
+	sp = kvm_mmu_new_shadow_page(vcpu, slot, gfn, role);
 
 out:
 	trace_kvm_mmu_get_page(sp, created);
-- 
2.35.1.723.g4982287a31-goog



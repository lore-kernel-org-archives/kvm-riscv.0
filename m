From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:29 +0000
Subject: [PATCH v5.5 28/30] KVM: Optimize overlapping memslots check
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-29-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Do a quick lookup for possibly overlapping gfns when creating or moving
a memslot instead of performing a linear scan of the whole memslot set.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
[sean: tweaked params to avoid churn in future cleanup]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 46 +++++++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d095e01838bf..d22e40225703 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1800,6 +1800,29 @@ static int kvm_set_memslot(struct kvm *kvm,
 	return 0;
 }
 
+static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
+				      gfn_t start, gfn_t end)
+{
+	int idx = slots->node_idx;
+	struct rb_node *node;
+
+	kvm_for_each_memslot_in_gfn_range(node, slots, start, end) {
+		struct kvm_memory_slot *cslot;
+		gfn_t cend;
+
+		cslot = container_of(node, struct kvm_memory_slot, gfn_node[idx]);
+		cend = cslot->base_gfn + cslot->npages;
+		if (cslot->id == id)
+			continue;
+
+		/* kvm_for_each_in_gfn_no_more() guarantees that cslot->base_gfn < nend */
+		if (cend > start)
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * Allocate some memory and give it an address in the guest physical address
  * space.
@@ -1811,8 +1834,9 @@ static int kvm_set_memslot(struct kvm *kvm,
 int __kvm_set_memory_region(struct kvm *kvm,
 			    const struct kvm_userspace_memory_region *mem)
 {
-	struct kvm_memory_slot *old, *tmp;
+	struct kvm_memory_slot *old;
 	struct kvm_memory_slot new;
+	struct kvm_memslots *slots;
 	enum kvm_mr_change change;
 	int as_id, id;
 	int r;
@@ -1841,11 +1865,13 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
 		return -EINVAL;
 
+	slots = __kvm_memslots(kvm, as_id);
+
 	/*
 	 * Note, the old memslot (and the pointer itself!) may be invalidated
 	 * and/or destroyed by kvm_set_memslot().
 	 */
-	old = id_to_memslot(__kvm_memslots(kvm, as_id), id);
+	old = id_to_memslot(slots, id);
 
 	if (!mem->memory_size) {
 		if (!old || !old->npages)
@@ -1894,18 +1920,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			return 0;
 	}
 
-	if ((change == KVM_MR_CREATE) || (change == KVM_MR_MOVE)) {
-		int bkt;
-
-		/* Check for overlaps */
-		kvm_for_each_memslot(tmp, bkt, __kvm_memslots(kvm, as_id)) {
-			if (tmp->id == id)
-				continue;
-			if (!((new.base_gfn + new.npages <= tmp->base_gfn) ||
-			      (new.base_gfn >= tmp->base_gfn + tmp->npages)))
-				return -EEXIST;
-		}
-	}
+	if ((change == KVM_MR_CREATE || change == KVM_MR_MOVE) &&
+	    kvm_check_memslot_overlap(slots, id, new.base_gfn,
+				      new.base_gfn + new.npages))
+		return -EEXIST;
 
 	return kvm_set_memslot(kvm, old, &new, change);
 }
-- 
2.33.1.1089.g2158813163f-goog



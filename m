From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:28 +0000
Subject: [PATCH v5.5 27/30] KVM: Optimize gfn lookup in kvm_zap_gfn_range()
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-28-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Introduce a memslots gfn upper bound operation and use it to optimize
kvm_zap_gfn_range().
This way this handler can do a quick lookup for intersecting gfns and won't
have to do a linear scan of the whole memslot set.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Not-signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 11 +++++--
 include/linux/kvm_host.h | 69 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 09ff0ccaa203..14e41278c069 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5714,16 +5714,20 @@ static bool __kvm_zap_rmaps(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 {
 	const struct kvm_memory_slot *memslot;
 	struct kvm_memslots *slots;
+	struct rb_node *node;
 	bool flush = false;
 	gfn_t start, end;
-	int i, bkt;
+	int i, idx;
 
 	if (!kvm_memslots_have_rmaps(kvm))
 		return flush;
 
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
 		slots = __kvm_memslots(kvm, i);
-		kvm_for_each_memslot(memslot, bkt, slots) {
+		idx = slots->node_idx;
+
+		kvm_for_each_memslot_in_gfn_range(node, slots, gfn_start, gfn_end) {
+			memslot = container_of(node, struct kvm_memory_slot, gfn_node[idx]);
 			start = max(gfn_start, memslot->base_gfn);
 			end = min(gfn_end, memslot->base_gfn + memslot->npages);
 			if (start >= end)
@@ -5747,6 +5751,9 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 	bool flush;
 	int i;
 
+	if (WARN_ON_ONCE(gfn_end <= gfn_start))
+		return;
+
 	write_lock(&kvm->mmu_lock);
 
 	kvm_inc_notifier_count(kvm, gfn_start, gfn_end);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6888f3c2e04b..810a5b958697 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -832,6 +832,75 @@ struct kvm_memory_slot *id_to_memslot(struct kvm_memslots *slots, int id)
 	return NULL;
 }
 
+static inline
+struct rb_node *kvm_memslots_gfn_upper_bound(struct kvm_memslots *slots, gfn_t gfn)
+{
+	int idx = slots->node_idx;
+	struct rb_node *node, *result = NULL;
+
+	for (node = slots->gfn_tree.rb_node; node; ) {
+		struct kvm_memory_slot *slot;
+
+		slot = container_of(node, struct kvm_memory_slot, gfn_node[idx]);
+		if (gfn < slot->base_gfn) {
+			result = node;
+			node = node->rb_left;
+		} else
+			node = node->rb_right;
+	}
+
+	return result;
+}
+
+static inline
+struct rb_node *kvm_for_each_in_gfn_first(struct kvm_memslots *slots, gfn_t start)
+{
+	struct rb_node *node;
+
+	/*
+	 * Find the slot with the lowest gfn that can possibly intersect with
+	 * the range, so we'll ideally have slot start <= range start
+	 */
+	node = kvm_memslots_gfn_upper_bound(slots, start);
+	if (node) {
+		struct rb_node *pnode;
+
+		/*
+		 * A NULL previous node means that the very first slot
+		 * already has a higher start gfn.
+		 * In this case slot start > range start.
+		 */
+		pnode = rb_prev(node);
+		if (pnode)
+			node = pnode;
+	} else {
+		/* a NULL node below means no slots */
+		node = rb_last(&slots->gfn_tree);
+	}
+
+	return node;
+}
+
+static inline
+bool kvm_for_each_in_gfn_no_more(struct kvm_memslots *slots, struct rb_node *node, gfn_t end)
+{
+	struct kvm_memory_slot *memslot;
+
+	memslot = container_of(node, struct kvm_memory_slot, gfn_node[slots->node_idx]);
+
+	/*
+	 * If this slot starts beyond or at the end of the range so does
+	 * every next one
+	 */
+	return memslot->base_gfn >= end;
+}
+
+/* Iterate over each memslot *possibly* intersecting [start, end) range */
+#define kvm_for_each_memslot_in_gfn_range(node, slots, start, end)	\
+	for (node = kvm_for_each_in_gfn_first(slots, start);		\
+	     node && !kvm_for_each_in_gfn_no_more(slots, node, end);	\
+	     node = rb_next(node))					\
+
 /*
  * KVM_SET_USER_MEMORY_REGION ioctl allows the following operations:
  * - create a new memory slot
-- 
2.33.1.1089.g2158813163f-goog



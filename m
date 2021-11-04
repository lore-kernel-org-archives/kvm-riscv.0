From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:24 +0000
Subject: [PATCH v5.5 23/30] KVM: Resolve memslot ID via a hash table instead
 of via a static array
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-24-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Memslot ID to the corresponding memslot mappings are currently kept as
indices in static id_to_index array.
The size of this array depends on the maximum allowed memslot count
(regardless of the number of memslots actually in use).

This has become especially problematic recently, when memslot count cap was
removed, so the maximum count is now full 32k memslots - the maximum
allowed by the current KVM API.

Keeping these IDs in a hash table (instead of an array) avoids this
problem.

Resolving a memslot ID to the actual memslot (instead of its index) will
also enable transitioning away from an array-based implementation of the
whole memslots structure in a later commit.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 16 +++----
 virt/kvm/kvm_main.c      | 96 +++++++++++++++++++++++++++++++---------
 2 files changed, 84 insertions(+), 28 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d46937a3a4e..81003e3acd53 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -29,6 +29,7 @@
 #include <linux/refcount.h>
 #include <linux/nospec.h>
 #include <linux/notifier.h>
+#include <linux/hashtable.h>
 #include <asm/signal.h>
 
 #include <linux/kvm.h>
@@ -425,6 +426,7 @@ static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
 #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
 
 struct kvm_memory_slot {
+	struct hlist_node id_node;
 	gfn_t base_gfn;
 	unsigned long npages;
 	unsigned long *dirty_bitmap;
@@ -527,7 +529,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 struct kvm_memslots {
 	u64 generation;
 	/* The mapping table from slot id to the index in memslots[]. */
-	short id_to_index[KVM_MEM_SLOTS_NUM];
+	DECLARE_HASHTABLE(id_hash, 7);
 	atomic_t last_used_slot;
 	int used_slots;
 	struct kvm_memory_slot memslots[];
@@ -789,16 +791,14 @@ static inline struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu)
 static inline
 struct kvm_memory_slot *id_to_memslot(struct kvm_memslots *slots, int id)
 {
-	int index = slots->id_to_index[id];
 	struct kvm_memory_slot *slot;
 
-	if (index < 0)
-		return NULL;
+	hash_for_each_possible(slots->id_hash, slot, id_node, id) {
+		if (slot->id == id)
+			return slot;
+	}
 
-	slot = &slots->memslots[index];
-
-	WARN_ON(slot->id != id);
-	return slot;
+	return NULL;
 }
 
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d45d574a5a2d..13c497abaab8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -853,15 +853,13 @@ static void kvm_destroy_pm_notifier(struct kvm *kvm)
 
 static struct kvm_memslots *kvm_alloc_memslots(void)
 {
-	int i;
 	struct kvm_memslots *slots;
 
 	slots = kvzalloc(sizeof(struct kvm_memslots), GFP_KERNEL_ACCOUNT);
 	if (!slots)
 		return NULL;
 
-	for (i = 0; i < KVM_MEM_SLOTS_NUM; i++)
-		slots->id_to_index[i] = -1;
+	hash_init(slots->id_hash);
 
 	return slots;
 }
@@ -1259,17 +1257,49 @@ static int kvm_alloc_dirty_bitmap(struct kvm_memory_slot *memslot)
 	return 0;
 }
 
+static void kvm_replace_memslot(struct kvm_memslots *slots,
+				struct kvm_memory_slot *old,
+				struct kvm_memory_slot *new)
+{
+	/*
+	 * Remove the old memslot from the hash list, copying the node data
+	 * would corrupt the list.
+	 */
+	if (old) {
+		hash_del(&old->id_node);
+
+		if (!new)
+			return;
+	}
+
+	/* Copy the source *data*, not the pointer, to the destination. */
+	if (old)
+		*new = *old;
+
+	/* (Re)Add the new memslot. */
+	hash_add(slots->id_hash, &new->id_node, new->id);
+}
+
+static void kvm_shift_memslot(struct kvm_memslots *slots, int dst, int src)
+{
+	struct kvm_memory_slot *mslots = slots->memslots;
+
+	kvm_replace_memslot(slots, &mslots[src], &mslots[dst]);
+}
+
 /*
  * Delete a memslot by decrementing the number of used slots and shifting all
  * other entries in the array forward one spot.
+ * @memslot is a detached dummy struct with just .id and .as_id filled.
  */
 static inline void kvm_memslot_delete(struct kvm_memslots *slots,
 				      struct kvm_memory_slot *memslot)
 {
 	struct kvm_memory_slot *mslots = slots->memslots;
+	struct kvm_memory_slot *oldslot = id_to_memslot(slots, memslot->id);
 	int i;
 
-	if (WARN_ON(slots->id_to_index[memslot->id] == -1))
+	if (WARN_ON(!oldslot))
 		return;
 
 	slots->used_slots--;
@@ -1277,12 +1307,17 @@ static inline void kvm_memslot_delete(struct kvm_memslots *slots,
 	if (atomic_read(&slots->last_used_slot) >= slots->used_slots)
 		atomic_set(&slots->last_used_slot, 0);
 
-	for (i = slots->id_to_index[memslot->id]; i < slots->used_slots; i++) {
-		mslots[i] = mslots[i + 1];
-		slots->id_to_index[mslots[i].id] = i;
-	}
+	/*
+	 * Remove the to-be-deleted memslot from the list _before_ shifting
+	 * the trailing memslots forward, its data will be overwritten.
+	 * Defer the (somewhat pointless) copying of the memslot until after
+	 * the last slot has been shifted to avoid overwriting said last slot.
+	 */
+	kvm_replace_memslot(slots, oldslot, NULL);
+
+	for (i = oldslot - mslots; i < slots->used_slots; i++)
+		kvm_shift_memslot(slots, i, i + 1);
 	mslots[i] = *memslot;
-	slots->id_to_index[memslot->id] = -1;
 }
 
 /*
@@ -1300,30 +1335,39 @@ static inline int kvm_memslot_insert_back(struct kvm_memslots *slots)
  * itself is not preserved in the array, i.e. not swapped at this time, only
  * its new index into the array is tracked.  Returns the changed memslot's
  * current index into the memslots array.
+ * The memslot at the returned index will not be in @slots->id_hash by then.
+ * @memslot is a detached struct with desired final data of the changed slot.
  */
 static inline int kvm_memslot_move_backward(struct kvm_memslots *slots,
 					    struct kvm_memory_slot *memslot)
 {
 	struct kvm_memory_slot *mslots = slots->memslots;
+	struct kvm_memory_slot *oldslot = id_to_memslot(slots, memslot->id);
 	int i;
 
-	if (slots->id_to_index[memslot->id] == -1 || !slots->used_slots)
+	if (!oldslot || !slots->used_slots)
 		return -1;
 
+	/*
+	 * Delete the slot from the hash table before sorting the remaining
+	 * slots, the slot's data may be overwritten when copying slots as part
+	 * of the sorting proccess.  update_memslots() will unconditionally
+	 * rewrite the entire slot and re-add it to the hash table.
+	 */
+	kvm_replace_memslot(slots, oldslot, NULL);
+
 	/*
 	 * Move the target memslot backward in the array by shifting existing
 	 * memslots with a higher GFN (than the target memslot) towards the
 	 * front of the array.
 	 */
-	for (i = slots->id_to_index[memslot->id]; i < slots->used_slots - 1; i++) {
+	for (i = oldslot - mslots; i < slots->used_slots - 1; i++) {
 		if (memslot->base_gfn > mslots[i + 1].base_gfn)
 			break;
 
 		WARN_ON_ONCE(memslot->base_gfn == mslots[i + 1].base_gfn);
 
-		/* Shift the next memslot forward one and update its index. */
-		mslots[i] = mslots[i + 1];
-		slots->id_to_index[mslots[i].id] = i;
+		kvm_shift_memslot(slots, i, i + 1);
 	}
 	return i;
 }
@@ -1334,6 +1378,10 @@ static inline int kvm_memslot_move_backward(struct kvm_memslots *slots,
  * is not preserved in the array, i.e. not swapped at this time, only its new
  * index into the array is tracked.  Returns the changed memslot's final index
  * into the memslots array.
+ * The memslot at the returned index will not be in @slots->id_hash by then.
+ * @memslot is a detached struct with desired final data of the new or
+ * changed slot.
+ * Assumes that the memslot at @start index is not in @slots->id_hash.
  */
 static inline int kvm_memslot_move_forward(struct kvm_memslots *slots,
 					   struct kvm_memory_slot *memslot,
@@ -1348,9 +1396,7 @@ static inline int kvm_memslot_move_forward(struct kvm_memslots *slots,
 
 		WARN_ON_ONCE(memslot->base_gfn == mslots[i - 1].base_gfn);
 
-		/* Shift the next memslot back one and update its index. */
-		mslots[i] = mslots[i - 1];
-		slots->id_to_index[mslots[i].id] = i;
+		kvm_shift_memslot(slots, i, i - 1);
 	}
 	return i;
 }
@@ -1395,6 +1441,9 @@ static inline int kvm_memslot_move_forward(struct kvm_memslots *slots,
  * most likely to be referenced, sorting it to the front of the array was
  * advantageous.  The current binary search starts from the middle of the array
  * and uses an LRU pointer to improve performance for all memslots and GFNs.
+ *
+ * @memslot is a detached struct, not a part of the current or new memslot
+ * array.
  */
 static void update_memslots(struct kvm_memslots *slots,
 			    struct kvm_memory_slot *memslot,
@@ -1419,7 +1468,7 @@ static void update_memslots(struct kvm_memslots *slots,
 		 * its index accordingly.
 		 */
 		slots->memslots[i] = *memslot;
-		slots->id_to_index[memslot->id] = i;
+		kvm_replace_memslot(slots, NULL, &slots->memslots[i]);
 	}
 }
 
@@ -1512,6 +1561,7 @@ static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
 {
 	struct kvm_memslots *slots;
 	size_t new_size;
+	struct kvm_memory_slot *memslot;
 
 	if (change == KVM_MR_CREATE)
 		new_size = kvm_memslots_size(old->used_slots + 1);
@@ -1519,8 +1569,14 @@ static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
 		new_size = kvm_memslots_size(old->used_slots);
 
 	slots = kvzalloc(new_size, GFP_KERNEL_ACCOUNT);
-	if (likely(slots))
-		memcpy(slots, old, kvm_memslots_size(old->used_slots));
+	if (unlikely(!slots))
+		return NULL;
+
+	memcpy(slots, old, kvm_memslots_size(old->used_slots));
+
+	hash_init(slots->id_hash);
+	kvm_for_each_memslot(memslot, slots)
+		hash_add(slots->id_hash, &memslot->id_node, memslot->id);
 
 	return slots;
 }
-- 
2.33.1.1089.g2158813163f-goog



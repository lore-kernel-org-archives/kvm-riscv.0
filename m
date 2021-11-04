From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:22 +0000
Subject: [PATCH v5.5 21/30] KVM: Integrate gfn_to_memslot_approx() into
 search_memslots()
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-22-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

s390 arch has gfn_to_memslot_approx() which is almost identical to
search_memslots(), differing only in that in case the gfn falls in a hole
one of the memslots bordering the hole is returned.

Add this lookup mode as an option to search_memslots() so we don't have two
almost identical functions for looking up a memslot by its gfn.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
[sean: tweaked helper names to keep gfn_to_memslot_approx() in s390]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c | 45 +++++++---------------------------------
 include/linux/kvm_host.h | 35 ++++++++++++++++++++++++-------
 virt/kvm/kvm_main.c      |  2 +-
 3 files changed, 36 insertions(+), 46 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index c4d0ed5f3400..4e032e176216 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -1941,41 +1941,6 @@ static long kvm_s390_set_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
 /* for consistency */
 #define KVM_S390_CMMA_SIZE_MAX ((u32)KVM_S390_SKEYS_MAX)
 
-/*
- * Similar to gfn_to_memslot, but returns the index of a memslot also when the
- * address falls in a hole. In that case the index of one of the memslots
- * bordering the hole is returned.
- */
-static int gfn_to_memslot_approx(struct kvm_memslots *slots, gfn_t gfn)
-{
-	int start = 0, end = slots->used_slots;
-	int slot = atomic_read(&slots->last_used_slot);
-	struct kvm_memory_slot *memslots = slots->memslots;
-
-	if (gfn >= memslots[slot].base_gfn &&
-	    gfn < memslots[slot].base_gfn + memslots[slot].npages)
-		return slot;
-
-	while (start < end) {
-		slot = start + (end - start) / 2;
-
-		if (gfn >= memslots[slot].base_gfn)
-			end = slot;
-		else
-			start = slot + 1;
-	}
-
-	if (start >= slots->used_slots)
-		return slots->used_slots - 1;
-
-	if (gfn >= memslots[start].base_gfn &&
-	    gfn < memslots[start].base_gfn + memslots[start].npages) {
-		atomic_set(&slots->last_used_slot, start);
-	}
-
-	return start;
-}
-
 static int kvm_s390_peek_cmma(struct kvm *kvm, struct kvm_s390_cmma_log *args,
 			      u8 *res, unsigned long bufsize)
 {
@@ -1999,11 +1964,17 @@ static int kvm_s390_peek_cmma(struct kvm *kvm, struct kvm_s390_cmma_log *args,
 	return 0;
 }
 
+static struct kvm_memory_slot *gfn_to_memslot_approx(struct kvm_memslots *slots,
+						     gfn_t gfn)
+{
+	return ____gfn_to_memslot(slots, gfn, true);
+}
+
 static unsigned long kvm_s390_next_dirty_cmma(struct kvm_memslots *slots,
 					      unsigned long cur_gfn)
 {
-	int slotidx = gfn_to_memslot_approx(slots, cur_gfn);
-	struct kvm_memory_slot *ms = slots->memslots + slotidx;
+	struct kvm_memory_slot *ms = gfn_to_memslot_approx(slots, cur_gfn);
+	int slotidx = ms - slots->memslots;
 	unsigned long ofs = cur_gfn - ms->base_gfn;
 
 	if (ms->base_gfn + ms->npages <= cur_gfn) {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2ef946e94a73..9d46937a3a4e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1230,10 +1230,14 @@ try_get_memslot(struct kvm_memslots *slots, int slot_index, gfn_t gfn)
  * Returns a pointer to the memslot that contains gfn and records the index of
  * the slot in index. Otherwise returns NULL.
  *
+ * With "approx" set returns the memslot also when the address falls
+ * in a hole. In that case one of the memslots bordering the hole is
+ * returned.
+ *
  * IMPORTANT: Slots are sorted from highest GFN to lowest GFN!
  */
 static inline struct kvm_memory_slot *
-search_memslots(struct kvm_memslots *slots, gfn_t gfn, int *index)
+search_memslots(struct kvm_memslots *slots, gfn_t gfn, int *index, bool approx)
 {
 	int start = 0, end = slots->used_slots;
 	struct kvm_memory_slot *memslots = slots->memslots;
@@ -1251,22 +1255,26 @@ search_memslots(struct kvm_memslots *slots, gfn_t gfn, int *index)
 			start = slot + 1;
 	}
 
+	if (approx && start >= slots->used_slots) {
+		*index = slots->used_slots - 1;
+		return &memslots[slots->used_slots - 1];
+	}
+
 	slot = try_get_memslot(slots, start, gfn);
 	if (slot) {
 		*index = start;
 		return slot;
 	}
+	if (approx) {
+		*index = start;
+		return &memslots[start];
+	}
 
 	return NULL;
 }
 
-/*
- * __gfn_to_memslot() and its descendants are here because it is called from
- * non-modular code in arch/powerpc/kvm/book3s_64_vio{,_hv}.c. gfn_to_memslot()
- * itself isn't here as an inline because that would bloat other code too much.
- */
 static inline struct kvm_memory_slot *
-__gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn)
+____gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn, bool approx)
 {
 	struct kvm_memory_slot *slot;
 	int slot_index = atomic_read(&slots->last_used_slot);
@@ -1275,7 +1283,7 @@ __gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn)
 	if (slot)
 		return slot;
 
-	slot = search_memslots(slots, gfn, &slot_index);
+	slot = search_memslots(slots, gfn, &slot_index, approx);
 	if (slot) {
 		atomic_set(&slots->last_used_slot, slot_index);
 		return slot;
@@ -1284,6 +1292,17 @@ __gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn)
 	return NULL;
 }
 
+/*
+ * __gfn_to_memslot() and its descendants are here to allow arch code to inline
+ * the lookups in hot paths.  gfn_to_memslot() itself isn't here as an inline
+ * because that would bloat other code too much.
+ */
+static inline struct kvm_memory_slot *
+__gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn)
+{
+	return ____gfn_to_memslot(slots, gfn, false);
+}
+
 static inline unsigned long
 __gfn_to_hva_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index bbaa01afac43..a2d51ce957e1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2126,7 +2126,7 @@ struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn
 	 * search_memslots() instead of __gfn_to_memslot() to avoid
 	 * thrashing the VM-wide last_used_index in kvm_memslots.
 	 */
-	slot = search_memslots(slots, gfn, &slot_index);
+	slot = search_memslots(slots, gfn, &slot_index, false);
 	if (slot) {
 		vcpu->last_used_slot = slot_index;
 		return slot;
-- 
2.33.1.1089.g2158813163f-goog



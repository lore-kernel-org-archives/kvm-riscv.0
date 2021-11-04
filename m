From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:07 +0000
Subject: [PATCH v5.5 06/30] KVM: Use "new" memslot's address space ID instead
 of dedicated param
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-7-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the address space ID is stored in every slot, including fake
slots used for deletion, use the slot's as_id instead of passing in the
redundant information as a param to kvm_set_memslot().  This will greatly
simplify future memslot work by avoiding passing a large number of
variables around purely to honor @as_id.

Drop a comment in the DELETE path about new->as_id being provided purely
for debug, as that's now a lie.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e5c2d10f6111..39a64e02a43a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1536,7 +1536,7 @@ static void kvm_copy_memslots_arch(struct kvm_memslots *to,
 
 static int kvm_set_memslot(struct kvm *kvm,
 			   const struct kvm_userspace_memory_region *mem,
-			   struct kvm_memory_slot *new, int as_id,
+			   struct kvm_memory_slot *new,
 			   enum kvm_mr_change change)
 {
 	struct kvm_memory_slot *slot, old;
@@ -1559,7 +1559,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 	 */
 	mutex_lock(&kvm->slots_arch_lock);
 
-	slots = kvm_dup_memslots(__kvm_memslots(kvm, as_id), change);
+	slots = kvm_dup_memslots(__kvm_memslots(kvm, new->as_id), change);
 	if (!slots) {
 		mutex_unlock(&kvm->slots_arch_lock);
 		return -ENOMEM;
@@ -1579,7 +1579,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		 * dropped by update_memslots anyway.  We'll also revert to the
 		 * old memslots if preparing the new memory region fails.
 		 */
-		slots = install_new_memslots(kvm, as_id, slots);
+		slots = install_new_memslots(kvm, new->as_id, slots);
 
 		/* From this point no new shadow pages pointing to a deleted,
 		 * or moved, memslot will be created.
@@ -1601,7 +1601,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		 * to retrieve memslots *after* acquiring slots_arch_lock, thus
 		 * the active memslots are guaranteed to be fresh.
 		 */
-		kvm_copy_memslots_arch(slots, __kvm_memslots(kvm, as_id));
+		kvm_copy_memslots_arch(slots, __kvm_memslots(kvm, new->as_id));
 	}
 
 	/*
@@ -1618,7 +1618,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		WARN_ON_ONCE(change != KVM_MR_CREATE);
 		memset(&old, 0, sizeof(old));
 		old.id = new->id;
-		old.as_id = as_id;
+		old.as_id = new->as_id;
 	}
 
 	/* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
@@ -1629,7 +1629,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		goto out_slots;
 
 	update_memslots(slots, new, change);
-	slots = install_new_memslots(kvm, as_id, slots);
+	slots = install_new_memslots(kvm, new->as_id, slots);
 
 	/*
 	 * Update the total number of memslot pages before calling the arch
@@ -1651,7 +1651,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 
 out_slots:
 	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE)
-		slots = install_new_memslots(kvm, as_id, slots);
+		slots = install_new_memslots(kvm, new->as_id, slots);
 	else
 		mutex_unlock(&kvm->slots_arch_lock);
 	kvfree(slots);
@@ -1723,13 +1723,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 
 		memset(&new, 0, sizeof(new));
 		new.id = id;
-		/*
-		 * This is only for debugging purpose; it should never be
-		 * referenced for a removed memslot.
-		 */
 		new.as_id = as_id;
 
-		return kvm_set_memslot(kvm, mem, &new, as_id, KVM_MR_DELETE);
+		return kvm_set_memslot(kvm, mem, &new, KVM_MR_DELETE);
 	}
 
 	new.as_id = as_id;
@@ -1792,7 +1788,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			bitmap_set(new.dirty_bitmap, 0, new.npages);
 	}
 
-	r = kvm_set_memslot(kvm, mem, &new, as_id, change);
+	r = kvm_set_memslot(kvm, mem, &new, change);
 	if (r)
 		goto out_bitmap;
 
-- 
2.33.1.1089.g2158813163f-goog



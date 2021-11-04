From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:16 +0000
Subject: [PATCH v5.5 15/30] KVM: Use prepare/commit hooks to handle generic
 memslot metadata updates
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-16-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Handle the generic memslot metadata, a.k.a. dirty bitmap, updates at the
same time that arch handles it's own metadata updates, i.e. at memslot
prepare and commit.  This will simplify converting @new to a dynamically
allocated object, and more closely aligns common KVM with architecture
code.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 109 +++++++++++++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 43 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9c75691b98ba..6c7bbc452dae 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1534,6 +1534,69 @@ static void kvm_copy_memslots_arch(struct kvm_memslots *to,
 		to->memslots[i].arch = from->memslots[i].arch;
 }
 
+static int kvm_prepare_memory_region(struct kvm *kvm,
+				     const struct kvm_memory_slot *old,
+				     struct kvm_memory_slot *new,
+				     enum kvm_mr_change change)
+{
+	int r;
+
+	/*
+	 * If dirty logging is disabled, nullify the bitmap; the old bitmap
+	 * will be freed on "commit".  If logging is enabled in both old and
+	 * new, reuse the existing bitmap.  If logging is enabled only in the
+	 * new and KVM isn't using a ring buffer, allocate and initialize a
+	 * new bitmap.
+	 */
+	if (!(new->flags & KVM_MEM_LOG_DIRTY_PAGES))
+		new->dirty_bitmap = NULL;
+	else if (old->dirty_bitmap)
+		new->dirty_bitmap = old->dirty_bitmap;
+	else if (!kvm->dirty_ring_size) {
+		r = kvm_alloc_dirty_bitmap(new);
+		if (r)
+			return r;
+
+		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
+			bitmap_set(new->dirty_bitmap, 0, new->npages);
+	}
+
+	r = kvm_arch_prepare_memory_region(kvm, old, new, change);
+
+	/* Free the bitmap on failure if it was allocated above. */
+	if (r && new->dirty_bitmap && !old->dirty_bitmap)
+		kvm_destroy_dirty_bitmap(new);
+
+	return r;
+}
+
+static void kvm_commit_memory_region(struct kvm *kvm,
+				     struct kvm_memory_slot *old,
+				     const struct kvm_memory_slot *new,
+				     enum kvm_mr_change change)
+{
+	/*
+	 * Update the total number of memslot pages before calling the arch
+	 * hook so that architectures can consume the result directly.
+	 */
+	if (change == KVM_MR_DELETE)
+		kvm->nr_memslot_pages -= old->npages;
+	else if (change == KVM_MR_CREATE)
+		kvm->nr_memslot_pages += new->npages;
+
+	kvm_arch_commit_memory_region(kvm, old, new, change);
+
+	/*
+	 * Free the old memslot's metadata.  On DELETE, free the whole thing,
+	 * otherwise free the dirty bitmap as needed (the below effectively
+	 * checks both the flags and whether a ring buffer is being used).
+	 */
+	if (change == KVM_MR_DELETE)
+		kvm_free_memslot(kvm, old);
+	else if (old->dirty_bitmap && !new->dirty_bitmap)
+		kvm_destroy_dirty_bitmap(old);
+}
+
 static int kvm_set_memslot(struct kvm *kvm,
 			   struct kvm_memory_slot *new,
 			   enum kvm_mr_change change)
@@ -1620,27 +1683,14 @@ static int kvm_set_memslot(struct kvm *kvm,
 		old.as_id = new->as_id;
 	}
 
-	r = kvm_arch_prepare_memory_region(kvm, &old, new, change);
+	r = kvm_prepare_memory_region(kvm, &old, new, change);
 	if (r)
 		goto out_slots;
 
 	update_memslots(slots, new, change);
 	slots = install_new_memslots(kvm, new->as_id, slots);
 
-	/*
-	 * Update the total number of memslot pages before calling the arch
-	 * hook so that architectures can consume the result directly.
-	 */
-	if (change == KVM_MR_DELETE)
-		kvm->nr_memslot_pages -= old.npages;
-	else if (change == KVM_MR_CREATE)
-		kvm->nr_memslot_pages += new->npages;
-
-	kvm_arch_commit_memory_region(kvm, &old, new, change);
-
-	/* Free the old memslot's metadata.  Note, this is the full copy!!! */
-	if (change == KVM_MR_DELETE)
-		kvm_free_memslot(kvm, &old);
+	kvm_commit_memory_region(kvm, &old, new, change);
 
 	kvfree(slots);
 	return 0;
@@ -1736,7 +1786,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
 
 	if (!old.npages) {
 		change = KVM_MR_CREATE;
-		new.dirty_bitmap = NULL;
 
 		/*
 		 * To simplify KVM internals, the total number of pages across
@@ -1756,9 +1805,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			change = KVM_MR_FLAGS_ONLY;
 		else /* Nothing to change. */
 			return 0;
-
-		/* Copy dirty_bitmap from the current memslot. */
-		new.dirty_bitmap = old.dirty_bitmap;
 	}
 
 	if ((change == KVM_MR_CREATE) || (change == KVM_MR_MOVE)) {
@@ -1772,30 +1818,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		}
 	}
 
-	/* Allocate/free page dirty bitmap as needed */
-	if (!(new.flags & KVM_MEM_LOG_DIRTY_PAGES))
-		new.dirty_bitmap = NULL;
-	else if (!new.dirty_bitmap && !kvm->dirty_ring_size) {
-		r = kvm_alloc_dirty_bitmap(&new);
-		if (r)
-			return r;
-
-		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-			bitmap_set(new.dirty_bitmap, 0, new.npages);
-	}
-
-	r = kvm_set_memslot(kvm, &new, change);
-	if (r)
-		goto out_bitmap;
-
-	if (old.dirty_bitmap && !new.dirty_bitmap)
-		kvm_destroy_dirty_bitmap(&old);
-	return 0;
-
-out_bitmap:
-	if (new.dirty_bitmap && !old.dirty_bitmap)
-		kvm_destroy_dirty_bitmap(&new);
-	return r;
+	return kvm_set_memslot(kvm, &new, change);
 }
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
 
-- 
2.33.1.1089.g2158813163f-goog



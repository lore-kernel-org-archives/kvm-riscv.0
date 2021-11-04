From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:30 +0000
Subject: [PATCH v5.5 29/30] KVM: Wait 'til the bitter end to initialize the
 "new" memslot
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-30-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Initialize the "new" memslot in the !DELETE path only after the various
sanity checks have passed.  This will allow a future commit to allocate
@new dynamically without having to copy a memslot, and without having to
deal with freeing @new in error paths and in the "nothing to change" path
that's hiding in the sanity checks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d22e40225703..5cc0b50faa8c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1838,6 +1838,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	struct kvm_memory_slot new;
 	struct kvm_memslots *slots;
 	enum kvm_mr_change change;
+	unsigned long npages;
+	gfn_t base_gfn;
 	int as_id, id;
 	int r;
 
@@ -1864,6 +1866,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return -EINVAL;
 	if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
 		return -EINVAL;
+	if ((mem->memory_size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
+		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
 
@@ -1887,15 +1891,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return kvm_set_memslot(kvm, old, &new, KVM_MR_DELETE);
 	}
 
-	new.as_id = as_id;
-	new.id = id;
-	new.base_gfn = mem->guest_phys_addr >> PAGE_SHIFT;
-	new.npages = mem->memory_size >> PAGE_SHIFT;
-	new.flags = mem->flags;
-	new.userspace_addr = mem->userspace_addr;
-
-	if (new.npages > KVM_MEM_MAX_NR_PAGES)
-		return -EINVAL;
+	base_gfn = (mem->guest_phys_addr >> PAGE_SHIFT);
+	npages = (mem->memory_size >> PAGE_SHIFT);
 
 	if (!old || !old->npages) {
 		change = KVM_MR_CREATE;
@@ -1904,27 +1901,33 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		 * To simplify KVM internals, the total number of pages across
 		 * all memslots must fit in an unsigned long.
 		 */
-		if ((kvm->nr_memslot_pages + new.npages) < kvm->nr_memslot_pages)
+		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
-		if ((new.userspace_addr != old->userspace_addr) ||
-		    (new.npages != old->npages) ||
-		    ((new.flags ^ old->flags) & KVM_MEM_READONLY))
+		if ((mem->userspace_addr != old->userspace_addr) ||
+		    (npages != old->npages) ||
+		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
 			return -EINVAL;
 
-		if (new.base_gfn != old->base_gfn)
+		if (base_gfn != old->base_gfn)
 			change = KVM_MR_MOVE;
-		else if (new.flags != old->flags)
+		else if (mem->flags != old->flags)
 			change = KVM_MR_FLAGS_ONLY;
 		else /* Nothing to change. */
 			return 0;
 	}
 
 	if ((change == KVM_MR_CREATE || change == KVM_MR_MOVE) &&
-	    kvm_check_memslot_overlap(slots, id, new.base_gfn,
-				      new.base_gfn + new.npages))
+	    kvm_check_memslot_overlap(slots, id, base_gfn, base_gfn + npages))
 		return -EEXIST;
 
+	new.as_id = as_id;
+	new.id = id;
+	new.base_gfn = base_gfn;
+	new.npages = npages;
+	new.flags = mem->flags;
+	new.userspace_addr = mem->userspace_addr;
+
 	return kvm_set_memslot(kvm, old, &new, change);
 }
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
-- 
2.33.1.1089.g2158813163f-goog



From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:05 +0000
Subject: [PATCH v5.5 04/30] KVM: Open code kvm_delete_memslot() into its only
 caller
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-5-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fold kvm_delete_memslot() into __kvm_set_memory_region() to free up the
"kvm_delete_memslot()" name for use in a future helper.  The delete logic
isn't so complex/long that it truly needs a helper, and it will be
simplified a wee bit further in upcoming commits.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 264c4b16520b..6171ddb3e31c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1653,29 +1653,6 @@ static int kvm_set_memslot(struct kvm *kvm,
 	return r;
 }
 
-static int kvm_delete_memslot(struct kvm *kvm,
-			      const struct kvm_userspace_memory_region *mem,
-			      struct kvm_memory_slot *old, int as_id)
-{
-	struct kvm_memory_slot new;
-
-	if (!old->npages)
-		return -EINVAL;
-
-	if (WARN_ON_ONCE(kvm->nr_memslot_pages < old->npages))
-		return -EIO;
-
-	memset(&new, 0, sizeof(new));
-	new.id = old->id;
-	/*
-	 * This is only for debugging purpose; it should never be referenced
-	 * for a removed memslot.
-	 */
-	new.as_id = as_id;
-
-	return kvm_set_memslot(kvm, mem, &new, as_id, KVM_MR_DELETE);
-}
-
 /*
  * Allocate some memory and give it an address in the guest physical address
  * space.
@@ -1732,8 +1709,23 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		old.id = id;
 	}
 
-	if (!mem->memory_size)
-		return kvm_delete_memslot(kvm, mem, &old, as_id);
+	if (!mem->memory_size) {
+		if (!old.npages)
+			return -EINVAL;
+
+		if (WARN_ON_ONCE(kvm->nr_memslot_pages < old.npages))
+			return -EIO;
+
+		memset(&new, 0, sizeof(new));
+		new.id = id;
+		/*
+		 * This is only for debugging purpose; it should never be
+		 * referenced for a removed memslot.
+		 */
+		new.as_id = as_id;
+
+		return kvm_set_memslot(kvm, mem, &new, as_id, KVM_MR_DELETE);
+	}
 
 	new.as_id = as_id;
 	new.id = id;
-- 
2.33.1.1089.g2158813163f-goog



From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:23 -0700
Subject: [PATCH v12 14/84] KVM: Replace "async" pointer in gfn=>pfn with
 "no_wait" and error code
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-15-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Stevens <stevensd@chromium.org>

Add a pfn error code to communicate that hva_to_pfn() failed because I/O
was needed and disallowed, and convert @async to a constant @no_wait
boolean.  This will allow eliminating the @no_wait param by having callers
pass in FOLL_NOWAIT along with other FOLL_* flags.

Signed-off-by: David Stevens <stevensd@chromium.org>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 18 +++++++++++-------
 include/linux/kvm_host.h |  3 ++-
 virt/kvm/kvm_main.c      | 29 +++++++++++++++--------------
 virt/kvm/kvm_mm.h        |  2 +-
 virt/kvm/pfncache.c      |  4 ++--
 5 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index d76390ef49b2..eb9ad0283fd5 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4328,17 +4328,21 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
 
 static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
-	bool async;
-
 	if (fault->is_private)
 		return kvm_faultin_pfn_private(vcpu, fault);
 
-	async = false;
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, &async,
+	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable,
 					  &fault->hva);
-	if (!async)
-		return RET_PF_CONTINUE; /* *pfn has correct page already */
+
+	/*
+	 * If resolving the page failed because I/O is needed to fault-in the
+	 * page, then either set up an asynchronous #PF to do the I/O, or if
+	 * doing an async #PF isn't possible, retry with I/O allowed.  All
+	 * other failures are terminal, i.e. retrying won't help.
+	 */
+	if (fault->pfn != KVM_PFN_ERR_NEEDS_IO)
+		return RET_PF_CONTINUE;
 
 	if (!fault->prefetch && kvm_can_do_async_pf(vcpu)) {
 		trace_kvm_try_async_get_page(fault->addr, fault->gfn);
@@ -4356,7 +4360,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	 * to wait for IO.  Note, gup always bails if it is unable to quickly
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, NULL,
+	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
 					  fault->write, &fault->map_writable,
 					  &fault->hva);
 	return RET_PF_CONTINUE;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6d4503e8eabe..92b2922e2216 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -97,6 +97,7 @@
 #define KVM_PFN_ERR_HWPOISON	(KVM_PFN_ERR_MASK + 1)
 #define KVM_PFN_ERR_RO_FAULT	(KVM_PFN_ERR_MASK + 2)
 #define KVM_PFN_ERR_SIGPENDING	(KVM_PFN_ERR_MASK + 3)
+#define KVM_PFN_ERR_NEEDS_IO	(KVM_PFN_ERR_MASK + 4)
 
 /*
  * error pfns indicate that the gfn is in slot but faild to
@@ -1218,7 +1219,7 @@ kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable);
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn);
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool interruptible, bool *async,
+			       bool interruptible, bool no_wait,
 			       bool write_fault, bool *writable, hva_t *hva);
 
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 03af1a0090b1..c2efdfe26d5b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2789,7 +2789,7 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
  * The slow path to get the pfn of the specified host virtual address,
  * 1 indicates success, -errno is returned if error is detected.
  */
-static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
+static int hva_to_pfn_slow(unsigned long addr, bool no_wait, bool write_fault,
 			   bool interruptible, bool *writable, kvm_pfn_t *pfn)
 {
 	/*
@@ -2812,7 +2812,7 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 
 	if (write_fault)
 		flags |= FOLL_WRITE;
-	if (async)
+	if (no_wait)
 		flags |= FOLL_NOWAIT;
 	if (interruptible)
 		flags |= FOLL_INTERRUPTIBLE;
@@ -2928,8 +2928,8 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * Pin guest page in memory and return its pfn.
  * @addr: host virtual address which maps memory to the guest
  * @interruptible: whether the process can be interrupted by non-fatal signals
- * @async: whether this function need to wait IO complete if the
- *         host page is not in the memory
+ * @no_wait: whether or not this function need to wait IO complete if the
+ *	     host page is not in the memory
  * @write_fault: whether we should get a writable host page
  * @writable: whether it allows to map a writable host page for !@write_fault
  *
@@ -2938,7 +2938,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * 2): @write_fault = false && @writable, @writable will tell the caller
  *     whether the mapping is writable.
  */
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
+kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 		     bool write_fault, bool *writable)
 {
 	struct vm_area_struct *vma;
@@ -2950,7 +2950,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
 		return pfn;
 
-	npages = hva_to_pfn_slow(addr, async, write_fault, interruptible,
+	npages = hva_to_pfn_slow(addr, no_wait, write_fault, interruptible,
 				 writable, &pfn);
 	if (npages == 1)
 		return pfn;
@@ -2959,7 +2959,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 
 	mmap_read_lock(current->mm);
 	if (npages == -EHWPOISON ||
-	      (!async && check_user_page_hwpoison(addr))) {
+	    (!no_wait && check_user_page_hwpoison(addr))) {
 		pfn = KVM_PFN_ERR_HWPOISON;
 		goto exit;
 	}
@@ -2976,9 +2976,10 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 		if (r < 0)
 			pfn = KVM_PFN_ERR_FAULT;
 	} else {
-		if (async && vma_is_valid(vma, write_fault))
-			*async = true;
-		pfn = KVM_PFN_ERR_FAULT;
+		if (no_wait && vma_is_valid(vma, write_fault))
+			pfn = KVM_PFN_ERR_NEEDS_IO;
+		else
+			pfn = KVM_PFN_ERR_FAULT;
 	}
 exit:
 	mmap_read_unlock(current->mm);
@@ -2986,7 +2987,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 }
 
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool interruptible, bool *async,
+			       bool interruptible, bool no_wait,
 			       bool write_fault, bool *writable, hva_t *hva)
 {
 	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
@@ -3008,21 +3009,21 @@ kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
 		writable = NULL;
 	}
 
-	return hva_to_pfn(addr, interruptible, async, write_fault, writable);
+	return hva_to_pfn(addr, interruptible, no_wait, write_fault, writable);
 }
 EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
 
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
-	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, NULL,
+	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, false,
 				    write_fault, writable, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
 
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, NULL, true, NULL, NULL);
+	return __gfn_to_pfn_memslot(slot, gfn, false, false, true, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index a3fa86f60d6c..51f3fee4ca3f 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -20,7 +20,7 @@
 #define KVM_MMU_UNLOCK(kvm)		spin_unlock(&(kvm)->mmu_lock)
 #endif /* KVM_HAVE_MMU_RWLOCK */
 
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
+kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 		     bool write_fault, bool *writable);
 
 #ifdef CONFIG_HAVE_KVM_PFNCACHE
diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 58c706a610e5..32dc61f48c81 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -197,8 +197,8 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 			cond_resched();
 		}
 
-		/* We always request a writeable mapping */
-		new_pfn = hva_to_pfn(gpc->uhva, false, NULL, true, NULL);
+		/* We always request a writable mapping */
+		new_pfn = hva_to_pfn(gpc->uhva, false, false, true, NULL);
 		if (is_error_noslot_pfn(new_pfn))
 			goto out_error;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog



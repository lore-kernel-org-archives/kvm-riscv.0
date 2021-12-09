From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 09 Dec 2021 20:40:48 +0000
Subject: [PATCH v5 08/12] KVM: Reinstate gfn_to_pfn_cache with
 invalidation support
In-Reply-To: <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-9-dwmw2@infradead.org>
 <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
Message-ID: <b614d9ae0fe7910cfa72eee0b4077776f8012e5f.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-12-09 at 19:34 +0100, Paolo Bonzini wrote:
> Sorry for the late review...


NP, very useful fixes. Thanks. Incremental patch looks like this. It
passes the xen_shinfo_test self-test; will test it with real Xen guests
tomorrow and repost based on your kvm/next tree once it shows up.

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index d8c6e1d4a647..9e3c662f815f 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -124,6 +124,33 @@ static void __release_gpc(struct kvm *kvm, kvm_pfn_t pfn, void *khva,
 	}
 }
 
+static kvm_pfn_t hva_to_pfn_retry(struct kvm *kvm, unsigned long uhva)
+{
+	unsigned long mmu_seq;
+	kvm_pfn_t new_pfn;
+	int retry;
+
+	do {
+		mmu_seq = kvm->mmu_notifier_seq;
+		smp_rmb();
+
+		/* We always request a writeable mapping */
+		new_pfn = hva_to_pfn(uhva, false, NULL, true, NULL);
+		if (is_error_noslot_pfn(new_pfn))
+			break;
+
+		KVM_MMU_READ_LOCK(kvm);
+		retry = mmu_notifier_retry_hva(kvm, mmu_seq, uhva);
+		KVM_MMU_READ_UNLOCK(kvm);
+		if (!retry)
+			break;
+
+		cond_resched();
+	} while (1);
+
+	return new_pfn;
+}
+
 int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
 				 gpa_t gpa, unsigned long len, bool dirty)
 {
@@ -147,7 +174,7 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
 
 	old_gpa = gpc->gpa;
 	old_pfn = gpc->pfn;
-	old_khva = gpc->khva;
+	old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
 	old_uhva = gpc->uhva;
 	old_valid = gpc->valid;
 	old_dirty = gpc->dirty;
@@ -178,8 +205,6 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
 	if (!old_valid || old_uhva != gpc->uhva) {
 		unsigned long uhva = gpc->uhva;
 		void *new_khva = NULL;
-		unsigned long mmu_seq;
-		int retry;
 
 		/* Placeholders for "hva is valid but not yet mapped" */
 		gpc->pfn = KVM_PFN_ERR_FAULT;
@@ -188,28 +213,15 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
 
 		write_unlock_irq(&gpc->lock);
 
-	retry_map:
-		mmu_seq = kvm->mmu_notifier_seq;
-		smp_rmb();
-
-		/* We always request a writeable mapping */
-		new_pfn = hva_to_pfn(uhva, false, NULL, true, NULL);
+		new_pfn = hva_to_pfn_retry(kvm, uhva);
 		if (is_error_noslot_pfn(new_pfn)) {
 			ret = -EFAULT;
 			goto map_done;
 		}
 
-		KVM_MMU_READ_LOCK(kvm);
-		retry = mmu_notifier_retry_hva(kvm, mmu_seq, uhva);
-		KVM_MMU_READ_UNLOCK(kvm);
-		if (retry) {
-			cond_resched();
-			goto retry_map;
-		}
-
 		if (gpc->kernel_map) {
 			if (new_pfn == old_pfn) {
-				new_khva = (void *)((unsigned long)old_khva - page_offset);
+				new_khva = old_khva;
 				old_pfn = KVM_PFN_ERR_FAULT;
 				old_khva = NULL;
 			} else if (pfn_valid(new_pfn)) {
@@ -219,7 +231,9 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
 				new_khva = memremap(pfn_to_hpa(new_pfn), PAGE_SIZE, MEMREMAP_WB);
 #endif
 			}
-			if (!new_khva)
+			if (new_khva)
+				new_khva += page_offset;
+			else
 				ret = -EFAULT;
 		}
 
@@ -232,7 +246,7 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
 		} else {
 			/* At this point, gpc->valid may already have been cleared */
 			gpc->pfn = new_pfn;
-			gpc->khva = new_khva + page_offset;
+			gpc->khva = new_khva;
 		}
 	} else {
 		/* If the HVA?PFN mapping was already valid, don't unmap it. */
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211209/4f810ebb/attachment-0001.p7s>

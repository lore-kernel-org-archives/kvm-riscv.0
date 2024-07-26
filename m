From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:36 -0700
Subject: [PATCH v12 27/84] KVM: pfncache: Precisely track refcounted pages
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-28-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Track refcounted struct page memory using kvm_follow_pfn.refcounted_page
instead of relying on kvm_release_pfn_clean() to correctly detect that the
pfn is associated with a struct page.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/pfncache.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 067daf9ad6ef..728d2c1b488a 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -159,11 +159,14 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 	kvm_pfn_t new_pfn = KVM_PFN_ERR_FAULT;
 	void *new_khva = NULL;
 	unsigned long mmu_seq;
+	struct page *page;
+
 	struct kvm_follow_pfn kfp = {
 		.slot = gpc->memslot,
 		.gfn = gpa_to_gfn(gpc->gpa),
 		.flags = FOLL_WRITE,
 		.hva = gpc->uhva,
+		.refcounted_page = &page,
 	};
 
 	lockdep_assert_held(&gpc->refresh_lock);
@@ -198,7 +201,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 			if (new_khva != old_khva)
 				gpc_unmap(new_pfn, new_khva);
 
-			kvm_release_pfn_clean(new_pfn);
+			kvm_release_page_unused(page);
 
 			cond_resched();
 		}
@@ -218,7 +221,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 			new_khva = gpc_map(new_pfn);
 
 		if (!new_khva) {
-			kvm_release_pfn_clean(new_pfn);
+			kvm_release_page_unused(page);
 			goto out_error;
 		}
 
@@ -236,11 +239,11 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 	gpc->khva = new_khva + offset_in_page(gpc->uhva);
 
 	/*
-	 * Put the reference to the _new_ pfn.  The pfn is now tracked by the
+	 * Put the reference to the _new_ page.  The page is now tracked by the
 	 * cache and can be safely migrated, swapped, etc... as the cache will
 	 * invalidate any mappings in response to relevant mmu_notifier events.
 	 */
-	kvm_release_pfn_clean(new_pfn);
+	kvm_release_page_clean(page);
 
 	return 0;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog



From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:33 -0700
Subject: [PATCH v12 24/84] KVM: Use plain "struct page" pointer instead of
 single-entry array
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-25-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use a single pointer instead of a single-entry array for the struct page
pointer in hva_to_pfn_fast().  Using an array makes the code unnecessarily
annoying to read and update.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3d717a131906..8e83d3f043f1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2763,7 +2763,7 @@ static inline int check_user_page_hwpoison(unsigned long addr)
  */
 static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
-	struct page *page[1];
+	struct page *page;
 
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
@@ -2773,8 +2773,8 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
 
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, page)) {
-		*pfn = page_to_pfn(page[0]);
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
+		*pfn = page_to_pfn(page);
 		if (kfp->map_writable)
 			*kfp->map_writable = true;
 		return true;
-- 
2.46.0.rc1.232.g9752f9e123-goog



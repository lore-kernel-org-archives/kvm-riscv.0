From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:23 -0700
Subject: [PATCH v12 74/84] KVM: Convert gfn_to_page() to use kvm_follow_pfn()
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-75-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert gfn_to_page() to the new kvm_follow_pfn() internal API, which will
eventually allow removing gfn_to_pfn() and kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6dc448602751..d0f55a6ecb31 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3181,14 +3181,16 @@ EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
  */
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 {
-	kvm_pfn_t pfn;
+	struct page *refcounted_page = NULL;
+	struct kvm_follow_pfn kfp = {
+		.slot = gfn_to_memslot(kvm, gfn),
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+		.refcounted_page = &refcounted_page,
+	};
 
-	pfn = gfn_to_pfn(kvm, gfn);
-
-	if (is_error_noslot_pfn(pfn))
-		return NULL;
-
-	return kvm_pfn_to_refcounted_page(pfn);
+	(void)kvm_follow_pfn(&kfp);
+	return refcounted_page;
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog



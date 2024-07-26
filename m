From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:13 -0700
Subject: [PATCH v12 04/84] KVM: Allow calling kvm_release_page_{clean,dirty}()
 on a NULL page pointer
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-5-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
tangible benefit to forcing the callers to pre-check @page, and it ends up
generating a lot of duplicate boilerplate code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fd8c212b8de7..656e931ac39e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3186,7 +3186,7 @@ static void kvm_set_page_accessed(struct page *page)
 
 void kvm_release_page_clean(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
 
 	kvm_set_page_accessed(page);
@@ -3211,7 +3211,7 @@ EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
 
 void kvm_release_page_dirty(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
 
 	kvm_set_page_dirty(page);
-- 
2.46.0.rc1.232.g9752f9e123-goog



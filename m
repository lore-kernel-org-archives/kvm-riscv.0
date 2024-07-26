From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:14 -0700
Subject: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put pages
 that KVM never consumes
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-6-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add an API to release an unused page, i.e. to put a page without marking
it accessed or dirty.  The API will be used when KVM faults-in a page but
bails before installing the guest mapping (and other similar flows).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3d9617d1de41..c5d39a337aa3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1201,6 +1201,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
 unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
 				      bool *writable);
+
+static inline void kvm_release_page_unused(struct page *page)
+{
+	if (!page)
+		return;
+
+	put_page(page);
+}
+
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog



From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:43 -0700
Subject: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without grabbing
 a reference
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-35-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
gfn=>pfn mapping without the caller getting a reference to any underlying
page.  The API will be used in flows that want to know if a gfn points at
a valid pfn, but don't actually need to do anything with the pfn.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 82ca0971c156..5a572cef4adc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1212,6 +1212,8 @@ static inline void kvm_release_page_unused(struct page *page)
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
+kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn);
+
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0b3c0bddaa07..ad84dab8c5dc 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3118,6 +3118,22 @@ kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
 
+kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn)
+{
+	struct page *refcounted_page = NULL;
+	struct kvm_follow_pfn kfp = {
+		.slot = gfn_to_memslot(kvm, gfn),
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+		.refcounted_page = &refcounted_page,
+	};
+	kvm_pfn_t pfn;
+
+	pfn = kvm_follow_pfn(&kfp);
+	kvm_release_page_unused(refcounted_page);
+	return pfn;
+}
+
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages)
 {
-- 
2.46.0.rc1.232.g9752f9e123-goog



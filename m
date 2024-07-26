From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:52 -0700
Subject: [PATCH v12 43/84] KVM: Add kvm_faultin_pfn() to specifically service
 guest page faults
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-44-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a new dedicated API, kvm_faultin_pfn(), for servicing guest page
faults, i.e. for getting pages/pfns that will be mapped into the guest via
an mmu_notifier-protected KVM MMU.  Keep struct kvm_follow_pfn buried in
internal code, as having __kvm_faultin_pfn() take "out" params is actually
cleaner for several architectures, e.g. it allows the caller to have its
own "page fault" structure without having to marshal data to/from
kvm_follow_pfn.

Long term, common KVM would ideally provide a kvm_page_fault structure, a
la x86's struct of the same name.  But all architectures need to be
converted to a common API before that can happen.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 11 +++++++++++
 virt/kvm/kvm_main.c      | 22 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ef0277b77375..e0548ae92659 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1217,6 +1217,17 @@ void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
 kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn);
+kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
+			    unsigned int foll, bool *writable,
+			    struct page **refcounted_page);
+
+static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
+					bool write, bool *writable,
+					struct page **refcounted_page)
+{
+	return __kvm_faultin_pfn(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
+				 write ? FOLL_WRITE : 0, writable, refcounted_page);
+}
 
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ad84dab8c5dc..6dc448602751 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3134,6 +3134,28 @@ kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn)
 	return pfn;
 }
 
+kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
+			    unsigned int foll, bool *writable,
+			    struct page **refcounted_page)
+{
+	struct kvm_follow_pfn kfp = {
+		.slot = slot,
+		.gfn = gfn,
+		.flags = foll,
+		.map_writable = writable,
+		.refcounted_page = refcounted_page,
+	};
+
+	if (WARN_ON_ONCE(!writable || !refcounted_page))
+		return KVM_PFN_ERR_FAULT;
+
+	*writable = false;
+	*refcounted_page = NULL;
+
+	return kvm_follow_pfn(&kfp);
+}
+EXPORT_SYMBOL_GPL(__kvm_faultin_pfn);
+
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages)
 {
-- 
2.46.0.rc1.232.g9752f9e123-goog



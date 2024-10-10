From: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:13 -0700
Subject: [PATCH v13 11/85] KVM: Rename gfn_to_page_many_atomic() to kvm_prefetch_pages()
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
References: <20241010182427.1434605-1-seanjc@google.com>
Message-ID: <20241010182427.1434605-12-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename gfn_to_page_many_atomic() to kvm_prefetch_pages() to try and
communicate its true purpose, as the "atomic" aspect is essentially a
side effect of the fact that x86 uses the API while holding mmu_lock.
E.g. even if mmu_lock weren't held, KVM wouldn't want to fault-in pages,
as the goal is to opportunistically grab surrounding pages that have
already been accessed and/or dirtied by the host, and to do so quickly.

Tested-by: Alex Benn?e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 2 +-
 arch/x86/kvm/mmu/paging_tmpl.h | 2 +-
 include/linux/kvm_host.h       | 4 ++--
 virt/kvm/kvm_main.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 04228a7da69a..5fe45ab0e818 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2958,7 +2958,7 @@ static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
 	if (!slot)
 		return -1;
 
-	ret = gfn_to_page_many_atomic(slot, gfn, pages, end - start);
+	ret = kvm_prefetch_pages(slot, gfn, pages, end - start);
 	if (ret <= 0)
 		return -1;
 
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 36b2607280f0..143b7e9f26dc 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -549,7 +549,7 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	if (!slot)
 		return false;
 
-	if (gfn_to_page_many_atomic(slot, gfn, &page, 1) != 1)
+	if (kvm_prefetch_pages(slot, gfn, &page, 1) != 1)
 		return false;
 
 	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ab4485b2bddc..56e7cde8c8b8 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1207,8 +1207,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm);
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot);
 
-int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
-			    struct page **pages, int nr_pages);
+int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
+		       struct page **pages, int nr_pages);
 
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn);
 unsigned long gfn_to_hva(struct kvm *kvm, gfn_t gfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2032292df0b0..957b4a6c9254 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3053,8 +3053,8 @@ kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
 
-int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
-			    struct page **pages, int nr_pages)
+int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
+		       struct page **pages, int nr_pages)
 {
 	unsigned long addr;
 	gfn_t entry = 0;
@@ -3068,7 +3068,7 @@ int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
 
 	return get_user_pages_fast_only(addr, nr_pages, FOLL_WRITE, pages);
 }
-EXPORT_SYMBOL_GPL(gfn_to_page_many_atomic);
+EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
 
 /*
  * Do not use this helper unless you are absolutely certain the gfn _must_ be
-- 
2.47.0.rc1.288.g06298d1525-goog



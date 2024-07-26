From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:28 -0700
Subject: [PATCH v12 19/84] KVM: Explicitly initialize all fields at the start
 of kvm_vcpu_map()
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-20-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Explicitly initialize the entire kvm_host_map structure when mapping a
pfn, as some callers declare their struct on the stack, i.e. don't
zero-initialize the struct, which makes the map->hva in kvm_vcpu_unmap()
*very* suspect.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 21ff0f4fa02c..67a50b87bb87 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3088,32 +3088,24 @@ void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
 
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 {
-	kvm_pfn_t pfn;
-	void *hva = NULL;
-	struct page *page = KVM_UNMAPPED_PAGE;
-
-	pfn = gfn_to_pfn(vcpu->kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
-		return -EINVAL;
-
-	if (pfn_valid(pfn)) {
-		page = pfn_to_page(pfn);
-		hva = kmap(page);
-#ifdef CONFIG_HAS_IOMEM
-	} else {
-		hva = memremap(pfn_to_hpa(pfn), PAGE_SIZE, MEMREMAP_WB);
-#endif
-	}
-
-	if (!hva)
-		return -EFAULT;
-
-	map->page = page;
-	map->hva = hva;
-	map->pfn = pfn;
+	map->page = KVM_UNMAPPED_PAGE;
+	map->hva = NULL;
 	map->gfn = gfn;
 
-	return 0;
+	map->pfn = gfn_to_pfn(vcpu->kvm, gfn);
+	if (is_error_noslot_pfn(map->pfn))
+		return -EINVAL;
+
+	if (pfn_valid(map->pfn)) {
+		map->page = pfn_to_page(map->pfn);
+		map->hva = kmap(map->page);
+#ifdef CONFIG_HAS_IOMEM
+	} else {
+		map->hva = memremap(pfn_to_hpa(map->pfn), PAGE_SIZE, MEMREMAP_WB);
+#endif
+	}
+
+	return map->hva ? 0 : -EFAULT;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_map);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog



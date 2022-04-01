From: David Matlack <dmatlack@google.com>
Date: Fri,  1 Apr 2022 17:55:54 +0000
Subject: [PATCH v3 23/23] KVM: selftests: Map x86_64 guest virtual memory with
 huge pages
In-Reply-To: <20220401175554.1931568-1-dmatlack@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
Message-ID: <20220401175554.1931568-24-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Override virt_map() in x86_64 selftests to use the largest page size
possible when mapping guest virtual memory. This enables testing eager
page splitting with shadow paging (e.g. kvm_intel.ept=N), as it allows
KVM to shadow guest memory with huge pages.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../selftests/kvm/include/x86_64/processor.h  |  6 ++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  4 +--
 .../selftests/kvm/lib/x86_64/processor.c      | 31 +++++++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 37db341d4cc5..efb228d2fbf7 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -470,6 +470,12 @@ enum x86_page_size {
 	X86_PAGE_SIZE_2M,
 	X86_PAGE_SIZE_1G,
 };
+
+static inline size_t page_size_bytes(enum x86_page_size page_size)
+{
+	return 1UL << (page_size * 9 + 12);
+}
+
 void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 		   enum x86_page_size page_size);
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 1665a220abcb..60198587236d 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1432,8 +1432,8 @@ vm_vaddr_t vm_vaddr_alloc_page(struct kvm_vm *vm)
  * Within the VM given by @vm, creates a virtual translation for
  * @npages starting at @vaddr to the page range starting@@paddr.
  */
-void virt_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
-	      unsigned int npages)
+void __weak virt_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
+		     unsigned int npages)
 {
 	size_t page_size = vm->page_size;
 	size_t size = npages * page_size;
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 9f000dfb5594..7df84292d5de 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -282,6 +282,37 @@ void virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
 	__virt_pg_map(vm, vaddr, paddr, X86_PAGE_SIZE_4K);
 }
 
+void virt_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, unsigned int npages)
+{
+	size_t size = (size_t) npages * vm->page_size;
+	size_t vend = vaddr + size;
+	enum x86_page_size page_size;
+	size_t stride;
+
+	TEST_ASSERT(vaddr + size > vaddr, "Vaddr overflow");
+	TEST_ASSERT(paddr + size > paddr, "Paddr overflow");
+
+	/*
+	 * Map the region with all 1G pages if possible, falling back to all
+	 * 2M pages, and finally all 4K pages. This could be improved to use
+	 * a mix of page sizes so that more of the region is mapped with large
+	 * pages.
+	 */
+	for (page_size = X86_PAGE_SIZE_1G; page_size >= X86_PAGE_SIZE_4K; page_size--) {
+		stride = page_size_bytes(page_size);
+
+		if (!(vaddr % stride) && !(paddr % stride) && !(size % stride))
+			break;
+	}
+
+	TEST_ASSERT(page_size >= X86_PAGE_SIZE_4K,
+		    "Cannot map unaligned region: vaddr 0x%lx paddr 0x%lx npages 0x%x\n",
+		    vaddr, paddr, npages);
+
+	for (; vaddr < vend; vaddr += stride, paddr += stride)
+		__virt_pg_map(vm, vaddr, paddr, page_size);
+}
+
 static struct pageTableEntry *_vm_get_page_table_entry(struct kvm_vm *vm, int vcpuid,
 						       uint64_t vaddr)
 {
-- 
2.35.1.1094.g7c7d902a7c-goog



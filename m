From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 15:44:57 +0200
Subject: [kvm-unit-tests PATCH v2 5/7] riscv: mmu: Sanity check input physical addresses
In-Reply-To: <20240812134451.112498-9-andrew.jones@linux.dev>
References: <20240812134451.112498-9-andrew.jones@linux.dev>
Message-ID: <20240812134451.112498-14-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ensure physical addresses aren't using bits they shouldn't be.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/mmu.h | 2 ++
 lib/riscv/mmu.c     | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/lib/riscv/asm/mmu.h b/lib/riscv/asm/mmu.h
index bb60f0895e2b..9cd760093666 100644
--- a/lib/riscv/asm/mmu.h
+++ b/lib/riscv/asm/mmu.h
@@ -6,6 +6,8 @@
 #include <asm/page.h>
 #include <asm/pgtable.h>
 
+#define PHYS_MASK	((phys_addr_t)SATP_PPN << PAGE_SHIFT | (PAGE_SIZE - 1))
+
 static inline pgd_t *current_pgtable(void)
 {
 	return (pgd_t *)((csr_read(CSR_SATP) & SATP_PPN) << PAGE_SHIFT);
diff --git a/lib/riscv/mmu.c b/lib/riscv/mmu.c
index 6ab1f15a99ae..24f9f90e51c3 100644
--- a/lib/riscv/mmu.c
+++ b/lib/riscv/mmu.c
@@ -77,6 +77,8 @@ pteval_t *install_page(pgd_t *pgtable, phys_addr_t phys, void *virt)
 	phys_addr_t paddr = phys & PAGE_MASK;
 	uintptr_t vaddr = (uintptr_t)virt & PAGE_MASK;
 
+	assert(phys == (phys & PHYS_MASK));
+
 	return __install_page(pgtable, paddr, vaddr,
 			      __pgprot(_PAGE_READ | _PAGE_WRITE), true);
 }
@@ -89,6 +91,8 @@ void mmu_set_range_ptes(pgd_t *pgtable, uintptr_t virt_offset,
 	uintptr_t vaddr = virt_offset & PAGE_MASK;
 	uintptr_t virt_end = phys_end - paddr + vaddr;
 
+	assert(phys_start == (phys_start & PHYS_MASK));
+	assert(phys_end == (phys_end & PHYS_MASK));
 	assert(phys_start < phys_end);
 
 	for (; vaddr < virt_end; vaddr += PAGE_SIZE, paddr += PAGE_SIZE)
-- 
2.45.2



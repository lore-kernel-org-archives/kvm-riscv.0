From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 15:44:58 +0200
Subject: [kvm-unit-tests PATCH v2 6/7] riscv: Define and use PHYS_PAGE_MASK
In-Reply-To: <20240812134451.112498-9-andrew.jones@linux.dev>
References: <20240812134451.112498-9-andrew.jones@linux.dev>
Message-ID: <20240812134451.112498-15-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

C doesn't extend the sign bit for unsigned types since there isn't a
sign bit to extend. This means a promotion of a u32 to a u64 results
in the upper 32 bits of the u64 being zero. When the u64 is then used
as a mask on another u64 the upper 32 bits get cleared, and that's
definitely not the intention of 'phys_addr & PAGE_MASK', which should
only clear the lower bits for page alignment. Create PHYS_PAGE_MASK
to do the right thing.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/mmu.h | 1 +
 lib/riscv/mmu.c     | 6 +++---
 lib/riscv/setup.c   | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/riscv/asm/mmu.h b/lib/riscv/asm/mmu.h
index 9cd760093666..28c332f11496 100644
--- a/lib/riscv/asm/mmu.h
+++ b/lib/riscv/asm/mmu.h
@@ -7,6 +7,7 @@
 #include <asm/pgtable.h>
 
 #define PHYS_MASK	((phys_addr_t)SATP_PPN << PAGE_SHIFT | (PAGE_SIZE - 1))
+#define PHYS_PAGE_MASK	(~((phys_addr_t)PAGE_SIZE - 1))
 
 static inline pgd_t *current_pgtable(void)
 {
diff --git a/lib/riscv/mmu.c b/lib/riscv/mmu.c
index 24f9f90e51c3..ce49e67be84b 100644
--- a/lib/riscv/mmu.c
+++ b/lib/riscv/mmu.c
@@ -74,7 +74,7 @@ static pteval_t *__install_page(pgd_t *pgtable, phys_addr_t paddr,
 
 pteval_t *install_page(pgd_t *pgtable, phys_addr_t phys, void *virt)
 {
-	phys_addr_t paddr = phys & PAGE_MASK;
+	phys_addr_t paddr = phys & PHYS_PAGE_MASK;
 	uintptr_t vaddr = (uintptr_t)virt & PAGE_MASK;
 
 	assert(phys == (phys & PHYS_MASK));
@@ -87,7 +87,7 @@ void mmu_set_range_ptes(pgd_t *pgtable, uintptr_t virt_offset,
 			phys_addr_t phys_start, phys_addr_t phys_end,
 			pgprot_t prot, bool flush)
 {
-	phys_addr_t paddr = phys_start & PAGE_MASK;
+	phys_addr_t paddr = phys_start & PHYS_PAGE_MASK;
 	uintptr_t vaddr = virt_offset & PAGE_MASK;
 	uintptr_t virt_end = phys_end - paddr + vaddr;
 
@@ -155,7 +155,7 @@ void *setup_mmu(phys_addr_t top, void *opaque)
 
 void __iomem *ioremap(phys_addr_t phys_addr, size_t size)
 {
-	phys_addr_t start = phys_addr & PAGE_MASK;
+	phys_addr_t start = phys_addr & PHYS_PAGE_MASK;
 	phys_addr_t end = PAGE_ALIGN(phys_addr + size);
 	pgd_t *pgtable = current_pgtable();
 	bool flush = true;
diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index 35829309c13d..9a16f00093d7 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -91,7 +91,7 @@ static void mem_allocator_init(struct mem_region *freemem, phys_addr_t freemem_s
 	phys_addr_t base, top;
 
 	freemem_start = PAGE_ALIGN(freemem_start);
-	freemem_end &= PAGE_MASK;
+	freemem_end &= PHYS_PAGE_MASK;
 
 	/*
 	 * The assert below is mostly checking that the free memory doesn't
-- 
2.45.2



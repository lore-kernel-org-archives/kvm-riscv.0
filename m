From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 15:44:59 +0200
Subject: [kvm-unit-tests PATCH v2 7/7] riscv: mmu: Ensure order of PTE update and sfence
In-Reply-To: <20240812134451.112498-9-andrew.jones@linux.dev>
References: <20240812134451.112498-9-andrew.jones@linux.dev>
Message-ID: <20240812134451.112498-16-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use WRITE_ONCE to ensure the compiler won't order the page table
write after the TLB flush.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/riscv/mmu.c b/lib/riscv/mmu.c
index ce49e67be84b..577c66aa77ba 100644
--- a/lib/riscv/mmu.c
+++ b/lib/riscv/mmu.c
@@ -64,7 +64,8 @@ static pteval_t *__install_page(pgd_t *pgtable, phys_addr_t paddr,
 	assert(!(ppn & ~PTE_PPN));
 
 	ptep = get_pte(pgtable, vaddr);
-	*ptep = __pte(pte | pgprot_val(prot) | _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_DIRTY);
+	pte |= pgprot_val(prot) | _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_DIRTY;
+	WRITE_ONCE(*ptep, __pte(pte));
 
 	if (flush)
 		local_flush_tlb_page(vaddr);
-- 
2.45.2



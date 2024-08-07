From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed,  7 Aug 2024 17:16:31 +0200
Subject: [kvm-unit-tests PATCH 1/3] riscv: Fix virt_to_phys again
In-Reply-To: <20240807151629.144168-5-andrew.jones@linux.dev>
References: <20240807151629.144168-5-andrew.jones@linux.dev>
Message-ID: <20240807151629.144168-6-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The last fix was a bit hasty since we didn't double check that
virt_to_phys() was the right place for the fix, rather than
virt_to_pte_phys(), and of course it was the latter... All
architectures add on the offset in virt_to_pte_phys() and then
simply wrap virt_to_pte_phys() with virt_to_phys(), if they
implement virt_to_phys() at all. RISCV shouldn't be different.

Fixes: e1dd4ea76894 ("riscv: Fix virt_to_phys")
Fixes: 23100d972705 ("riscv: Enable vmalloc")
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/riscv/mmu.c b/lib/riscv/mmu.c
index 165a7034bc69..2c9c4f376ac9 100644
--- a/lib/riscv/mmu.c
+++ b/lib/riscv/mmu.c
@@ -179,7 +179,7 @@ phys_addr_t virt_to_pte_phys(pgd_t *pgtable, void *virt)
 	if (!pte_val(*ptep))
 		return 0;
 
-	return __pa(pteval_to_ptep(pte_val(*ptep)));
+	return __pa(pteval_to_ptep(pte_val(*ptep))) | offset_in_page(virt);
 }
 
 unsigned long virt_to_phys(volatile void *address)
@@ -194,7 +194,7 @@ unsigned long virt_to_phys(volatile void *address)
 	paddr = virt_to_pte_phys(pgtable, (void *)address);
 	assert(sizeof(long) == 8 || !(paddr >> 32));
 
-	return (unsigned long)paddr | offset_in_page(address);
+	return (unsigned long)paddr;
 }
 
 void *phys_to_virt(unsigned long address)
-- 
2.45.2



From: Cade Richard <cade.richard@gmail.com>
Date: Sat, 06 Jul 2024 16:09:44 -0700
Subject: [PATCH kvm-unit-tests] riscv: Fix virt_to_phys()
Message-ID: <20240706-virt-to-phys-v1-1-7a4dc11f542c@berkeley.edu>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



---
Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
---
 lib/riscv/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/riscv/mmu.c b/lib/riscv/mmu.c
index bd006881..c4770552 100644
--- a/lib/riscv/mmu.c
+++ b/lib/riscv/mmu.c
@@ -194,7 +194,7 @@ unsigned long virt_to_phys(volatile void *address)
 	paddr = virt_to_pte_phys(pgtable, (void *)address);
 	assert(sizeof(long) == 8 || !(paddr >> 32));
 
-	return (unsigned long)paddr;
+	return (unsigned long)paddr | ((unsigned long) address & 0x00000FFF);
 }
 
 void *phys_to_virt(unsigned long address)

---
base-commit: a68956b3fb6f5f308822b20ce0ff8e02db1f7375
change-id: 20240706-virt-to-phys-2a27a924ef2a

Best regards,
-- 
Cade Richard <cade.richard@berkeley.edu>



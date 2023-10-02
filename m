From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon,  2 Oct 2023 17:10:29 +0200
Subject: [PATCH 3/5] riscv: mm: Only compile pgtable.c if MMU
In-Reply-To: <20231002151031.110551-1-alexghiti@rivosinc.com>
References: <20231002151031.110551-1-alexghiti@rivosinc.com>
Message-ID: <20231002151031.110551-4-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

All functions defined in there depend on MMU, so no need to compile it
for !MMU configs.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 9c454f90fd3d..c71d4253a171 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,10 +13,9 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o
+obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o
 obj-y += cacheflush.o
 obj-y += context.o
-obj-y += pgtable.o
 obj-y += pmem.o
 
 ifeq ($(CONFIG_MMU),y)
-- 
2.39.2



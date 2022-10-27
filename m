From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 27 Oct 2022 15:02:42 +0200
Subject: [PATCH 4/9] RISC-V: Use Zicboz in clear_page when available
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
Message-ID: <20221027130247.31634-5-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Using memset() to zero a 4K page takes 563 total instructions
where 20 are branches. clear_page() with Zicboz takes 198 total
instructions where 64 are branches. We could reduce the number
branches by unrolling, but since the cboz block size isn't fixed,
cbo.zero doesn't take an offset, and even PAGE_SIZE doesn't have
to be 4K forever, we'd end up implementing a Duff device where
each unrolled block would not only contain a cbo.zero instruction,
but also an add to update the base address. So, for now, it seems
the simple tight loop approach is better. At least we don't have
to worry as much about potential icache misses as unrolled loops
do. Of course as hardware becomes available we can experiment
with unrolling too.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/page.h |  6 +++++-
 arch/riscv/lib/Makefile       |  1 +
 arch/riscv/lib/clear_page.S   | 28 ++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/clear_page.S

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index ac70b0fd9a9a..a86d6d8a9ca0 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -49,10 +49,14 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_RISCV_ISA_ZICBOZ
+void clear_page(void *page);
+#else
 #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
+#endif
 #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
 
-#define clear_user_page(pgaddr, vaddr, page)	memset((pgaddr), 0, PAGE_SIZE)
+#define clear_user_page(pgaddr, vaddr, page)	clear_page(pgaddr)
 #define copy_user_page(vto, vfrom, vaddr, topg) \
 			memcpy((vto), (vfrom), PAGE_SIZE)
 
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 25d5c9664e57..9ee5e2ab5143 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -5,5 +5,6 @@ lib-y			+= memset.o
 lib-y			+= memmove.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
+lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
new file mode 100644
index 000000000000..cafa24a918d6
--- /dev/null
+++ b/arch/riscv/lib/clear_page.S
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+#include <asm/insn-def.h>
+#include <asm/page.h>
+
+/* void clear_page(void *page) */
+ENTRY(__clear_page)
+WEAK(clear_page)
+	li	a2, PAGE_SIZE
+	ALTERNATIVE("j .Lno_zicboz", "nop",
+		    0, RISCV_ISA_EXT_ZICBOZ, CONFIG_RISCV_ISA_ZICBOZ)
+	la	a3, riscv_cboz_block_size
+	lw	a1, 0(a3)
+	add	a2, a0, a2
+.Lzero_loop:
+	CBO_ZERO(a0)
+	add	a0, a0, a1
+	bltu	a0, a2, .Lzero_loop
+	ret
+.Lno_zicboz:
+	li	a1, 0
+	la	a3, __memset
+	jr	a3
+END(__clear_page)
-- 
2.37.3



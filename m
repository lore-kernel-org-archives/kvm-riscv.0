From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:13 -0700
Subject: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap hooks
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-46-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

The guests running in CoVE must notify the host about its mmio regions
so that host can enable mmio emulation.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/mm/Makefile  |  1 +
 arch/riscv/mm/ioremap.c | 45 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/riscv/mm/ioremap.c

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 1fd9b60..721b557 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -15,6 +15,7 @@ obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pgtable.o
 obj-y += pmem.o
+obj-y += ioremap.o
 
 ifeq ($(CONFIG_MMU),y)
 obj-$(CONFIG_SMP) += tlbflush.o
diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
new file mode 100644
index 0000000..0d4e026
--- /dev/null
+++ b/arch/riscv/mm/ioremap.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#include <linux/export.h>
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+#include <linux/io.h>
+#include <asm/covg_sbi.h>
+#include <asm/cove.h>
+#include <asm-generic/io.h>
+
+void ioremap_phys_range_hook(phys_addr_t addr, size_t size, pgprot_t prot)
+{
+	unsigned long offset;
+
+	if (!is_cove_guest())
+		return;
+
+	/* Page-align address and size. */
+	offset = addr & (~PAGE_MASK);
+	addr -= offset;
+	size = PAGE_ALIGN(size + offset);
+
+	sbi_covg_add_mmio_region(addr, size);
+}
+
+void iounmap_phys_range_hook(phys_addr_t addr, size_t size)
+{
+	unsigned long offset;
+
+	if (!is_cove_guest())
+		return;
+
+	/* Page-align address and size. */
+	offset = addr & (~PAGE_MASK);
+	addr -= offset;
+	size = PAGE_ALIGN(size + offset);
+
+	sbi_covg_remove_mmio_region(addr, size);
+}
-- 
2.25.1



From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:07 -0700
Subject: [RFC 39/48] RISC-V: Implement COVG SBI extension
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-40-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

COVG extension defines the guest side interface for running a guest
in CoVE. These functions allow a CoVE guest to share/unshare memory, ask
host to trap and emulate MMIO regions and allow/deny
injection of interrupts from host.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/cove/Makefile          |   2 +-
 arch/riscv/cove/cove_guest_sbi.c  | 109 ++++++++++++++++++++++++++++++
 arch/riscv/include/asm/covg_sbi.h |  38 +++++++++++
 3 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/cove/cove_guest_sbi.c
 create mode 100644 arch/riscv/include/asm/covg_sbi.h

diff --git a/arch/riscv/cove/Makefile b/arch/riscv/cove/Makefile
index 03a0cac..a95043b 100644
--- a/arch/riscv/cove/Makefile
+++ b/arch/riscv/cove/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_RISCV_COVE_GUEST)	+= core.o
+obj-$(CONFIG_RISCV_COVE_GUEST)	+= core.o cove_guest_sbi.o
diff --git a/arch/riscv/cove/cove_guest_sbi.c b/arch/riscv/cove/cove_guest_sbi.c
new file mode 100644
index 0000000..af22d5e
--- /dev/null
+++ b/arch/riscv/cove/cove_guest_sbi.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * COVG SBI extensions related helper functions.
+ *
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#include <linux/errno.h>
+#include <asm/sbi.h>
+#include <asm/covg_sbi.h>
+
+int sbi_covg_add_mmio_region(unsigned long addr, unsigned long len)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_ADD_MMIO_REGION, addr, len,
+			0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_remove_mmio_region(unsigned long addr, unsigned long len)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_REMOVE_MMIO_REGION, addr,
+			len, 0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_share_memory(unsigned long addr, unsigned long len)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_SHARE_MEMORY, addr, len, 0,
+			0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_unshare_memory(unsigned long addr, unsigned long len)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_UNSHARE_MEMORY, addr, len, 0,
+			0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_allow_external_interrupt(unsigned long id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_ALLOW_EXT_INTERRUPT, id, 0,
+			0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_allow_all_external_interrupt(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_ALLOW_EXT_INTERRUPT, -1, 0,
+			0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_deny_external_interrupt(unsigned long id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_DENY_EXT_INTERRUPT, id, 0, 0,
+			0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_deny_all_external_interrupt(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_DENY_EXT_INTERRUPT, -1, 0, 0,
+			0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
diff --git a/arch/riscv/include/asm/covg_sbi.h b/arch/riscv/include/asm/covg_sbi.h
new file mode 100644
index 0000000..31283de
--- /dev/null
+++ b/arch/riscv/include/asm/covg_sbi.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * COVG SBI extension related header file.
+ *
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#ifndef __RISCV_COVG_SBI_H__
+#define __RISCV_COVG_SBI_H__
+
+#ifdef CONFIG_RISCV_COVE_GUEST
+
+int sbi_covg_add_mmio_region(unsigned long addr, unsigned long len);
+int sbi_covg_remove_mmio_region(unsigned long addr, unsigned long len);
+int sbi_covg_share_memory(unsigned long addr, unsigned long len);
+int sbi_covg_unshare_memory(unsigned long addr, unsigned long len);
+int sbi_covg_allow_external_interrupt(unsigned long id);
+int sbi_covg_allow_all_external_interrupt(void);
+int sbi_covg_deny_external_interrupt(unsigned long id);
+int sbi_covg_deny_all_external_interrupt(void);
+
+#else
+
+static inline int sbi_covg_add_mmio_region(unsigned long addr, unsigned long len) { return 0; }
+static inline int sbi_covg_remove_mmio_region(unsigned long addr, unsigned long len) { return 0; }
+static inline int sbi_covg_share_memory(unsigned long addr, unsigned long len) { return 0; }
+static inline int sbi_covg_unshare_memory(unsigned long addr, unsigned long len) { return 0; }
+static inline int sbi_covg_allow_external_interrupt(unsigned long id) { return 0; }
+static inline int sbi_covg_allow_all_external_interrupt(void) { return 0; }
+static inline int sbi_covg_deny_external_interrupt(unsigned long id) { return 0; }
+static inline int sbi_covg_deny_all_external_interrupt(void) { return 0; }
+
+#endif
+
+#endif /* __RISCV_COVG_SBI_H__ */
-- 
2.25.1



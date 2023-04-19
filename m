From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:06 -0700
Subject: [RFC 38/48] RISC-V: Add CoVE guest config and helper functions
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-39-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

Introduce a separate config for the guest running in CoVE so that
it can be enabled separately if required. However, the default config
will enable both CoVE host & guest configs in order to make single
image work as both host & guest. Introduce a helper function to
detect if a guest is TVM or not at run time. The TSM only enables
the CoVE guest SBI extension for TVMs.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Co-developed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/Kbuild             |  2 ++
 arch/riscv/Kconfig            |  6 ++++++
 arch/riscv/cove/Makefile      |  2 ++
 arch/riscv/cove/core.c        | 28 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/cove.h | 27 +++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c     |  2 ++
 6 files changed, 67 insertions(+)
 create mode 100644 arch/riscv/cove/Makefile
 create mode 100644 arch/riscv/cove/core.c
 create mode 100644 arch/riscv/include/asm/cove.h

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index afa83e3..ecd661e 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-$(CONFIG_RISCV_COVE_GUEST) += cove/
+
 obj-y += kernel/ mm/ net/
 obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 obj-y += errata/
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8462941..49c3006 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -512,6 +512,12 @@ config RISCV_COVE_HOST
 	    That means the platform should be capable of running TEE VM (TVM)
 	    using KVM and TEE Security Manager (TSM).
 
+config RISCV_COVE_GUEST
+	bool "Guest Support for Confidential VM Extension(CoVE)"
+	default n
+	help
+	  Enables support for running TVMs on platforms supporting CoVE.
+
 endmenu # "Confidential VM Extension(CoVE) Support"
 
 endmenu # "Platform type"
diff --git a/arch/riscv/cove/Makefile b/arch/riscv/cove/Makefile
new file mode 100644
index 0000000..03a0cac
--- /dev/null
+++ b/arch/riscv/cove/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RISCV_COVE_GUEST)	+= core.o
diff --git a/arch/riscv/cove/core.c b/arch/riscv/cove/core.c
new file mode 100644
index 0000000..7218fe7
--- /dev/null
+++ b/arch/riscv/cove/core.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Confidential Computing Platform Capability checks
+ *
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#include <linux/export.h>
+#include <linux/cc_platform.h>
+#include <asm/sbi.h>
+#include <asm/cove.h>
+
+static bool is_tvm;
+
+bool is_cove_guest(void)
+{
+	return is_tvm;
+}
+EXPORT_SYMBOL_GPL(is_cove_guest);
+
+void riscv_cove_sbi_init(void)
+{
+	if (sbi_probe_extension(SBI_EXT_COVG) > 0)
+		is_tvm = true;
+}
diff --git a/arch/riscv/include/asm/cove.h b/arch/riscv/include/asm/cove.h
new file mode 100644
index 0000000..c4d609d
--- /dev/null
+++ b/arch/riscv/include/asm/cove.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TVM helper functions
+ *
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#ifndef __RISCV_COVE_H__
+#define __RISCV_COVE_H__
+
+#ifdef CONFIG_RISCV_COVE_GUEST
+void riscv_cove_sbi_init(void);
+bool is_cove_guest(void);
+#else /* CONFIG_RISCV_COVE_GUEST */
+static inline bool is_cove_guest(void)
+{
+	return false;
+}
+static inline void riscv_cove_sbi_init(void)
+{
+}
+#endif /* CONFIG_RISCV_COVE_GUEST */
+
+#endif /* __RISCV_COVE_H__ */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 7b2b065..20b0280 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -35,6 +35,7 @@
 #include <asm/thread_info.h>
 #include <asm/kasan.h>
 #include <asm/efi.h>
+#include <asm/cove.h>
 
 #include "head.h"
 
@@ -272,6 +273,7 @@ void __init setup_arch(char **cmdline_p)
 
 	early_ioremap_setup();
 	sbi_init();
+	riscv_cove_sbi_init();
 	jump_label_init();
 	parse_early_param();
 
-- 
2.25.1



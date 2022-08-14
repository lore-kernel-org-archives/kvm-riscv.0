From: Conor Dooley <mail@conchuod.ie>
Date: Sun, 14 Aug 2022 15:12:37 +0100
Subject: [PATCH 3/4] riscv: signal: fix missing prototype warning
In-Reply-To: <20220814141237.493457-1-mail@conchuod.ie>
References: <20220814141237.493457-1-mail@conchuod.ie>
Message-ID: <20220814141237.493457-4-mail@conchuod.ie>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Conor Dooley <conor.dooley@microchip.com>

Fix the warning:
arch/riscv/kernel/signal.c:316:27: warning: no previous prototype for function 'do_notify_resume' [-Wmissing-prototypes]
asmlinkage __visible void do_notify_resume(struct pt_regs *regs,

All other functions in the file are static & none of the existing
headers stood out as an obvious location. Create signal.h to hold the
declaration.

Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/signal.h | 12 ++++++++++++
 arch/riscv/kernel/signal.c      |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 arch/riscv/include/asm/signal.h

diff --git a/arch/riscv/include/asm/signal.h b/arch/riscv/include/asm/signal.h
new file mode 100644
index 000000000000..532c29ef0376
--- /dev/null
+++ b/arch/riscv/include/asm/signal.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_SIGNAL_H
+#define __ASM_SIGNAL_H
+
+#include <uapi/asm/signal.h>
+#include <uapi/asm/ptrace.h>
+
+asmlinkage __visible
+void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
+
+#endif
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 38b05ca6fe66..5a2de6b6f882 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -15,6 +15,7 @@
 
 #include <asm/ucontext.h>
 #include <asm/vdso.h>
+#include <asm/signal.h>
 #include <asm/signal32.h>
 #include <asm/switch_to.h>
 #include <asm/csr.h>
-- 
2.37.1



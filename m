From: Conor Dooley <mail@conchuod.ie>
Date: Sun, 14 Aug 2022 15:12:38 +0100
Subject: [PATCH 4/4] riscv: traps: add missing prototype
In-Reply-To: <20220814141237.493457-1-mail@conchuod.ie>
References: <20220814141237.493457-1-mail@conchuod.ie>
Message-ID: <20220814141237.493457-5-mail@conchuod.ie>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Conor Dooley <conor.dooley@microchip.com>

Sparse complains:
arch/riscv/kernel/traps.c:213:6: warning: symbol 'shadow_stack' was not declared. Should it be static?

The variable is used in entry.S, so declare shadow_stack there
alongside SHADOW_OVERFLOW_STACK_SIZE.

Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/thread_info.h | 2 ++
 arch/riscv/kernel/traps.c            | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 78933ac04995..67322f878e0d 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -42,6 +42,8 @@
 
 #ifndef __ASSEMBLY__
 
+extern long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE / sizeof(long)];
+
 #include <asm/processor.h>
 #include <asm/csr.h>
 
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 39d0f8bba4b4..635e6ec26938 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -20,9 +20,10 @@
 
 #include <asm/asm-prototypes.h>
 #include <asm/bug.h>
+#include <asm/csr.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
-#include <asm/csr.h>
+#include <asm/thread_info.h>
 
 int show_unhandled_signals = 1;
 
-- 
2.37.1



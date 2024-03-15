From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 15 Mar 2024 14:40:12 +0100
Subject: [PATCH 2/5] riscv: Prefer wrs.nto over wrs.sto
In-Reply-To: <20240315134009.580167-7-ajones@ventanamicro.com>
References: <20240315134009.580167-7-ajones@ventanamicro.com>
Message-ID: <20240315134009.580167-9-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When running as a guest we'd like to trap to the host while waiting
in order to give the hypervisor a chance to schedule the lock holding
VCPU. Unlike wrs.sto, wrs.nto may be configured to raise an exception
when its duration expires, so use it instead. Protect ourselves from
unhandled exceptions with _ASM_EXTABLE in case the higher privileged
level configures wrs.nto to raise exceptions, but then doesn't handle
them.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/barrier.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 93b3f572d643..441b9eb4b0ef 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -13,6 +13,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/compiler.h>
 #include <asm/alternative-macros.h>
+#include <asm/asm-extable.h>
 #include <asm/hwcap.h>
 #include <asm/rwonce.h>
 
@@ -22,10 +23,14 @@
 
 #define ZAWRS_WRS_NTO	".long 0x00d00073"
 #define ZAWRS_WRS_STO	".long 0x01d00073"
+#define __ALT_WRS_NTO							\
+	ALTERNATIVE("nop\n", ZAWRS_WRS_NTO "\n",			\
+		    0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS)
 #define ALT_WRS_NTO()							\
-	__asm__ __volatile__ (ALTERNATIVE(				\
-		"nop\n", ZAWRS_WRS_NTO "\n",				\
-		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
+	__asm__ __volatile__ (						\
+		"1: " __ALT_WRS_NTO "\n"				\
+		"2:\n"							\
+		_ASM_EXTABLE(1b, 2b))
 #define ALT_WRS_STO()							\
 	__asm__ __volatile__ (ALTERNATIVE(				\
 		"nop\n", ZAWRS_WRS_STO "\n",				\
@@ -130,7 +135,7 @@ do {									\
 			VAL = __smp_load_reserved_relaxed(__PTR);	\
 			if (cond_expr)					\
 				break;					\
-			ALT_WRS_STO();					\
+			ALT_WRS_NTO();					\
 		}							\
 	}								\
 	(typeof(*ptr))VAL;						\
@@ -147,7 +152,7 @@ do {									\
 			VAL = __smp_load_reserved_acquire(__PTR);	\
 			if (cond_expr)					\
 				break;					\
-			ALT_WRS_STO();					\
+			ALT_WRS_NTO();					\
 		}							\
 	}								\
 	(typeof(*ptr))VAL;						\
-- 
2.44.0



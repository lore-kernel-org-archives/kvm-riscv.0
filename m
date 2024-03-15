From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 15 Mar 2024 14:40:11 +0100
Subject: [PATCH 1/5] riscv: Add Zawrs support for spinlocks
In-Reply-To: <20240315134009.580167-7-ajones@ventanamicro.com>
References: <20240315134009.580167-7-ajones@ventanamicro.com>
Message-ID: <20240315134009.580167-8-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christoph M?llner <christoph.muellner@vrull.eu>

The current RISC-V code uses the generic ticket lock implementation,
that calls the macros smp_cond_load_relaxed() and smp_cond_load_acquire().
Currently, RISC-V uses the generic implementation of these macros.
This patch introduces a RISC-V specific implementation, of these
macros, that peels off the first loop iteration and modifies the waiting
loop such, that it is possible to use the WRS.STO instruction of the Zawrs
ISA extension to stall the CPU.

The resulting implementation of smp_cond_load_*() will only work for
32-bit or 64-bit types for RV64 and 32-bit types for RV32.
This is caused by the restrictions of the LR instruction (RISC-V only
has LR.W and LR.D). Compiler assertions guard this new restriction.

This patch uses the existing RISC-V ISA extension framework
to detect the presence of Zawrs at run-time.
If available a NOP instruction will be replaced by WRS.NTO or WRS.STO.

The whole mechanism is gated by Kconfig setting, which defaults to Y.

The Zawrs specification can be found here:
https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc

Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
[rebase, update to review comments]
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
[rebase, move ALT_WRS* to barrier.h]
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig               | 13 +++++
 arch/riscv/include/asm/barrier.h | 82 ++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/hwcap.h   |  1 +
 arch/riscv/kernel/cpufeature.c   |  1 +
 4 files changed, 97 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e3142ce531a0..2c296113aeb1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -569,6 +569,19 @@ config RISCV_ISA_V_PREEMPTIVE
 	  preemption. Enabling this config will result in higher memory
 	  consumption due to the allocation of per-task's kernel Vector context.
 
+config RISCV_ISA_ZAWRS
+	bool "Zawrs extension support for more efficient busy waiting"
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Enable the use of the Zawrs (wait for reservation set) extension
+	   when available.
+
+	   The Zawrs extension instructions (wrs.nto and wrs.sto) are used for
+	   more efficient busy waiting.
+
+	   If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 110752594228..93b3f572d643 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -11,11 +11,26 @@
 #define _ASM_RISCV_BARRIER_H
 
 #ifndef __ASSEMBLY__
+#include <linux/compiler.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+#include <asm/rwonce.h>
 
 #define nop()		__asm__ __volatile__ ("nop")
 #define __nops(n)	".rept	" #n "\nnop\n.endr\n"
 #define nops(n)		__asm__ __volatile__ (__nops(n))
 
+#define ZAWRS_WRS_NTO	".long 0x00d00073"
+#define ZAWRS_WRS_STO	".long 0x01d00073"
+#define ALT_WRS_NTO()							\
+	__asm__ __volatile__ (ALTERNATIVE(				\
+		"nop\n", ZAWRS_WRS_NTO "\n",				\
+		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
+#define ALT_WRS_STO()							\
+	__asm__ __volatile__ (ALTERNATIVE(				\
+		"nop\n", ZAWRS_WRS_STO "\n",				\
+		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
+
 #define RISCV_FENCE(p, s) \
 	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
 
@@ -44,6 +59,39 @@ do {									\
 	___p1;								\
 })
 
+#define ___smp_load_reservedN(attr, ptr)				\
+({									\
+	typeof(*ptr) ___p1;						\
+									\
+	__asm__ __volatile__ ("lr." attr "       %[p], %[c]\n"		\
+			      : [p]"=&r" (___p1), [c]"+A"(*ptr));	\
+	___p1;								\
+})
+
+#define __smp_load_reserved_relaxed(ptr)				\
+({									\
+	typeof(*ptr) ___p1;						\
+									\
+	if (sizeof(*ptr) == sizeof(int))				\
+		___p1 = ___smp_load_reservedN("w", ptr);		\
+	else if (sizeof(*ptr) == sizeof(long))				\
+		___p1 = ___smp_load_reservedN("d", ptr);		\
+	else								\
+		compiletime_assert(0,					\
+		"Need type compatible with LR/SC instructions for "	\
+		__stringify(ptr));					\
+	___p1;								\
+})
+
+#define __smp_load_reserved_acquire(ptr)				\
+({									\
+	typeof(*ptr) ___p1;						\
+									\
+	___p1 = __smp_load_reserved_relaxed(ptr);			\
+	RISCV_FENCE(r, rw);						\
+	___p1;								\
+})
+
 /*
  * This is a very specific barrier: it's currently only used in two places in
  * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
@@ -71,6 +119,40 @@ do {									\
  */
 #define smp_mb__after_spinlock()	RISCV_FENCE(iorw,iorw)
 
+#define smp_cond_load_relaxed(ptr, cond_expr)				\
+({									\
+	typeof(ptr) __PTR = (ptr);					\
+	__unqual_scalar_typeof(*ptr) VAL;				\
+									\
+	VAL = READ_ONCE(*__PTR);					\
+	if (!cond_expr) {						\
+		for (;;) {						\
+			VAL = __smp_load_reserved_relaxed(__PTR);	\
+			if (cond_expr)					\
+				break;					\
+			ALT_WRS_STO();					\
+		}							\
+	}								\
+	(typeof(*ptr))VAL;						\
+})
+
+#define smp_cond_load_acquire(ptr, cond_expr)				\
+({									\
+	typeof(ptr) __PTR = (ptr);					\
+	__unqual_scalar_typeof(*ptr) VAL;				\
+									\
+	VAL = smp_load_acquire(__PTR);					\
+	if (!cond_expr) {						\
+		for (;;) {						\
+			VAL = __smp_load_reserved_acquire(__PTR);	\
+			if (cond_expr)					\
+				break;					\
+			ALT_WRS_STO();					\
+		}							\
+	}								\
+	(typeof(*ptr))VAL;						\
+})
+
 #include <asm-generic/barrier.h>
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 1f2d2599c655..eac7214a4bd0 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,6 +80,7 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
+#define RISCV_ISA_EXT_ZAWRS		74
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 79a5a35fab96..0e3c79094b07 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -271,6 +271,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
-- 
2.44.0



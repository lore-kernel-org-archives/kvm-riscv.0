From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 19 Apr 2024 15:53:25 +0200
Subject: [PATCH v2 3/6] riscv: Add Zawrs support for spinlocks
In-Reply-To: <20240419135321.70781-8-ajones@ventanamicro.com>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
Message-ID: <20240419135321.70781-11-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christoph M?llner <christoph.muellner@vrull.eu>

RISC-V code uses the generic ticket lock implementation, which calls
the macros smp_cond_load_relaxed() and smp_cond_load_acquire().
Introduce a RISC-V specific implementation of smp_cond_load_relaxed()
which applies WRS.NTO of the Zawrs extension in order to reduce power
consumption while waiting and allows hypervisors to enable guests to
trap while waiting. smp_cond_load_acquire() doesn't need a RISC-V
specific implementation as the generic implementation is based on
smp_cond_load_relaxed() and smp_acquire__after_ctrl_dep() sufficiently
provides the acquire semantics.

This implementation is heavily based on Arm's approach which is the
approach Andrea Parri also suggested.

The Zawrs specification can be found here:
https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc

Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
Co-developed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig                | 13 ++++++++
 arch/riscv/include/asm/barrier.h  | 45 ++++++++++++++++++---------
 arch/riscv/include/asm/cmpxchg.h  | 51 +++++++++++++++++++++++++++++++
 arch/riscv/include/asm/hwcap.h    |  1 +
 arch/riscv/include/asm/insn-def.h |  2 ++
 arch/riscv/kernel/cpufeature.c    |  1 +
 6 files changed, 98 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7427d8088337..34bbe6b70546 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -578,6 +578,19 @@ config RISCV_ISA_V_PREEMPTIVE
 	  preemption. Enabling this config will result in higher memory
 	  consumption due to the allocation of per-task's kernel Vector context.
 
+config RISCV_ISA_ZAWRS
+	bool "Zawrs extension support for more efficient busy waiting"
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  The Zawrs extension defines instructions to be used in polling loops
+	  which allow a hart to enter a low-power state or to trap to the
+	  hypervisor while waiting on a store to a memory location. Enable the
+	  use of these instructions in the kernel when the Zawrs extension is
+	  detected at boot.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 880b56d8480d..e1d9bf1deca6 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -11,6 +11,7 @@
 #define _ASM_RISCV_BARRIER_H
 
 #ifndef __ASSEMBLY__
+#include <asm/cmpxchg.h>
 #include <asm/fence.h>
 
 #define nop()		__asm__ __volatile__ ("nop")
@@ -28,21 +29,6 @@
 #define __smp_rmb()	RISCV_FENCE(r, r)
 #define __smp_wmb()	RISCV_FENCE(w, w)
 
-#define __smp_store_release(p, v)					\
-do {									\
-	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(rw, w);						\
-	WRITE_ONCE(*p, v);						\
-} while (0)
-
-#define __smp_load_acquire(p)						\
-({									\
-	typeof(*p) ___p1 = READ_ONCE(*p);				\
-	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(r, rw);						\
-	___p1;								\
-})
-
 /*
  * This is a very specific barrier: it's currently only used in two places in
  * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
@@ -70,6 +56,35 @@ do {									\
  */
 #define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
 
+#define __smp_store_release(p, v)					\
+do {									\
+	compiletime_assert_atomic_type(*p);				\
+	RISCV_FENCE(rw, w);						\
+	WRITE_ONCE(*p, v);						\
+} while (0)
+
+#define __smp_load_acquire(p)						\
+({									\
+	typeof(*p) ___p1 = READ_ONCE(*p);				\
+	compiletime_assert_atomic_type(*p);				\
+	RISCV_FENCE(r, rw);						\
+	___p1;								\
+})
+
+#ifdef CONFIG_RISCV_ISA_ZAWRS
+#define smp_cond_load_relaxed(ptr, cond_expr) ({			\
+	typeof(ptr) __PTR = (ptr);					\
+	__unqual_scalar_typeof(*ptr) VAL;				\
+	for (;;) {							\
+		VAL = READ_ONCE(*__PTR);				\
+		if (cond_expr)						\
+			break;						\
+		__cmpwait_relaxed(ptr, VAL);				\
+	}								\
+	(typeof(*ptr))VAL;						\
+})
+#endif
+
 #include <asm-generic/barrier.h>
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2fee65cc8443..0926ac7f4ca6 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -8,7 +8,10 @@
 
 #include <linux/bug.h>
 
+#include <asm/alternative-macros.h>
 #include <asm/fence.h>
+#include <asm/hwcap.h>
+#include <asm/insn-def.h>
 
 #define __xchg_relaxed(ptr, new, size)					\
 ({									\
@@ -359,4 +362,52 @@
 	arch_cmpxchg_relaxed((ptr), (o), (n));				\
 })
 
+#ifdef CONFIG_RISCV_ISA_ZAWRS
+static __always_inline void __cmpwait(volatile void *ptr,
+				      unsigned long val,
+				      int size)
+{
+	unsigned long tmp;
+
+	asm goto(ALTERNATIVE("j %l[no_zawrs]", "nop",
+			     0, RISCV_ISA_EXT_ZAWRS, 1)
+		 : : : : no_zawrs);
+
+	switch (size) {
+	case 4:
+		asm volatile(
+		"	lr.w	%0, %1\n"
+		"	xor	%0, %0, %2\n"
+		"	bnez	%0, 1f\n"
+			ZAWRS_WRS_NTO "\n"
+		"1:"
+		: "=&r" (tmp), "+A" (*(u32 *)ptr)
+		: "r" (val));
+		break;
+#if __riscv_xlen == 64
+	case 8:
+		asm volatile(
+		"	lr.d	%0, %1\n"
+		"	xor	%0, %0, %2\n"
+		"	bnez	%0, 1f\n"
+			ZAWRS_WRS_NTO "\n"
+		"1:"
+		: "=&r" (tmp), "+A" (*(u64 *)ptr)
+		: "r" (val));
+		break;
+#endif
+	default:
+		BUILD_BUG();
+	}
+
+	return;
+
+no_zawrs:
+	asm volatile(RISCV_PAUSE : : : "memory");
+}
+
+#define __cmpwait_relaxed(ptr, val) \
+	__cmpwait((ptr), (unsigned long)(val), sizeof(*(ptr)))
+#endif
+
 #endif /* _ASM_RISCV_CMPXCHG_H */
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..5b358c3cf212 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_ZAWRS		75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 64dffaa21bfa..9a913010cdd9 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -197,5 +197,7 @@
 	       RS1(base), SIMM12(4))
 
 #define RISCV_PAUSE	".4byte 0x100000f"
+#define ZAWRS_WRS_NTO	".4byte 0x00d00073"
+#define ZAWRS_WRS_STO	".4byte 0x01d00073"
 
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..02de9eaa3f42 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -257,6 +257,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
-- 
2.44.0



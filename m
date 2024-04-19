From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 19 Apr 2024 15:53:23 +0200
Subject: [PATCH v2 1/6] riscv: Provide a definition for 'pause'
In-Reply-To: <20240419135321.70781-8-ajones@ventanamicro.com>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
Message-ID: <20240419135321.70781-9-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If we're going to provide the encoding for 'pause' in cpu_relax()
anyway, then we can drop the toolchain checks and just always use
it. The advantage of doing this is that other code that need
pause don't need to also define it (yes, another use is coming).
Add the definition to insn-def.h since it's an instruction
definition and also because insn-def.h doesn't include much, so
it's safe to include from asm/vdso/processor.h without concern for
circular dependencies.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig                      | 7 -------
 arch/riscv/Makefile                     | 3 ---
 arch/riscv/include/asm/insn-def.h       | 2 ++
 arch/riscv/include/asm/vdso/processor.h | 8 ++------
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..7427d8088337 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -639,13 +639,6 @@ config RISCV_ISA_ZICBOZ
 
 	   If you don't know what to do here, say Y.
 
-config TOOLCHAIN_HAS_ZIHINTPAUSE
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zihintpause)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zihintpause)
-	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23600
-
 config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	def_bool y
 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 252d63942f34..f1792ac03335 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -75,9 +75,6 @@ else
 riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
 endif
 
-# Check if the toolchain supports Zihintpause extension
-riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
-
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index e27179b26086..64dffaa21bfa 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -196,4 +196,6 @@
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(4))
 
+#define RISCV_PAUSE	".4byte 0x100000f"
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
index 96b65a5396df..8f383f05a290 100644
--- a/arch/riscv/include/asm/vdso/processor.h
+++ b/arch/riscv/include/asm/vdso/processor.h
@@ -5,6 +5,7 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/barrier.h>
+#include <asm/insn-def.h>
 
 static inline void cpu_relax(void)
 {
@@ -14,16 +15,11 @@ static inline void cpu_relax(void)
 	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
 #endif
 
-#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
 	/*
 	 * Reduce instruction retirement.
 	 * This assumes the PC changes.
 	 */
-	__asm__ __volatile__ ("pause");
-#else
-	/* Encoding of the pause instruction */
-	__asm__ __volatile__ (".4byte 0x100000F");
-#endif
+	__asm__ __volatile__ (RISCV_PAUSE);
 	barrier();
 }
 
-- 
2.44.0



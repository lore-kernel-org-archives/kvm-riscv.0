From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 26 Jan 2024 15:23:33 +0100
Subject: [kvm-unit-tests PATCH v2 08/24] riscv: Add riscv32 support
In-Reply-To: <20240126142324.66674-26-andrew.jones@linux.dev>
References: <20240126142324.66674-26-andrew.jones@linux.dev>
Message-ID: <20240126142324.66674-34-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make a few tweaks to allow also building and running riscv32.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 lib/elf.h               | 11 +++++++++++
 lib/ldiv32.c            | 16 ++++++++++++++++
 lib/riscv/asm-offsets.c | 11 +++++++++++
 riscv/Makefile          |  3 +++
 riscv/cstart.S          | 35 +++++++++++++++++++++--------------
 5 files changed, 62 insertions(+), 14 deletions(-)

diff --git a/lib/elf.h b/lib/elf.h
index abd5cf4beaad..7a7db57774cd 100644
--- a/lib/elf.h
+++ b/lib/elf.h
@@ -8,6 +8,11 @@
 
 #include <libcflat.h>
 
+/* 32-bit ELF base types. */
+typedef u32	Elf32_Addr;
+typedef u32	Elf32_Xword;
+typedef s32	Elf32_Sxword;
+
 /* 64-bit ELF base types. */
 typedef u64	Elf64_Addr;
 typedef u64	Elf64_Xword;
@@ -26,6 +31,12 @@ typedef struct elf64_rel {
 	Elf64_Xword r_info;     /* index and type of relocation */
 } Elf64_Rel;
 
+typedef struct elf32_rela {
+	Elf32_Addr r_offset;    /* Location at which to apply the action */
+	Elf32_Xword r_info;     /* index and type of relocation */
+	Elf32_Sxword r_addend;  /* Constant addend used to compute value */
+} Elf32_Rela;
+
 typedef struct elf64_rela {
 	Elf64_Addr r_offset;    /* Location at which to apply the action */
 	Elf64_Xword r_info;     /* index and type of relocation */
diff --git a/lib/ldiv32.c b/lib/ldiv32.c
index 897a4b9cd39e..9ce2a6a1faf0 100644
--- a/lib/ldiv32.c
+++ b/lib/ldiv32.c
@@ -1,5 +1,21 @@
 #include <stdint.h>
 
+#if __riscv_xlen == 32
+int __clzdi2(unsigned long);
+
+int __clzdi2(unsigned long a)
+{
+	int n = 0;
+
+	while (a) {
+		++n;
+		a >>= 1;
+	}
+
+	return 32 - n;
+}
+#endif
+
 extern uint64_t __udivmoddi4(uint64_t num, uint64_t den, uint64_t *p_rem);
 extern int64_t __divmoddi4(int64_t num, int64_t den, int64_t *p_rem);
 extern int64_t __moddi3(int64_t num, int64_t den);
diff --git a/lib/riscv/asm-offsets.c b/lib/riscv/asm-offsets.c
index 4a74df9e4a09..eb337b7547b8 100644
--- a/lib/riscv/asm-offsets.c
+++ b/lib/riscv/asm-offsets.c
@@ -1,6 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <kbuild.h>
+#include <elf.h>
 
 int main(void)
 {
+#if __riscv_xlen == 32
+	OFFSET(ELF_RELA_OFFSET, elf32_rela, r_offset);
+	OFFSET(ELF_RELA_ADDEND, elf32_rela, r_addend);
+	DEFINE(ELF_RELA_SIZE, sizeof(struct elf32_rela));
+#elif __riscv_xlen == 64
+	OFFSET(ELF_RELA_OFFSET, elf64_rela, r_offset);
+	OFFSET(ELF_RELA_ADDEND, elf64_rela, r_addend);
+	DEFINE(ELF_RELA_SIZE, sizeof(struct elf64_rela));
+#endif
 	return 0;
 }
diff --git a/riscv/Makefile b/riscv/Makefile
index 4e7fcc538ba1..fb97e678a456 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -29,6 +29,9 @@ cflatobjs += lib/riscv/io.o
 cflatobjs += lib/riscv/sbi.o
 cflatobjs += lib/riscv/setup.o
 cflatobjs += lib/riscv/smp.o
+ifeq ($(ARCH),riscv32)
+cflatobjs += lib/ldiv32.o
+endif
 
 ########################################
 
diff --git a/riscv/cstart.S b/riscv/cstart.S
index a28d75e8021e..6ec2231e5812 100644
--- a/riscv/cstart.S
+++ b/riscv/cstart.S
@@ -4,11 +4,23 @@
  *
  * Copyright (C) 2023, Ventana Micro Systems Inc., Andrew Jones <ajones@ventanamicro.com>
  */
+#include <asm/asm-offsets.h>
 #include <asm/csr.h>
 
+#if __riscv_xlen == 64
+#define __REG_SEL(a, b) a
+#elif __riscv_xlen == 32
+#define __REG_SEL(a, b) b
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+#define REG_L	__REG_SEL(ld, lw)
+#define REG_S	__REG_SEL(sd, sw)
+
 .macro zero_range, tmp1, tmp2
 9998:	beq	\tmp1, \tmp2, 9997f
-	sd	zero, 0(\tmp1)
+	REG_S	zero, 0(\tmp1)
 	addi	\tmp1, \tmp1, 8
 	j	9998b
 9997:
@@ -33,26 +45,20 @@ start:
 
 	/*
 	 * Update all R_RISCV_RELATIVE relocations using the table
-	 * of Elf64_Rela entries between reloc_start/end. The build
-	 * will not emit other relocation types.
-	 *
-	 * struct Elf64_Rela {
-	 * 	uint64_t r_offset;
-	 * 	uint64_t r_info;
-	 * 	int64_t  r_addend;
-	 * }
+	 * of Elf32_Rela/Elf64_Rela entries between reloc_start/end.
+	 * The build will not emit other relocation types.
 	 */
 	la	a1, reloc_start
 	la	a2, reloc_end
 	la	a3, start			// base
 1:
 	bge	a1, a2, 1f
-	ld	a4, 0(a1)			// r_offset
-	ld	a5, 16(a1)			// r_addend
+	REG_L	a4, ELF_RELA_OFFSET(a1)		// r_offset
+	REG_L	a5, ELF_RELA_ADDEND(a1)		// r_addend
 	add	a4, a3, a4			// addr = base + r_offset
 	add	a5, a3, a5			// val = base + r_addend
-	sd	a5, 0(a4)			// *addr = val
-	addi	a1, a1, 24
+	REG_S	a5, 0(a4)			// *addr = val
+	addi	a1, a1, ELF_RELA_SIZE
 	j	1b
 
 1:
@@ -72,11 +78,12 @@ start:
 
 	/* complete setup */
 	la	a1, stacktop			// a1 is the base of free memory
+	mv	a2, zero			// clear a2 for xlen=32
 	call	setup				// a0 is the addr of the dtb
 
 	/* run the test */
 	la	a0, __argc
-	ld	a0, 0(a0)
+	REG_L	a0, 0(a0)
 	la	a1, __argv
 	la	a2, __environ
 	call	main
-- 
2.43.0



From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 27 Oct 2022 15:02:45 +0200
Subject: [PATCH 7/9] RISC-V: lib: Improve memset assembler formatting
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
Message-ID: <20221027130247.31634-8-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Aligning the first operand of each instructions with a tab is a
typical style which improves readability. Apply it to memset.S.
While there, we also make a small grammar change to a comment.

No functional change intended.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/lib/memset.S | 143 ++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 71 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 34c5360c6705..e613c5c27998 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -3,111 +3,112 @@
  * Copyright (C) 2013 Regents of the University of California
  */
 
-
 #include <linux/linkage.h>
 #include <asm/asm.h>
 
 /* void *memset(void *, int, size_t) */
 ENTRY(__memset)
 WEAK(memset)
-	move t0, a0  /* Preserve return value */
+	move	t0, a0			/* Preserve return value */
 
 	/* Defer to byte-oriented fill for small sizes */
-	sltiu a3, a2, 16
-	bnez a3, 4f
+	sltiu	a3, a2, 16
+	bnez	a3, 4f
 
 	/*
 	 * Round to nearest XLEN-aligned address
-	 * greater than or equal to start address
+	 * greater than or equal to the start address.
 	 */
-	addi a3, t0, SZREG-1
-	andi a3, a3, ~(SZREG-1)
-	beq a3, t0, 2f  /* Skip if already aligned */
+	addi	a3, t0, SZREG-1
+	andi	a3, a3, ~(SZREG-1)
+	beq	a3, t0, 2f		/* Skip if already aligned */
+
 	/* Handle initial misalignment */
-	sub a4, a3, t0
+	sub	a4, a3, t0
 1:
-	sb a1, 0(t0)
-	addi t0, t0, 1
-	bltu t0, a3, 1b
-	sub a2, a2, a4  /* Update count */
+	sb	a1, 0(t0)
+	addi	t0, t0, 1
+	bltu	t0, a3, 1b
+	sub	a2, a2, a4		/* Update count */
 
 2: /* Duff's device with 32 XLEN stores per iteration */
 	/* Broadcast value into all bytes */
-	andi a1, a1, 0xff
-	slli a3, a1, 8
-	or a1, a3, a1
-	slli a3, a1, 16
-	or a1, a3, a1
+	andi	a1, a1, 0xff
+	slli	a3, a1, 8
+	or	a1, a3, a1
+	slli	a3, a1, 16
+	or	a1, a3, a1
 #ifdef CONFIG_64BIT
-	slli a3, a1, 32
-	or a1, a3, a1
+	slli	a3, a1, 32
+	or	a1, a3, a1
 #endif
 
 	/* Calculate end address */
-	andi a4, a2, ~(SZREG-1)
-	add a3, t0, a4
+	andi	a4, a2, ~(SZREG-1)
+	add	a3, t0, a4
 
-	andi a4, a4, 31*SZREG  /* Calculate remainder */
-	beqz a4, 3f            /* Shortcut if no remainder */
-	neg a4, a4
-	addi a4, a4, 32*SZREG  /* Calculate initial offset */
+	andi	a4, a4, 31*SZREG	/* Calculate remainder */
+	beqz	a4, 3f			/* Shortcut if no remainder */
+	neg	a4, a4
+	addi	a4, a4, 32*SZREG	/* Calculate initial offset */
 
 	/* Adjust start address with offset */
-	sub t0, t0, a4
+	sub	t0, t0, a4
 
 	/* Jump into loop body */
 	/* Assumes 32-bit instruction lengths */
-	la a5, 3f
+	la	a5, 3f
 #ifdef CONFIG_64BIT
-	srli a4, a4, 1
+	srli	a4, a4, 1
 #endif
-	add a5, a5, a4
-	jr a5
+	add	a5, a5, a4
+	jr	a5
 3:
-	REG_S a1,        0(t0)
-	REG_S a1,    SZREG(t0)
-	REG_S a1,  2*SZREG(t0)
-	REG_S a1,  3*SZREG(t0)
-	REG_S a1,  4*SZREG(t0)
-	REG_S a1,  5*SZREG(t0)
-	REG_S a1,  6*SZREG(t0)
-	REG_S a1,  7*SZREG(t0)
-	REG_S a1,  8*SZREG(t0)
-	REG_S a1,  9*SZREG(t0)
-	REG_S a1, 10*SZREG(t0)
-	REG_S a1, 11*SZREG(t0)
-	REG_S a1, 12*SZREG(t0)
-	REG_S a1, 13*SZREG(t0)
-	REG_S a1, 14*SZREG(t0)
-	REG_S a1, 15*SZREG(t0)
-	REG_S a1, 16*SZREG(t0)
-	REG_S a1, 17*SZREG(t0)
-	REG_S a1, 18*SZREG(t0)
-	REG_S a1, 19*SZREG(t0)
-	REG_S a1, 20*SZREG(t0)
-	REG_S a1, 21*SZREG(t0)
-	REG_S a1, 22*SZREG(t0)
-	REG_S a1, 23*SZREG(t0)
-	REG_S a1, 24*SZREG(t0)
-	REG_S a1, 25*SZREG(t0)
-	REG_S a1, 26*SZREG(t0)
-	REG_S a1, 27*SZREG(t0)
-	REG_S a1, 28*SZREG(t0)
-	REG_S a1, 29*SZREG(t0)
-	REG_S a1, 30*SZREG(t0)
-	REG_S a1, 31*SZREG(t0)
-	addi t0, t0, 32*SZREG
-	bltu t0, a3, 3b
-	andi a2, a2, SZREG-1  /* Update count */
+	REG_S	a1,        0(t0)
+	REG_S	a1,    SZREG(t0)
+	REG_S	a1,  2*SZREG(t0)
+	REG_S	a1,  3*SZREG(t0)
+	REG_S	a1,  4*SZREG(t0)
+	REG_S	a1,  5*SZREG(t0)
+	REG_S	a1,  6*SZREG(t0)
+	REG_S	a1,  7*SZREG(t0)
+	REG_S	a1,  8*SZREG(t0)
+	REG_S	a1,  9*SZREG(t0)
+	REG_S	a1, 10*SZREG(t0)
+	REG_S	a1, 11*SZREG(t0)
+	REG_S	a1, 12*SZREG(t0)
+	REG_S	a1, 13*SZREG(t0)
+	REG_S	a1, 14*SZREG(t0)
+	REG_S	a1, 15*SZREG(t0)
+	REG_S	a1, 16*SZREG(t0)
+	REG_S	a1, 17*SZREG(t0)
+	REG_S	a1, 18*SZREG(t0)
+	REG_S	a1, 19*SZREG(t0)
+	REG_S	a1, 20*SZREG(t0)
+	REG_S	a1, 21*SZREG(t0)
+	REG_S	a1, 22*SZREG(t0)
+	REG_S	a1, 23*SZREG(t0)
+	REG_S	a1, 24*SZREG(t0)
+	REG_S	a1, 25*SZREG(t0)
+	REG_S	a1, 26*SZREG(t0)
+	REG_S	a1, 27*SZREG(t0)
+	REG_S	a1, 28*SZREG(t0)
+	REG_S	a1, 29*SZREG(t0)
+	REG_S	a1, 30*SZREG(t0)
+	REG_S	a1, 31*SZREG(t0)
+
+	addi	t0, t0, 32*SZREG
+	bltu	t0, a3, 3b
+	andi	a2, a2, SZREG-1		/* Update count */
 
 4:
 	/* Handle trailing misalignment */
-	beqz a2, 6f
-	add a3, t0, a2
+	beqz	a2, 6f
+	add	a3, t0, a2
 5:
-	sb a1, 0(t0)
-	addi t0, t0, 1
-	bltu t0, a3, 5b
+	sb	a1, 0(t0)
+	addi	t0, t0, 1
+	bltu	t0, a3, 5b
 6:
 	ret
 END(__memset)
-- 
2.37.3



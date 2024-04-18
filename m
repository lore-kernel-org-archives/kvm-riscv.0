From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 18 Apr 2024 16:26:43 +0200
Subject: [RFC PATCH 4/7] riscv: handle Ssdbltrp mstatus SDT bit
In-Reply-To: <20240418142701.1493091-1-cleger@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
Message-ID: <20240418142701.1493091-5-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When Ssdbltrp is enabled, we must take care of clearing SDT after
sensitive phases are over to avoid generating a double trap. This
is mainly about exceptions handling so clear SDT once we have
saved enough information (critical CSRs) but also clears it during SATP
mode detection which generates an "inline" trap and thus sets SDT
implicitely.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/csr.h  |  1 +
 arch/riscv/kernel/entry.S     | 52 ++++++++++++++++++++---------------
 arch/riscv/kernel/head.S      |  4 +++
 arch/riscv/kernel/sse_entry.S |  4 +--
 4 files changed, 37 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 5528159b3d5d..905cdf894a57 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -17,6 +17,7 @@
 #define SR_SPP		_AC(0x00000100, UL) /* Previously Supervisor */
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
+#define SR_SDT		_AC(0x01000000, UL) /* Supervisor Double Trap */
 
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 1591e0781569..07da91080839 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -49,23 +49,12 @@ SYM_CODE_START(handle_exception)
 	REG_S x5,  PT_T0(sp)
 	save_from_x6_to_x31
 
-	/*
-	 * Disable user-mode memory access as it should only be set in the
-	 * actual user copy routines.
-	 *
-	 * Disable the FPU/Vector to detect illegal usage of floating point
-	 * or vector in kernel space.
-	 */
-	li t0, SR_SUM | SR_FS_VS
-
 	REG_L s0, TASK_TI_USER_SP(tp)
-	csrrc s1, CSR_STATUS, t0
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
 	csrr s4, CSR_CAUSE
 	csrr s5, CSR_SCRATCH
 	REG_S s0, PT_SP(sp)
-	REG_S s1, PT_STATUS(sp)
 	REG_S s2, PT_EPC(sp)
 	REG_S s3, PT_BADADDR(sp)
 	REG_S s4, PT_CAUSE(sp)
@@ -77,6 +66,21 @@ SYM_CODE_START(handle_exception)
 	 */
 	csrw CSR_SCRATCH, x0
 
+	/*
+	 * Disable user-mode memory access as it should only be set in the
+	 * actual user copy routines.
+	 *
+	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * or vector in kernel space.
+	 *
+	 * Clear supervisor double trap bit as all trap context is saved and we
+	 * can handle another one
+	 */
+	li t0, SR_SUM | SR_FS_VS | SR_SDT
+
+	csrrc s1, CSR_STATUS, t0
+	REG_S s1, PT_STATUS(sp)
+
 	/* Load the global pointer */
 	load_global_pointer
 
@@ -123,15 +127,25 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 #ifdef CONFIG_RISCV_M_MODE
 	/* the MPP value is too large to be used as an immediate arg for addi */
 	li t0, SR_MPP
-	and s0, s0, t0
+	and t1, s0, t0
 #else
-	andi s0, s0, SR_SPP
+	andi t1, s0, SR_SPP
+#endif
+
+#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
+	move a0, sp
+	call riscv_v_context_nesting_end
 #endif
-	bnez s0, 1f
+	/*
+	 * Restore STATUS now to set supervisor double trap bit which means that
+	 * from now on, we can not handle an exception up to "sret"
+	 */
+	csrw CSR_STATUS, s0
+	bnez t1, 1f
 
 	/* Save unwound kernel stack pointer in thread_info */
-	addi s0, sp, PT_SIZE_ON_STACK
-	REG_S s0, TASK_TI_KERNEL_SP(tp)
+	addi t1, sp, PT_SIZE_ON_STACK
+	REG_S t1, TASK_TI_KERNEL_SP(tp)
 
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
@@ -142,11 +156,6 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 */
 	csrw CSR_SCRATCH, tp
 1:
-#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
-	move a0, sp
-	call riscv_v_context_nesting_end
-#endif
-	REG_L a0, PT_STATUS(sp)
 	/*
 	 * The current load reservation is effectively part of the processor's
 	 * state, in the sense that load reservations cannot be shared between
@@ -167,7 +176,6 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	REG_L  a2, PT_EPC(sp)
 	REG_SC x0, a2, PT_EPC(sp)
 
-	csrw CSR_STATUS, a0
 	csrw CSR_EPC, a2
 
 	REG_L x1,  PT_RA(sp)
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4236a69c35cb..bcc2b6678f40 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -106,6 +106,10 @@ relocate_enable_mmu:
 	csrw CSR_SATP, a0
 .align 2
 1:
+	/* A trap potentially set the SDT flag, clear it */
+	li t0, SR_SDT
+	csrc CSR_STATUS, t0
+
 	/* Set trap vector to spin forever to help debug */
 	la a0, .Lsecondary_park
 	csrw CSR_TVEC, a0
diff --git a/arch/riscv/kernel/sse_entry.S b/arch/riscv/kernel/sse_entry.S
index d3c7286f3372..e69d386e36e9 100644
--- a/arch/riscv/kernel/sse_entry.S
+++ b/arch/riscv/kernel/sse_entry.S
@@ -65,7 +65,7 @@ SYM_CODE_START(handle_sse)
 	REG_S a4, PT_SP(sp)
 
 	/* Disable user memory access and floating/vector computing */
-	li t0, SR_SUM | SR_FS_VS
+	li t0, SR_SUM | SR_FS_VS | SR_SDT
 	csrc CSR_STATUS, t0
 
 	load_global_pointer
@@ -131,8 +131,8 @@ SYM_CODE_START(handle_sse)
 
 SYM_INNER_LABEL(ret_from_sse, SYM_L_GLOBAL)
 	/* Restore saved CSRs */
-	csrw CSR_SSCRATCH, s4
 	csrw CSR_SSTATUS, s5
+	csrw CSR_SSCRATCH, s4
 
 #ifdef CONFIG_FRAME_POINTER
 	/* Frame pointer is created only when kernel is interrupted */
-- 
2.43.0



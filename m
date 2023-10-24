From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 24 Oct 2023 15:26:54 +0200
Subject: [PATCH v2 4/5] riscv: kvm: Use SYM_*() assembly macros instead of deprecated ones
In-Reply-To: <20231024132655.730417-1-cleger@rivosinc.com>
References: <20231024132655.730417-1-cleger@rivosinc.com>
Message-ID: <20231024132655.730417-5-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ENTRY()/END()/WEAK() macros are deprecated and we should make use of the
new SYM_*() macros [1] for better annotation of symbols. Replace the
deprecated ones with the new ones and fix wrong usage of END()/ENDPROC()
to correctly describe the symbols.

[1] https://docs.kernel.org/core-api/asm-annotations.html

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_switch.S | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index d74df8eb4d71..8b18473780ac 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -15,7 +15,7 @@
 	.altmacro
 	.option norelax
 
-ENTRY(__kvm_riscv_switch_to)
+SYM_FUNC_START(__kvm_riscv_switch_to)
 	/* Save Host GPRs (except A0 and T0-T6) */
 	REG_S	ra, (KVM_ARCH_HOST_RA)(a0)
 	REG_S	sp, (KVM_ARCH_HOST_SP)(a0)
@@ -208,9 +208,9 @@ __kvm_switch_return:
 
 	/* Return to C code */
 	ret
-ENDPROC(__kvm_riscv_switch_to)
+SYM_FUNC_END(__kvm_riscv_switch_to)
 
-ENTRY(__kvm_riscv_unpriv_trap)
+SYM_CODE_START(__kvm_riscv_unpriv_trap)
 	/*
 	 * We assume that faulting unpriv load/store instruction is
 	 * 4-byte long and blindly increment SEPC by 4.
@@ -231,12 +231,10 @@ ENTRY(__kvm_riscv_unpriv_trap)
 	csrr	a1, CSR_HTINST
 	REG_S	a1, (KVM_ARCH_TRAP_HTINST)(a0)
 	sret
-ENDPROC(__kvm_riscv_unpriv_trap)
+SYM_CODE_END(__kvm_riscv_unpriv_trap)
 
 #ifdef	CONFIG_FPU
-	.align 3
-	.global __kvm_riscv_fp_f_save
-__kvm_riscv_fp_f_save:
+SYM_FUNC_START(__kvm_riscv_fp_f_save)
 	csrr t2, CSR_SSTATUS
 	li t1, SR_FS
 	csrs CSR_SSTATUS, t1
@@ -276,10 +274,9 @@ __kvm_riscv_fp_f_save:
 	sw t0, KVM_ARCH_FP_F_FCSR(a0)
 	csrw CSR_SSTATUS, t2
 	ret
+SYM_FUNC_END(__kvm_riscv_fp_f_save)
 
-	.align 3
-	.global __kvm_riscv_fp_d_save
-__kvm_riscv_fp_d_save:
+SYM_FUNC_START(__kvm_riscv_fp_d_save)
 	csrr t2, CSR_SSTATUS
 	li t1, SR_FS
 	csrs CSR_SSTATUS, t1
@@ -319,10 +316,9 @@ __kvm_riscv_fp_d_save:
 	sw t0, KVM_ARCH_FP_D_FCSR(a0)
 	csrw CSR_SSTATUS, t2
 	ret
+SYM_FUNC_END(__kvm_riscv_fp_d_save)
 
-	.align 3
-	.global __kvm_riscv_fp_f_restore
-__kvm_riscv_fp_f_restore:
+SYM_FUNC_START(__kvm_riscv_fp_f_restore)
 	csrr t2, CSR_SSTATUS
 	li t1, SR_FS
 	lw t0, KVM_ARCH_FP_F_FCSR(a0)
@@ -362,10 +358,9 @@ __kvm_riscv_fp_f_restore:
 	fscsr t0
 	csrw CSR_SSTATUS, t2
 	ret
+SYM_FUNC_END(__kvm_riscv_fp_f_restore)
 
-	.align 3
-	.global __kvm_riscv_fp_d_restore
-__kvm_riscv_fp_d_restore:
+SYM_FUNC_START(__kvm_riscv_fp_d_restore)
 	csrr t2, CSR_SSTATUS
 	li t1, SR_FS
 	lw t0, KVM_ARCH_FP_D_FCSR(a0)
@@ -405,4 +400,5 @@ __kvm_riscv_fp_d_restore:
 	fscsr t0
 	csrw CSR_SSTATUS, t2
 	ret
+SYM_FUNC_END(__kvm_riscv_fp_d_restore)
 #endif
-- 
2.42.0



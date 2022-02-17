From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 17 Feb 2022 18:42:48 +0800
Subject: [PATCH] riscv: kvm: refine __kvm_riscv_switch_to and
 __kvm_riscv_switch_from function
Message-ID: <20220217104248.30948-1-vincent.chen@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Kernel uses __kvm_riscv_switch_to() and __kvm_riscv_switch_from() to switch
the context of host kernel and guest kernel. Several CSRs belonging to the
context will be read and written during the context switch. To ensure
atomic read-modify-write control of CSR and ordering of CSR accesses, some
hardware blocks or flushes the pipeline when writing a CSR. In this
circumstance, grouping CSR executions together as much as possible can
reduce the performance impact of the pipeline. Therefore, this commit
reorders the CSR instructions to enhance the context switch performance..

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Suggested-by: Hsinyi Lee <hsinyi.lee@sifive.com>
Suggested-by: Fu-Ching Yang <fu-ching.yang@sifive.com>
---
 arch/riscv/kvm/vcpu_switch.S | 55 ++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index 029a28a195c6..75cf21e5ed92 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -40,34 +40,35 @@ ENTRY(__kvm_riscv_switch_to)
 	REG_S	s9, (KVM_ARCH_HOST_S9)(a0)
 	REG_S	s10, (KVM_ARCH_HOST_S10)(a0)
 	REG_S	s11, (KVM_ARCH_HOST_S11)(a0)
+	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
+	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
+	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
+	la	t4, __kvm_switch_return
+	REG_L	t5, (KVM_ARCH_GUEST_SEPC)(a0)
 
 	/* Save Host and Restore Guest SSTATUS */
-	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
 	csrrw	t0, CSR_SSTATUS, t0
-	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
 
 	/* Save Host and Restore Guest HSTATUS */
-	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
 	csrrw	t1, CSR_HSTATUS, t1
-	REG_S	t1, (KVM_ARCH_HOST_HSTATUS)(a0)
 
 	/* Save Host and Restore Guest SCOUNTEREN */
-	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
 	csrrw	t2, CSR_SCOUNTEREN, t2
-	REG_S	t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
-
-	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
-	csrrw	t3, CSR_SSCRATCH, a0
-	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
 
 	/* Save Host STVEC and change it to return path */
-	la	t4, __kvm_switch_return
 	csrrw	t4, CSR_STVEC, t4
-	REG_S	t4, (KVM_ARCH_HOST_STVEC)(a0)
+
+	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
+	csrrw	t3, CSR_SSCRATCH, a0
 
 	/* Restore Guest SEPC */
-	REG_L	t0, (KVM_ARCH_GUEST_SEPC)(a0)
-	csrw	CSR_SEPC, t0
+	csrw	CSR_SEPC, t5
+
+	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
+	REG_S	t1, (KVM_ARCH_HOST_HSTATUS)(a0)
+	REG_S	t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
+	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
+	REG_S	t4, (KVM_ARCH_HOST_STVEC)(a0)
 
 	/* Restore Guest GPRs (except A0) */
 	REG_L	ra, (KVM_ARCH_GUEST_RA)(a0)
@@ -144,35 +145,35 @@ __kvm_switch_return:
 	REG_S	t4, (KVM_ARCH_GUEST_T4)(a0)
 	REG_S	t5, (KVM_ARCH_GUEST_T5)(a0)
 	REG_S	t6, (KVM_ARCH_GUEST_T6)(a0)
+	REG_L	t1, (KVM_ARCH_HOST_STVEC)(a0)
+	REG_L	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
+	REG_L	t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
+	REG_L	t4, (KVM_ARCH_HOST_HSTATUS)(a0)
+	REG_L	t5, (KVM_ARCH_HOST_SSTATUS)(a0)
 
 	/* Save Guest SEPC */
 	csrr	t0, CSR_SEPC
-	REG_S	t0, (KVM_ARCH_GUEST_SEPC)(a0)
-
-	/* Restore Host STVEC */
-	REG_L	t1, (KVM_ARCH_HOST_STVEC)(a0)
-	csrw	CSR_STVEC, t1
 
 	/* Save Guest A0 and Restore Host SSCRATCH */
-	REG_L	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
 	csrrw	t2, CSR_SSCRATCH, t2
-	REG_S	t2, (KVM_ARCH_GUEST_A0)(a0)
+
+	/* Restore Host STVEC */
+	csrw	CSR_STVEC, t1
 
 	/* Save Guest and Restore Host SCOUNTEREN */
-	REG_L	t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
 	csrrw	t3, CSR_SCOUNTEREN, t3
-	REG_S	t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
 
 	/* Save Guest and Restore Host HSTATUS */
-	REG_L	t4, (KVM_ARCH_HOST_HSTATUS)(a0)
 	csrrw	t4, CSR_HSTATUS, t4
-	REG_S	t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
 
 	/* Save Guest and Restore Host SSTATUS */
-	REG_L	t5, (KVM_ARCH_HOST_SSTATUS)(a0)
 	csrrw	t5, CSR_SSTATUS, t5
-	REG_S	t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
 
+	REG_S	t0, (KVM_ARCH_GUEST_SEPC)(a0)
+	REG_S	t2, (KVM_ARCH_GUEST_A0)(a0)
+	REG_S	t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
+	REG_S	t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
+	REG_S	t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
 	/* Restore Host GPRs (except A0 and T0-T6) */
 	REG_L	ra, (KVM_ARCH_HOST_RA)(a0)
 	REG_L	sp, (KVM_ARCH_HOST_SP)(a0)
-- 
2.17.1



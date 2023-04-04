From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  4 Apr 2023 21:04:50 +0530
Subject: [PATCH v4 7/9] RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
Message-ID: <20230404153452.2405681-8-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To support 64 VCPU local interrupts on RV32 host, we should use
bitmap for irqs_pending and irqs_pending_mask in struct kvm_vcpu_arch.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  7 ++--
 arch/riscv/kvm/vcpu.c             | 53 ++++++++++++++++++++-----------
 2 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 3157cf748df1..ee0acccb1d3b 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -204,8 +204,9 @@ struct kvm_vcpu_arch {
 	 * in irqs_pending. Our approach is modeled around multiple producer
 	 * and single consumer problem where the consumer is the VCPU itself.
 	 */
-	unsigned long irqs_pending;
-	unsigned long irqs_pending_mask;
+#define KVM_RISCV_VCPU_NR_IRQS	64
+	DECLARE_BITMAP(irqs_pending, KVM_RISCV_VCPU_NR_IRQS);
+	DECLARE_BITMAP(irqs_pending_mask, KVM_RISCV_VCPU_NR_IRQS);
 
 	/* VCPU Timer */
 	struct kvm_vcpu_timer timer;
@@ -334,7 +335,7 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq);
 int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq);
 void kvm_riscv_vcpu_flush_interrupts(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu);
-bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, unsigned long mask);
+bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask);
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 57bdbfc17d48..811c7e9a308c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -141,8 +141,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_aia_reset(vcpu);
 
-	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
-	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+	bitmap_zero(vcpu->arch.irqs_pending, KVM_RISCV_VCPU_NR_IRQS);
+	bitmap_zero(vcpu->arch.irqs_pending_mask, KVM_RISCV_VCPU_NR_IRQS);
 
 	kvm_riscv_vcpu_pmu_reset(vcpu);
 
@@ -474,6 +474,7 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
 		kvm_riscv_vcpu_flush_interrupts(vcpu);
 		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
+		*out_val |= csr->hvip & ~IRQ_LOCAL_MASK;
 	} else
 		*out_val = ((unsigned long *)csr)[reg_num];
 
@@ -497,7 +498,7 @@ static inline int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 	((unsigned long *)csr)[reg_num] = reg_val;
 
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
-		WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+		WRITE_ONCE(vcpu->arch.irqs_pending_mask[0], 0);
 
 	return 0;
 }
@@ -799,9 +800,9 @@ void kvm_riscv_vcpu_flush_interrupts(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	unsigned long mask, val;
 
-	if (READ_ONCE(vcpu->arch.irqs_pending_mask)) {
-		mask = xchg_acquire(&vcpu->arch.irqs_pending_mask, 0);
-		val = READ_ONCE(vcpu->arch.irqs_pending) & mask;
+	if (READ_ONCE(vcpu->arch.irqs_pending_mask[0])) {
+		mask = xchg_acquire(&vcpu->arch.irqs_pending_mask[0], 0);
+		val = READ_ONCE(vcpu->arch.irqs_pending[0]) & mask;
 
 		csr->hvip &= ~mask;
 		csr->hvip |= val;
@@ -825,12 +826,12 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 	if ((csr->hvip ^ hvip) & (1UL << IRQ_VS_SOFT)) {
 		if (hvip & (1UL << IRQ_VS_SOFT)) {
 			if (!test_and_set_bit(IRQ_VS_SOFT,
-					      &v->irqs_pending_mask))
-				set_bit(IRQ_VS_SOFT, &v->irqs_pending);
+					      v->irqs_pending_mask))
+				set_bit(IRQ_VS_SOFT, v->irqs_pending);
 		} else {
 			if (!test_and_set_bit(IRQ_VS_SOFT,
-					      &v->irqs_pending_mask))
-				clear_bit(IRQ_VS_SOFT, &v->irqs_pending);
+					      v->irqs_pending_mask))
+				clear_bit(IRQ_VS_SOFT, v->irqs_pending);
 		}
 	}
 
@@ -843,14 +844,20 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 
 int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 {
-	if (irq != IRQ_VS_SOFT &&
+	/*
+	 * We only allow VS-mode software, timer, and external
+	 * interrupts when irq is one of the local interrupts
+	 * defined by RISC-V privilege specification.
+	 */
+	if (irq < IRQ_LOCAL_MAX &&
+	    irq != IRQ_VS_SOFT &&
 	    irq != IRQ_VS_TIMER &&
 	    irq != IRQ_VS_EXT)
 		return -EINVAL;
 
-	set_bit(irq, &vcpu->arch.irqs_pending);
+	set_bit(irq, vcpu->arch.irqs_pending);
 	smp_mb__before_atomic();
-	set_bit(irq, &vcpu->arch.irqs_pending_mask);
+	set_bit(irq, vcpu->arch.irqs_pending_mask);
 
 	kvm_vcpu_kick(vcpu);
 
@@ -859,25 +866,33 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 
 int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 {
-	if (irq != IRQ_VS_SOFT &&
+	/*
+	 * We only allow VS-mode software, timer, and external
+	 * interrupts when irq is one of the local interrupts
+	 * defined by RISC-V privilege specification.
+	 */
+	if (irq < IRQ_LOCAL_MAX &&
+	    irq != IRQ_VS_SOFT &&
 	    irq != IRQ_VS_TIMER &&
 	    irq != IRQ_VS_EXT)
 		return -EINVAL;
 
-	clear_bit(irq, &vcpu->arch.irqs_pending);
+	clear_bit(irq, vcpu->arch.irqs_pending);
 	smp_mb__before_atomic();
-	set_bit(irq, &vcpu->arch.irqs_pending_mask);
+	set_bit(irq, vcpu->arch.irqs_pending_mask);
 
 	return 0;
 }
 
-bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, unsigned long mask)
+bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 {
 	unsigned long ie;
 
 	ie = ((vcpu->arch.guest_csr.vsie & VSIP_VALID_MASK)
-		<< VSIP_TO_HVIP_SHIFT) & mask;
-	if (READ_ONCE(vcpu->arch.irqs_pending) & ie)
+		<< VSIP_TO_HVIP_SHIFT) & (unsigned long)mask;
+	ie |= vcpu->arch.guest_csr.vsie & ~IRQ_LOCAL_MASK &
+		(unsigned long)mask;
+	if (READ_ONCE(vcpu->arch.irqs_pending[0]) & ie)
 		return true;
 
 	/* Check AIA high interrupts */
-- 
2.34.1



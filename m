From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 19 Oct 2022 17:15:35 +0530
Subject: [PATCH] RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc
Message-ID: <20221019114535.131469-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The kvm_riscv_vcpu_timer_pending() checks per-VCPU next_cycles
and per-VCPU software injected VS timer interrupt. This function
returns incorrect value when Sstc is available because the per-VCPU
next_cycles are only updated by kvm_riscv_vcpu_timer_save() called
from kvm_arch_vcpu_put(). As a result, when Sstc is available the
VCPU does not block properly upon WFI traps.

To fix the above issue, we introduce kvm_riscv_vcpu_timer_sync()
which will update per-VCPU next_cycles upon every VM exit instead
of kvm_riscv_vcpu_timer_save().

Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_timer.h |  1 +
 arch/riscv/kvm/vcpu.c                   |  3 +++
 arch/riscv/kvm/vcpu_timer.c             | 17 +++++++++++++++--
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
index 0d8fdb8ec63a..82f7260301da 100644
--- a/arch/riscv/include/asm/kvm_vcpu_timer.h
+++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
@@ -45,6 +45,7 @@ int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
 void kvm_riscv_guest_timer_init(struct kvm *kvm);
+void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu);
 bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a032c4f0d600..71ebbc4821f0 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -708,6 +708,9 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 				clear_bit(IRQ_VS_SOFT, &v->irqs_pending);
 		}
 	}
+
+	/* Sync-up timer CSRs */
+	kvm_riscv_vcpu_timer_sync(vcpu);
 }
 
 int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 185f2386a747..ad34519c8a13 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -320,20 +320,33 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_timer_unblocking(vcpu);
 }
 
-void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
 
 	if (!t->sstc_enabled)
 		return;
 
-	t = &vcpu->arch.timer;
 #if defined(CONFIG_32BIT)
 	t->next_cycles = csr_read(CSR_VSTIMECMP);
 	t->next_cycles |= (u64)csr_read(CSR_VSTIMECMPH) << 32;
 #else
 	t->next_cycles = csr_read(CSR_VSTIMECMP);
 #endif
+}
+
+void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
+
+	if (!t->sstc_enabled)
+		return;
+
+	/*
+	 * The vstimecmp CSRs are saved by kvm_riscv_vcpu_timer_sync()
+	 * upon every VM exit so no need to save here.
+	 */
+
 	/* timer should be enabled for the remaining operations */
 	if (unlikely(!t->init_done))
 		return;
-- 
2.34.1



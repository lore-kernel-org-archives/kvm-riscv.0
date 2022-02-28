From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 28 Feb 2022 01:42:33 -0800
Subject: [RFC PATCH 6/6] RISC-V: KVM: Support sstc extension
In-Reply-To: <20220228094234.3773153-1-atishp@rivosinc.com>
References: <20220228094234.3773153-1-atishp@rivosinc.com>
Message-ID: <20220228094234.3773153-7-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sstc extension allows the guest to program the vstimecmp CSR directly
instead of making an SBI call to the hypervisor to program the next
event. The timer interrupt is also directly injected to the guest by
the hardware in this case. To maintain backward compatibility, the
hypervisors also update the vstimecmp in an SBI set_time call if
the hardware supports it. Thus, the older kernels in guest also
take advantage of the sstc extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h       |   4 +
 arch/riscv/include/asm/kvm_vcpu_timer.h |   3 +-
 arch/riscv/include/uapi/asm/kvm.h       |   1 +
 arch/riscv/kvm/main.c                   |   8 ++
 arch/riscv/kvm/vcpu.c                   |   4 +-
 arch/riscv/kvm/vcpu_sbi_replace.c       |  10 +-
 arch/riscv/kvm/vcpu_timer.c             | 136 +++++++++++++++++++++++-
 7 files changed, 158 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 99ef6a120617..fb8c993ba022 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -135,6 +135,7 @@ struct kvm_vcpu_csr {
 	unsigned long hvip;
 	unsigned long vsatp;
 	unsigned long scounteren;
+	u64 vstimecmp;
 };
 
 struct kvm_vcpu_arch {
@@ -179,6 +180,9 @@ struct kvm_vcpu_arch {
 	/* VCPU Timer */
 	struct kvm_vcpu_timer timer;
 
+	/* VCPU Timer for vstimecmp */
+	struct kvm_vcpu_timer vstimer;
+
 	/* MMIO instruction details */
 	struct kvm_mmio_decode mmio_decode;
 
diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
index 375281eb49e0..10715b81db86 100644
--- a/arch/riscv/include/asm/kvm_vcpu_timer.h
+++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
@@ -39,6 +39,7 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu);
 int kvm_riscv_guest_timer_init(struct kvm *kvm);
-
+bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu);
 #endif
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e01678aa2a55..c7c313272c0b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -97,6 +97,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_H,
 	KVM_RISCV_ISA_EXT_I,
 	KVM_RISCV_ISA_EXT_M,
+	KVM_RISCV_ISA_EXT_SSTC,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 2e5ca43c8c49..8485f59d2db3 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -13,6 +13,7 @@
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
+#include <asm/timex.h>
 
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
@@ -50,6 +51,13 @@ int kvm_arch_hardware_enable(void)
 	csr_write(CSR_HIDELEG, hideleg);
 
 	csr_write(CSR_HCOUNTEREN, -1UL);
+	if (cpu_sstc_ext_available) {
+#ifdef CONFIG_64BIT
+		csr_write(CSR_HENVCFG, 1UL<<HENVCFG_STCE);
+#else
+		csr_write(CSR_HENVCFGH, 1UL<<HENVCFGH_STCE);
+#endif
+	}
 
 	csr_write(CSR_HVIP, 0);
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c314c40be313..dda1fc950178 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -141,7 +141,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 {
-	return kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER);
+	return kvm_riscv_vcpu_timer_pending(vcpu);
 }
 
 void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
@@ -373,6 +373,7 @@ static unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_h,
 	RISCV_ISA_EXT_i,
 	RISCV_ISA_EXT_m,
+	RISCV_ISA_EXT_SSTC,
 };
 
 static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
@@ -756,6 +757,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 				     vcpu->arch.isa);
 	kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
 
+	kvm_riscv_vcpu_timer_save(vcpu);
 	csr_write(CSR_HGATP, 0);
 
 	csr->vsstatus = csr_read(CSR_VSSTATUS);
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 1bc0608a5bfd..e34fc9e1f41b 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -30,7 +30,15 @@ static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 #else
 	next_cycle = (u64)cp->a0;
 #endif
-	kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
+	if (cpu_sstc_ext_available) {
+#if __riscv_xlen == 32
+		csr_write(CSR_VSTIMECMP, next_cycle & 0xFFFFFFFF);
+		csr_write(CSR_VSTIMECMPH, next_cycle >> 32);
+#else
+		csr_write(CSR_VSTIMECMP, next_cycle);
+#endif
+	} else
+		kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
 
 	return ret;
 }
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 5c4c37ff2d48..5647c234fea3 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -14,6 +14,7 @@
 #include <asm/csr.h>
 #include <asm/delay.h>
 #include <asm/kvm_vcpu_timer.h>
+#include <asm/timex.h>
 
 static u64 kvm_riscv_current_cycles(struct kvm_guest_timer *gt)
 {
@@ -88,10 +89,66 @@ int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles)
 	return 0;
 }
 
+static enum hrtimer_restart kvm_riscv_vcpu_vstimer_expired(struct hrtimer *h)
+{
+	u64 delta_ns;
+	struct kvm_vcpu_timer *vst = container_of(h, struct kvm_vcpu_timer, hrt);
+	struct kvm_vcpu *vcpu = container_of(vst, struct kvm_vcpu, arch.vstimer);
+	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
+
+	if (kvm_riscv_current_cycles(gt) < vst->next_cycles) {
+		delta_ns = kvm_riscv_delta_cycles2ns(vst->next_cycles, gt, vst);
+		hrtimer_forward_now(&vst->hrt, ktime_set(0, delta_ns));
+		return HRTIMER_RESTART;
+	}
+
+	vst->next_set = false;
+	kvm_vcpu_kick(vcpu);
+
+	return HRTIMER_NORESTART;
+}
+
+bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_timer *vst = &vcpu->arch.vstimer;
+	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
+	u64 vstimecmp_val = vcpu->arch.guest_csr.vstimecmp;
+
+	if (!kvm_riscv_delta_cycles2ns(vstimecmp_val, gt, vst) ||
+	    kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER))
+		return true;
+	else
+		return false;
+}
+
+static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_timer *vst = &vcpu->arch.vstimer;
+	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
+	u64 delta_ns;
+	u64 vstimecmp_val = vcpu->arch.guest_csr.vstimecmp;
+
+	if (!vst->init_done)
+		return;
+
+	delta_ns = kvm_riscv_delta_cycles2ns(vstimecmp_val, gt, vst);
+	if (delta_ns) {
+		vst->next_cycles = vstimecmp_val;
+		hrtimer_start(&vst->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
+		vst->next_set = true;
+	}
+}
+
+static void kvm_riscv_vcpu_timer_unblocking(struct kvm_vcpu *vcpu)
+{
+	kvm_riscv_vcpu_timer_cancel(&vcpu->arch.vstimer);
+}
+
 int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
 				 const struct kvm_one_reg *reg)
 {
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
+	struct kvm_vcpu_timer *vst = &vcpu->arch.vstimer;
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
 	u64 __user *uaddr = (u64 __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
@@ -112,7 +169,10 @@ int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
 		reg_val = kvm_riscv_current_cycles(gt);
 		break;
 	case KVM_REG_RISCV_TIMER_REG(compare):
-		reg_val = t->next_cycles;
+		if (cpu_sstc_ext_available)
+			reg_val = vst->next_cycles;
+		else
+			reg_val = t->next_cycles;
 		break;
 	case KVM_REG_RISCV_TIMER_REG(state):
 		reg_val = (t->next_set) ? KVM_RISCV_TIMER_STATE_ON :
@@ -132,6 +192,7 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 				 const struct kvm_one_reg *reg)
 {
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
+	struct kvm_vcpu_timer *vst = &vcpu->arch.vstimer;
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
 	u64 __user *uaddr = (u64 __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
@@ -156,7 +217,10 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 		gt->time_delta = reg_val - get_cycles64();
 		break;
 	case KVM_REG_RISCV_TIMER_REG(compare):
-		t->next_cycles = reg_val;
+		if (cpu_sstc_ext_available)
+			vst->next_cycles = reg_val;
+		else
+			t->next_cycles = reg_val;
 		break;
 	case KVM_REG_RISCV_TIMER_REG(state):
 		if (reg_val == KVM_RISCV_TIMER_STATE_ON)
@@ -175,8 +239,9 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
+	struct kvm_vcpu_timer *vst = &vcpu->arch.vstimer;
 
-	if (t->init_done)
+	if (t->init_done || vst->init_done)
 		return -EINVAL;
 
 	hrtimer_init(&t->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
@@ -184,6 +249,11 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu)
 	t->init_done = true;
 	t->next_set = false;
 
+	hrtimer_init(&vst->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	vst->hrt.function = kvm_riscv_vcpu_vstimer_expired;
+	vst->init_done = true;
+	vst->next_set = false;
+
 	return 0;
 }
 
@@ -194,15 +264,21 @@ int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu)
 	ret = kvm_riscv_vcpu_timer_cancel(&vcpu->arch.timer);
 	vcpu->arch.timer.init_done = false;
 
+	ret = kvm_riscv_vcpu_timer_cancel(&vcpu->arch.vstimer);
+	vcpu->arch.vstimer.init_done = false;
+
 	return ret;
 }
 
 int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu)
 {
-	return kvm_riscv_vcpu_timer_cancel(&vcpu->arch.timer);
+	kvm_riscv_vcpu_timer_cancel(&vcpu->arch.timer);
+	kvm_riscv_vcpu_timer_cancel(&vcpu->arch.vstimer);
+
+	return 0;
 }
 
-void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
+static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
 {
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
 
@@ -214,6 +290,56 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 #endif
 }
 
+void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_timer *vst;
+	struct kvm_vcpu_csr *csr;
+
+	kvm_riscv_vcpu_update_timedelta(vcpu);
+
+	if (!cpu_sstc_ext_available)
+		return;
+
+	vst = &vcpu->arch.vstimer;
+	csr = &vcpu->arch.guest_csr;
+#ifdef CONFIG_64BIT
+	csr_write(CSR_VSTIMECMP, csr->vstimecmp);
+#else
+	csr_write(CSR_VSTIMECMP, (u32)csr->vstimecmp);
+	csr_write(CSR_VSTIMECMPH, (u32)(csr->vstimecmp >> 32));
+#endif
+
+	/* vstimer should be enabled for the remaining operations */
+	if (unlikely(!vst->init_done))
+		return;
+
+	if (kvm_vcpu_is_blocking(vcpu))
+		kvm_riscv_vcpu_timer_blocking(vcpu);
+}
+
+void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_csr *csr;
+	struct kvm_vcpu_timer *vst;
+
+	if (!cpu_sstc_ext_available)
+		return;
+
+	csr = &vcpu->arch.guest_csr;
+	vst = &vcpu->arch.vstimer;
+#ifdef CONFIG_64BIT
+	csr->vstimecmp = csr_read(CSR_VSTIMECMP);
+#else
+	csr->vstimecmp = csr_read(CSR_VSTIMECMP);
+	csr->vstimecmp |= (u64)csr_read(CSR_VSTIMECMPH) >> 32;
+#endif
+	/* vstimer should be enabled for the remaining operations */
+	if (unlikely(!vst->init_done))
+		return;
+
+	kvm_riscv_vcpu_timer_unblocking(vcpu);
+}
+
 int kvm_riscv_guest_timer_init(struct kvm *kvm)
 {
 	struct kvm_guest_timer *gt = &kvm->arch.timer;
-- 
2.30.2



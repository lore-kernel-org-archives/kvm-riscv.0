From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 12:46:28 -0700
Subject: [PATCH 16/17] riscv: KVM: Add vector lazy save/restore support
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
Message-ID: <20220921194629.1480202-17-stillson@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Vincent Chen <vincent.chen@sifive.com>

This patch adds vector context save/restore for guest VCPUs. To reduce the
impact on KVM performance, the implementation imitates the FP context
switch mechanism to lazily store and restore the vector context only when
the kernel enters/exits the in-kernel run loop and not during the KVM
world switch.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h        |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h |  65 +++++++++
 arch/riscv/include/uapi/asm/kvm.h        |   7 +
 arch/riscv/kernel/asm-offsets.c          |   7 +
 arch/riscv/kvm/Makefile                  |   1 +
 arch/riscv/kvm/vcpu.c                    |  32 +++++
 arch/riscv/kvm/vcpu_switch.S             |  69 +++++++++
 arch/riscv/kvm/vcpu_vector.c             | 173 +++++++++++++++++++++++
 8 files changed, 356 insertions(+)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
 create mode 100644 arch/riscv/kvm/vcpu_vector.c

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 60c517e4d576..665ddb4cec62 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -17,6 +17,7 @@
 #include <asm/hwcap.h>
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_insn.h>
+#include <asm/kvm_vcpu_vector.h>
 #include <asm/kvm_vcpu_timer.h>
 
 #define KVM_MAX_VCPUS			1024
@@ -143,6 +144,7 @@ struct kvm_cpu_context {
 	unsigned long sstatus;
 	unsigned long hstatus;
 	union __riscv_fp_state fp;
+	struct __riscv_v_state vector;
 };
 
 struct kvm_vcpu_csr {
diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
new file mode 100644
index 000000000000..1dcc1b2e05bb
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 SiFive
+ *
+ * Authors:
+ *     Atish Patra <atish.patra@wdc.com>
+ *     Anup Patel <anup.patel@wdc.com>
+ *     Vincent Chen <vincent.chen@sifive.com>
+ *     Greentime Hu <greentime.hu@sifive.com>
+ */
+
+#ifndef __KVM_VCPU_RISCV_VECTOR_H
+#define __KVM_VCPU_RISCV_VECTOR_H
+
+#include <linux/types.h>
+
+struct kvm_cpu_context;
+
+#ifdef CONFIG_VECTOR
+void __kvm_riscv_vector_save(struct kvm_cpu_context *context);
+void __kvm_riscv_vector_restore(struct kvm_cpu_context *context);
+void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
+				      unsigned long isa);
+void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
+					 unsigned long isa);
+void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
+void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
+void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
+#else
+static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
+{
+}
+
+static inline void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
+						    unsigned long isa)
+{
+}
+
+static inline void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
+						       unsigned long isa)
+{
+}
+
+static inline void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
+{
+}
+
+static inline void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
+{
+}
+
+static inline void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
+{
+}
+#endif
+
+int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
+				  const struct kvm_one_reg *reg,
+				  unsigned long rtype);
+int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
+				  const struct kvm_one_reg *reg,
+				  unsigned long rtype);
+#endif
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7351417afd62..f4ba57b235a3 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -96,6 +96,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_H,
 	KVM_RISCV_ISA_EXT_I,
 	KVM_RISCV_ISA_EXT_M,
+	KVM_RISCV_ISA_EXT_V,
 	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_SSTC,
 	KVM_RISCV_ISA_EXT_MAX,
@@ -145,6 +146,12 @@ enum KVM_RISCV_ISA_EXT_ID {
 /* ISA Extension registers are mapped as type 7 */
 #define KVM_REG_RISCV_ISA_EXT		(0x07 << KVM_REG_RISCV_TYPE_SHIFT)
 
+/* V extension registers are mapped as type 7 */
+#define KVM_REG_RISCV_VECTOR		(0x07 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_VECTOR_CSR_REG(name)	\
+		(offsetof(struct __riscv_v_state, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_VECTOR_REG(n)	\
+		((n) + sizeof(struct __riscv_v_state) / sizeof(unsigned long))
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 80316ef7bb78..2540b9146072 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -278,6 +278,13 @@ void asm_offsets(void)
 	OFFSET(KVM_ARCH_FP_D_F31, kvm_cpu_context, fp.d.f[31]);
 	OFFSET(KVM_ARCH_FP_D_FCSR, kvm_cpu_context, fp.d.fcsr);
 
+	/* V extension */
+
+	OFFSET(KVM_ARCH_VECTOR_VSTART, kvm_cpu_context, vector.vstart);
+	OFFSET(KVM_ARCH_VECTOR_VL, kvm_cpu_context, vector.vl);
+	OFFSET(KVM_ARCH_VECTOR_VTYPE, kvm_cpu_context, vector.vtype);
+	OFFSET(KVM_ARCH_VECTOR_VCSR, kvm_cpu_context, vector.vcsr);
+	OFFSET(KVM_ARCH_VECTOR_DATAP, kvm_cpu_context, vector.datap);
 	/*
 	 * THREAD_{F,X}* might be larger than a S-type offset can handle, but
 	 * these are used in performance-sensitive assembly so we can't resort
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 019df9208bdd..b26bc605a267 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -17,6 +17,7 @@ kvm-y += mmu.o
 kvm-y += vcpu.o
 kvm-y += vcpu_exit.o
 kvm-y += vcpu_fp.o
+kvm-y += vcpu_vector.o
 kvm-y += vcpu_insn.o
 kvm-y += vcpu_switch.o
 kvm-y += vcpu_sbi.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d0f08d5b4282..76941937e745 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -19,6 +19,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
+#include <asm/switch_to.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
@@ -51,6 +52,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_h,
 	RISCV_ISA_EXT_i,
 	RISCV_ISA_EXT_m,
+	RISCV_ISA_EXT_v,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_SSTC,
 };
@@ -79,6 +81,7 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
 	return true;
 }
 
+//CMS FIXME
 static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 {
 	switch (ext) {
@@ -121,6 +124,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_fp_reset(vcpu);
 
+	kvm_riscv_vcpu_vector_reset(vcpu);
+
 	kvm_riscv_vcpu_timer_reset(vcpu);
 
 	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
@@ -171,6 +176,15 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	cntx->hstatus |= HSTATUS_SPVP;
 	cntx->hstatus |= HSTATUS_SPV;
 
+	if (has_vector()) {
+		cntx->vector.datap = kmalloc(riscv_vsize, GFP_KERNEL);
+		if (!cntx->vector.datap)
+			return -ENOMEM;
+		vcpu->arch.host_context.vector.datap = kzalloc(riscv_vsize, GFP_KERNEL);
+		if (!vcpu->arch.host_context.vector.datap)
+			return -ENOMEM;
+	}
+
 	/* By default, make CY, TM, and IR counters accessible in VU mode */
 	reset_csr->scounteren = 0x7;
 
@@ -201,6 +215,9 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 
 	/* Free unused pages pre-allocated for G-stage page table mappings */
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
+
+	/* Free vector context space for host and guest kernel */
+	kvm_riscv_vcpu_free_vector_context(vcpu);
 }
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
@@ -539,6 +556,9 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 						 KVM_REG_RISCV_FP_D);
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
 		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_VECTOR)
+		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg,
+						 KVM_REG_RISCV_VECTOR);
 
 	return -EINVAL;
 }
@@ -562,6 +582,9 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 						 KVM_REG_RISCV_FP_D);
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
 		return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_VECTOR)
+		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg,
+						 KVM_REG_RISCV_VECTOR);
 
 	return -EINVAL;
 }
@@ -818,6 +841,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
 	kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
 					vcpu->arch.isa);
+	kvm_riscv_vcpu_host_vector_save(&vcpu->arch.host_context);
+	kvm_riscv_vcpu_guest_vector_restore(&vcpu->arch.guest_context,
+					    vcpu->arch.isa);
 
 	vcpu->cpu = cpu;
 }
@@ -834,6 +860,12 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_timer_save(vcpu);
 
+	kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context,
+					 vcpu->arch.isa);
+	kvm_riscv_vcpu_host_vector_restore(&vcpu->arch.host_context);
+
+	csr_write(CSR_HGATP, 0);
+
 	csr->vsstatus = csr_read(CSR_VSSTATUS);
 	csr->vsie = csr_read(CSR_VSIE);
 	csr->vstvec = csr_read(CSR_VSTVEC);
diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index d74df8eb4d71..730dc9b8c644 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -406,3 +406,72 @@ __kvm_riscv_fp_d_restore:
 	csrw CSR_SSTATUS, t2
 	ret
 #endif
+
+#ifdef CONFIG_VECTOR
+
+#define vstatep  a0
+#define datap    a1
+#define x_vstart t0
+#define x_vtype  t1
+#define x_vl     t2
+#define x_vcsr   t3
+#define incr     t4
+#define status   t5
+
+ENTRY(__kvm_riscv_vector_save)
+	li      status, SR_VS
+	csrs    CSR_STATUS, status
+
+	li	a2, KVM_ARCH_VECTOR_DATAP
+	add	datap, a0, a2
+	ld	datap, (datap)
+	csrr    x_vstart, CSR_VSTART
+	csrr    x_vtype, CSR_VTYPE
+	csrr    x_vl, CSR_VL
+	csrr    x_vcsr, CSR_VCSR
+	vsetvli incr, x0, e8, m8, ta, ma
+	vse8.v   v0, (datap)
+	add     datap, datap, incr
+	vse8.v   v8, (datap)
+	add     datap, datap, incr
+	vse8.v   v16, (datap)
+	add     datap, datap, incr
+	vse8.v   v24, (datap)
+
+	REG_S   x_vstart, KVM_ARCH_VECTOR_VSTART(vstatep)
+	REG_S   x_vtype, KVM_ARCH_VECTOR_VTYPE(vstatep)
+	REG_S   x_vl, KVM_ARCH_VECTOR_VL(vstatep)
+	REG_S   x_vcsr, KVM_ARCH_VECTOR_VCSR(vstatep)
+
+	csrc	CSR_STATUS, status
+	ret
+ENDPROC(__kvm_riscv_vector_save)
+
+ENTRY(__kvm_riscv_vector_restore)
+	li      status, SR_VS
+	csrs    CSR_STATUS, status
+
+	li	a2, KVM_ARCH_VECTOR_DATAP
+	add	datap, a0, a2
+	ld	datap, (datap)
+	vsetvli incr, x0, e8, m8, ta, ma
+	vle8.v   v0, (datap)
+	add     datap, datap, incr
+	vle8.v   v8, (datap)
+	add     datap, datap, incr
+	vle8.v   v16, (datap)
+	add     datap, datap, incr
+	vle8.v   v24, (datap)
+
+	REG_L   x_vstart, KVM_ARCH_VECTOR_VSTART(vstatep)
+	REG_L   x_vtype, KVM_ARCH_VECTOR_VTYPE(vstatep)
+	REG_L   x_vl, KVM_ARCH_VECTOR_VL(vstatep)
+	REG_L   x_vcsr, KVM_ARCH_VECTOR_VCSR(vstatep)
+	vsetvl  x0, x_vl, x_vtype
+	csrw    CSR_VSTART, x_vstart
+	csrw    CSR_VCSR, x_vcsr
+
+	csrc	CSR_STATUS, status
+	ret
+ENDPROC(__kvm_riscv_vector_restore)
+#endif
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
new file mode 100644
index 000000000000..37bf4ffd47dd
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 SiFive
+ *
+ * Authors:
+ *     Atish Patra <atish.patra@wdc.com>
+ *     Anup Patel <anup.patel@wdc.com>
+ *     Vincent Chen <vincent.chen@sifive.com>
+ *     Greentime Hu <greentime.hu@sifive.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <linux/uaccess.h>
+#include <asm/hwcap.h>
+
+#ifdef CONFIG_VECTOR
+extern unsigned long riscv_vsize;
+void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
+{
+	unsigned long isa = vcpu->arch.isa;
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	cntx->sstatus &= ~SR_VS;
+	if (riscv_isa_extension_available(&isa, v))
+		cntx->sstatus |= SR_VS_INITIAL;
+	else
+		cntx->sstatus |= SR_VS_OFF;
+
+	memset(cntx->vector.datap, 0, riscv_vsize);
+}
+
+static void kvm_riscv_vcpu_vector_clean(struct kvm_cpu_context *cntx)
+{
+	cntx->sstatus &= ~SR_VS;
+	cntx->sstatus |= SR_VS_CLEAN;
+}
+
+void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
+				      unsigned long isa)
+{
+	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
+		if (riscv_isa_extension_available(&isa, v))
+			__kvm_riscv_vector_save(cntx);
+		kvm_riscv_vcpu_vector_clean(cntx);
+	}
+}
+
+void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
+					 unsigned long isa)
+{
+	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
+		if (riscv_isa_extension_available(&isa, v))
+			__kvm_riscv_vector_restore(cntx);
+		kvm_riscv_vcpu_vector_clean(cntx);
+	}
+}
+
+void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
+{
+	/* No need to check host sstatus as it can be modified outside */
+	__kvm_riscv_vector_save(cntx);
+}
+
+void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
+{
+	__kvm_riscv_vector_restore(cntx);
+}
+
+void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
+{
+	kfree(vcpu->arch.guest_reset_context.vector.datap);
+	kfree(vcpu->arch.host_context.vector.datap);
+}
+#else
+#define riscv_vsize (0)
+#endif
+
+static void *kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
+				      unsigned long reg_num,
+				      size_t reg_size)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	void *reg_val;
+	size_t vlenb = riscv_vsize / 32;
+
+	if (reg_num < KVM_REG_RISCV_VECTOR_REG(0)) {
+		if (reg_size != sizeof(unsigned long))
+			return NULL;
+		switch (reg_num) {
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
+			reg_val = &cntx->vector.vstart;
+			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
+			reg_val = &cntx->vector.vl;
+			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
+			reg_val = &cntx->vector.vtype;
+			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
+			reg_val = &cntx->vector.vcsr;
+			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
+		default:
+			return NULL;
+		}
+	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
+		if (reg_size != vlenb)
+			return NULL;
+		reg_val = cntx->vector.datap
+			  + (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
+	} else {
+		return NULL;
+	}
+
+	return reg_val;
+}
+
+int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
+				  const struct kvm_one_reg *reg,
+				  unsigned long rtype)
+{
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val;
+	size_t reg_size = KVM_REG_SIZE(reg->id);
+
+	if ((rtype == KVM_REG_RISCV_VECTOR) &&
+	    riscv_isa_extension_available(&isa, v)) {
+		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
+	}
+
+	if (!reg_val)
+		return -EINVAL;
+
+	if (copy_to_user(uaddr, reg_val, reg_size))
+		return -EFAULT;
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
+				  const struct kvm_one_reg *reg,
+				  unsigned long rtype)
+{
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val = NULL;
+	size_t reg_size = KVM_REG_SIZE(reg->id);
+
+	if ((rtype == KVM_REG_RISCV_VECTOR) &&
+	    riscv_isa_extension_available(&isa, v)) {
+		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
+	}
+
+	if (!reg_val)
+		return -EINVAL;
+
+	if (copy_from_user(reg_val, uaddr, reg_size))
+		return -EFAULT;
+
+	return 0;
+}
-- 
2.25.1



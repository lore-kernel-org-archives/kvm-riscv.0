From: Anup Patel <anup.patel@wdc.com>
Date: Tue, 26 Oct 2021 22:31:35 +0530
Subject: [PATCH 2/3] RISC-V: KVM: Factor-out FP virtualization into separate
 sources
In-Reply-To: <20211026170136.2147619-1-anup.patel@wdc.com>
References: <20211026170136.2147619-1-anup.patel@wdc.com>
Message-ID: <20211026170136.2147619-3-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The timer and SBI virtualization is already in separate sources.
In future, we will have vector and AIA virtualization also added
as separate sources.

To align with above described modularity, we factor-out FP
virtualization into separate sources.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/kvm_host.h    |   5 +-
 arch/riscv/include/asm/kvm_vcpu_fp.h |  59 +++++++++
 arch/riscv/kvm/Makefile              |   1 +
 arch/riscv/kvm/vcpu.c                | 172 ---------------------------
 arch/riscv/kvm/vcpu_fp.c             | 167 ++++++++++++++++++++++++++
 5 files changed, 228 insertions(+), 176 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_fp.h
 create mode 100644 arch/riscv/kvm/vcpu_fp.c

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index d7e1696cd2ec..d27878d6adf9 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/kvm.h>
 #include <linux/kvm_types.h>
+#include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_timer.h>
 
 #ifdef CONFIG_64BIT
@@ -247,10 +248,6 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			struct kvm_cpu_trap *trap);
 
 void __kvm_riscv_switch_to(struct kvm_vcpu_arch *vcpu_arch);
-void __kvm_riscv_fp_f_save(struct kvm_cpu_context *context);
-void __kvm_riscv_fp_f_restore(struct kvm_cpu_context *context);
-void __kvm_riscv_fp_d_save(struct kvm_cpu_context *context);
-void __kvm_riscv_fp_d_restore(struct kvm_cpu_context *context);
 
 int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq);
 int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq);
diff --git a/arch/riscv/include/asm/kvm_vcpu_fp.h b/arch/riscv/include/asm/kvm_vcpu_fp.h
new file mode 100644
index 000000000000..4da9b8e0f050
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_fp.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *     Atish Patra <atish.patra@wdc.com>
+ *     Anup Patel <anup.patel@wdc.com>
+ */
+
+#ifndef __KVM_VCPU_RISCV_FP_H
+#define __KVM_VCPU_RISCV_FP_H
+
+#include <linux/types.h>
+
+struct kvm_cpu_context;
+
+#ifdef CONFIG_FPU
+void __kvm_riscv_fp_f_save(struct kvm_cpu_context *context);
+void __kvm_riscv_fp_f_restore(struct kvm_cpu_context *context);
+void __kvm_riscv_fp_d_save(struct kvm_cpu_context *context);
+void __kvm_riscv_fp_d_restore(struct kvm_cpu_context *context);
+
+void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_guest_fp_save(struct kvm_cpu_context *cntx,
+				  unsigned long isa);
+void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_context *cntx,
+				     unsigned long isa);
+void kvm_riscv_vcpu_host_fp_save(struct kvm_cpu_context *cntx);
+void kvm_riscv_vcpu_host_fp_restore(struct kvm_cpu_context *cntx);
+#else
+static inline void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
+{
+}
+static inline void kvm_riscv_vcpu_guest_fp_save(struct kvm_cpu_context *cntx,
+						unsigned long isa)
+{
+}
+static inline void kvm_riscv_vcpu_guest_fp_restore(
+					struct kvm_cpu_context *cntx,
+					unsigned long isa)
+{
+}
+static inline void kvm_riscv_vcpu_host_fp_save(struct kvm_cpu_context *cntx)
+{
+}
+static inline void kvm_riscv_vcpu_host_fp_restore(
+					struct kvm_cpu_context *cntx)
+{
+}
+#endif
+
+int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
+			      const struct kvm_one_reg *reg,
+			      unsigned long rtype);
+int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
+			      const struct kvm_one_reg *reg,
+			      unsigned long rtype);
+
+#endif
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 3226696b8340..30cdd1df0098 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -20,6 +20,7 @@ kvm-y += tlb.o
 kvm-y += mmu.o
 kvm-y += vcpu.o
 kvm-y += vcpu_exit.o
+kvm-y += vcpu_fp.o
 kvm-y += vcpu_switch.o
 kvm-y += vcpu_sbi.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 912928586df9..e3d3aed46184 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -38,86 +38,6 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
 		       sizeof(kvm_vcpu_stats_desc),
 };
 
-#ifdef CONFIG_FPU
-static void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
-{
-	unsigned long isa = vcpu->arch.isa;
-	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
-
-	cntx->sstatus &= ~SR_FS;
-	if (riscv_isa_extension_available(&isa, f) ||
-	    riscv_isa_extension_available(&isa, d))
-		cntx->sstatus |= SR_FS_INITIAL;
-	else
-		cntx->sstatus |= SR_FS_OFF;
-}
-
-static void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
-{
-	cntx->sstatus &= ~SR_FS;
-	cntx->sstatus |= SR_FS_CLEAN;
-}
-
-static void kvm_riscv_vcpu_guest_fp_save(struct kvm_cpu_context *cntx,
-					 unsigned long isa)
-{
-	if ((cntx->sstatus & SR_FS) == SR_FS_DIRTY) {
-		if (riscv_isa_extension_available(&isa, d))
-			__kvm_riscv_fp_d_save(cntx);
-		else if (riscv_isa_extension_available(&isa, f))
-			__kvm_riscv_fp_f_save(cntx);
-		kvm_riscv_vcpu_fp_clean(cntx);
-	}
-}
-
-static void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_context *cntx,
-					    unsigned long isa)
-{
-	if ((cntx->sstatus & SR_FS) != SR_FS_OFF) {
-		if (riscv_isa_extension_available(&isa, d))
-			__kvm_riscv_fp_d_restore(cntx);
-		else if (riscv_isa_extension_available(&isa, f))
-			__kvm_riscv_fp_f_restore(cntx);
-		kvm_riscv_vcpu_fp_clean(cntx);
-	}
-}
-
-static void kvm_riscv_vcpu_host_fp_save(struct kvm_cpu_context *cntx)
-{
-	/* No need to check host sstatus as it can be modified outside */
-	if (riscv_isa_extension_available(NULL, d))
-		__kvm_riscv_fp_d_save(cntx);
-	else if (riscv_isa_extension_available(NULL, f))
-		__kvm_riscv_fp_f_save(cntx);
-}
-
-static void kvm_riscv_vcpu_host_fp_restore(struct kvm_cpu_context *cntx)
-{
-	if (riscv_isa_extension_available(NULL, d))
-		__kvm_riscv_fp_d_restore(cntx);
-	else if (riscv_isa_extension_available(NULL, f))
-		__kvm_riscv_fp_f_restore(cntx);
-}
-#else
-static void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
-{
-}
-static void kvm_riscv_vcpu_guest_fp_save(struct kvm_cpu_context *cntx,
-					 unsigned long isa)
-{
-}
-static void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_context *cntx,
-					    unsigned long isa)
-{
-}
-static void kvm_riscv_vcpu_host_fp_save(struct kvm_cpu_context *cntx)
-{
-}
-static void kvm_riscv_vcpu_host_fp_restore(struct kvm_cpu_context *cntx)
-{
-}
-#endif
-
 #define KVM_RISCV_ISA_ALLOWED	(riscv_isa_extension_mask(a) | \
 				 riscv_isa_extension_mask(c) | \
 				 riscv_isa_extension_mask(d) | \
@@ -414,98 +334,6 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-static int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
-				     const struct kvm_one_reg *reg,
-				     unsigned long rtype)
-{
-	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
-	unsigned long isa = vcpu->arch.isa;
-	unsigned long __user *uaddr =
-			(unsigned long __user *)(unsigned long)reg->addr;
-	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
-					    KVM_REG_SIZE_MASK |
-					    rtype);
-	void *reg_val;
-
-	if ((rtype == KVM_REG_RISCV_FP_F) &&
-	    riscv_isa_extension_available(&isa, f)) {
-		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
-			return -EINVAL;
-		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
-			reg_val = &cntx->fp.f.fcsr;
-		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
-			reg_val = &cntx->fp.f.f[reg_num];
-		else
-			return -EINVAL;
-	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
-		   riscv_isa_extension_available(&isa, d)) {
-		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
-				return -EINVAL;
-			reg_val = &cntx->fp.d.fcsr;
-		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
-			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
-				return -EINVAL;
-			reg_val = &cntx->fp.d.f[reg_num];
-		} else
-			return -EINVAL;
-	} else
-		return -EINVAL;
-
-	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
-		return -EFAULT;
-
-	return 0;
-}
-
-static int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
-				     const struct kvm_one_reg *reg,
-				     unsigned long rtype)
-{
-	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
-	unsigned long isa = vcpu->arch.isa;
-	unsigned long __user *uaddr =
-			(unsigned long __user *)(unsigned long)reg->addr;
-	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
-					    KVM_REG_SIZE_MASK |
-					    rtype);
-	void *reg_val;
-
-	if ((rtype == KVM_REG_RISCV_FP_F) &&
-	    riscv_isa_extension_available(&isa, f)) {
-		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
-			return -EINVAL;
-		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
-			reg_val = &cntx->fp.f.fcsr;
-		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
-			reg_val = &cntx->fp.f.f[reg_num];
-		else
-			return -EINVAL;
-	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
-		   riscv_isa_extension_available(&isa, d)) {
-		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
-				return -EINVAL;
-			reg_val = &cntx->fp.d.fcsr;
-		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
-			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
-				return -EINVAL;
-			reg_val = &cntx->fp.d.f[reg_num];
-		} else
-			return -EINVAL;
-	} else
-		return -EINVAL;
-
-	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
-		return -EFAULT;
-
-	return 0;
-}
-
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
new file mode 100644
index 000000000000..1b070152578f
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *     Atish Patra <atish.patra@wdc.com>
+ *     Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <linux/uaccess.h>
+
+#ifdef CONFIG_FPU
+void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
+{
+	unsigned long isa = vcpu->arch.isa;
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	cntx->sstatus &= ~SR_FS;
+	if (riscv_isa_extension_available(&isa, f) ||
+	    riscv_isa_extension_available(&isa, d))
+		cntx->sstatus |= SR_FS_INITIAL;
+	else
+		cntx->sstatus |= SR_FS_OFF;
+}
+
+void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
+{
+	cntx->sstatus &= ~SR_FS;
+	cntx->sstatus |= SR_FS_CLEAN;
+}
+
+void kvm_riscv_vcpu_guest_fp_save(struct kvm_cpu_context *cntx,
+				  unsigned long isa)
+{
+	if ((cntx->sstatus & SR_FS) == SR_FS_DIRTY) {
+		if (riscv_isa_extension_available(&isa, d))
+			__kvm_riscv_fp_d_save(cntx);
+		else if (riscv_isa_extension_available(&isa, f))
+			__kvm_riscv_fp_f_save(cntx);
+		kvm_riscv_vcpu_fp_clean(cntx);
+	}
+}
+
+void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_context *cntx,
+				     unsigned long isa)
+{
+	if ((cntx->sstatus & SR_FS) != SR_FS_OFF) {
+		if (riscv_isa_extension_available(&isa, d))
+			__kvm_riscv_fp_d_restore(cntx);
+		else if (riscv_isa_extension_available(&isa, f))
+			__kvm_riscv_fp_f_restore(cntx);
+		kvm_riscv_vcpu_fp_clean(cntx);
+	}
+}
+
+void kvm_riscv_vcpu_host_fp_save(struct kvm_cpu_context *cntx)
+{
+	/* No need to check host sstatus as it can be modified outside */
+	if (riscv_isa_extension_available(NULL, d))
+		__kvm_riscv_fp_d_save(cntx);
+	else if (riscv_isa_extension_available(NULL, f))
+		__kvm_riscv_fp_f_save(cntx);
+}
+
+void kvm_riscv_vcpu_host_fp_restore(struct kvm_cpu_context *cntx)
+{
+	if (riscv_isa_extension_available(NULL, d))
+		__kvm_riscv_fp_d_restore(cntx);
+	else if (riscv_isa_extension_available(NULL, f))
+		__kvm_riscv_fp_f_restore(cntx);
+}
+#endif
+
+int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
+			      const struct kvm_one_reg *reg,
+			      unsigned long rtype)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val;
+
+	if ((rtype == KVM_REG_RISCV_FP_F) &&
+	    riscv_isa_extension_available(&isa, f)) {
+		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+			return -EINVAL;
+		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
+			reg_val = &cntx->fp.f.fcsr;
+		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
+			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
+			reg_val = &cntx->fp.f.f[reg_num];
+		else
+			return -EINVAL;
+	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
+		   riscv_isa_extension_available(&isa, d)) {
+		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.fcsr;
+		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
+			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.f[reg_num];
+		} else
+			return -EINVAL;
+	} else
+		return -EINVAL;
+
+	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
+			      const struct kvm_one_reg *reg,
+			      unsigned long rtype)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val;
+
+	if ((rtype == KVM_REG_RISCV_FP_F) &&
+	    riscv_isa_extension_available(&isa, f)) {
+		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+			return -EINVAL;
+		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
+			reg_val = &cntx->fp.f.fcsr;
+		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
+			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
+			reg_val = &cntx->fp.f.f[reg_num];
+		else
+			return -EINVAL;
+	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
+		   riscv_isa_extension_available(&isa, d)) {
+		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.fcsr;
+		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
+			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.f[reg_num];
+		} else
+			return -EINVAL;
+	} else
+		return -EINVAL;
+
+	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
-- 
2.25.1



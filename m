From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 14:43:59 -0700
Subject: [PATCH v12 17/17] riscv: prctl to enable vector commands
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
Message-ID: <20220921214439.1491510-17-stillson@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This code makes enabling the vector extension on a riscv manchine
optional by adding an option to prctl() to allow a process to enable,
disable or query its vector context state.

-added prctl to enable/disable/query current vector state
-added actual function in riscv specific code to change/query the process
state
- Fixed problem with initial set of patches
	(missing some EXPORT_SYMBOL() macro calls)
- rebased to 6.0-rc1
---
 arch/riscv/configs/defconfig             |  6 ++++++
 arch/riscv/include/asm/kvm_vcpu_vector.h |  8 ++++----
 arch/riscv/include/asm/processor.h       |  6 ++++++
 arch/riscv/include/asm/switch_to.h       | 11 +++++++++++
 arch/riscv/kernel/cpufeature.c           |  3 ++-
 arch/riscv/kernel/process.c              | 20 +++++++++++++++++++-
 arch/riscv/kvm/vcpu_vector.c             | 14 +++++++-------
 include/uapi/linux/prctl.h               |  6 ++++++
 kernel/sys.c                             |  7 +++++++
 9 files changed, 68 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index aed332a9d4ea..fce054286b1f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -209,3 +209,9 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
+CONFIG_ARCH_RV64I=y
+CONFIG_64BIT=y
+CONFIG_VECTOR=y
+CONFIG_ARCH_RV64I=y
+CONFIG_64BIT=y
+CONFIG_VECTOR=y
diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 1dcc1b2e05bb..c7101ff943a0 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -22,9 +22,9 @@ void __kvm_riscv_vector_save(struct kvm_cpu_context *context);
 void __kvm_riscv_vector_restore(struct kvm_cpu_context *context);
 void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
-				      unsigned long isa);
+				      unsigned long *isa);
 void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
-					 unsigned long isa);
+					 unsigned long *isa);
 void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
 void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
@@ -34,12 +34,12 @@ static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 }
 
 static inline void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
-						    unsigned long isa)
+						    unsigned long *isa)
 {
 }
 
 static inline void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
-						       unsigned long isa)
+						       unsigned long *isa)
 {
 }
 
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index a09141ecf6aa..f2d0a91ce174 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -88,6 +88,12 @@ extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
 extern unsigned long signal_minsigstksz __ro_after_init;
+
+#ifdef CONFIG_VECTOR
+extern int rvv_proc_enable(unsigned long x);
+#define RVV_PROC_ENABLE(x) rvv_proc_enable(x)
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 527951c033d4..d9747450311c 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -80,6 +80,17 @@ extern unsigned long riscv_vsize;
 extern void __vstate_save(struct __riscv_v_state *save_to, void *datap);
 extern void __vstate_restore(struct __riscv_v_state *restore_from, void *datap);
 
+static inline bool vstate_query(struct pt_regs *regs)
+{
+	return (regs->status & SR_VS) != 0;
+}
+
+static inline void vstate_on(struct task_struct *task,
+				struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~(SR_VS)) | SR_VS_INITIAL;
+}
+
 static inline void __vstate_clean(struct pt_regs *regs)
 {
 	regs->status = (regs->status & ~(SR_VS)) | SR_VS_CLEAN;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 0487ab19b234..3be469cb9266 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -37,6 +37,8 @@ __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #include <asm/vector.h>
 __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_vector);
 unsigned long riscv_vsize __read_mostly;
+EXPORT_SYMBOL(cpu_hwcap_vector);
+EXPORT_SYMBOL(riscv_vsize);
 #endif
 
 /**
@@ -346,4 +348,3 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
-}
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e88a37fc77ed..a5a76d1374ec 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -15,6 +15,7 @@
 #include <linux/tick.h>
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
+#include <linux/prctl.h>
 
 #include <asm/unistd.h>
 #include <asm/processor.h>
@@ -134,7 +135,6 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 			if (WARN_ON(!vstate->datap))
 				return;
 		}
-		regs->status |= SR_VS_INITIAL;
 
 		/*
 		 * Restore the initial value to the vector register
@@ -230,3 +229,22 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
+
+#ifdef CONFIG_VECTOR
+int rvv_proc_enable(unsigned long x)
+{
+	switch (x) {
+	case PR_RVV_DISABLE:
+		vstate_off(current, task_pt_regs(current));
+		return 0;
+	case PR_RVV_ENABLE:
+		vstate_on(current, task_pt_regs(current));
+		return 0;
+	case PR_RVV_QUERY:
+		return vstate_query(task_pt_regs(current));
+	default:
+		return -(EINVAL);
+
+	}
+}
+#endif
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 37bf4ffd47dd..9d1613da561a 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -20,7 +20,7 @@
 extern unsigned long riscv_vsize;
 void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 {
-	unsigned long isa = vcpu->arch.isa;
+	unsigned long isa = *vcpu->arch.isa;
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 
 	cntx->sstatus &= ~SR_VS;
@@ -39,20 +39,20 @@ static void kvm_riscv_vcpu_vector_clean(struct kvm_cpu_context *cntx)
 }
 
 void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
-				      unsigned long isa)
+				      unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
-		if (riscv_isa_extension_available(&isa, v))
+		if (riscv_isa_extension_available(isa, v))
 			__kvm_riscv_vector_save(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
 }
 
 void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
-					 unsigned long isa)
+					 unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
-		if (riscv_isa_extension_available(&isa, v))
+		if (riscv_isa_extension_available(isa, v))
 			__kvm_riscv_vector_restore(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
@@ -122,7 +122,7 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg,
 				  unsigned long rtype)
 {
-	unsigned long isa = vcpu->arch.isa;
+	unsigned long isa = *vcpu->arch.isa;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
@@ -149,7 +149,7 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg,
 				  unsigned long rtype)
 {
-	unsigned long isa = vcpu->arch.isa;
+	unsigned long isa = *vcpu->arch.isa;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index a5e06dcbba13..8ea56e4c48f8 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -281,6 +281,12 @@ struct prctl_mm_map {
 # define PR_SME_VL_LEN_MASK		0xffff
 # define PR_SME_VL_INHERIT		(1 << 17) /* inherit across exec */
 
+/* RISC-V V vector extension */
+#define PR_RVV_STATE			65
+# define PR_RVV_DISABLE			0
+# define PR_RVV_ENABLE			1
+# define PR_RVV_QUERY			2
+
 #define PR_SET_VMA		0x53564d41
 # define PR_SET_VMA_ANON_NAME		0
 
diff --git a/kernel/sys.c b/kernel/sys.c
index b911fa6d81ab..3049b1823273 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -138,6 +138,9 @@
 #ifndef GET_TAGGED_ADDR_CTRL
 # define GET_TAGGED_ADDR_CTRL()		(-EINVAL)
 #endif
+#ifndef RVV_PROC_ENABLE
+# define RVV_PROC_ENABLE(x)			(-EINVAL)
+#endif
 
 /*
  * this is where the system-wide overflow UID and GID are defined, for
@@ -2620,6 +2623,10 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		error = sched_core_share_pid(arg2, arg3, arg4, arg5);
 		break;
 #endif
+	case PR_RVV_STATE:
+		error = RVV_PROC_ENABLE(arg2);
+		break;
+
 	case PR_SET_VMA:
 		error = prctl_set_vma(arg2, arg3, arg4, arg5);
 		break;
-- 
2.25.1



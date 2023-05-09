From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue,  9 May 2023 10:30:29 +0000
Subject: [PATCH -next v19 20/24] riscv: Add prctl controls for userspace vector management
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
Message-ID: <20230509103033.11285-21-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch add two riscv-specific prctls, to allow usespace control the
use of vector unit:

 * PR_RISCV_V_SET_CONTROL: control the permission to use Vector at next,
   or all following execve for a thread. Turning off a thread's Vector
   live is not possible since libraries may have registered ifunc that
   may execute Vector instructions.
 * PR_RISCV_V_GET_CONTROL: get the same permission setting for the
   current thread, and the setting for following execve(s).

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/include/asm/processor.h |  13 ++++
 arch/riscv/include/asm/vector.h    |   4 ++
 arch/riscv/kernel/process.c        |   1 +
 arch/riscv/kernel/vector.c         | 108 +++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c              |   2 +
 include/uapi/linux/prctl.h         |  11 +++
 kernel/sys.c                       |  12 ++++
 7 files changed, 151 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 38ded8c5f207..79261da74cfd 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -40,6 +40,7 @@ struct thread_struct {
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
+	unsigned long vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
 };
 
@@ -83,6 +84,18 @@ extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
 extern unsigned long signal_minsigstksz __ro_after_init;
+
+#ifdef CONFIG_RISCV_ISA_V
+/* Userspace interface for PR_RISCV_V_{SET,GET}_VS prctl()s: */
+#define RISCV_V_SET_CONTROL(arg)	riscv_v_vstate_ctrl_set_current(arg)
+#define RISCV_V_GET_CONTROL()		riscv_v_vstate_ctrl_get_current()
+extern unsigned int riscv_v_vstate_ctrl_set_current(unsigned long arg);
+extern unsigned int riscv_v_vstate_ctrl_get_current(void);
+#else /* !CONFIG_RISCV_ISA_V */
+#define RISCV_V_SET_CONTROL(arg)	(-EINVAL)
+#define RISCV_V_GET_CONTROL()		(-EINVAL)
+#endif /* CONFIG_RISCV_ISA_V */
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index a8881af83ce4..e7db2d373044 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -160,6 +160,9 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	riscv_v_vstate_restore(next, task_pt_regs(next));
 }
 
+void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
+bool riscv_v_user_allowed(void);
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 struct pt_regs;
@@ -168,6 +171,7 @@ static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
 static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
+static inline bool riscv_v_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_vstate_save(task, regs)		do {} while (0)
 #define riscv_v_vstate_restore(task, regs)	do {} while (0)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b7a10361ddc6..60278233926c 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -149,6 +149,7 @@ void flush_thread(void)
 #endif
 #ifdef CONFIG_RISCV_ISA_V
 	/* Reset vector state */
+	riscv_v_vstate_ctrl_init(current);
 	riscv_v_vstate_off(task_pt_regs(current));
 	kfree(current->thread.vstate.datap);
 	memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 960a343799c6..16ccb35625a9 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/uaccess.h>
+#include <linux/prctl.h>
 
 #include <asm/thread_info.h>
 #include <asm/processor.h>
@@ -19,6 +20,8 @@
 #include <asm/ptrace.h>
 #include <asm/bug.h>
 
+static bool riscv_v_implicit_uacc = !IS_ENABLED(CONFIG_RISCV_V_DISABLE);
+
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
 
@@ -91,11 +94,51 @@ static int riscv_v_thread_zalloc(void)
 	return 0;
 }
 
+#define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
+#define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
+#define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
+#define VSTATE_CTRL_GET_INHERIT(x) (!!((x) & PR_RISCV_V_VSTATE_CTRL_INHERIT))
+static inline int riscv_v_get_cur_ctrl(struct task_struct *tsk)
+{
+	return VSTATE_CTRL_GET_CUR(tsk->thread.vstate_ctrl);
+}
+
+static inline int riscv_v_get_next_ctrl(struct task_struct *tsk)
+{
+	return VSTATE_CTRL_GET_NEXT(tsk->thread.vstate_ctrl);
+}
+
+static inline bool riscv_v_test_ctrl_inherit(struct task_struct *tsk)
+{
+	return VSTATE_CTRL_GET_INHERIT(tsk->thread.vstate_ctrl);
+}
+
+static inline void riscv_v_set_ctrl(struct task_struct *tsk, int cur, int nxt,
+				    bool inherit)
+{
+	unsigned long ctrl;
+
+	ctrl = cur & PR_RISCV_V_VSTATE_CTRL_CUR_MASK;
+	ctrl |= VSTATE_CTRL_MAKE_NEXT(nxt);
+	if (inherit)
+		ctrl |= PR_RISCV_V_VSTATE_CTRL_INHERIT;
+	tsk->thread.vstate_ctrl = ctrl;
+}
+
+bool riscv_v_user_allowed(void)
+{
+	return riscv_v_get_cur_ctrl(current) == PR_RISCV_V_VSTATE_CTRL_ON;
+}
+
 bool riscv_v_first_use_handler(struct pt_regs *regs)
 {
 	u32 __user *epc = (u32 __user *)regs->epc;
 	u32 insn = (u32)regs->badaddr;
 
+	/* Do not handle the trap if V is not allowed for this process*/
+	if (!riscv_v_user_allowed())
+		return false;
+
 	/* If V has been enabled then it is not the first-use trap */
 	if (riscv_v_vstate_query(regs))
 		return false;
@@ -125,3 +168,68 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	riscv_v_vstate_on(regs);
 	return true;
 }
+
+void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
+{
+	bool inherit;
+	int cur, next;
+
+	next = riscv_v_get_next_ctrl(tsk);
+	if (!next) {
+		if (riscv_v_implicit_uacc)
+			cur = PR_RISCV_V_VSTATE_CTRL_ON;
+		else
+			cur = PR_RISCV_V_VSTATE_CTRL_OFF;
+	} else {
+		cur = next;
+	}
+	/* Clear next mask if inherit-bit is not set */
+	inherit = riscv_v_test_ctrl_inherit(tsk);
+	if (!inherit)
+		next = PR_RISCV_V_VSTATE_CTRL_DEFAULT;
+
+	riscv_v_set_ctrl(tsk, cur, next, inherit);
+}
+
+unsigned int riscv_v_vstate_ctrl_get_current(void)
+{
+	return current->thread.vstate_ctrl & PR_RISCV_V_VSTATE_CTRL_MASK;
+}
+
+unsigned int riscv_v_vstate_ctrl_set_current(unsigned long arg)
+{
+	bool inherit;
+	int cur, next;
+
+	if (arg & ~PR_RISCV_V_VSTATE_CTRL_MASK)
+		return -EINVAL;
+
+	cur = VSTATE_CTRL_GET_CUR(arg);
+	switch (cur) {
+	case PR_RISCV_V_VSTATE_CTRL_OFF:
+		/* Do not allow user to turn off V if current is not off */
+		if (riscv_v_get_cur_ctrl(current) != PR_RISCV_V_VSTATE_CTRL_OFF)
+			return -EPERM;
+
+		break;
+	case PR_RISCV_V_VSTATE_CTRL_ON:
+		break;
+	case PR_RISCV_V_VSTATE_CTRL_DEFAULT:
+		cur = riscv_v_get_cur_ctrl(current);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	next = VSTATE_CTRL_GET_NEXT(arg);
+	inherit = VSTATE_CTRL_GET_INHERIT(arg);
+	switch (next) {
+	case PR_RISCV_V_VSTATE_CTRL_DEFAULT:
+	case PR_RISCV_V_VSTATE_CTRL_OFF:
+	case PR_RISCV_V_VSTATE_CTRL_ON:
+		riscv_v_set_ctrl(current, cur, next, inherit);
+		return 0;
+	}
+
+	return -EINVAL;
+}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e5e045852e6a..704968b71272 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -88,6 +88,8 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
 	switch (ext) {
 	case KVM_RISCV_ISA_EXT_H:
 		return false;
+	case KVM_RISCV_ISA_EXT_V:
+		return riscv_v_user_allowed();
 	default:
 		break;
 	}
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index f23d9a16507f..3c36aeade991 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -294,4 +294,15 @@ struct prctl_mm_map {
 
 #define PR_SET_MEMORY_MERGE		67
 #define PR_GET_MEMORY_MERGE		68
+
+#define PR_RISCV_V_SET_CONTROL		69
+#define PR_RISCV_V_GET_CONTROL		70
+# define PR_RISCV_V_VSTATE_CTRL_DEFAULT		0
+# define PR_RISCV_V_VSTATE_CTRL_OFF		1
+# define PR_RISCV_V_VSTATE_CTRL_ON		2
+# define PR_RISCV_V_VSTATE_CTRL_INHERIT		(1 << 4)
+# define PR_RISCV_V_VSTATE_CTRL_CUR_MASK	0x3
+# define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
+# define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 339fee3eff6a..412d2c126060 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -140,6 +140,12 @@
 #ifndef GET_TAGGED_ADDR_CTRL
 # define GET_TAGGED_ADDR_CTRL()		(-EINVAL)
 #endif
+#ifndef PR_RISCV_V_SET_CONTROL
+# define PR_RISCV_V_SET_CONTROL@	(-EINVAL)
+#endif
+#ifndef PR_RISCV_V_GET_CONTROL
+# define PR_RISCV_V_GET_CONTROL()	(-EINVAL)
+#endif
 
 /*
  * this is where the system-wide overflow UID and GID are defined, for
@@ -2708,6 +2714,12 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		error = !!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
 		break;
 #endif
+	case PR_RISCV_V_SET_CONTROL:
+		error = RISCV_V_SET_CONTROL(arg2);
+		break;
+	case PR_RISCV_V_GET_CONTROL:
+		error = RISCV_V_GET_CONTROL();
+		break;
 	default:
 		error = -EINVAL;
 		break;
-- 
2.17.1



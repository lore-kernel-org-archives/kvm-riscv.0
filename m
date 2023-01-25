From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 25 Jan 2023 14:20:50 +0000
Subject: [PATCH -next v13 13/19] riscv: signal: Add sigcontext save/restore for vector
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
Message-ID: <20230125142056.18356-14-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Greentime Hu <greentime.hu@sifive.com>

This patch facilitates the existing fp-reserved words for placement of
the first extension's context header on the user's sigframe. A context
header consists of a distinct magic word and the size, including the
header itself, of an extension on the stack. Then, the frame is followed
by the context of that extension, and then a header + context body for
another extension if exists. If there is no more extension to come, then
the frame must be ended with a null context header. A special case is
rv64gc, where the kernel support no extensions requiring to expose
additional regfile to the user. In such case the kernel would place the
null context header right after the first reserved word of
__riscv_q_ext_state when saving sigframe. And the kernel would check if
all reserved words are zeros when a signal handler returns.

__riscv_q_ext_state---->|	|<-__riscv_extra_ext_header
			~	~
	.reserved[0]--->|0	|<-	.reserved
		<-------|magic	|<-	.hdr
		|	|size	|_______ end of sc_fpregs
		|	|ext-bdy|
		|	~	~
	+)size	------->|magic	|<- another context header
			|size	|
			|ext-bdy|
			~	~
			|magic:0|<- null context header
			|size:0	|

The vector registers will be saved in datap pointer. The datap pointer
will be allocated dynamically when the task needs in kernel space. On
the other hand, datap pointer on the sigframe will be set right after
the __riscv_v_state data structure.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/uapi/asm/ptrace.h     |  15 ++
 arch/riscv/include/uapi/asm/sigcontext.h |  16 ++-
 arch/riscv/kernel/setup.c                |   3 +
 arch/riscv/kernel/signal.c               | 175 ++++++++++++++++++++---
 4 files changed, 189 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 2c86d017c142..93f2cbdb5427 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -71,6 +71,21 @@ struct __riscv_q_ext_state {
 	__u32 reserved[3];
 };
 
+struct __riscv_ctx_hdr {
+	__u32 magic;
+	__u32 size;
+};
+
+struct __riscv_extra_ext_header {
+	__u32 __padding[129] __attribute__((aligned(16)));
+	/*
+	 * Reserved for expansion of sigcontext structure.  Currently zeroed
+	 * upon signal, and must be zero upon sigreturn.
+	 */
+	__u32 reserved;
+	struct __riscv_ctx_hdr hdr;
+};
+
 union __riscv_fp_state {
 	struct __riscv_f_ext_state f;
 	struct __riscv_d_ext_state d;
diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index 84f2dfcfdbce..554319a4d05f 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -8,6 +8,17 @@
 
 #include <asm/ptrace.h>
 
+/* The Magic number for signal context frame header. */
+#define RVV_MAGIC	0x53465457
+#define END_MAGIC	0x0
+
+/* The size of END signal context header. */
+#define END_HDR_SIZE	0x0
+
+struct __sc_riscv_v_state {
+	struct __riscv_v_state v_state;
+} __attribute__((aligned(16)));
+
 /*
  * Signal context structure
  *
@@ -16,7 +27,10 @@
  */
 struct sigcontext {
 	struct user_regs_struct sc_regs;
-	union __riscv_fp_state sc_fpregs;
+	union {
+		union __riscv_fp_state sc_fpregs;
+		struct __riscv_extra_ext_header sc_extdesc;
+	};
 };
 
 #endif /* _UAPI_ASM_RISCV_SIGCONTEXT_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 86acd690d529..03eefa49b0b5 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -262,6 +262,8 @@ static void __init parse_dtb(void)
 #endif
 }
 
+extern void __init init_rt_signal_env(void);
+
 void __init setup_arch(char **cmdline_p)
 {
 	parse_dtb();
@@ -299,6 +301,7 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_init_cbom_blocksize();
 	riscv_fill_hwcap();
+	init_rt_signal_env();
 	apply_boot_alternatives();
 }
 
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 0c8be5404a73..fe91475e63e4 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -18,9 +18,11 @@
 #include <asm/signal.h>
 #include <asm/signal32.h>
 #include <asm/switch_to.h>
+#include <asm/vector.h>
 #include <asm/csr.h>
 
 extern u32 __user_rt_sigreturn[2];
+static size_t rvv_sc_size;
 
 #define DEBUG_SIG 0
 
@@ -62,34 +64,155 @@ static long save_fp_state(struct pt_regs *regs,
 #define restore_fp_state(task, regs) (0)
 #endif
 
+#ifdef CONFIG_RISCV_ISA_V
+
+static long save_v_state(struct pt_regs *regs, void **sc_vec)
+{
+	/*
+	 * Put __sc_riscv_v_state to the user's signal context space pointed
+	 * by sc_vec and the datap point the address right
+	 * after __sc_riscv_v_state.
+	 */
+	struct __riscv_ctx_hdr __user *hdr = (struct __riscv_ctx_hdr *)(*sc_vec);
+	struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)(hdr + 1);
+	void __user *datap = state + 1;
+	long err;
+
+	/* datap is designed to be 16 byte aligned for better performance */
+	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
+
+	vstate_save(current, regs);
+	/* Copy everything of vstate but datap. */
+	err = __copy_to_user(&state->v_state, &current->thread.vstate,
+			     offsetof(struct __riscv_v_state, datap));
+	/* Copy the pointer datap itself. */
+	err |= __put_user(datap, &state->v_state.datap);
+	/* Copy the whole vector content to user space datap. */
+	err |= __copy_to_user(datap, current->thread.vstate.datap, riscv_vsize);
+	/* Copy magic to the user space after saving  all vector conetext */
+	err |= __put_user(RVV_MAGIC, &hdr->magic);
+	err |= __put_user(rvv_sc_size, &hdr->size);
+	if (unlikely(err))
+		return err;
+
+	/* Only progress the sv_vec if everything has done successfully  */
+	*sc_vec += rvv_sc_size;
+	return 0;
+}
+
+/*
+ * Restore Vector extension context from the user's signal frame. This function
+ * assumes a valid extension header. So magic and size checking must be done by
+ * the caller.
+ */
+static long __restore_v_state(struct pt_regs *regs, void *sc_vec)
+{
+	long err;
+	struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)(sc_vec);
+	void __user *datap;
+
+	/* Copy everything of __sc_riscv_v_state except datap. */
+	err = __copy_from_user(&current->thread.vstate, &state->v_state,
+			       offsetof(struct __riscv_v_state, datap));
+	if (unlikely(err))
+		return err;
+
+	/* Copy the pointer datap itself. */
+	err = __get_user(datap, &state->v_state.datap);
+	if (unlikely(err))
+		return err;
+	/*
+	 * Copy the whole vector content from user space datap. Use
+	 * copy_from_user to prevent information leak.
+	 */
+	err = copy_from_user(current->thread.vstate.datap, datap, riscv_vsize);
+	if (unlikely(err))
+		return err;
+
+	vstate_restore(current, regs);
+
+	return err;
+}
+#else
+#define save_v_state(task, regs) (0)
+#define __restore_v_state(task, regs) (0)
+#endif
+
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
 {
+	void *sc_ext_ptr = &sc->sc_extdesc.hdr;
+	__u32 rsvd;
 	long err;
-	size_t i;
-
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
 	if (unlikely(err))
-		return err;
+		goto done;
 	/* Restore the floating-point state. */
 	if (has_fpu()) {
 		err = restore_fp_state(regs, &sc->sc_fpregs);
 		if (unlikely(err))
-			return err;
+			goto done;
 	}
 
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++) {
-		u32 value;
-
-		err = __get_user(value, &sc->sc_fpregs.q.reserved[i]);
-		if (unlikely(err))
+	/* Check the reserved word before extensions parsing */
+	err = __get_user(rsvd, &sc->sc_extdesc.reserved);
+	if (unlikely(err))
+		goto done;
+	if (unlikely(rsvd))
+		goto invalid;
+
+	while (1 && !err) {
+		__u32 magic, size;
+		struct __riscv_ctx_hdr *head = (struct __riscv_ctx_hdr *)sc_ext_ptr;
+
+		err |= __get_user(magic, &head->magic);
+		err |= __get_user(size, &head->size);
+		if (err)
+			goto done;
+
+		sc_ext_ptr += sizeof(struct __riscv_ctx_hdr);
+		switch (magic) {
+		case 0:
+			if (size)
+				goto invalid;
+			goto done;
+		case RVV_MAGIC:
+			if (!has_vector() || !vstate_query(regs))
+				goto invalid;
+			if (size != rvv_sc_size)
+				goto invalid;
+			err = __restore_v_state(regs, sc_ext_ptr);
 			break;
-		if (value != 0)
-			return -EINVAL;
+		default:
+			goto invalid;
+		}
+		sc_ext_ptr = ((void *)(head) + size);
 	}
+done:
 	return err;
+invalid:
+	return -EINVAL;
+}
+
+static size_t cal_rt_frame_size(void)
+{
+	struct rt_sigframe __user *frame;
+	size_t frame_size;
+	size_t total_context_size = 0;
+
+	frame_size = sizeof(*frame);
+
+	if (has_vector() && vstate_query(task_pt_regs(current)))
+		total_context_size += rvv_sc_size;
+	/* Preserved a __riscv_ctx_hdr for END signal context header. */
+	total_context_size += sizeof(struct __riscv_ctx_hdr);
+
+	frame_size += (total_context_size);
+
+	frame_size = round_up(frame_size, 16);
+	return frame_size;
+
 }
 
 SYSCALL_DEFINE0(rt_sigreturn)
@@ -98,13 +221,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	struct rt_sigframe __user *frame;
 	struct task_struct *task;
 	sigset_t set;
+	size_t frame_size = cal_rt_frame_size();
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
 
 	frame = (struct rt_sigframe __user *)regs->sp;
 
-	if (!access_ok(frame, sizeof(*frame)))
+	if (!access_ok(frame, frame_size))
 		goto badframe;
 
 	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
@@ -138,17 +262,22 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	struct pt_regs *regs)
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
+	void *sc_ext_ptr = &sc->sc_extdesc.hdr;
 	long err;
-	size_t i;
 
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
-		err |= __put_user(0, &sc->sc_fpregs.q.reserved[i]);
+	/* Save the vector state. */
+	if (has_vector() && vstate_query(regs))
+		err |= save_v_state(regs, &sc_ext_ptr);
+	/* Write zero to fp-reserved space and check it on restore_sigcontext */
+	err |= __put_user(0, &sc->sc_extdesc.reserved);
+	/* And put END __riscv_ctx_hdr at the end. */
+	err |= __put_user(END_MAGIC, &((struct __riscv_ctx_hdr *)sc_ext_ptr)->magic);
+	err |= __put_user(END_HDR_SIZE, &((struct __riscv_ctx_hdr *)sc_ext_ptr)->size);
 	return err;
 }
 
@@ -180,9 +309,10 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 {
 	struct rt_sigframe __user *frame;
 	long err = 0;
+	size_t frame_size = cal_rt_frame_size();
 
-	frame = get_sigframe(ksig, regs, sizeof(*frame));
-	if (!access_ok(frame, sizeof(*frame)))
+	frame = get_sigframe(ksig, regs, frame_size);
+	if (!access_ok(frame, frame_size))
 		return -EFAULT;
 
 	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
@@ -336,3 +466,10 @@ asmlinkage __visible void do_work_pending(struct pt_regs *regs,
 		thread_info_flags = read_thread_flags();
 	} while (thread_info_flags & _TIF_WORK_MASK);
 }
+
+void init_rt_signal_env(void);
+void __init init_rt_signal_env(void)
+{
+	rvv_sc_size = sizeof(struct __riscv_ctx_hdr) +
+		      sizeof(struct __sc_riscv_v_state) + riscv_vsize;
+}
-- 
2.17.1



Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFAFC36018
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=452IQ2FY6rbtKQ/fDnztUMSeELaisTrdrmkMNUpMX6k=; b=tWv1d3RJtbjWbi
	nMsPCVY1jXR37JtKvLktlnOeJmL4LpnD0HZn7dxbpIf3Hank5d2EgPRKo5KeH2xdaxo8DCMygzxKX
	a0kVnlDPlX0lIWTKwE2+4fx5IIMCxkPK81fK4O8pyH9Wq8xmggUcZFJBL++tZEaEzqYQaJVFsST97
	hGiMaB8uAyeoZX0EKpz8td5KrGBynrroPp4rSWvAC63PcJBB2exteDAz4b+H/eBj1hWj+HZvYygsk
	q3ElYklhnrYw5xaSu9D660MyOPGXtPBdgwsml10wmJa7HhiTaQoKMvUx3EArHhRuA0JFAOfLhD78v
	/AKBv6GTccOiiqp/kKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Ya-00000005rYn-2KaU;
	Tue, 25 Mar 2025 12:39:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Fd-00000005mg0-2Pv1;
	Tue, 25 Mar 2025 12:19:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED5F943650;
	Tue, 25 Mar 2025 12:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB0AC4CEE4;
	Tue, 25 Mar 2025 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905165;
	bh=TL2FUUudYeGR9aUH8EHF68qPdOytUMHPJcMNMO4C6gI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z9Owa6vw61GNZTo9S5QAJkMaxwfFdSHmn39VE6QvFbjvLgobYJXjoxt4SFzZ9+H45
	 3bBUxyIWXOs8+vctcc1o0z3EPcy5ylluVr1qaPks5R0Of7RuyosVXAlY1uWvUJ2AMq
	 AWXcxuO9frvt0rZhx+kYmwWptlxaskKYsKBYBrhlA00p5ujGlXfEgpH+FdgG+3suN5
	 DcfXa+xebjYrFGQi64b2ybrTNKHm1wMzPcYxDRlQ+BZrJ9Ss2tuzrYUMsYpIapwuLV
	 epLCYOMwS8It/5/qluGk6hyVcphUsHbtL9YgvqmSpPF9Fliz9vORyp9sFkHZ/283pY
	 je6WQknjoL8Jg==
From: guoren@kernel.org
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	torvalds@linux-foundation.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	oleg@redhat.com,
	kees@kernel.org,
	tglx@linutronix.de,
	will@kernel.org,
	mark.rutland@arm.com,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	edumazet@google.com,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	gaohan@iscas.ac.cn,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	wuwei2016@iscas.ac.cn,
	drew@pdp7.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	ctsai390@andestech.com,
	wefu@redhat.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	guoren@kernel.org,
	xiao.w.wang@intel.com,
	qingfang.deng@siflower.com.cn,
	leobras@redhat.com,
	jszhang@kernel.org,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	yongxuan.wang@sifive.com,
	luxu.kernel@bytedance.com,
	david@redhat.com,
	ruanjinjie@huawei.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	qiaozhe@iscas.ac.cn
Cc: ardb@kernel.org,
	ast@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-nfs@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [RFC PATCH V3 11/43] rv64ilp32_abi: riscv: Introduce PTR_L and PTR_S
Date: Tue, 25 Mar 2025 08:15:52 -0400
Message-Id: <20250325121624.523258-12-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_051925_662225_ED5DF38A 
X-CRM114-Status: GOOD (  11.50  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

REG_L and REG_S can't satisfy rv64ilp32 abi requirements, because
BITS_PER_LONG != __riscv_xlen. So we introduce new PTR_L and PTR_S
macro to help head.S and entry.S deal with the pointer data type.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/asm/asm.h | 13 +++++++++----
 arch/riscv/include/asm/scs.h |  4 ++--
 arch/riscv/kernel/entry.S    | 32 ++++++++++++++++----------------
 arch/riscv/kernel/head.S     |  8 ++++----
 4 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 776354895b81..e37d73abbedd 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -38,6 +38,7 @@
 #define RISCV_SZPTR		"8"
 #define RISCV_LGPTR		"3"
 #endif
+#define __PTR_SEL(a, b)		__ASM_STR(a)
 #elif __SIZEOF_POINTER__ == 4
 #ifdef __ASSEMBLY__
 #define RISCV_PTR		.word
@@ -48,10 +49,14 @@
 #define RISCV_SZPTR		"4"
 #define RISCV_LGPTR		"2"
 #endif
+#define __PTR_SEL(a, b)		__ASM_STR(b)
 #else
 #error "Unexpected __SIZEOF_POINTER__"
 #endif
 
+#define PTR_L		__PTR_SEL(ld, lw)
+#define PTR_S		__PTR_SEL(sd, sw)
+
 #if (__SIZEOF_INT__ == 4)
 #define RISCV_INT		__ASM_STR(.word)
 #define RISCV_SZINT		__ASM_STR(4)
@@ -83,18 +88,18 @@
 .endm
 
 #ifdef CONFIG_SMP
-#ifdef CONFIG_32BIT
+#if BITS_PER_LONG == 32
 #define PER_CPU_OFFSET_SHIFT 2
 #else
 #define PER_CPU_OFFSET_SHIFT 3
 #endif
 
 .macro asm_per_cpu dst sym tmp
-	REG_L \tmp, TASK_TI_CPU_NUM(tp)
+	PTR_L \tmp, TASK_TI_CPU_NUM(tp)
 	slli  \tmp, \tmp, PER_CPU_OFFSET_SHIFT
 	la    \dst, __per_cpu_offset
 	add   \dst, \dst, \tmp
-	REG_L \tmp, 0(\dst)
+	PTR_L \tmp, 0(\dst)
 	la    \dst, \sym
 	add   \dst, \dst, \tmp
 .endm
@@ -106,7 +111,7 @@
 
 .macro load_per_cpu dst ptr tmp
 	asm_per_cpu \dst \ptr \tmp
-	REG_L \dst, 0(\dst)
+	PTR_L \dst, 0(\dst)
 .endm
 
 #ifdef CONFIG_SHADOW_CALL_STACK
diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
index 0e45db78b24b..30929afb4e1a 100644
--- a/arch/riscv/include/asm/scs.h
+++ b/arch/riscv/include/asm/scs.h
@@ -20,7 +20,7 @@
 
 /* Load task_scs_sp(current) to gp. */
 .macro scs_load_current
-	REG_L	gp, TASK_TI_SCS_SP(tp)
+	PTR_L	gp, TASK_TI_SCS_SP(tp)
 .endm
 
 /* Load task_scs_sp(current) to gp, but only if tp has changed. */
@@ -32,7 +32,7 @@
 
 /* Save gp to task_scs_sp(current). */
 .macro scs_save_current
-	REG_S	gp, TASK_TI_SCS_SP(tp)
+	PTR_S	gp, TASK_TI_SCS_SP(tp)
 .endm
 
 #else /* CONFIG_SHADOW_CALL_STACK */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 33a5a9f2a0d4..2cf36e3ab6b9 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -117,19 +117,19 @@ SYM_CODE_START(handle_exception)
 	new_vmalloc_check
 #endif
 
-	REG_S sp, TASK_TI_KERNEL_SP(tp)
+	PTR_S sp, TASK_TI_KERNEL_SP(tp)
 
 #ifdef CONFIG_VMAP_STACK
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 	srli sp, sp, THREAD_SHIFT
 	andi sp, sp, 0x1
 	bnez sp, handle_kernel_stack_overflow
-	REG_L sp, TASK_TI_KERNEL_SP(tp)
+	PTR_L sp, TASK_TI_KERNEL_SP(tp)
 #endif
 
 .Lsave_context:
-	REG_S sp, TASK_TI_USER_SP(tp)
-	REG_L sp, TASK_TI_KERNEL_SP(tp)
+	PTR_S sp, TASK_TI_USER_SP(tp)
+	PTR_L sp, TASK_TI_KERNEL_SP(tp)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 	REG_S x1,  PT_RA(sp)
 	REG_S x3,  PT_GP(sp)
@@ -145,7 +145,7 @@ SYM_CODE_START(handle_exception)
 	 */
 	li t0, SR_SUM | SR_FS_VS
 
-	REG_L s0, TASK_TI_USER_SP(tp)
+	PTR_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
@@ -193,7 +193,7 @@ SYM_CODE_START(handle_exception)
 	add t0, t1, t0
 	/* Check if exception code lies within bounds */
 	bgeu t0, t2, 3f
-	REG_L t1, 0(t0)
+	PTR_L t1, 0(t0)
 2:	jalr t1
 	j ret_from_exception
 3:
@@ -226,7 +226,7 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 
 	/* Save unwound kernel stack pointer in thread_info */
 	addi s0, sp, PT_SIZE_ON_STACK
-	REG_S s0, TASK_TI_KERNEL_SP(tp)
+	PTR_S s0, TASK_TI_KERNEL_SP(tp)
 
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
@@ -301,7 +301,7 @@ SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
 	REG_S x5,  PT_T0(sp)
 	save_from_x6_to_x31
 
-	REG_L s0, TASK_TI_KERNEL_SP(tp)
+	PTR_L s0, TASK_TI_KERNEL_SP(tp)
 	csrr s1, CSR_STATUS
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
@@ -341,8 +341,8 @@ SYM_CODE_END(ret_from_fork)
 SYM_FUNC_START(call_on_irq_stack)
 	/* Create a frame record to save ra and s0 (fp) */
 	addi	sp, sp, -STACKFRAME_SIZE_ON_STACK
-	REG_S	ra, STACKFRAME_RA(sp)
-	REG_S	s0, STACKFRAME_FP(sp)
+	PTR_S	ra, STACKFRAME_RA(sp)
+	PTR_S	s0, STACKFRAME_FP(sp)
 	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
 
 	/* Switch to the per-CPU shadow call stack */
@@ -360,8 +360,8 @@ SYM_FUNC_START(call_on_irq_stack)
 
 	/* Switch back to the thread stack and restore ra and s0 */
 	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
-	REG_L	ra, STACKFRAME_RA(sp)
-	REG_L	s0, STACKFRAME_FP(sp)
+	PTR_L	ra, STACKFRAME_RA(sp)
+	PTR_L	s0, STACKFRAME_FP(sp)
 	addi	sp, sp, STACKFRAME_SIZE_ON_STACK
 
 	ret
@@ -383,8 +383,8 @@ SYM_FUNC_START(__switch_to)
 	li    a4,  TASK_THREAD_RA
 	add   a3, a0, a4
 	add   a4, a1, a4
-	REG_S ra,  TASK_THREAD_RA_RA(a3)
-	REG_S sp,  TASK_THREAD_SP_RA(a3)
+	PTR_S ra,  TASK_THREAD_RA_RA(a3)
+	PTR_S sp,  TASK_THREAD_SP_RA(a3)
 	REG_S s0,  TASK_THREAD_S0_RA(a3)
 	REG_S s1,  TASK_THREAD_S1_RA(a3)
 	REG_S s2,  TASK_THREAD_S2_RA(a3)
@@ -400,8 +400,8 @@ SYM_FUNC_START(__switch_to)
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 	/* Restore context from next->thread */
-	REG_L ra,  TASK_THREAD_RA_RA(a4)
-	REG_L sp,  TASK_THREAD_SP_RA(a4)
+	PTR_L ra,  TASK_THREAD_RA_RA(a4)
+	PTR_L sp,  TASK_THREAD_SP_RA(a4)
 	REG_L s0,  TASK_THREAD_S0_RA(a4)
 	REG_L s1,  TASK_THREAD_S1_RA(a4)
 	REG_L s2,  TASK_THREAD_S2_RA(a4)
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..e55a92be12b1 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -42,7 +42,7 @@ SYM_CODE_START(_start)
 	/* Image load offset (0MB) from start of RAM for M-mode */
 	.dword 0
 #else
-#if __riscv_xlen == 64
+#ifdef CONFIG_64BIT
 	/* Image load offset(2MB) from start of RAM */
 	.dword 0x200000
 #else
@@ -75,7 +75,7 @@ relocate_enable_mmu:
 	/* Relocate return address */
 	la a1, kernel_map
 	XIP_FIXUP_OFFSET a1
-	REG_L a1, KERNEL_MAP_VIRT_ADDR(a1)
+	PTR_L a1, KERNEL_MAP_VIRT_ADDR(a1)
 	la a2, _start
 	sub a1, a1, a2
 	add ra, ra, a1
@@ -349,8 +349,8 @@ SYM_CODE_START(_start_kernel)
 	 */
 .Lwait_for_cpu_up:
 	/* FIXME: We should WFI to save some energy here. */
-	REG_L sp, (a1)
-	REG_L tp, (a2)
+	PTR_L sp, (a1)
+	PTR_L tp, (a2)
 	beqz sp, .Lwait_for_cpu_up
 	beqz tp, .Lwait_for_cpu_up
 	fence
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

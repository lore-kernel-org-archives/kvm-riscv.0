Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5895CC55174
	for <kvm-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 06:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gJ8BBHSBpuzsoCSZcOdDecYbaZNDaFJLlOYvF7pPr8c=; b=35gvIIJ5Hz/azh
	F/GNEqn/g4Uq+LbVWgQ4TUaIMf5/LJYEo4r7dzSuMY1138+EUiAc3OiHFmNf9wqv5rlCntPu/ho7W
	oP+0dF/ocuTOjX18fNe2R7n9jVpptBT+JYG6KrXAlaXE2/d1A8upH/RYCP9aKwHQ//lj5r+QEC+k7
	rSSZtXQa2Ng0fcSSMvxdzSy9hduujj6r9w0rHES3JFDaxMUeJ6208hZQnBykQTn/OpyLPCnco9ftf
	BINLJ7oHtcrM2eXVYa6CpSTi5R3eaIqm2eLZOvWEc7CELGdzEJkLp7Bu/tCcLMVzxiXloraPf6vjz
	qgM2o96rCAgLRu/loKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVTy-00000003LgI-3F5B;
	Wed, 05 Aug 2026 06:52:06 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVTw-00000003Lfb-0Lx0
	for kvm-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 06:52:05 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so488514a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 04 Aug 2026 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785912723; x=1786517523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZveE5TKFRvmEM6ufGP9KCDDa09D/zv/1Va+H0O6po0=;
        b=nwHfZ/wU2QmSXbwC85M6HVFAfFUZKugG9orFh9rQv15Wn4j94TlmzFdpxwYumEQNVk
         zGCLMVk8dlrDI9FF70uXoHuPDJTh/xX/sDiOEx57CY/AKoRxQqJSjdJzgcIKq0Btih8p
         buOn+SdD5bwerbN9R6uJ1oXoHGi3aIoDXqWKfqfzSndPlNQ0xOflmrOWutliGZj7ozfA
         8fz/Sa1rFbgWbM2ySTaMzQzBb2EhUXaa7B3V5g6oYNr6/Geg6R++FEQSCnHgZxmyQ8Ki
         0nc8cRYgMJP1gD3Lv91/6yZ09eP+mIID6X0kzyaabJkBXDvw51WnwpjkrT9gqm+4RE7R
         HSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912723; x=1786517523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZveE5TKFRvmEM6ufGP9KCDDa09D/zv/1Va+H0O6po0=;
        b=WJ8HpL+KV53jV6EApMlAA6/jYCA0THKkeTa9u1prTFWlDsXqn69SM2eP8Sqk5DW5Q9
         1Fheca8nqNdnI8YDtWED5RbGIRdR/6bqZWlpujP7TwtN1gENhc5OJmNdcQfm4zjOJ49f
         L4CwMxTU6J2TWco6UvC+LOwzl59LlS89W/4AgYQ2WdCZCCZ4SU9wW+EEJTv3FLIU0SBM
         rKtLwIxoAsIWARPXtV4lNaZYe8Ab2W93po1g9UoTzrLDJtmMltOCSty0HUBTjW68Y1O9
         0Or01XxF/J4IgnxDjzHgt653i4msPWN4LD1tcsR10XHdGm5yKyVYWnO+RrhixO61lpCr
         jGBA==
X-Forwarded-Encrypted: i=1; AHgh+RoXplIOc5RkLgyHjPfyDuPaO8oimFm4dxbwzxtMSOWB2OWJXYxYYq6bty+pUPlLYq7ibCwpUqs1E7A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFJ2YnZjbNSERs7LGBSANZikGzs7YXYysiucyMKe9DrXTdAxio
	CcNg/+8ZY6AF1iobRRfgIqEGqMhQNX6aJxgu7AVNGgzCpknzftA+ZWMB
X-Gm-Gg: AR+sD12XAAuJLvTpGJbBWZlpBIymeBxHLD0YjTFBbVog6XKiCzCGIKESAYu9fbgv7nF
	lS9M/7J0W4SWbJCZxs025ayVUh0VZAfgDeLe6oSL2Yl6LSnavp9qdH3Tur56rVqselQgvIiD4m+
	errzNFEz/YnAOGyEj8pLV7HXBlWVc4mdZmOoO+hfYecMsEhNWI5g45y0qWTAfr/vxQdxf5yibt2
	pi9yR/6bw4Ic27NlQvxRrIlq+J5nIo8S2qrqcL/Ue7lTYDzgFJ4xPsK6509rbsrNSdX9pPCqXiG
	dZ84Q+wNP2nGy5Q4vO/xT3sGbctGDJv1qqK0zTY9erbTL/J0Xoaa7KqFMKwPuVByrlOSa4F04Pd
	IJ8tylGbPAfGdsmoAs3CiaOkz/GAGHvwNngU+vphxSW4lpOCeuYI3XLVBZrUcZV6nXsNJszSJZu
	v1gR4OtMTXoh+9HLR9lkU82zZcWeKGtFJvdUkSAtsFVBf7GDa7L+nLbTs/Bp5jdrFrKSUj+9/pZ
	t5ThpdBsL0qqMt4Zg==
X-Received: by 2002:a17:90b:1c8e:b0:38f:1a80:d1e7 with SMTP id 98e67ed59e1d1-3903c596de7mr3372058a91.13.1785912722454;
        Tue, 04 Aug 2026 23:52:02 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390392b2b7fsm2113080a91.14.2026.08.04.23.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:52:02 -0700 (PDT)
From: "Yuhang.Chen" <yhchen312@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	kernel test robot <lkp@intel.com>,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH v3] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control VS-mode WFI trapping
Date: Wed,  5 Aug 2026 14:51:32 +0800
Message-Id: <20260805065132.3210346-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_235204_201420_272EE60A 
X-CRM114-Status: GOOD (  25.43  )
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

Add a kernel command-line option, kvm-riscv.wfi_trap_policy=trap|auto,
that controls whether a WFI executed by a VS-mode guest traps into KVM
(HS-mode) or executes natively.

HSTATUS.VTW governs VS-mode WFI: when set, the WFI traps into KVM, which
blocks the vCPU through kvm_vcpu_halt() and releases the CPU to other
runnable tasks; when clear, the guest runs WFI natively. Because RISC-V
WFI is only a hint (it may be a no-op on some implementations), the
policy is re-evaluated before each guest entry rather than fixed once
at reset.

  trap  : always trap VS-mode WFI into KVM (HSTATUS.VTW=1). This is the
          default and preserves the previous unconditional behavior.

  auto  : clear HSTATUS.VTW so the guest runs WFI natively only when the
          vCPU is the sole runnable task on the current CPU; otherwise
          keep trapping. When the vCPU is alone, skipping the
          virtual-instruction exit cannot starve another task, and on
          hardware that honors WFI the hart blocks until a VS-mode
          interrupt. The policy is re-evaluated before every guest entry,
          so when another task becomes runnable the next entry traps
          again and KVM blocks the vCPU through kvm_vcpu_halt(), yielding
          the CPU. The vCPU therefore never monopolizes the CPU the way
          an unconditional native WFI would: it either blocks through
          kvm_vcpu_halt(), or runs WFI natively only when no other task
          needs the CPU.

Measured on QEMU TCG (-smp 1, -cpu max): wfi_exit_stat delta and guest
wake count over a 3 s window. "busy" adds a CPU-bound competitor that
shares the vCPU's CPU so that single_task_running() reports false:

  policy  busy  exits  wakes   cpu%  note
  ------  ----  -----  -----   ----  ------------------------
  trap    off    286    285    6.5   default; no regression
  trap    on     291    290  101.0   trap is unconditional
  auto    off      4    287    5.0   sole task: native WFI
  auto    on     285    284  101.5   competitor -> traps

With "auto", WFI exits drop to ~0 when the vCPU is the only runnable
task, and rise back to the trap level as soon as a competitor appears,
which is the desired dynamic behavior. Host CPU stays low in the
sole-task case; the ~101% in the busy cases is the forked competitor,
not the vCPU.

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.Chen <yhchen312@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608051354.KYOXP5po-lkp@intel.com/

---
Changes in v3:

- Guard the early_param() parser with #ifndef MODULE. RISC-V KVM is
  tristate and may be built as a module (CONFIG_KVM=m), but
  early_param() is only defined for built-in code, so v2 failed to
  compile as a module. With CONFIG_KVM=m the policy now keeps its
  default (trap) value, which is safe and regression-free; the rest of
  the policy logic is unaffected. The kernel-parameters.txt entry now
  documents that the option is only honored when KVM is built in.

- Re-evaluate the WFI trap policy before each guest entry instead of
  only in kvm_arch_vcpu_load(). In v2 the policy was checked once when
  the vCPU was loaded, so between two kvm_arch_vcpu_load() calls
  HSTATUS.VTW could go stale: if a task of lower or equal priority woke
  on the vCPU's CPU while the guest was running, the run loop would
  re-enter the guest without re-checking and without preempting, and a
  native WFI could then halt the hart and delay the woken task until the
  next timer tick. Checking before every entry closes this window,
  because a wakeup arrives through a host interrupt that forces a VM
  exit, and the next entry re-evaluates and traps.

Changes in v2:

- Drop the "notrap" mode, which cleared HSTATUS.VTW unconditionally and
  so never trapped: the vCPU never reached kvm_vcpu_halt() and could
  stay busy even while idle.
- Add the "auto" mode, which clears HSTATUS.VTW only when the vCPU is
  the sole runnable task (single_task_running()) and otherwise traps.
  The policy is applied dynamically from kvm_arch_vcpu_load() instead of
  once at reset, so a vCPU that stops being the sole runnable task
  switches back to trapping.
- Update the kernel-parameters.txt entry for trap/auto.

v1: https://lore.kernel.org/all/20260709115610.287420-1-yhchen312@gmail.com/
v2: https://lore.kernel.org/all/20260804024707.2400404-1-yhchen312@gmail.com/
---
 .../admin-guide/kernel-parameters.txt         | 20 ++++++
 arch/riscv/kvm/vcpu.c                         | 72 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..2ab9eb335e60 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3254,6 +3254,26 @@ Kernel parameters
 
 			notrap: clear WFI instruction trap
 
+	kvm-riscv.wfi_trap_policy=
+			[KVM,RISCV] Control when to set the WFI instruction
+			trap (HSTATUS.VTW) for KVM VMs. The policy is
+			re-evaluated before each guest entry, not only at
+			reset, since RISC-V WFI is only a hint.
+
+			trap: always trap VS-mode WFI into KVM (HSTATUS.VTW=1)
+
+			auto: trap unless the vCPU is the only runnable task on
+				the current CPU, in which case clear the trap
+				(HSTATUS.VTW=0) and let the guest execute WFI
+				natively
+
+			Defaults to trap, preserving the previous unconditional
+			behavior.
+
+			Only honored when KVM is built into the kernel
+			(CONFIG_KVM=y); as a module (CONFIG_KVM=m) the policy
+			stays at its default (trap).
+
 	kvm_cma_resv_ratio=n [PPC,EARLY]
 			Reserves given percentage from system memory area for
 			contiguous memory allocation for KVM hash pagetable
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index cf6e231e76e2..8efeb74699cc 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -12,8 +12,10 @@
 #include <linux/kdebug.h>
 #include <linux/module.h>
 #include <linux/percpu.h>
+#include <linux/string.h>
 #include <linux/vmalloc.h>
 #include <linux/sched/signal.h>
+#include <linux/sched/stat.h>
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
@@ -26,6 +28,67 @@
 
 static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
 
+/*
+ * WFI trap policy for VS-mode guests, controllable through the
+ * kvm-riscv.wfi_trap_policy= kernel command-line option.
+ */
+enum kvm_riscv_wfi_trap_policy {
+	KVM_RISCV_WFI_TRAP,	/* Always trap VS-mode WFI into KVM */
+	KVM_RISCV_WFI_AUTO,	/* Trap unless the vCPU is the only runnable task */
+};
+
+static enum kvm_riscv_wfi_trap_policy kvm_riscv_wfi_trap_policy __read_mostly =
+	KVM_RISCV_WFI_TRAP;
+
+/*
+ * RISC-V KVM is tristate and may be built as a module, but early_param() is
+ * only defined for built-in code (see <linux/init.h>). Guard the command-line
+ * parser accordingly: when CONFIG_KVM=m the policy simply keeps its default
+ * (trap) value, which is the safe, regression-free behavior.
+ */
+#ifndef MODULE
+static int __init early_kvm_riscv_wfi_trap_policy_cfg(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (strcmp(arg, "trap") == 0) {
+		kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_TRAP;
+		return 0;
+	}
+
+	if (strcmp(arg, "auto") == 0) {
+		kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_AUTO;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy_cfg);
+#endif
+
+static bool kvm_riscv_vcpu_wfi_should_trap(struct kvm_vcpu *vcpu)
+{
+	switch (kvm_riscv_wfi_trap_policy) {
+	case KVM_RISCV_WFI_AUTO:
+		/* Native WFI only when the vCPU is the sole runnable task. */
+		return !single_task_running();
+	case KVM_RISCV_WFI_TRAP:
+	default:
+		return true;
+	}
+}
+
+static void kvm_riscv_vcpu_update_wfi_trap(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	if (kvm_riscv_vcpu_wfi_should_trap(vcpu))
+		cntx->hstatus |= HSTATUS_VTW;
+	else
+		cntx->hstatus &= ~HSTATUS_VTW;
+}
+
 const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
@@ -73,6 +136,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu,
 	/* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
 	cntx->sstatus = SR_SPP | SR_SPIE;
 
+	/* Trap VS-mode WFI by default; the run loop reapplies the policy before each entry. */
 	cntx->hstatus |= HSTATUS_VTW;
 	cntx->hstatus |= HSTATUS_SPVP;
 	cntx->hstatus |= HSTATUS_SPV;
@@ -936,6 +1000,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 */
 		kvm_riscv_local_tlb_sanitize(vcpu);
 
+		/*
+		 * Re-evaluate the WFI trap policy for this entry so that
+		 * HSTATUS.VTW tracks the current runnable-task count and
+		 * cannot go stale across guest entries (which would let a
+		 * native WFI halt the CPU while another task is runnable).
+		 */
+		kvm_riscv_vcpu_update_wfi_trap(vcpu);
+
 		trace_kvm_entry(vcpu);
 
 		guest_timing_enter_irqoff();
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

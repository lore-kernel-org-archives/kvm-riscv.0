Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FB4C55182
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 02:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cvJuKYJUscOi3Lsb4IH6ksmefX4AWSSjfejmkUAywbw=; b=4I3b609h1AkCe5
	rk7Toxao+h22z+qYW6cvvAzo/tvpIrdcnktbsA77dBUNsA+R+NKILTpgXxxDid8mrvKPXsX8L3bdS
	SebKF2wqsYRkDeg52bELpWOs7HlOuHVYMpbz0Z6T9JCFV0q5mPXn85SBAsRdaoD/HVrjh7Q1a00uE
	ML1SGP+7sKF+OCngeSmUqCHbeJqLGvGQoojvmZLCaRP5qg4RZ1zikp1myUDTeoE3ONLEpz8VSCuOs
	gyid1IsEmtLqnoX2Df39RxPkb3tGSQeecxFbUmIbxSYqTRP44udKkNJ026O2qbgWZJTiMCVYoiUiB
	5DJXqM/W/Ge0gWW3u1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Bx-00000000rqe-0fcu;
	Tue, 04 Aug 2026 02:47:45 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Bu-00000000rpa-0iUt
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 02:47:43 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84e27035206so4357470b3a.3
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Aug 2026 19:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785811661; x=1786416461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4kZP+sF/QMfPPiLTmI8ScpIheCw+l8Hd9ySn9On/vg=;
        b=ppwEAqdZjMue5AcyKSvpfoqEmB88isGa8SH34YcRPBQThrM8yWYSIyAHDlQvgYQ8qb
         oubwFb2w0JzZ0VEEn6ma8i9+I/bi6g2xzLCYptTXmABwkEaL92SV4zm2Zilur5+roFES
         CvSMwH1UPYW0nbbxVzPp5jWC8fX7wm3CAZBjZjQjeMzah6dG8fmVqtrB1jzE45Ufqnrx
         08qhllcDgM3Ffr1vmggMjWdfAHsU168aZdmitghqKjQgZypevaDDSvbi1GUXSpKvYa2I
         qKlClMaf+RIwpYfsLa9GQZGnL8NuaRAun5MZb1q0qSeXO3rzqIEpcfvEsncG04NEgkTm
         aVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811661; x=1786416461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4kZP+sF/QMfPPiLTmI8ScpIheCw+l8Hd9ySn9On/vg=;
        b=EKFTF4ysHWXkLMQoTaM1CrSYqmfmqKyeP4Mze3aReT1Vb5fN4kzWV0cAJ3e51J3KsD
         buznOHcL6lU+Nbku0TO+St7oOyfowB159niwBBxBEIQ9gBqkFAVC82WBKUcax+yrsj1A
         SZADHYbB8ewD6aq3AWt7T1Busm3WszAnEkykFTdFsQdiPqRo7hkOco6dNyiJqzEs6UcD
         aUpgHdFAcHYQ0tp20pzzKkalqGXxHDTH+N1XNkd0lpUcyTIBXE++s4YWmzhf87xkkQPg
         4GbYrsiS4xCL4DwyfJlUnP2lq8J0miHyRboxiO28av4D4gpQ4K+K8gLFBECVSQaIwI6y
         MsjA==
X-Forwarded-Encrypted: i=1; AHgh+RrMMvCxYg78Wry4TcE0ifdyIiDdo95ufO1okYIT9CVGlxrU/IbR0d2fwz9L6Jlh3lesw6AsOFcBPLs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ6Gv0YIfwO+uv2y4vM7NHk1vPh1l63N1EqoW8V+oyZymJjua7
	gLVw0ftqmbTk9ElQYUDTls3tqz6XNqNcLQiMQ8NniB+nc5tgTe3CKYVY
X-Gm-Gg: AR+sD10alIw71LD3B2ng/w9tbceLrMwNYhj0Y6dW5AcVsKWBuP8tkUE3M+skj1XOvG2
	3nNNfuhsRe/uY0fa/YOQD7XeR9CRHkLIp6trvy14fEQ/CN3HqT3ROhBMYfsB7Gz03mmfzkV8frg
	yWHE895YT1EksGD/i8LdZDNRN5+CUnGQHZmXnb/solIqQq/oZYH3dXMoJ1ZnydUdTUWHXVXM6AG
	1/Jj1UqiwXcjOGR0jLH88vVYl+/qJ5PDoenEFh9t3CeDi2q0o3fWWpJlQeFIy1SkyMJfP+J+Rw0
	AjmAJFuic4Csc2bI5l9wkSTIw6vVLs1LxqJEl1UdoDvVUip56EyI7nCNpL7zNgAICALHIvo02Be
	ajSv41r6zXNemQnm/Q1Il5xKSJ4zVSbPy+WIFT9Gt75cnexY5DfIS/fyMunLZ/vJQfUHIgBIFF5
	HWIdhNg/VTi/dV59XGJLurmdjmAVS5PQeL5dqQ6oZflzIKFmzGPTGsSngg5ggBUputVjAMLbpDI
	aPRiho=
X-Received: by 2002:a05:6a00:330a:b0:848:4754:28e5 with SMTP id d2e1a72fcca58-84ee47c1e51mr11869884b3a.16.1785811660618;
        Mon, 03 Aug 2026 19:47:40 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84eecf81b08sm3240286b3a.22.2026.08.03.19.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:47:40 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control VS-mode WFI trapping
Date: Tue,  4 Aug 2026 10:47:07 +0800
Message-Id: <20260804024707.2400404-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_194742_217102_AAA6E373 
X-CRM114-Status: GOOD (  22.04  )
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
policy is re-evaluated each time a vCPU is loaded rather than fixed once
at reset.

  trap  : always trap VS-mode WFI into KVM (HSTATUS.VTW=1). This is the
          default and preserves the previous unconditional behavior.

  auto  : clear HSTATUS.VTW so the guest runs WFI natively only when the
          vCPU is the sole runnable task on the current CPU; otherwise
          keep trapping. When the vCPU is alone, skipping the
          virtual-instruction exit cannot starve another task, and on
          hardware that honors WFI the hart blocks until a VS-mode
          interrupt. As soon as another task becomes runnable, the
          policy traps again so that KVM blocks the vCPU and yields the
          CPU to it. The vCPU therefore never monopolizes the CPU the
          way an unconditional native WFI would: it either blocks
          through kvm_vcpu_halt(), or runs WFI natively only when no
          other task needs the CPU.

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

---
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
---
 .../admin-guide/kernel-parameters.txt         | 16 +++++
 arch/riscv/kvm/vcpu.c                         | 59 +++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..29fc824b5ce2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3254,6 +3254,22 @@ Kernel parameters
 
 			notrap: clear WFI instruction trap
 
+	kvm-riscv.wfi_trap_policy=
+			[KVM,RISCV] Control when to set the WFI instruction
+			trap (HSTATUS.VTW) for KVM VMs. The policy is
+			re-evaluated each time a vCPU is loaded, not only at
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
 	kvm_cma_resv_ratio=n [PPC,EARLY]
 			Reserves given percentage from system memory area for
 			contiguous memory allocation for KVM hash pagetable
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index cf6e231e76e2..e9251f81a4f8 100644
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
@@ -26,6 +28,59 @@
 
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
@@ -73,6 +128,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu,
 	/* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
 	cntx->sstatus = SR_SPP | SR_SPIE;
 
+	/* Trap VS-mode WFI by default; kvm_arch_vcpu_load() reapplies the policy. */
 	cntx->hstatus |= HSTATUS_VTW;
 	cntx->hstatus |= HSTATUS_SPVP;
 	cntx->hstatus |= HSTATUS_SPV;
@@ -609,6 +665,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
 
+	/* Re-evaluate the WFI trap policy for this vCPU. */
+	kvm_riscv_vcpu_update_wfi_trap(vcpu);
+
 	vcpu->cpu = cpu;
 }
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

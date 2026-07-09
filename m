Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1843C43458
	for <kvm-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fKGHuHwxxOWsjXp1zgUPe+Fhwn+X+eWcNTHUY4cGs9o=; b=1RmiwvnnyakFl+
	+7Uv9N5Mvt0/0fm/s0sB0vlgZzkjiKMTd5Msi/Xleaz3MlF1P7KKyKNFEpvB4nlEadi7JbqcuwCW9
	UBX02dyUU+avnOgswmA3csazVMZq6Fw5Z3yVoP1Bbw1YD3c6xX7rahfsxZEgs21lhSI17II/7RbEo
	xv4vMVpyDIzA6NtKt5elgKN08ci04ULbHNMRR1EdUsg0akJ9vmzKkkp5mZ+N9MSOkJlc5ebzVEqGp
	VYu/i/ug1A+9hvGtdHnzdnr3rLaOpp5wJoJCjiMHDuZA2zArVJk7XikpOW7GLUERINdCWJFHxxEiX
	J7dZif8GKUGzF+lllmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnMj-00000002HLw-1nRc;
	Thu, 09 Jul 2026 11:56:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnMh-00000002HLC-3QkV
	for kvm-riscv@bombadil.infradead.org;
	Thu, 09 Jul 2026 11:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CivCo3sxABn6gVyRhQlVLSU7JseOeDcuh4Y0SWmJVu4=; b=FqO/xwxfQrnXcno8dSFs4IMT8r
	H6HfgGuZInesMddv4LEJkLCmPOeji8OYao2yUwgDLiV/veOTA9CLIp1jC/r5ByG48AYr2kJMVi2kG
	Ai53mT6c5X3H0k6pEHsPKXW6iUSClVOlFCKHPcM6IvvY5DrxRdCMQ69jkYb3X04FWyox372oEYU6+
	r+gfQdeYofT0w+NAh5HkE2gSuPgzvTR8a+DjISoEiuJu2UhDlxiSiPEdDoQT9pMwrBb/YSoYGYfgZ
	WWedJekxBdQSu8ojjDZ3UZzLXGUKYNVBjFLwDSY9N153tHNpn7cTBMLhdJn7coxPLuDs4PwCnjnZh
	UamfHCXQ==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whnMd-00000009Ard-2uEC
	for kvm-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 11:56:25 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caed617615so17044785ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 09 Jul 2026 04:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783598181; x=1784202981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CivCo3sxABn6gVyRhQlVLSU7JseOeDcuh4Y0SWmJVu4=;
        b=WqVyNPAy7hnkOH3mV0eUM5AwH7lM7u7BwwcXCdIzCdF2CFdi2lIE5L3SgWT7+Cr/v+
         RWm0k+NVreoZ2Wx99A5QSfFAENfzGkAgBh+uXPR0MkdtgoGI2X0kUpKkUQZnc+oNGDjH
         T7aNStgREnvqHVnak1EyraSGbzBQqz8tdekMmdYicfTvDKLdVCGAcUZA6Jmh4tv/MrVj
         JTLMd3WUyJ/A4rHVu19IzXCIpB1rNwuVjWinoAyuYXbHvUFOkQJ66TZ84mMcOuVs+fis
         y7VA3VA6UuZ2cuZcI19oyhIAXB/BdPVo33UyC993103jjKOTVEPqh2YD37TYx1nW1rey
         HfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598181; x=1784202981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CivCo3sxABn6gVyRhQlVLSU7JseOeDcuh4Y0SWmJVu4=;
        b=GeXAGizeOiiszj467N9gkiasxrkzQeHInfgdqlC1mWqYcLjdpdPOcA7C/VBPMOIzDZ
         xA+AySbvBWkA5NKFOlbckWkfSKLJAZgUZL7TbGtbYqs5fb7XFmrZFEYHGvqd0SGJQzHq
         ukhJYhpUDSSKwo7H1N1hEewaT+OgzEVI/UPlq4tQlCHBw1IjjOX7SQu03gLo4WwMa6sm
         TtaMbJkWpQ85ewwjbi+EunHSFhqpBsG7gy9+D06YxPD2FMw4Eqr2aUrnmTGEntkjQBvt
         E9Uw2NgdNKPYp5Oh/ghwRzxF7ZcIOhlNIhJR4T8EvqRDWI7P6vEg4eGgJi3/nvSVARa6
         Lp/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp+BCGCIrv8ftOzo/w4Hx9fQ5tm0XwrcTXwqheZnAnyGswIuMOCRaSsnfoJNrTVcUeMpJcZHDrJbPQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHmcw/SI9MJ3Mvb/B0FU6vghuSYYqhWBdmZHm6ipTbgDjeZR5C
	oOLYLbi0qsos+iuwiZM+ZOQzEcChrlh7ntRywK+VlszFo9PFdVep2odm
X-Gm-Gg: AfdE7clNNQhl3PaQLw5bFOkpLjKd16a4MiZWiiZt+VHTMVg2mLyCqvx9PWhc+DtQXvx
	Ie4vZE4i8ddZuM7a7yRztUsBi0bEWp1MUWDG18LAcXXKA7k2+EgmzGmv0TxRLxfSFr+3usZ1txA
	RyXKU9FPbZK5mv1yKdagZoeRSRINGJDT1ysmDmVphhx3/M8bSmkFmmjkag+Vv70RwA8SQ5MI+o8
	DglCY8lJ5mx6lry/wOVWRGAbkS5UTkq9d4VCbPmegnBD/mqbft5k9Nv5R8G+5IAnPvEE1+oZe7B
	j+ot+ACdTmGw8vu3eEFi2GwTKuaDRAewwXfXyMqQfUBMYADnW4hdEsQAk0oghnIX0rGxS5gNUXB
	eEqaBr+ev3/xZwYAtxAqqUWZVEDKicS3/OO8RC7C64XzD9i5r3ZmPx0d5EsUI7Fmue1o/4mzwLI
	4qbYutcd+9lm04xrxE2AKSCHIuycOcOZUSEbfGiFczNw==
X-Received: by 2002:a17:903:4b4e:b0:2cc:98b4:e7e2 with SMTP id d9443c01a7336-2ccea5a815emr69832995ad.44.1783598180886;
        Thu, 09 Jul 2026 04:56:20 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3b906sm43917145ad.56.2026.07.09.04.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:56:20 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
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
Subject: [PATCH] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control VS-mode WFI trapping
Date: Thu,  9 Jul 2026 19:56:10 +0800
Message-Id: <20260709115610.287420-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_125623_895044_A601E8BA 
X-CRM114-Status: GOOD (  14.63  )
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

Add a kernel command-line option, kvm-riscv.wfi_trap_policy=trap|notrap,
that controls whether a WFI executed by a VS-mode guest traps into KVM
(HS-mode) or executes natively.

Measured results (wfi_exit_stat delta / guest wake count over 3 s):

  policy        WFI_EXITS   WAKE_CNT
  ----------    ---------   --------
  default       295         294      (== trap, no regression)
  trap          295         294
  notrap          0         298

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         | 14 ++++++
 arch/riscv/kvm/vcpu.c                         | 44 ++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..ee6603b30033 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3254,6 +3254,20 @@ Kernel parameters
 
 			notrap: clear WFI instruction trap
 
+	kvm-riscv.wfi_trap_policy=
+			[KVM,RISCV] Control when to set the WFI instruction
+			trap for KVM VMs. When set, a VS-mode WFI traps into
+			KVM and is emulated; when clear, the guest executes
+			WFI natively and blocks until a VS-mode interrupt
+			(e.g. the sstc timer) is pending.
+
+			trap: set WFI instruction trap (HSTATUS.VTW=1)
+
+			notrap: clear WFI instruction trap (HSTATUS.VTW=0)
+
+			Defaults to trap, preserving the previous
+			unconditional behavior.
+
 	kvm_cma_resv_ratio=n [PPC,EARLY]
 			Reserves given percentage from system memory area for
 			contiguous memory allocation for KVM hash pagetable
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c3672513b4e9..d50b47ed280e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -12,6 +12,7 @@
 #include <linux/kdebug.h>
 #include <linux/module.h>
 #include <linux/percpu.h>
+#include <linux/string.h>
 #include <linux/vmalloc.h>
 #include <linux/sched/signal.h>
 #include <linux/fs.h>
@@ -26,6 +27,42 @@
 
 static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
 
+/*
+ * WFI trap policy for VS-mode guests, controllable through the
+ * kvm-riscv.wfi_trap_policy= kernel command-line option.
+ */
+enum kvm_riscv_wfi_trap_policy {
+	KVM_RISCV_WFI_TRAP,	/* Default: trap VS-mode WFI into KVM */
+	KVM_RISCV_WFI_NOTRAP,	/* Let VS-mode WFI execute natively */
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
+	if (strcmp(arg, "notrap") == 0) {
+		kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_NOTRAP;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy_cfg);
+
+static bool kvm_riscv_vcpu_wfi_should_trap(struct kvm_vcpu *vcpu)
+{
+	return kvm_riscv_wfi_trap_policy == KVM_RISCV_WFI_TRAP;
+}
+
 const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
@@ -73,7 +110,12 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu,
 	/* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
 	cntx->sstatus = SR_SPP | SR_SPIE;
 
-	cntx->hstatus |= HSTATUS_VTW;
+	/*
+	 * Trap VS-mode WFI into KVM unless the WFI trap policy lets the guest
+	 * execute it natively. See kvm_riscv_wfi_trap_policy.
+	 */
+	if (kvm_riscv_vcpu_wfi_should_trap(vcpu))
+		cntx->hstatus |= HSTATUS_VTW;
 	cntx->hstatus |= HSTATUS_SPVP;
 	cntx->hstatus |= HSTATUS_SPV;
 }
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

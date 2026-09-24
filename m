Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13481C9830E
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 10:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xzMLabimfVPUDW5B2ni3yWmdDu3OLumDIO7XcEaicAQ=; b=JTQDd4pQ5D79nx
	xqRhRzDWacCOr9zPrmBMYoBABCk14DJPlHngakoZXUosOzLt6LE/GASkhAeY6TjUyMGOjczDLpbGk
	vj78vjjewp5PlZDQv9m+MQpr0Xh07D0VvHFsbvhy20z0z14mPgRuV6sUAFw30MvPxLEZx84InJ6IA
	89yiyRqMVtlzjwTqqZRvem+f5GPZJiId2RjAYHpeVkXUoeaWfaIYWsaYxTke6g/lT/UvM8RuPxfxa
	L4XKAnEi08g1GI5E5a4MgMQyRn/lpk1fY7LVqwl4DrEnLBYsFRxPAlvkfZAUZPwtQkGGXAIqtyFmP
	4lhxsZ2eTbCKTeNRoLJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gV8-0000000AgPU-2nyR;
	Thu, 24 Sep 2026 10:16:26 +0000
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gV2-0000000AgOU-1F2v
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 10:16:25 +0000
Received: by mail-dl2-x10.google.com with SMTP id a92af1059eb24-142dd025d06so1642263c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Sep 2026 03:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790244979; x=1790849779; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u7LK00oqDOE3QAV0dIPEwP0ZWU0x/VHk80FlxiovFNw=;
        b=Z/pjjbr9ig2rSNYHcbvgrfu8qcWEvSS11FjHpCw7HgbDehLMJ4doBjrey+VlH3PZAT
         +xVtilIJW0XShC2Z0f1nz3ugzEnvwcNuYGYfe23BKtUo60PzZme6mi68epyZPN1OucpU
         Yj3hg//NQjgdmxQx1Le9ZeUJ7j/ghcnnaHwIm1oItUEZCuR3DP7XVq/mpNYqqDI+Qlfl
         59Jm8aXcjXjGSIC9+DQ4dY/b2I4Ac4aobYO1Ue4QY10IBTDCxBw0I1Tysc9OqX750pAH
         BdROewG7RiiKWoNLOb/0P/yNMExV3CCMNHV2icLP5mir+c1HWPq3UODAlen0NSg12Wq3
         EUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244979; x=1790849779;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u7LK00oqDOE3QAV0dIPEwP0ZWU0x/VHk80FlxiovFNw=;
        b=n1RP7pbo/h3Q39VRRhuR0rKxkcEdKHtE9tVhgpdYcH8Ya1ArwsZunpwC5NlBkFJlZ+
         b4L/a0tH03xDv+tZsTbQ7e/L/9hLNXylXqKJisngOITuzrFx7yJAqVzWt4pyNwG5+aD9
         Q9tiDK+MP8qK3mq/wQzznStWTWG1du0DxzgSLCBYXGcTkrYC74K1A4a7TqhD85NuoyHt
         j9SVTNGv4T2bziZeaxfpc357tz15UHmILnqS2Tuax1782VpTw6zmUKPu7HF+MvdJ7cR7
         Zw2ghbIuYq1u21+cAoVJ7Q0MBBfrzbFDjh9T9hzgVB3/RR3NDVvvKct+QtUtwnbz4Sni
         uAbA==
X-Forwarded-Encrypted: i=1; AKwUvBw7Nzfl89l5YGATM0IUN0VRa3jWxwc0ShVNBNupo9cIc7dt9a/TinhmCSMNgp2BkSpJnM2LJf5y4Yk=@lists.infradead.org
X-Gm-Message-State: AFuF++lmKElu4/75798LLnduePufkBXrqlK8u9gdvK0kY//JkfIE7Kca
	SAkQVbkFjNhbrHs55Wf4W6oTWtwJJiR1iRgnjGwBeqiQdZ0WMl2xntPNCZsOOZ90zj4=
X-Gm-Gg: AYBFou2POXKqwT1UzxwAnEE7x3Jhi2BbIaJLW0G15iO3sAZCr6Bd5IrtxcI7Qup1K63
	WGiugZuEMGHcAsbHJtPNQi/8b/OTD/IiKes9/ys/ZtdpNfpsZL6U0kEatKgolL3/JMM2C52nS1V
	dlt+QaD4a60dTZiY2g04eidllcLhtKhNGbl15QFBJXd/5TcJGpsAuMB1oG38xz4gG9uAtrm23Ik
	uGrxtBVksJp9FuwC6RbUs/AWgJIQW/m0D+zR4L/fCtYsUvjJl4oJosQ4gpaPUy3MHCSNChJ5mU+
	sDcXGabl6cZDTZ7g2W9lhhDwcmkJYVki/vdBo0RsbUmRwPop7jahGkXztbU7ksVTTdnHFd9az98
	PqfDaRZdl9I3MnvgQUWly1vhn9628AXFKFGjX+j6QIlFMmP8vW1MbCwD5I9Qhex5yIJarGN87d1
	oR309Z9OVMeE5fXYxRzc54c3TYuuMr8IFdHdt2KhA76pSUFcl5kUCQP+xPv5WKkWTSl30mn9YFI
	mf/NKf6UvhlugJdrnU=
X-Received: by 2002:a05:7300:c019:10b0:33b:c24c:47cd with SMTP id 5a478bee46e88-340035bf9d9mr1782888eec.16.1790244978791;
        Thu, 24 Sep 2026 03:16:18 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e975223fcsm12254595eec.31.2026.09.24.03.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:16:18 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 24 Sep 2026 03:16:13 -0700
Subject: [PATCH v2] RISC-V: Clear HSTATUS.HU on CPU initialization
MIME-Version: 1.0
Message-Id: <20260924-hstatus_hu-v2-1-7e970f5f1d8d@sifive.com>
X-B4-Tracking: v=1; b=H4sIAGz4tGoC/22NywrCMBBFf6XM2kgTHw2u/A8pkqZTM4JNySRBK
 f13m7p1eeDcc2dgDIQMl2qGgJmY/LiC2lVgnRkfKKhfGVStzrWWjXAcTUx8d0kYabQ2qrFNJ2E
 dTAEHem+xW/tjTt0TbSyFYjji6MNne8uyeH/DWQoplLang+2H7ljrK9NAGffWv6BdluULdtg/e
 rcAAAA=
X-Change-ID: 20260817-hstatus_hu-a1a88a27c7b1
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790244977; l=3822;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=MiE+4ItnXmHUBKhLrUz3zntIZyWtLRntpAxtOY0u6BY=;
 b=lJsDgeDAFpzkUZgwbf6xofjnxNK0j5K+KDvcLG59+7QXUPCuV2SrHNbl6effhqne9YSnrJDPl
 DbbQVpzEO2jBsZbYKau8bP8WWRoX/urfT4BpbtZmYrJ8aUni4lV7kqg
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_031620_349125_66D027A6 
X-CRM114-Status: GOOD (  12.14  )
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

The RISC-V privileged specification does not mandate HSTATUS reset
values, leaving the HU bit potentially set after hardware reset.
When HU=1, hypervisor instructions (HLV/HLVX/HSV) can execute in
U-mode to access guest memory, which may cause unintended behavior
if not explicitly controlled.

Clear HSTATUS.HU during CPU initialization to ensure hypervisor
instructions are only available in HS-mode, preventing unexpected
guest memory access from U-mode code.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
Changes in v2:
- Clear the hstatus.hu in the arch core setup instead of kvm core setup
(sashiko)
- Link to v1: https://patch.msgid.link/20260817-hstatus_hu-v1-1-28c53cdfb408@sifive.com
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 12 ++++++++++++
 arch/riscv/kernel/setup.c           |  2 ++
 arch/riscv/kernel/smpboot.c         |  2 ++
 arch/riscv/kernel/suspend.c         |  2 ++
 5 files changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b..5efa72823475 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -40,6 +40,8 @@ extern u32 thead_vlenb_of;
 
 void __init riscv_user_isa_enable(void);
 
+void riscv_clear_hypervisor_csr(void);
+
 #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _validate) {	\
 	.name = #_name,									\
 	.property = #_name,								\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74..80767a016602 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1183,6 +1183,18 @@ void __init riscv_user_isa_enable(void)
 		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
 }
 
+void riscv_clear_hypervisor_csr(void)
+{
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_h))
+		return;
+
+	/*
+	 * Clear HSTATUS.HU to restrict hypervisor instructions to HS-mode.
+	 * This prevents user-mode from executing HLV/HSV instructions.
+	 */
+	csr_clear(CSR_HSTATUS, HSTATUS_HU);
+}
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 52d1d2b8f338..bf42efd848f6 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -364,6 +364,8 @@ void __init setup_arch(char **cmdline_p)
 
 	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB) || !riscv_isa_extension_available(NULL, ZBB))
 		static_branch_disable(&efficient_ffs_key);
+
+	riscv_clear_hypervisor_csr();
 }
 
 bool arch_cpu_is_hotpluggable(int cpu)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f6ef57930b50..a9de2dae804c 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -244,6 +244,8 @@ asmlinkage __visible void smp_callin(void)
 
 	numa_add_cpu(curr_cpuid);
 
+	riscv_clear_hypervisor_csr();
+
 	pr_debug("CPU%u: Booted secondary hartid %lu\n", curr_cpuid,
 		cpuid_to_hartid_map(curr_cpuid));
 
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 3efbf7874f3b..db220966f782 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -43,6 +43,8 @@ void suspend_save_csrs(struct suspend_context *context)
 
 void suspend_restore_csrs(struct suspend_context *context)
 {
+	riscv_clear_hypervisor_csr();
+
 	csr_write(CSR_SCRATCH, 0);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
 		csr_write(CSR_ENVCFG, context->envcfg);

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260817-hstatus_hu-a1a88a27c7b1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

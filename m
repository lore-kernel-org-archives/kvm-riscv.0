Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F90E77180
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 20:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sJ5EWBc77fvKWUxGJForpUcXzNGRAZGXVv8PEechM4=; b=au4T5zTLK3Liw+
	rVqgOVJKd456X0SbLvRQwWqYWKa71pVeg4d/31jrPaJprVtkmcRDkIaOBB7wpFmO4ZMF7HoTGyg6P
	RTdyVthpxm9K5jCaqM0aWooe73U3IE+kidL1mBtSDrjLdG4bdDMFv+Lz7lbMerv3UJr6aI66ebNOp
	+8/9kcFvSdvAtrLOMDXEFHUWOMmVSOLGdnDD7ib+KkMXVbPaY8qc23BO3SOSjbVLh9VtsqkBbM5xA
	Gfkr7jxA/jDK1gY71+HBac3tyMQBtuxNbGtBE+karEnLaxL3UxQnX6RlvQA3ON5taR+zo/O0a+iCD
	lyxlc3/46rNTXV/ty1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqF8-00000001rxG-0EtW;
	Thu, 12 Dec 2024 20:57:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqF3-00000001rtV-0xx9
	for kvm-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 20:57:02 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21628b3fe7dso9763465ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Dec 2024 12:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734037020; x=1734641820; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaPMD+BdCyI5hLi3/kV/S6HLELSeYS1h2xBFfdAEcTQ=;
        b=XtnL73VBv0KVXSYwThucRk0t+KO9eXvzijPnAz5ROe22pZP/3voz07mnlNW7udJOYK
         +vs/lnp5+Wzmec3OpPtRBWUHFTRMjyA8LpgaJ71e8YI2q/1It2SOJMcTTRIwm3JCA+a0
         O7NBwnchXR7M3ln2NF+uc5pye8GDSGfQrSCFhShsApoPa/xQqPXpZQSK9R0NZLsH9EaD
         FZsdPYMvnFYkdOhQ1zmO86mww0fPzcUf6ZneF09oNs5+CrfWadaFJSTZEbHnb87zFSMv
         w6Zj/0LinPwJukK7dnk38Iz7sY/+WnSvlKECrsfQWyKAbucMAk5UHLOiBqlvghEMEPiW
         W1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037020; x=1734641820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaPMD+BdCyI5hLi3/kV/S6HLELSeYS1h2xBFfdAEcTQ=;
        b=BpP9jIYt8tmwcav3r23goInCw2pnt82lSyxnjaqcOiCifM4Q1cZkNOEKQRTJXgsHsq
         KsFbV50F6ZAnjcBUL3eOucwzU9hpyAOM8SKEdAfsjACH+JakRaJBJ+7hWFHpJFsJm9SR
         44AlbCouV1wmT3KuwlGT4RhwCCpE9HljGEFHoLwz7nKcXOsz8+oACgH1T5HR/Y+4sFtz
         +Wcs+2M951Up8CpAYKsP1Wc+n/5ovhXdOZkMnQ+MvasqjybQqnQ7yJdyWALflUhykVYm
         tKp48YmqE0khwBf0GZUQyjj0GSBWzs16Wj2D23R2myjDdzLxTWjK7cfVIm8PoknsCtg/
         6GHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOcH8FJ5w08G1DR+yEEwev9hsNJCYCQYgn9oF0XpQMeTCTGA4NCJpu4Kqeat3wkKdIulFk5tabO6U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy62qgVwLbBHCIlhRm2imi3congV/8e13fGQP1sri6a2knzLMOY
	v/qJV66q9Nd21kUKgyxh5edyHuUZOn1ioSBEPOxtbOwkVIztdgApvug/85JBM7g=
X-Gm-Gg: ASbGncsSLioyhDRzJtgINMc0KFS0L0R3YuT0eUUoJawVJqH5528J0lbaM8NQN2LhLVY
	lc/HJv31ZKL1wFvi7pUdkLwamFcjVoYtDiTU4Z7Vg/6DOE5A9A319tbp6tBwlyQ2Z180UChkgHC
	r0j9mzx1IDFMKyQdA1x67DP0Zbb1Ntl2T2Fdm1/gRvKV0KyqKBLADKwBFLdmPoPfpW/NCZ04+G3
	hm2i3TFptxku1/JnQn/RrdIO74xRgbt8Ka2b6A1RZh1l/nJGfVaHrHyhILuttJzI3oTyA==
X-Google-Smtp-Source: AGHT+IGLXA772pUTt0BVGAPXfaZJ5WaJQ7JivmCyvoMmFNjKdV2TZP6t/5GpHJeWN5LeMnNdr4yhBA==
X-Received: by 2002:a17:902:f908:b0:216:69ca:7714 with SMTP id d9443c01a7336-21892980b8dmr2076045ad.11.1734037020131;
        Thu, 12 Dec 2024 12:57:00 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162e53798asm94019785ad.60.2024.12.12.12.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 12:56:59 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 12 Dec 2024 12:56:55 -0800
Subject: [PATCH 2/3] RISC-V: KVM: Update firmware counters for various
 events
MIME-Version: 1.0
Message-Id: <20241212-kvm_guest_stat-v1-2-d1a6d0c862d5@rivosinc.com>
References: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com>
In-Reply-To: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_125701_271061_076B43C7 
X-CRM114-Status: GOOD (  12.42  )
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

SBI PMU specification defines few firmware counters which can be
used by the guests to collect the statstics about various traps
occurred in the host.

Update these counters whenever a corresponding trap is taken

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_exit.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index c9f8b2094554..acdcd619797e 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -165,6 +165,17 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	vcpu->arch.guest_context.sstatus |= SR_SPP;
 }
 
+static inline int vcpu_redirect(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap)
+{
+	int ret = -EFAULT;
+
+	if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
+		kvm_riscv_vcpu_trap_redirect(vcpu, trap);
+		ret = 1;
+	}
+	return ret;
+}
+
 /*
  * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason) on
  * proper exit to userspace.
@@ -183,15 +194,27 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
 	case EXC_INST_ILLEGAL:
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ILLEGAL_INSN);
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	case EXC_LOAD_MISALIGNED:
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_LOAD);
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	case EXC_STORE_MISALIGNED:
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_STORE);
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	case EXC_LOAD_ACCESS:
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_LOAD);
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	case EXC_STORE_ACCESS:
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_STORE);
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	case EXC_INST_ACCESS:
-		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
-			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
-			ret = 1;
-		}
+		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_VIRTUAL_INST_FAULT:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

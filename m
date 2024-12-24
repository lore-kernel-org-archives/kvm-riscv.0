Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FCBE7718D
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQMSxPQnaJdxhvSmV/lOal85alA1hUL/Ea2Qe1l4AYE=; b=N1zXssyYfpOTbZ
	7my8R2JDaX1CqdKNsrQwn6Y+eEaaKr+I7EyI6d2cN8p7ECYm/tkN0aFSvpISwSKjoNHJHvgdv0cya
	4ccUgGGmqWL4wjS774gh1Wn6vZcz8bOWjVyz2kcEYaICcwOKczqoPa+RRMNN3MpgmaZy96FyOvP0o
	atSDMyP8FlSny4cVSQ48hBf5pEi1HazqfhuzBjSEXyg4/zdgbCQi4Qd3ewXOj/scqJBDcLmfg3w9a
	Fq7R+ZR3owBDj7m/OhoKQ/zN8Z4K4d0+ag88FygaqRSyfk/jfzuTddgeohWHq1PmJlujMgWnZbDyt
	FxxpkLrj40x0Ih+PTaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5R-0000000CnUp-0MrA;
	Tue, 24 Dec 2024 21:05:05 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5N-0000000CnRl-0ZLn
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 21:05:02 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2161eb95317so59176445ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Dec 2024 13:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735074300; x=1735679100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyrUQMinm9VfIkz//Zqi5azyB73CtB0XBmp3HQwwuxA=;
        b=l2GPhqpAxO1Ju9VS8vhndc7qDLqctOKN6zkdl+eRkWOJzWnSq+GbsOTPFHL4SAuAfG
         UX4QAv8JP0ihfn06Ut76ecQ1zB9I0mzuiNhNCNqUqfzFGD4HDMqff/wzWq5VhbqWZb5O
         AA3enyTIQ/+IKnhXRcSMaNV8yCpB8tEZVba0fZUSCxLFoznveF0VWyrnJr2EaTxS6680
         bVK7iAIk+nKF7InWFs7Bt25tkn8g3cc2G4oCuGITmDxVWfyD8phFVTEX/y3uOosUmhgS
         N33QQxfogWElp4Le2tSN/Pvrmwc2DOqxS45V1N6EtHKPcZN9o8IXkgakyX5snVDR6l63
         +TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735074300; x=1735679100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyrUQMinm9VfIkz//Zqi5azyB73CtB0XBmp3HQwwuxA=;
        b=HUnGSjU9X7Y5B7Ncjjet0ZAAW/qBfa1200r0q3N5sO9U7PstJQAjFdF6ZjG2PE+Z/0
         oQ54pq8M4vwwSipreH/+yVOLdmz8bWloIsw+Pu36aPyhaVPqJ1MUO2oEg6NY2mC5dIvx
         IwzYxXRf+xPXLpbF945UQsrz+cLk3CFXODkJlt9sk9ShuHnX3zawg4sjjDVM3je+dIxt
         RP7isKFNbMgGvWf04tQGYTOaQTUF/AszmApGhb0RYw0VP8w+qTX25odbaKxdxuOXrTPt
         FccxMXNkmoM2yTkN4JnJDWVTfQI98NWPIHh8smin3h21dUMEtrjCPySRJGJR6e+/7pJo
         2/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+PEBOsEmSu25WqKQNJgVcSOZJeRRGXhjnQGrHruzWyRV0bcN4vIVhv3mIqqye9f36/NwZYxlyv/8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhYKzZtMHKRyX2gIYlwn9XSra+3/PnSxZkGWpU1PUwl9WiFMDg
	58J3OOkzz03Uyacm1r6T5XPoga+Mwrd0Lu9v6qzPJo31E+rjvhAO1FJIRtXA+TY=
X-Gm-Gg: ASbGncu+jDwry9pT8M1X5zfouT2EKTk95K6C9lKCqAhz5Fmq2bO6UUUko6DdtUxLJCx
	f/cjTgyyOgf0iCYlPtgNADRFu6KpQjyZDrL/weogHGtghLSUJE12IkEq8pXFbWd2un2YVFjS5ih
	0Dq/fEKcCJDP+SyuO6qv0MCOJ4nomuCgI684ey3KZTdCpyBG8C45MJPsZ2MrOh/acieIFbe7E1m
	0M96onEpGpIGXiL3+V4tXeAflmS0AjcxM89OtXUhIPjoY80Uh56EBRgNYT545oROzrGMA==
X-Google-Smtp-Source: AGHT+IFDnCQ0fa4NqS6VnWu4yH1L9kNVbzZkBTsq+P+df9RDRyuUZJOIb8A9T8ylvjy7lFyFnN1bzg==
X-Received: by 2002:a05:6a21:7e8a:b0:1e1:ae9a:6316 with SMTP id adf61e73a8af0-1e606dfe621mr13695856637.35.1735074300205;
        Tue, 24 Dec 2024 13:05:00 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c344sm10445925b3a.186.2024.12.24.13.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 13:04:59 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 24 Dec 2024 13:04:54 -0800
Subject: [PATCH v2 2/3] RISC-V: KVM: Update firmware counters for various
 events
MIME-Version: 1.0
Message-Id: <20241224-kvm_guest_stat-v2-2-08a77ac36b02@rivosinc.com>
References: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
In-Reply-To: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_130501_224171_57065B71 
X-CRM114-Status: GOOD (  12.48  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
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

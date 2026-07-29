Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B44C55162
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41TefVgOUXKfCe4N2p1VaYBxTluFKCB1xfeUv/rFkrM=; b=McyO3WQnuBMd+4
	o+FZitRdEYQbElAhdYOYF3emaQEZbJx2B1qXoXMyfYJbHhOMdD1Dbzqau8lQNpoe5BDJOGtwGTrrh
	I/pT3O5iXlj+BYr7b3JupAW1wmwFzrgXb0kmHRAUKi1RmB7LLhDYCElvI8egL5CJOqIQDlYkjhaQ7
	cpg3PW6xmiOOanAnPWD5WcLdvK566H2maQrhPK0MDeiQwJwjemFLFfzlXreOtin1VRq/OULylMzoH
	bdXPHwcCqEbix345w5RV1Yc8nu41jhkqzeCPoz3tbzUwvY2f2hYwLUNRqGB310gKBgr3ushJnqJMF
	q0h7i2v+qKsdTitBu/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDej-000000096x9-3Y8t;
	Wed, 29 Jul 2026 23:25:45 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDeg-000000096v0-3pLT
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 23:25:44 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84ea0ded155so144603b3a.2
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 16:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785367542; x=1785972342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5uwqzdU+bRfmUzUhku7H1r8OyjJF5nGSMJqcdrWCrY=;
        b=Y6VH9PS/jIfi1Ri/+FvBjXenL2Y1Tcm9NorVPsAqoOqNool6Pt8QHhL/SHLIf8SE0I
         aXwW/yU3fYxHFDf3OD0Qd05lpwzJE9pYZXNzfylM32WeDi46x+7/assE4y4u4daq0CPW
         ncLna/UOfXCuNz3WvpSgwod0gpQrX4wfnMA7TayvOEVQOLnSzIyde8is53Irrnf8WQVL
         r+4OPtQ2S7JNKvt0BzzYd4yVUbAGDVRsq75TFoSCT1o+mxKsjEOmxhPpCLjsMyjyD1Iy
         f0EmHU83JqKdDkNdVexIQFweLnHyazNcBUUntmLnrJP0OiATF7DCk2FfcnsHb3dSktHJ
         8ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785367542; x=1785972342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5uwqzdU+bRfmUzUhku7H1r8OyjJF5nGSMJqcdrWCrY=;
        b=sCX3P4NF1ddmLiDw7LfmfwDCCAA8D1p5tRmlZQH50cUs0n2fIYZ2RTR0o+ASXi6FMP
         QquW1iNeTxpK5Ixx8FSSz2I61fPqOiMNKZC0MIL8UuNTrra9u6XfykVRvSlBB2t+yMuq
         08hQP0T7XS9NGjgeVflvIuS6Llj2exwyBlJdxUb40uyt2Zq8zOZCIdiushBrAapfSOTf
         Alr97XG+NLZZTn68Ib2ouj7h6HatRF73n+8VMT0o3A9dY9JbbSh8whYz3gDDgU/tQc2b
         9WDFjkVFiAloj8zgVyRAzdbChLOuB6cA508wfKAMkH5rnYNGLG7nVUfkzKnyrvTUuts5
         FLBA==
X-Forwarded-Encrypted: i=1; AHgh+RqVFCC1HT3+o16KLoF9Q3zYI2aaPJ+sMmy3JmJcU12NouyZjUl3OSDS9MM24aS4T4HvSXhC/KzF9U0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdZxayoQgqT+yBCYHJ7kcchpuX+fdBPQbC9uykYIp+49yqE6fU
	hEr/NQu0DB9lfOunCmMYdnDqJrM2dahwZeXA2l90iW2qUD8spdY2HDPA
X-Gm-Gg: AR+sD11RX3xLCOcZBSbQsAER5RBPx0DSqld74fq6oBNGqpqgI7ne9TBpQMk0bxdXlUA
	ZsbjUbT6oUV25JQqximFWMP2hcR+hlmfsEeQ+KfyVfhGfr2kWtDCMuV4KSkoL3Iq/8X1hIjQtwD
	kHAWByRJNFQ/bObaYBDg/Iw8hLEXvsQXI5GjHkNf8uVWwp2CcNUZnXWdJhhVLs9ousL7aWmwVWQ
	ditHmorGZ7ZlrGGP1O53RPhz4xqyx9K286R5+m0/gmZAlshWUo51hkMevxeIsqPEaqkJdne53Q/
	+hqiryRTaxtLz5NUQzS7UkvH99WLg0jAcdTo+2b04xsWIQ6Y0HW65QgrvLSBPnmDCa0x0ocIkfP
	j7gNwvLH8E3vcYYwRvddz97bMWEnypa4bQ0BR/vvXnEnFhpc2m6Izn/mpMfos8uo5y1JIkzH9+l
	+Wor7/qDucEtgzND2XtGUVTC0NFBT6r/jEch4FdZ1GcyTOYmsNIe929SG7/5A=
X-Received: by 2002:a05:6a00:330e:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84ebc1eb51amr328381b3a.6.1785367542040;
        Wed, 29 Jul 2026 16:25:42 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa474sm1992558b3a.30.2026.07.29.16.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 16:25:41 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 1/4] RISC-V: KVM: Add SBI extension validate callback
Date: Thu, 30 Jul 2026 07:25:22 +0800
Message-ID: <20260729232527.139183-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729232527.139183-1-inochiama@gmail.com>
References: <20260729232527.139183-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162542_954561_E922FE77 
X-CRM114-Status: GOOD (  13.04  )
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

When user disable FWFT extension after setting any value of the
FWFT feature, the state of vCPU will be broken since the value
of disable FWFT feature is still functional.

Add the generic SBI extension validate callback so the FWFT
extension can fix its parameters before the first run.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++++
 arch/riscv/kvm/vcpu_config.c          |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index c1a7e3b40d9c..f01a2860c751 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -60,6 +60,9 @@ struct kvm_vcpu_sbi_extension {
 
 	void (*reset)(struct kvm_vcpu *vcpu);
 
+	/* Allow the extension to correct its parameters before the first run */
+	void (*validate)(struct kvm_vcpu *vcpu);
+
 	unsigned long state_reg_subtype;
 	unsigned long (*get_state_reg_count)(struct kvm_vcpu *vcpu);
 	int (*get_state_reg_id)(struct kvm_vcpu *vcpu, int index, u64 *reg_id);
@@ -93,6 +96,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_sbi_validate(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index 238418fed2b9..b68aa830aaf5 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -69,6 +69,8 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
+
+	kvm_riscv_vcpu_sbi_validate(vcpu);
 }
 
 void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 46ab7b989432..b737e9a7a12a 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -723,3 +723,26 @@ void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu)
 		ext->reset(vcpu);
 	}
 }
+
+void kvm_riscv_vcpu_sbi_validate(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int idx, i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+		idx = entry->ext_idx;
+
+		if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
+			continue;
+
+		if (scontext->ext_status[idx] != KVM_RISCV_SBI_EXT_STATUS_ENABLED ||
+		    !ext->validate)
+			continue;
+
+		ext->validate(vcpu);
+	}
+}
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

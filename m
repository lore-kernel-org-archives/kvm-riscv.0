Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F545CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 12:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2jEMzR+7iqDlSht7Y6/fpKig0EZRg20TyeokYHhKiU=; b=L17qsu44hRTm6z
	c53Z7qtx/zQIhsl7Nkwa+ghWvYlL63qrdw2gTrXRWmJvG87pLIHxiRjL9GPG+5zOpmKlT8PA3vfpP
	b3HV1HxS4YHZvIF/hYpOTBZ8bi19f/PehjybQBqk7w3CF5PBMxhw17cMAGpc0C7Yu5o93YFEHQ7o4
	npx2KYv/0ecRebAK4Xygx0fZRlJq96/5yqib1xViau5EAYwZncxE1XdGwpFQ1UVnQMBo4tleHzfN1
	MkawaMP67AErcQelLxqh59czs0/STpm1+RVWBMywWSXxvRSlpPObVnQM1MM8OPupqQONKbwjoVMmj
	nFCdTIKklALf9DZQeAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncaK-00000005f8d-1Gbj;
	Sun, 17 Aug 2025 12:34:04 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncaI-00000005f6u-02rD
	for kvm-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 12:34:03 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-323266b6ff5so1903931a91.0
        for <kvm-riscv@lists.infradead.org>; Sun, 17 Aug 2025 05:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755434041; x=1756038841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNhy8e+wcu2xj9coMjyL72gmYgwxBYToiGY6Az0bjY8=;
        b=eroSETpiSCEBPFxrSpFUizMkkAzCUojL++VPKUBRB2qz8OgEpaArmkgWxeds/N4m2P
         yrvjJWmxVOZBDLqGitB+GZ1AK4vZUQyVUFHesdkTVK/82/DUjSFU+c/QbbgTdJzGn+BG
         h/mj6N2wm4vUfGpcteSv60KFebvAFYymDTH7bIh3OPT2hh+DLNIlhOuHbS+amvVbpq/V
         dUCt5SGNHyIa7Z3MK1m4LkaWPOhvvxBFUBYTikAqiX9dJc0wlLFohsWIzUjIfqOhC4H+
         J5RMp4lRYN0nWzVtDkpyFSGXOgiw0Y+wfIOZ++B0d9+goiZTVRZMoWvNphiGhhCnhTr3
         zS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755434041; x=1756038841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNhy8e+wcu2xj9coMjyL72gmYgwxBYToiGY6Az0bjY8=;
        b=Fq6OTL146N72z7M00X/tRPWyg1N3ysRLWnHF6PHUNYD4bnTbVcQrc6kis7hhG/Nv3e
         HRG+sOTXLlkTNbF+5QJlqICTDPpCTsc9Pu5+Kvi+pka18BJbirfe7vbQR+Ilp4QF1+YN
         TsqDvm/Sv++jSOBNntYVJlyh1PAZt61U+MOp6QX7P6KYCcNf9kRtrwxWlS13BDGXdVmo
         OP/n+soJs9CExAMSn5mBPOmMonnsdedrw0HBicUxZSlvk61i8NZG6luijav2/DV+Qoa2
         7eaRofdFv7EJU9MQULHRwsbT6V14avNpDmZaU9MM4UdMhaS3jUlENmtwWp/iP3UGsyyl
         eTHw==
X-Forwarded-Encrypted: i=1; AJvYcCWhoovb0VvEqngzAcu1pIc1eFE32ZRUixoE3lDUU5oNY+HQT+opYGB2v2v3MoZ7GI5iRh/iqI4L/B0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6g9igXmRTB19YKfuuX3vAgGZx73hIyLoQJSI6zSjLZr91MTZx
	KnbCCU5GLjkLyKPLC8Md+hDCwFxO/vcsUWPsTPsE/+kuKLDRQkJuI1tTO4BjhP+2sS0=
X-Gm-Gg: ASbGncu+wx1tWz0mUYfPimChprd2GDEf/lFhArb/xcQ2PTejJKuktA8fpuG1nzj/GAp
	PwxIpoRHGIYcM4QyXaGndMxPfI7+dWlMK3ycs9yUFssDYDIVl8IoTO4LBy8ivjhEOwAiR6OkMwo
	uXE3bxxtbgx1BUKl8K7nJjb+y+L5/SnvMcpX9VI3cVete4n874lFpDqSITcRHbqv/NxsAHdfAGW
	OTRtZf9r3VNfG92AyxzQ8pyvZOhmjXp8rQ2T2m0b9G9HuC5ayiNVQpM7c9r0fIr5yD4g0ZRK5BG
	lCkFvsW/A6pWUm5L5sQUdfK4OVxcpm80V9ICUflLOrEpB7eyvz69jZ855B1TNCcr690CH7ypguB
	XHVJSsfMPB9Ylb8ETM5+nhqIjjMhikaSpey67u6kj89YBEGxSAMfAVmY=
X-Google-Smtp-Source: AGHT+IHh37iRS02dzFD7p73eZSbpQiOlqNZO1JoyVWCj6beSgZrt2b8qgavkosgeWIhzOEcfJ80ZCA==
X-Received: by 2002:a17:90b:3b4d:b0:321:1348:4438 with SMTP id 98e67ed59e1d1-323296d963bmr17136225a91.7.1755434041279;
        Sun, 17 Aug 2025 05:34:01 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232b291449sm4480912a91.0.2025.08.17.05.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:34:00 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 4/6] RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI implementation
Date: Sun, 17 Aug 2025 18:03:22 +0530
Message-ID: <20250817123324.239423-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817123324.239423-1-apatel@ventanamicro.com>
References: <20250817123324.239423-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_053402_050873_CAE0F305 
X-CRM114-Status: GOOD (  13.67  )
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

The ONE_REG handling of SBI extension enable/disable registers and
SBI extension state registers is already under SBI implementation.
On similar lines, let's move copy_sbi_ext_reg_indices() under SBI
implementation.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 +-
 arch/riscv/kvm/vcpu_onereg.c          | 29 ++-------------------------
 arch/riscv/kvm/vcpu_sbi.c             | 27 ++++++++++++++++++++++++-
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 8970cc7530c4..d75ca45c0152 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -77,6 +77,7 @@ void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
 				      unsigned long pc, unsigned long a1);
 void kvm_riscv_vcpu_sbi_load_reset_state(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
+int kvm_riscv_vcpu_reg_indices_sbi_ext(struct kvm_vcpu *vcpu, u64 __user *uindices);
 int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
 int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
@@ -86,7 +87,6 @@ int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *
 int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid);
-bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 5843b0519224..0894ab517525 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -1060,34 +1060,9 @@ static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
 	return copy_isa_ext_reg_indices(vcpu, NULL);
 }
 
-static int copy_sbi_ext_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
-{
-	unsigned int n = 0;
-
-	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
-		u64 size = IS_ENABLED(CONFIG_32BIT) ?
-			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
-		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
-			  KVM_REG_RISCV_SBI_SINGLE | i;
-
-		if (!riscv_vcpu_supports_sbi_ext(vcpu, i))
-			continue;
-
-		if (uindices) {
-			if (put_user(reg, uindices))
-				return -EFAULT;
-			uindices++;
-		}
-
-		n++;
-	}
-
-	return n;
-}
-
 static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
 {
-	return copy_sbi_ext_reg_indices(vcpu, NULL);
+	return kvm_riscv_vcpu_reg_indices_sbi_ext(vcpu, NULL);
 }
 
 static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
@@ -1215,7 +1190,7 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
 		return ret;
 	uindices += ret;
 
-	ret = copy_sbi_ext_reg_indices(vcpu, uindices);
+	ret = kvm_riscv_vcpu_reg_indices_sbi_ext(vcpu, uindices);
 	if (ret < 0)
 		return ret;
 	uindices += ret;
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 04903e5012d6..1b13623380e1 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -110,7 +110,7 @@ riscv_vcpu_get_sbi_ext(struct kvm_vcpu *vcpu, unsigned long idx)
 	return sext;
 }
 
-bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
+static bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
 {
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
 	const struct kvm_riscv_sbi_extension_entry *sext;
@@ -288,6 +288,31 @@ static int riscv_vcpu_get_sbi_ext_multi(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+int kvm_riscv_vcpu_reg_indices_sbi_ext(struct kvm_vcpu *vcpu, u64 __user *uindices)
+{
+	unsigned int n = 0;
+
+	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
+		u64 size = IS_ENABLED(CONFIG_32BIT) ?
+			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
+			  KVM_REG_RISCV_SBI_SINGLE | i;
+
+		if (!riscv_vcpu_supports_sbi_ext(vcpu, i))
+			continue;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+
+		n++;
+	}
+
+	return n;
+}
+
 int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg)
 {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

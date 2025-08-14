Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4ACCA0EDC
	for <kvm-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkRKBSITgnm3qeMmgi7FRB7yRaqCHzN1zs3kort5cA4=; b=RKaWWUPZSVFppD
	qvd6Gx309EVVjdTRZaiHdIkyech0uTXehcjl5C1VxpbMW/RwbkbSAwUJ+mopCOaU5kf2PH0MdWhQU
	On3lA/TTr/laZ2q5ODQnI1IIOsuBpuoAaIETjlfSKt1NrIAU58iptJytYce/4ROVgDzG7u9aw4o8f
	1OM8Z2CuEC0HS7RAnrM0GMi9VN6/fGfLJXJwa9kyElPAUGqWQZPCKja7gf4jxt03l7AChoOgb1F7i
	o/1Mfz47Qsc8shXCQsgbqVKzpWbYd4WNJWDJdQgvDeKGgMF6Sir2ErdlV5U2ADotfuIJMPlCvQWur
	e+4TW0xTMxM+VctdHJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbHD-0000000080P-2TD4;
	Thu, 14 Aug 2025 16:58:07 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umaJU-0000000HY90-0LyC
	for kvm-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 15:56:25 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b47174edb2bso757048a12.3
        for <kvm-riscv@lists.infradead.org>; Thu, 14 Aug 2025 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755186983; x=1755791783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjEBV0XycMWcBVpHucFxuLGWtwgSmQrzNPLz1/7S0Uc=;
        b=f8KYSHRLYhUM6AzTUCuVK/HYsZQG/Jd5SDU+GpppPtBvHq7+KsYwI+iS3HaDpGrmAr
         Cz88TWQuI2msfuMIDky+XB/46CYVpVcIW1R/8L//0tK4jBprn3uz6LOJycsrX+2rgmKR
         ZUq/06pB+VgxB+A7dncZ4O4v5Z5UvXLgnws+Qa4Joulx+lTThTCRbpZ7atSs3mZC40j/
         EuGkJ9qfkhsDFAG4bYG3/MB3cguzbCp1KmhabIYeamNTab8uTR3EMR4quStOmkRTYQhh
         zg5rWwfGWoH9TGJEollLGolNDqWSSP854CiguRews1hXFOjWImfOe7N2t/u7VpaGPoY8
         HvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186983; x=1755791783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjEBV0XycMWcBVpHucFxuLGWtwgSmQrzNPLz1/7S0Uc=;
        b=uXxLD/ChqfMTDVSF1IKchmYr+ONhaHlz40h9RpkRK2hUuLrFfrCh/5a5yczBjLhCIV
         cmnmmvM+FZUeg4IPnV6ae/jGj6QF/O5x/Co5RNRSggvGQ9WR0GZ5f0Mw6PH15ZLQhjBL
         EtQU8qTpCxmKijY90ZpBT6o1R8u0uKiD3sZsgAjsWNJWeCGQpq0BMI6nykxzEjVAABuW
         IvpFZY9atXr7TAxodB72j4Jyc6CNO5bpDyxnJijpMNo9gWSTJKpfVgJkqd1UcryRI71a
         1jvcnybOqb4y6S0j32Aq8a+WlGSf/sD11txsicx+gsHG7/L6M1XcXO0ZEHW9vrkS6O0f
         JCtA==
X-Forwarded-Encrypted: i=1; AJvYcCWqMyS9aVXQCo1B1xa/HU5QlqQIo0zdU3C4QMzw8qGkxWzYVlPyu0lj8ETTe0GmMbOgRHa0pxpNjGY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/jyPtbIn0TOQVeR0fgYKYAmcVx3+MZ9pkVYGJVOqvmTyCQG+A
	c14TRZPizBUb5N8b3qkiS9i9VqdEr1VMG0wek6AJa39bI9a6vEotaxboWy/hTsDiRTA=
X-Gm-Gg: ASbGncsJ0WCV/QJ10a9StUbCUL0Tr2YctYfmDLPrPCYmYWEHOo9aStTGUtSjxDKz/PW
	Hpk4IEpMrgod3oMGNlXgobcPknVMjcBMSWkR5bGcETfG+IjG8O3pHOliRFvH38r3Gi6p8+fl6At
	oJIPAy2DWD9QnMqkve3LBwjyCrHoIdBEw6cPsCfC911YvvEI8wuLWIEMsFaeRN0mfAP2gCgJTsR
	tR/HhspYb/Pjqv4gt4HpBujhnTyRAa2DcDpD0+TkvpJkKY/kXpupKsXWVNXbB4UUXQHrievD7Dp
	hEj5FJ2HMNzPY2ewhJvjVHOrYjrSHu9kdcOIWY7aj4YrbX3kHh16AdWOryj+soDNulnTsTla+6y
	OS+ViPXiMbdHGmHWXvoLCydmAHT095tjL5AI78O5zZ467o57y29c9XUhNpyT6PA==
X-Google-Smtp-Source: AGHT+IGItqFm8z55cDwxSzzGs3dPEK+gv7cx+ag71dX5oyptRWM4L/1ck05jILA7+mE1V8PQvvjeLQ==
X-Received: by 2002:a17:90b:5246:b0:311:eb85:96df with SMTP id 98e67ed59e1d1-32327a63a5cmr6292953a91.17.1755186983087;
        Thu, 14 Aug 2025 08:56:23 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3233108e1d9sm2225500a91.29.2025.08.14.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 08:56:22 -0700 (PDT)
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
Subject: [PATCH 4/6] RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI implementation
Date: Thu, 14 Aug 2025 21:25:46 +0530
Message-ID: <20250814155548.457172-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814155548.457172-1-apatel@ventanamicro.com>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_085624_123259_058CA803 
X-CRM114-Status: GOOD (  13.58  )
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
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 +-
 arch/riscv/kvm/vcpu_onereg.c          | 29 ++-------------------------
 arch/riscv/kvm/vcpu_sbi.c             | 27 ++++++++++++++++++++++++-
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 144c3f6d5eb9..212c31629bc8 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -78,6 +78,7 @@ void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
 				      unsigned long pc, unsigned long a1);
 void kvm_riscv_vcpu_sbi_load_reset_state(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
+int kvm_riscv_vcpu_reg_indices_sbi_ext(struct kvm_vcpu *vcpu, u64 __user *uindices);
 int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
 int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
@@ -87,7 +88,6 @@ int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *
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
index 8b3c393e0c83..19e0e3d7b598 100644
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

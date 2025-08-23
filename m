Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41175CA0FE1
	for <kvm-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebdFTyQStqBepQVtKPX9VQ+e+RraG7P3Duv5OKCO10M=; b=q83Omlj7GT+XN8
	zRAOA8Hj/4E5ESkYqg1+e8uLoxWV/98AENQGAzcj510NdOUSseD1794OKFteuI3n9Qn07Gcu8Ho3n
	WuJGMtpXhj3w4SvoDgqt//A6cjGjeZJ04kzAEbfcOgh9kTtzS/0zzON0DnpFibdzgiaDmoPaDIEun
	s0TsJm4VVjU27Ix5Fdf4eDiQJCmaVMKpy+YoBrx0iFaraEfZD6mKCHOgo4kVgtfalozFJjrrBD0/4
	HrbL6Qb/5IVbI5Lo07ifi8itoMtZX+fq/wfgsxtrWjKSiM2e/inXjfMs655TG9jl87Q2vyVKaDh4I
	PKBillwoJcLqshf7ZSuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprFf-000000052yI-01W8;
	Sat, 23 Aug 2025 16:37:59 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqfL-00000004xWd-0vDW
	for kvm-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 16:00:28 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76e39ec6f30so2961180b3a.2
        for <kvm-riscv@lists.infradead.org>; Sat, 23 Aug 2025 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755964826; x=1756569626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QNTGSl8W9jUKwX1Y5hiHFssIh4zzMlPaIQnsQ0pfko=;
        b=i9DZ6yHyvQAQ68bfENY18MI7lUp93G6BIz/z4/CdsdueXSS9sjzgw2E78pbtdvmDt3
         4ZaiIDwyWz/poI2vS8ftFTD1DBxNSXWkJh1lOKCBMQfLaq2Wx0d5zxWYp71GNoh4bH6o
         z4fQ6wxPsy0WqZ5uS869TzXTEUTxlh1ec9hT5IPdYI+kBcqXAQMmHBmRWhnWzSd/2Vqr
         F9G8WWIsgJX//PHAO5GoIkp66E6JiFvcsdI5A1DPTi8itb0oOsAhjn//8YmRI5VVTFjV
         TkF2SBKDkZOIaUMYGZtMciOzS1j6qCCW2mRLxUfipShR80WODRg2mr5TNFAXTTf2W0bW
         0lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964826; x=1756569626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QNTGSl8W9jUKwX1Y5hiHFssIh4zzMlPaIQnsQ0pfko=;
        b=hiaOVm6u9E/HioxaFPu2P859QrQ+SGO5885ONEoJSlnoMfvS+oq1YaEm5sD+EQeiUs
         SVkmQ8DwThsE76aoP6VHK9NMe7gR2LG6IOAuF8yVq1ZFoDlYufrpyQOLkaF2yGAUmNOQ
         rFlZzgYx8XBSKJCbutBG/fqt5uJWlfqaek9GwZERPuvCXqBRNVvOYMNUcCzMNE07Giu9
         XQ1hV1G5V7Xi0i0yrb694KMPVknz/rQu8h1ifuiKSGpdQWrQdqYe+rpzLQxyjwSmqN0n
         g8aRQZ/jw56lgxHSz2Rsxt2kY+/zke4QvrVQuoOq4uxkkfs+pIBeSb2iNYr0a9WslPzE
         m4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS2ClUW0USBEN4ziVEB6FiCpzySPqJAw+U8U+3raufzTGnAo0c2ze8xFMkGZMspsUe26rqPGwI+Ik=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/z+DrOIp0MNC41BEsBrbuSuHEhoyoumDTtyelpgg0/Qi798F0
	UzL6t2TcEySjI59de8z85NBiBup2PNRv4DgWg5NtGyczH6tPgotk1MvPd/nnmJ31j5Y=
X-Gm-Gg: ASbGncu08ZLjWkMcb17ra9UeQw/iie0SY7AQopJIbYYVOITVCqZ75PWSvZfCORBIVy/
	sSlQ5vtrij2fS10l4UEoIzvF8d1C9YH530ANMby3nHj06iO68578TgBvurWfCF2FPU5ErPJ/Scg
	KpqI2foI+GjVe+MWlHwpZuBedq7BzQHQSaLm1wkmLm2ZRhHxHGDo/S88vtMv0RJaF/xXtqXU30P
	dQRiN0j+MiXXwz1ZXrAtW817pCdrlpSc0jmNCSBNjaHABLwXKFX6cGc6ZqoEd2eaa42gg9z7mnP
	F+WxiTopswWxRm429xp16Gll/JbIyxsMRE17YRHKlXSVJkPs9p3WGpYzMCQMaFvrY74eJh8PY9m
	vaDaaMQoqeciwLzIkrhWfJ1FNkU7WZIHglY4TDCH1xGLEnnPhS02R8bF0mU0k+Czs4eFfIL91
X-Google-Smtp-Source: AGHT+IEo9oLIFiXAIQrZJ7Jw/lL5+vEVJj3YiBwiqokGLrQldRoOB9aEEhSOfywm+FIR5r1fQzfjXg==
X-Received: by 2002:a05:6a00:9288:b0:76b:d67b:2ee0 with SMTP id d2e1a72fcca58-7702f9d7f70mr10308982b3a.6.1755964825622;
        Sat, 23 Aug 2025 09:00:25 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214b81sm2804464b3a.93.2025.08.23.09.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:00:25 -0700 (PDT)
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
Subject: [PATCH v3 4/6] RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI implementation
Date: Sat, 23 Aug 2025 21:29:45 +0530
Message-ID: <20250823155947.1354229-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250823155947.1354229-1-apatel@ventanamicro.com>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090027_252461_B7DD35F8 
X-CRM114-Status: GOOD (  13.43  )
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
index 0f4e444e5e10..865dae903aa0 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -1082,34 +1082,9 @@ static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
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
@@ -1237,7 +1212,7 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
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

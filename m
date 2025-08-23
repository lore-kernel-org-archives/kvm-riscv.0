Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527D6CA0FE8
	for <kvm-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 16:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEZ1ql9OiqpGwDYMsUjkcfruli/EaGPO15ip0uviT+o=; b=H4uAmic43mX/+3
	50z4mKQRcWsxUq7ciboYlDvpcB52bFK77I9jEizv3JyIZ8epKhsEv5MErsDrAWpmC4k0XQDYADGYB
	UQvhzjJQWqdl2zS1k3LuAQY4w4p5D/rlf/ORbcS+SLkSbJgqLn/pIOmPdZ8655splTb3CtzvCU7AY
	F27FPdj9M7ZwL8ENE1QwVqvRPxhS7Y27ZSTmbieShn08ZDd/fRD8Wy7s7NTb4y2ZFynE26Qm9R87b
	f5dcJhiKdZrw3+HuF12fee6pW8eprTTLvmFc4zx2eCXBGBDEZDqfYmj3C1Y+UazEuMH9p5ff+I456
	rYbIQ9doYYehibLUGAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprFg-000000052za-0Fe8;
	Sat, 23 Aug 2025 16:38:00 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqfQ-00000004xYL-37sP
	for kvm-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 16:00:33 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e2ea94c7dso3149969b3a.2
        for <kvm-riscv@lists.infradead.org>; Sat, 23 Aug 2025 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755964832; x=1756569632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOBEpzpsJOm5NzKt44w6bKVXSAiqD9Y6Ko8TaaNwkww=;
        b=dssmbkV4Yrb21wdcAnteV39Faf4YL5OoAFb1VRBE9wYqL8A4WzyXA1WNAitc3zE07G
         ScIOKk2ohi3WucbHzLDKjSznDQe4h5iRE359q3Pjg2I5TC7R9Q3d1WLVTV0BlaJcgxzR
         GwMlyxZrE1SVSzgFutZQLC7V3Ak4DVs2UK/t0f8mKi9sMsqxyxG79wd2Oadl1N+xluuf
         WmiCH2Xi1R37sF/lvlZUKq9bgFZekGTyargkjefz7MpGJ7uqF0jnzPA4JG3cHOxTB6yb
         1lUIPkC8vfg73xAUEvPps375qXCR65gi+1TzPwx4P6aASnoMP0VNMv9fE2mqm1+u2X0k
         s2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964832; x=1756569632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOBEpzpsJOm5NzKt44w6bKVXSAiqD9Y6Ko8TaaNwkww=;
        b=riekVnfm9LcR/8d+zJhmjjlPSVvKUhXzlRG1O1dAa1HPQzjT5V5v1QEaKE+t/Y3y1d
         AS7OPhWBkGCq/otAkFrOa2T/jYszNgq0cPHRC3N3FFTrji2TqfqQ5+pKUtTjB8xlpY7m
         30H9jQqvtleFGKO8ZW0bhvYydSBjZJzsGQO1gvCcPA7nI5maCdqj6P1qnq9eFq0gVvR9
         9adEDkVZfy+Pg9k2qS/rwdWUhb3PENRAZh/vo+h6qsrJphHXlXnGXDAsonhwn9+1R8hC
         OjsrYpOjXULlvUeFdfCW8qXlGUrI7MvTb7YE/IgxOOxnGMu7uu70e0Xgb4Spf0HU3dKz
         2xyw==
X-Forwarded-Encrypted: i=1; AJvYcCXAGrNWKsy8hVJLZimzEi4uid02wbP33nmp4rzvENjMZqfqw6ccxL2OEtYeojPdoy4hhxTAb18mOro=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+6xdJYqv3DIHqKwHI3l+fJ0oaqDMjJr08iw+J0OhM47Q24Lqh
	j8gdCFf0r7sUHQK13/77RrlNa+kq9G9whCIY/gJf4ljaiWlr/qVXaur9TC8UxoXFF6E=
X-Gm-Gg: ASbGncs1Gm5HsJAs2DNdSdsYxmV5l6BNxIRH3ps0YSGHrhfes0f2ZjxD3fpRCs4GE/B
	KfbRKRzLSsOWGps0QcHQJkfnYZTcZkmlJ3XZdYkMMBCixCMYpnkfIniy6e/c7Ct09JxCs9rvsOS
	0mqmvhFHS1tymnMQCaLpO1UScrAjHSea/K3JNeloFwY07M4oUyucl+hjPzaKZERvSi7/hQaR+Yn
	EPKN1ocOFBRFQKpaliiwwyH1chTHvSKJ6PDYEgvTq92ixAOgfTAGiNySJ7MjkIHVDQUNktf29LA
	+/J/pS+lod1QccwqTEb+ZTL1hSpXIxeARiMUYgDRDG1CmpgN/Fmm48hScFTVAXAPynU/VsJDK1I
	WGqVGCG1A124Jrv4qQcJinp2hwwk6ClRo4KongUBZQZcIqBlIXqxXrI+B6dEsiw==
X-Google-Smtp-Source: AGHT+IE53BwXP6ryhSfjXi5EZJJmMqH5ezOmaRJWAx3BEmYaFaH4XaSvhu2sMiMiod7cJeFFLx3hpQ==
X-Received: by 2002:a05:6a00:2991:b0:770:374c:6c60 with SMTP id d2e1a72fcca58-770375bb1b7mr6594396b3a.12.1755964831710;
        Sat, 23 Aug 2025 09:00:31 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214b81sm2804464b3a.93.2025.08.23.09.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:00:31 -0700 (PDT)
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
Subject: [PATCH v3 5/6] RISC-V: KVM: Implement ONE_REG interface for SBI FWFT state
Date: Sat, 23 Aug 2025 21:29:46 +0530
Message-ID: <20250823155947.1354229-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250823155947.1354229-1-apatel@ventanamicro.com>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090032_785208_56939B9D 
X-CRM114-Status: GOOD (  21.23  )
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

The KVM user-space needs a way to save/restore the state of
SBI FWFT features so implement SBI extension ONE_REG callbacks.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |   1 +
 arch/riscv/include/uapi/asm/kvm.h          |  15 ++
 arch/riscv/kvm/vcpu_sbi_fwft.c             | 197 +++++++++++++++++++--
 3 files changed, 200 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
index afb6305e46bb..5604cec79902 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
@@ -16,6 +16,7 @@ struct kvm_sbi_fwft_feature;
 struct kvm_sbi_fwft_config {
 	const struct kvm_sbi_fwft_feature *feature;
 	bool supported;
+	bool enabled;
 	unsigned long flags;
 };
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index d2ebc4d0be4b..11fe4a89600c 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -220,6 +220,18 @@ struct kvm_riscv_sbi_sta {
 	unsigned long shmem_hi;
 };
 
+struct kvm_riscv_sbi_fwft_feature {
+	unsigned long enable;
+	unsigned long flags;
+	unsigned long value;
+};
+
+/* SBI FWFT extension registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_sbi_fwft {
+	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
+	struct kvm_riscv_sbi_fwft_feature pointer_masking;
+};
+
 /* Possible states for kvm_riscv_timer */
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
@@ -303,6 +315,9 @@ struct kvm_riscv_sbi_sta {
 #define KVM_REG_RISCV_SBI_STA		(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_SBI_STA_REG(name)		\
 		(offsetof(struct kvm_riscv_sbi_sta, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_SBI_FWFT		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_SBI_FWFT_REG(name)	\
+		(offsetof(struct kvm_riscv_sbi_fwft, name) / sizeof(unsigned long))
 
 /* Device Control API: RISC-V AIA */
 #define KVM_DEV_RISCV_APLIC_ALIGN		0x1000
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 5a3bad0f9330..cacb3d4410a5 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -22,6 +22,11 @@ struct kvm_sbi_fwft_feature {
 	 */
 	enum sbi_fwft_feature_t id;
 
+	/**
+	 * @first_reg_num: ONE_REG index of the first ONE_REG register
+	 */
+	unsigned long first_reg_num;
+
 	/**
 	 * @supported: Check if the feature is supported on the vcpu
 	 *
@@ -44,7 +49,8 @@ struct kvm_sbi_fwft_feature {
 	 *
 	 * This callback is mandatory
 	 */
-	long (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, unsigned long value);
+	long (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf,
+		    bool one_reg_access, unsigned long value);
 
 	/**
 	 * @get: Get the feature current value
@@ -53,7 +59,8 @@ struct kvm_sbi_fwft_feature {
 	 *
 	 * This callback is mandatory
 	 */
-	long (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, unsigned long *value);
+	long (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf,
+		    bool one_reg_access, unsigned long *value);
 };
 
 static const enum sbi_fwft_feature_t kvm_fwft_defined_features[] = {
@@ -91,16 +98,18 @@ static void kvm_sbi_fwft_reset_misaligned_delegation(struct kvm_vcpu *vcpu)
 
 static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
 					struct kvm_sbi_fwft_config *conf,
-					unsigned long value)
+					bool one_reg_access, unsigned long value)
 {
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	if (value == 1) {
 		cfg->hedeleg |= MIS_DELEG;
-		csr_set(CSR_HEDELEG, MIS_DELEG);
+		if (!one_reg_access)
+			csr_set(CSR_HEDELEG, MIS_DELEG);
 	} else if (value == 0) {
 		cfg->hedeleg &= ~MIS_DELEG;
-		csr_clear(CSR_HEDELEG, MIS_DELEG);
+		if (!one_reg_access)
+			csr_clear(CSR_HEDELEG, MIS_DELEG);
 	} else {
 		return SBI_ERR_INVALID_PARAM;
 	}
@@ -110,10 +119,11 @@ static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
 
 static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 					struct kvm_sbi_fwft_config *conf,
-					unsigned long *value)
+					bool one_reg_access, unsigned long *value)
 {
-	*value = (csr_read(CSR_HEDELEG) & MIS_DELEG) == MIS_DELEG;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
+	*value = (cfg->hedeleg & MIS_DELEG) == MIS_DELEG;
 	return SBI_SUCCESS;
 }
 
@@ -145,7 +155,7 @@ static void kvm_sbi_fwft_reset_pointer_masking_pmlen(struct kvm_vcpu *vcpu)
 
 static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 						   struct kvm_sbi_fwft_config *conf,
-						   unsigned long value)
+						   bool one_reg_access, unsigned long value)
 {
 	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
 	unsigned long pmm;
@@ -167,14 +177,15 @@ static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 	 * update here so that VCPU see's pointer masking mode change
 	 * immediately.
 	 */
-	csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+	if (!one_reg_access)
+		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
 
 	return SBI_SUCCESS;
 }
 
 static long kvm_sbi_fwft_get_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 						   struct kvm_sbi_fwft_config *conf,
-						   unsigned long *value)
+						   bool one_reg_access, unsigned long *value)
 {
 	switch (vcpu->arch.cfg.henvcfg & ENVCFG_PMM) {
 	case ENVCFG_PMM_PMLEN_0:
@@ -198,6 +209,8 @@ static long kvm_sbi_fwft_get_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 static const struct kvm_sbi_fwft_feature features[] = {
 	{
 		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, misaligned_deleg.enable) /
+				 sizeof(unsigned long),
 		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
 		.reset = kvm_sbi_fwft_reset_misaligned_delegation,
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
@@ -206,6 +219,8 @@ static const struct kvm_sbi_fwft_feature features[] = {
 #ifndef CONFIG_32BIT
 	{
 		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pointer_masking.enable) /
+				 sizeof(unsigned long),
 		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
 		.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
 		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
@@ -214,6 +229,20 @@ static const struct kvm_sbi_fwft_feature features[] = {
 #endif
 };
 
+static const struct kvm_sbi_fwft_feature *kvm_sbi_fwft_regnum_to_feature(unsigned long reg_num)
+{
+	const struct kvm_sbi_fwft_feature *feature;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
+		feature = &features[i];
+		if (feature->first_reg_num <= reg_num && reg_num < (feature->first_reg_num + 3))
+			return feature;
+	}
+
+	return NULL;
+}
+
 static struct kvm_sbi_fwft_config *
 kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t feature)
 {
@@ -241,7 +270,7 @@ static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
 		return SBI_ERR_DENIED;
 	}
 
-	if (!tconf->supported)
+	if (!tconf->supported || !tconf->enabled)
 		return SBI_ERR_NOT_SUPPORTED;
 
 	*conf = tconf;
@@ -267,7 +296,7 @@ static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, u32 feature,
 
 	conf->flags = flags;
 
-	return conf->feature->set(vcpu, conf, value);
+	return conf->feature->set(vcpu, conf, false, value);
 }
 
 static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
@@ -280,7 +309,7 @@ static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
 	if (ret)
 		return ret;
 
-	return conf->feature->get(vcpu, conf, value);
+	return conf->feature->get(vcpu, conf, false, value);
 }
 
 static int kvm_sbi_ext_fwft_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
@@ -327,6 +356,7 @@ static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
 		else
 			conf->supported = true;
 
+		conf->enabled = conf->supported;
 		conf->feature = feature;
 	}
 
@@ -354,6 +384,142 @@ static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
 	}
 }
 
+static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
+{
+	unsigned long max_reg_count = sizeof(struct kvm_riscv_sbi_fwft) / sizeof(unsigned long);
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	unsigned long reg, ret = 0;
+
+	for (reg = 0; reg < max_reg_count; reg++) {
+		feature = kvm_sbi_fwft_regnum_to_feature(reg);
+		if (!feature)
+			continue;
+
+		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
+		if (!conf || !conf->supported)
+			continue;
+
+		ret++;
+	}
+
+	return ret;
+}
+
+static int kvm_sbi_ext_fwft_get_reg_id(struct kvm_vcpu *vcpu, int index, u64 *reg_id)
+{
+	int reg, max_reg_count = sizeof(struct kvm_riscv_sbi_fwft) / sizeof(unsigned long);
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	int idx = 0;
+
+	for (reg = 0; reg < max_reg_count; reg++) {
+		feature = kvm_sbi_fwft_regnum_to_feature(reg);
+		if (!feature)
+			continue;
+
+		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
+		if (!conf || !conf->supported)
+			continue;
+
+		if (index == idx) {
+			*reg_id = KVM_REG_RISCV |
+				  (IS_ENABLED(CONFIG_32BIT) ?
+				   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64) |
+				  KVM_REG_RISCV_SBI_STATE |
+				  KVM_REG_RISCV_SBI_FWFT | reg;
+			return 0;
+		}
+
+		idx++;
+	}
+
+	return -ENOENT;
+}
+
+static int kvm_sbi_ext_fwft_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				    unsigned long reg_size, void *reg_val)
+{
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	unsigned long *value;
+	int ret = 0;
+
+	if (reg_size != sizeof(unsigned long))
+		return -EINVAL;
+	value = reg_val;
+
+	feature = kvm_sbi_fwft_regnum_to_feature(reg_num);
+	if (!feature)
+		return -ENOENT;
+
+	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
+	if (!conf || !conf->supported)
+		return -ENOENT;
+
+	switch (reg_num - feature->first_reg_num) {
+	case 0:
+		*value = conf->enabled;
+		break;
+	case 1:
+		*value = conf->flags;
+		break;
+	case 2:
+		ret = conf->feature->get(vcpu, conf, true, value);
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	return sbi_err_map_linux_errno(ret);
+}
+
+static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				    unsigned long reg_size, const void *reg_val)
+{
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	unsigned long value;
+	int ret = 0;
+
+	if (reg_size != sizeof(unsigned long))
+		return -EINVAL;
+	value = *(const unsigned long *)reg_val;
+
+	feature = kvm_sbi_fwft_regnum_to_feature(reg_num);
+	if (!feature)
+		return -ENOENT;
+
+	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
+	if (!conf || !conf->supported)
+		return -ENOENT;
+
+	switch (reg_num - feature->first_reg_num) {
+	case 0:
+		switch (value) {
+		case 0:
+			conf->enabled = false;
+			break;
+		case 1:
+			conf->enabled = true;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case 1:
+		conf->flags = value & SBI_FWFT_SET_FLAG_LOCK;
+		break;
+	case 2:
+		ret = conf->feature->set(vcpu, conf, true, value);
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	return sbi_err_map_linux_errno(ret);
+}
+
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
 	.extid_start = SBI_EXT_FWFT,
 	.extid_end = SBI_EXT_FWFT,
@@ -361,4 +527,9 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
 	.init = kvm_sbi_ext_fwft_init,
 	.deinit = kvm_sbi_ext_fwft_deinit,
 	.reset = kvm_sbi_ext_fwft_reset,
+	.state_reg_subtype = KVM_REG_RISCV_SBI_FWFT,
+	.get_state_reg_count = kvm_sbi_ext_fwft_get_reg_count,
+	.get_state_reg_id = kvm_sbi_ext_fwft_get_reg_id,
+	.get_state_reg = kvm_sbi_ext_fwft_get_reg,
+	.set_state_reg = kvm_sbi_ext_fwft_set_reg,
 };
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C95ACD8C93
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiybZM501A9Si4qWpn6MC96m2bG0/iAJu8haAXJoG2g=; b=GxniNP6IuoSOVh
	ZE+y3/B3sc4tl4gC0UbnsZJ0HrMpihQwwMUI90IJqZIfa2yI6pwWt/0EB0lN6KbiT7+jIIJ+MAOj5
	v4QhoVLghjoxVEDtZN1TUgle8hLD0pmQeEkXMNHoY+0qCNB9ftEeq2n5txJbyRp5eCa8kcGbpIvTp
	mKOpmyS2rt5gxEfWweia1jcIyr/3MhKkPZOjb9CRrt5qnE6/+M3LGrUgQHTAvd2O1cOYuyimunhcD
	aQ/4SsJG4D1Iet9dRwRoKmHcNAScNoiCaKMQMsJYCFTSsgQmuIMf750neX7TJ3wmwuDi3+KB8M2d6
	6bqD4EcNeGRQutWCvacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bY-000000027Tg-3aMz;
	Sun, 07 Jun 2026 08:11:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bW-000000027Pw-3arP
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:11:35 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so1720699b3a.1
        for <kvm-riscv@lists.infradead.org>; Sun, 07 Jun 2026 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819894; x=1781424694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnAk1DyBQ24p90WHdW3yMyzw8YDZPAAEuxnsHVkQ7lk=;
        b=I0eFKWUOxi1ulGUd4qHryAJ73Cc9sI+j48LWXDqRmP1vDEegpfex6r9JQaLUwAkThz
         6HAllPfOfzV6JEplmY9lWxPNKhKeBsGwF9wTxQJoYwF12AZt7WXmyJi7pBXZkHoLIcv0
         9TGLdW4cR44eGzogDmQGeFogEOLqMV88bPAwkh+x0WDSY1wzfYyg9mgESJGtm6UXPZNV
         Dk8wGTwPs0lVsJU66eql8H7uyFDMxuSa89PXKhLwKnxSSQtS70Ev0+iKV2roD9PywbZp
         TyuTiGqmP/CFkrjn5hbsipOCE8yoYv3Qx1+YGfjaA9QRZpi8Dyx1PGvTZQtMSfw2yT53
         Sx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819894; x=1781424694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qnAk1DyBQ24p90WHdW3yMyzw8YDZPAAEuxnsHVkQ7lk=;
        b=YXzXXfBadHm2WCdkg1/5DkBl5m+/9KY3Jvr2OzgSJJHsdF0Z2eP40ifaDkBHgmg/DL
         WNVwHxMuu4Vph+TSqh6e7bsMbTiD7K8aumaAkivwUgKvOVvC04HAM+Cey/FlkS63WNam
         GTOl0qFFFRhWcLeCnTzAWGHkU7JcM3V9BH8ya/p2ojZLNUQfFIRuk5L5u5T6M5aybVYr
         R9OW6/YDCRRt1ASnuOAQaGFU13Cp8bYA2hX2aGJpAi/8bJNHXkxYnCvDhB41iGb9Mx3a
         EBczneIFKidpxLCCqd7qqLrQEsACFii3vFbpKSDUnFeIYz/IMpCLzU4esLlYTz6scaXB
         4c8A==
X-Forwarded-Encrypted: i=1; AFNElJ+al5dqeLBnepi8plScgO2Szp8slOiNYgdyKUAHiV3az6lLRMcTl/ZAh630ZdxSEfg+c1R6P1M/MiU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyM8chAU7x3W9hmLENhwtAVRqeuIbCCGULhJg/8DW442A4DvDkB
	nqkTwRs0bkSy45fvTAGrgMCUpDOalLM7xutkNQvbCAO50CaUtjVWK0qz
X-Gm-Gg: Acq92OGkxLhzATKT8VjH2BEorAyzuY2Eyzd2IQKXWBgXC0fLd+sQUJNAk0JRG2yOoqU
	JCDnKHf0DdzBrGTd+t5+VfF60Aj/1ha5YMZVBGIXBAqgjc5Xrj05Iy6Z0rnwles1ilP7KH22dZv
	gptNvhrTk3QSciJnMF6tkMc87tHdeFrCfbfcdw5WAff70x93evHZuBnSfxHNLSC8xPOXdgSBk7C
	zbiT6WoDPLgSUK/FxiRkPdNRpHfR63tPgSBs1E7WrinCIvBN7wuY7P7k8XfE6uyB54sMRrnro/+
	Aw7/U9NoHai+qak3g3b+rEXtXQ9CqXmIaJleRdriD4twJFiqNIq722MvGOfHEvCIsLsBhnWBYXI
	oYjCVLFnZ1I6DzLMIPjwdfI9pU1ZxCvbnh5rWnhnCi6n216PLPDU5nE27vUmypRinAQlC0Zu8ZJ
	fYzhuiNJGhcoqYvUwtqOtCdgV1txIawyqrl1HTSynxyXyn
X-Received: by 2002:a05:6a00:420a:b0:842:5f67:eada with SMTP id d2e1a72fcca58-842b666f9c0mr7966468b3a.5.1780819893831;
        Sun, 07 Jun 2026 01:11:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm15725254b3a.30.2026.06.07.01.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:33 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 7/8] RISC-V: KVM: Add support for control-flow integrity FWFT features
Date: Sun,  7 Jun 2026 16:11:03 +0800
Message-ID: <20260607081105.993908-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_011134_904342_E2D0A1A2 
X-CRM114-Status: GOOD (  16.27  )
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

Control-flow integrity is controlled through a WARL field in henvcfg.
Expose the feature only if the Zicfilp/Zicfiss is supported for VS-mode.
Allow the VMM to block access to the feature by disabling the ISA
extension in the guest.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h |   2 +
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 107 ++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index fd4c81697617..20d9959ca44f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -248,6 +248,8 @@ struct kvm_riscv_sbi_fwft {
 	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
 	struct kvm_riscv_sbi_fwft_feature pointer_masking;
 	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
+	struct kvm_riscv_sbi_fwft_feature landing_pad;
+	struct kvm_riscv_sbi_fwft_feature shadow_stack;
 };
 
 /* If you need to interpret the index values, here is the key: */
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 7192c229a19e..cb9b9721ec88 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -176,6 +176,95 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static long kvm_sbi_fwft_set_cfi(struct kvm_vcpu *vcpu,
+				 struct kvm_sbi_fwft_config *conf,
+				 bool one_reg_access, unsigned long value,
+				 u64 flag)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	if (value == 0)
+		cfg->henvcfg &= ~flag;
+	else if (value == 1)
+		cfg->henvcfg |= flag;
+	else
+		return SBI_ERR_INVALID_PARAM;
+
+	if (cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
+		cfg->hedeleg |= EXC_SOFTWARE_CHECK;
+	else
+		cfg->hedeleg &= ~EXC_SOFTWARE_CHECK;
+
+	if (!one_reg_access) {
+		csr_write(CSR_HEDELEG, cfg->hedeleg);
+		/*
+		 * Both Bit LPE and SSE are in the lower part, so it is safe
+		 * to only write the henvcfg
+		 */
+		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+	}
+
+	return SBI_SUCCESS;
+}
+
+static bool kvm_sbi_fwft_landing_pad_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, ZICFILP);
+}
+
+static void kvm_sbi_fwft_reset_landing_pad(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_LPE);
+	if ((cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE)) == 0)
+		cfg->hedeleg &= ~EXC_SOFTWARE_CHECK;
+}
+
+static long kvm_sbi_fwft_set_landing_pad(struct kvm_vcpu *vcpu,
+					 struct kvm_sbi_fwft_config *conf,
+					 bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_set_cfi(vcpu, conf, one_reg_access, value, ENVCFG_LPE);
+}
+
+static long kvm_sbi_fwft_get_landing_pad(struct kvm_vcpu *vcpu,
+					 struct kvm_sbi_fwft_config *conf,
+					 bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_LPE);
+}
+
+static bool kvm_sbi_fwft_shadow_stack_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, ZICFISS);
+}
+
+static void kvm_sbi_fwft_reset_shadow_stack(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_SSE);
+	if ((cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE)) == 0)
+		cfg->hedeleg &= ~EXC_SOFTWARE_CHECK;
+}
+
+static long kvm_sbi_fwft_set_shadow_stack(struct kvm_vcpu *vcpu,
+					  struct kvm_sbi_fwft_config *conf,
+					  bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_set_cfi(vcpu, conf, one_reg_access, value, ENVCFG_SSE);
+}
+
+static long kvm_sbi_fwft_get_shadow_stack(struct kvm_vcpu *vcpu,
+					  struct kvm_sbi_fwft_config *conf,
+					  bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_SSE);
+}
+
 static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
 {
 	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
@@ -312,6 +401,24 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
 	},
+	{
+		.id = SBI_FWFT_LANDING_PAD,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, landing_pad.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_landing_pad_supported,
+		.reset = kvm_sbi_fwft_reset_landing_pad,
+		.set = kvm_sbi_fwft_set_landing_pad,
+		.get = kvm_sbi_fwft_get_landing_pad,
+	},
+	{
+		.id = SBI_FWFT_SHADOW_STACK,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, shadow_stack.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_shadow_stack_supported,
+		.reset = kvm_sbi_fwft_reset_shadow_stack,
+		.set = kvm_sbi_fwft_set_shadow_stack,
+		.get = kvm_sbi_fwft_get_shadow_stack,
+	},
 	{
 		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
 		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

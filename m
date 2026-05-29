Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C523ACD6E4C
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 May 2026 06:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1liRpHaT/YLXxGwOK4Dm/JhZrPsPjJL3kY87fZqePo=; b=11zHHAVLW0OrX3
	mpF+VZ0dD5Zq71YN+WpaVPhso8+xmtOQ+v0Lu7p96tyXFXW587gkWd0CWsZx/1OhnXBuaN8xWgXfM
	Qn9I1vdD9ba0TKDa7/VHVpozSKKYZ7zYnT02qJhwl7cSsjWtd2TdI0t+kl+QHkf25KjqFxTu4bRtd
	pbR9BF4jmlCm3iQQzQAcgUIVr6BAZQKguB3EqVy1jb0cHQYYDIB1jbI1P6p8IgSBamouOskJ+pfy+
	Jv8hpV5Gl3eIeCO6gIx41y/cuxe4d42q0YNlAzHpDqhzfW5OHz8XzA/b1etmKIttQFQK+m3DoH6zT
	ttZZC3HdlQV6FOByMLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqiB-00000006oEr-2ISU;
	Fri, 29 May 2026 06:28:51 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqi7-00000006oBA-2YjK
	for kvm-riscv@lists.infradead.org;
	Fri, 29 May 2026 06:28:48 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3045c195251so7484107eec.1
        for <kvm-riscv@lists.infradead.org>; Thu, 28 May 2026 23:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780036127; x=1780640927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxMETX/1hxmLpjZh8E8SUrLwKpabU2lfgKz/6O/A+s8=;
        b=SM0OzeVLvZc1bkZndHK3aaPlZwE+1Z9BQwHFhc2IBXl/AiYvxjSSa9MV1ukBk0AnID
         lvekRtoxtoyvFPWR8tiOsm+o4gZD8sxYhnwqL8X1QUbiwTnApeaaxQAcDUMMfGRQEdfa
         kremmQRW8ZK+8g7Wh5KJR4sU2UgSMn+eOaOxx15V9v0Vy6YHpYPGN4IhhawBQ4mhZMQ1
         krbSPpsHWHQBVmMrQbiDG+hANbpu0uLJxA4IzzDYPPlenFDIrioqd5NpjhQ4HasQKC+P
         HGK8xN/OECwlnjSXUJydGhOR0emcbSy6YXx73zktakdeTVgKwMUkNX5cf2VbCEuAF0Jt
         Ozlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036127; x=1780640927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gxMETX/1hxmLpjZh8E8SUrLwKpabU2lfgKz/6O/A+s8=;
        b=PDilhTZ9mUAjbc6zesywfZxXVG/qvb+ZFZ3ScjaVJUM4Q8HzEIvYGVakf7Sxkb2Ze4
         Zp1wn4qRAF/2ZoWTG226RYTUwkrnWrKEZsj6Z02Auq0+EwNx9KD+WxGClR4ucc342gUZ
         1dN/OBVm9/hj7U3yV6LfHlFtKwZUewUj5evvxoEqs+yj8KSsn+a0rkC/JGzvO74Rxya2
         KWzFLHDNJol8FmC2820DPAoD4kVA+VgyLknnhfQnOPBMDDH/4DfEpwbw5E2fV+pRwWsP
         G3V9lWUqtFcLUzAjrhUG4MFDM5Q+6C60AK9OH2TCeDEbyAJtapnYKjf2PKZWnGz3mV4h
         W1aw==
X-Forwarded-Encrypted: i=1; AFNElJ+xuKJhK7Rpo0TkR+MlKts53rQWcJlUD6NB9SLicijJVvBWzFdsIxby793Z7zDA0qBhqC/Im9e6+ME=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0R3jR3z+eBdZpPWpvRspz56pn1+Yin+aVWDLqhsUu1PAy7KKx
	CvhOQyTNfN8skp8Y3LfJF7/BAQSP6P1EGRIRouguIRpYE/jsK6nmzADChPBt5ZbvQgo=
X-Gm-Gg: Acq92OHaKD5kbTHquYV+io6/SyGHAdfLERM8dBFN+xnCXcd3sUPS7A4a0oqhPQpCYF4
	1vrExgi0oNzbi9+tBpP1pgujDtNLLoAVP2f16UgTjGSu6BJzqRuOgEluMMEqb7c5bRi4PsdgCTW
	VZKTrbORbB2YUxPyH1DcOu0yHGdR2ZCbCbCVk90FCOFe8+bHcXFxQZSR0txB6Wwcg6pWzXz8pHn
	l74CVbz3PCQwjxZdsCjY57Uuce58uTaIoZC9/5DncPe7CqazI3Wd9XmHO9w6dh++JV8PMB9u5g0
	m8/5vWlaeuD2t756R8k2bY2NTeX09jEifM/J2R87hif+NZsb6T8qXSrBDTGvcaR+vH2mqEz6Zz2
	ewDrQkVruKbE2ne7F7dIKVPpnYGwaHUrsDVqAI1HxbKJLGuwwF7uXWd5h6K/U+7iz5S34kBLVLC
	CU/8IDxbcsw2z9hCY+xqr82AqFrqiV4RsjFcwTK743xlvDA2ErdSOVTQ==
X-Received: by 2002:a05:7300:2154:b0:304:b93a:511a with SMTP id 5a478bee46e88-304eb204f20mr625767eec.28.1780036126724;
        Thu, 28 May 2026 23:28:46 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed3358b1sm694607eec.13.2026.05.28.23.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:28:46 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 28 May 2026 23:28:29 -0700
Subject: [PATCH v3 3/3] KVM: riscv: selftests: Split SBI FWFT into separate
 feature-specific sublists
MIME-Version: 1.0
Message-Id: <20260528-kvm-get_reg_list-v2-v3-3-170969a8599f@sifive.com>
References: <20260528-kvm-get_reg_list-v2-v3-0-170969a8599f@sifive.com>
In-Reply-To: <20260528-kvm-get_reg_list-v2-v3-0-170969a8599f@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780036122; l=7950;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=3uThBhNaY+zRvOn064pZTF8raJgmTDzDgSiNvxgnqt0=;
 b=UJt9lgaaEV/6X0Wm2ZL+TKZkFJtdMJtIVecgcG006PE6wBq8pql2yEe41adYrKAvTbyBu6A4f
 Cqk7TgKtm+kAvoqekaex5imWd74p16LOhGAiiZ36mjnuiU3bTwdENQ9
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_232847_672196_7856A949 
X-CRM114-Status: GOOD (  17.77  )
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

Divide the monolithic SBI FWFT (Firmware Features) register list into
separate sublists, each testing a specific FWFT feature independently
with proper dependency checking.

Previously, all FWFT features were tested together in a single sublist.
This caused issues because:
1. Not all FWFT features are available on all platforms
2. Some features depend on specific ISA extensions (e.g., pointer_masking
requires Smnpm)
3. Tests would fail if any single feature was unavailable

Add the feature-specific SBI FWFT sublists with the following
improvements:
- Add check_supported_reg() function to validate register availability
  based on required ISA extensions and SBI extensions
- Add check_fwft_feature() helper to verify FWFT feature availability
  at runtime
- Update filter_reg() to handle per-feature FWFT register filtering

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 90 ++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 5033c09201ef..7ae55fbad29a 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -27,6 +27,23 @@ enum {
 };
 
 static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
+static bool isa_ext_enabled[KVM_RISCV_ISA_EXT_MAX];
+static bool sbi_ext_enabled[KVM_RISCV_SBI_EXT_MAX];
+
+bool check_supported_reg(struct kvm_vcpu *vcpu, __u64 reg)
+{
+	switch (reg & ~REG_MASK) {
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value):
+		return sbi_ext_enabled[KVM_RISCV_SBI_EXT_FWFT] &&
+		       isa_ext_enabled[KVM_RISCV_ISA_EXT_SMNPM];
+	default:
+		break;
+	}
+
+	return true;
+}
 
 bool filter_reg(__u64 reg)
 {
@@ -149,6 +166,14 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
 		return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA];
+	/*
+	 * FWFT misaligned delegation registers are always visible when the SBI FWFT
+	 * extension is enable and the host supports the misaligned delegation.
+	 */
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.enable):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.flags):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.value):
+		return sbi_ext_enabled[KVM_RISCV_SBI_EXT_FWFT];
 	default:
 		break;
 	}
@@ -193,15 +218,39 @@ static int override_vector_reg_size(struct kvm_vcpu *vcpu, struct vcpu_reg_subli
 	return 0;
 }
 
+void check_fwft_feature(struct kvm_vcpu *vcpu, struct vcpu_reg_sublist *s, u64 feature)
+{
+	unsigned long value;
+	int rc;
+
+	/* Enable SBI FWFT extension so that we can check the supported register */
+	rc = __vcpu_set_reg(vcpu, feature, 1);
+	if (rc)
+		return;
+
+	for (int i = 0; i < s->regs_n; i++) {
+		if ((s->regs[i] & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_SBI_STATE) {
+			rc = __vcpu_get_reg(vcpu, s->regs[i], &value);
+			__TEST_REQUIRE(!rc, "%s not available, skipping tests", s->name);
+		}
+	}
+
+	/* We should assert if disabling failed here while enabling succeeded before */
+	vcpu_set_reg(vcpu, feature, 0);
+}
+
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
-	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
+	unsigned long isa_ext_state;
 	struct vcpu_reg_sublist *s;
 	u64 feature;
 	int rc;
 
-	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
-		__vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(i), &isa_ext_state[i]);
+	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
+		rc = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(i), &isa_ext_state);
+		if (!rc)
+			isa_ext_enabled[i] = !!isa_ext_state;
+	}
 
 	/*
 	 * Disable all extensions which were enabled by default
@@ -209,8 +258,10 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 	 */
 	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
 		rc = __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
-		if (rc && isa_ext_state[i])
+		if (rc && isa_ext_enabled[i])
 			isa_ext_cant_disable[i] = true;
+		else
+			isa_ext_enabled[i] = false;
 	}
 
 	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
@@ -232,9 +283,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 		switch (s->feature_type) {
 		case VCPU_FEATURE_ISA_EXT:
 			feature = RISCV_ISA_EXT_REG(s->feature);
+			isa_ext_enabled[s->feature] = true;
 			break;
 		case VCPU_FEATURE_SBI_EXT:
 			feature = RISCV_SBI_EXT_REG(s->feature);
+			if (s->feature == KVM_RISCV_SBI_EXT_FWFT)
+				check_fwft_feature(vcpu, s, feature);
+			sbi_ext_enabled[s->feature] = true;
 			break;
 		default:
 			TEST_FAIL("Unknown feature type");
@@ -897,11 +952,15 @@ static __u64 sbi_sta_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_hi),
 };
 
-static __u64 sbi_fwft_regs[] = {
+static __u64 sbi_fwft_misaligned_deleg_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.value),
+};
+
+static __u64 sbi_fwft_pointer_masking_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
@@ -1129,7 +1188,6 @@ KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
 KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
 KVM_SBI_EXT_SIMPLE_CONFIG(mpxy, MPXY);
-KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
 
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, SSAIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, F);
@@ -1206,6 +1264,23 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zvksed, ZVKSED);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvksh, ZVKSH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvkt, ZVKT);
 
+static struct vcpu_reg_list config_sbi_fwft_misaligned_deleg = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_SBI(fwft_misaligned_deleg, FWFT),
+		{0},
+	},
+};
+
+static struct vcpu_reg_list config_sbi_fwft_pointer_masking = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(smnpm, SMNPM),
+		SUBLIST_SBI(fwft_pointer_masking, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1213,7 +1288,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_dbcn,
 	&config_sbi_susp,
 	&config_sbi_mpxy,
-	&config_sbi_fwft,
+	&config_sbi_fwft_misaligned_deleg,
+	&config_sbi_fwft_pointer_masking,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,

-- 
2.43.7


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

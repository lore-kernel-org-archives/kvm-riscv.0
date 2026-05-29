Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82998CD6E45
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 May 2026 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CobX5BNIaDboNzsr7xmxUMzfeRYFEGHMJ+W39lA9OLc=; b=DKf76AZH+ugc6G
	CEMalqQuy/MulXvn6o92bp0pHMTyCOhFFRTK4ErGFCGlha4X6t98A1iFb05i+TooG59W5dP0+4CVm
	A57WQ3nx+u8aPushxSEWu0LHNphdsz4g+mAiPa3IB+SPLLLrFUOukYt9FLBZ9GpY3xBswABsN12Gx
	/FNplytx3AEbUkZ1I8bnecnEzeu2UM9P7+cyZHp2F8lTXIZGFkfz/ROe9CnGIgeUzlk6MGmdKyFNd
	QjsvR7Y8vqqwn7se/CMUKoqIbyIcSgbnfU41K02sUG7ndmftFN8hxNZVUHPlDHX1F3hiMcn2XEn+T
	tSXwSDVOlDx+wJz9l6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqi8-00000006oCB-0nGQ;
	Fri, 29 May 2026 06:28:48 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqi5-00000006o9X-08CT
	for kvm-riscv@lists.infradead.org;
	Fri, 29 May 2026 06:28:46 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-304f0039c02so137636eec.1
        for <kvm-riscv@lists.infradead.org>; Thu, 28 May 2026 23:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780036124; x=1780640924; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NB+TMW9/jFeVQq09mC6JlH7aNglQQ/HmhdkvMfkdL10=;
        b=Uzi+/xq5BL+2jLQybLJSfbS/5rZOk3wnP41M0Ud3w0qJFSrwx1xKZB6aRpxORf4uXn
         r5Hcd8bkBtd30Gs7TOM1Ma7nrK21m3BviFlCPGHZ30B2gg6SLPyEwmoPOVwfyVWnMaPB
         gAZp42vpfqRk7/+p07B+U6hsG1Mq0zh7H+Gtjb9kMgD2yIzouczbhdnhdVpAcs9BBquT
         81oG5lQyEVp0lH4MHX9fLSv9BYk3L8iatkB1TD9axaM1lvDK1Bw2KKMjVCZI/LyXrDau
         9Rj8eIAznV1kp01eDInuMtD4Qr8FsBPv4v5JzX32jTyT/2PHajU+7mpsnfNSaBuINTa4
         ylHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036124; x=1780640924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NB+TMW9/jFeVQq09mC6JlH7aNglQQ/HmhdkvMfkdL10=;
        b=n0QelIH4toPZSj7Q4sI6oNnMLWQBc0CM9Pa2BSKqrNK28Q90Dboby9lphisnJACocE
         0rUUDl0DpRMQAAHFcrdha8U6pP+HfWf7WdopDUkwlwaRsCc4ea0VY6Bnf7VUEKIJqbae
         b3K7MVOMWc7cuSHNJ2A8Azvz5ScygVakFCwnU4++ptuF2TUZOml1o+DS0m3aENiWaAUv
         OHGsBi93KZ2hw2a0YaE+C4KYz3GMuLqMNCYJopBMU/BHuWPXL5L/t1i+ns8f4wiCocxb
         LxnzuOEMkUZOfsZoH5y7MbsBWR2961BqxdYoltt9gPKMyjxbYQtL65mrW0jkc317W5OF
         cdfw==
X-Forwarded-Encrypted: i=1; AFNElJ/rirQq+mJIJpbAEKVyk809OyuI7dKxy0ICv8YQ85mwvXYHDGZFwMXMlyvAhIobfCvwiKWoK8zVxQI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEaBFQhlQ34KEesqjEXAceExYg7p8JwdBVnVPNFEg6L/vXvVFq
	Mutiqsugb7psPO2Isj/EJUFDhlnsWmw1vYNcu/3M5a053Ds6HY8WdgVf3oo948m/VAI=
X-Gm-Gg: Acq92OHJBP5JV0D3pSOh8/KLaQ1xOV/X/GfruPonPLXnSJMAK/VMSBP8m0QQFslqAuS
	unk+p70jCBZAovk6fVSaOc8dpLubuGnHw4Osz3qJqF8BAffkKvD+UAUrig7Bx491KEJdeww4k88
	2eKOtg9sKQS3Zf0rc19VxzOVwyCvToZ8y96jVLLbv3cdDbBX8D2cnSaSw6BWtdmEz/F1QUcl6Pi
	VA0q8ihQPv33JEiIeNrSCpQfFa5YEAtVqRqQuuU4Ab1x4ykjsoFcHBIVwhHAnD1X4eooemn9bfm
	AAni6GVdUrEO08of/9IjZZpBt1kO06qHv1dAxO3B51LcRJnKiB/F05LcnFudkSlAIHDpd+vmeWE
	TEi3DWsQyXJD/LchxnOx2fe3OVgulWUh//x8P6uhujal+zH07jP0N8wj1Vb9YY+2QJSB8Ksz3EP
	YRIWAY+FdC6f0s2uIvUV5YUx2ZxtwnPcJ0aVfMSfNUUTWEtUgPaviHww==
X-Received: by 2002:a05:7301:3e18:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-304eb1fbfeemr788995eec.17.1780036124198;
        Thu, 28 May 2026 23:28:44 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed3358b1sm694607eec.13.2026.05.28.23.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:28:43 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 28 May 2026 23:28:27 -0700
Subject: [PATCH v3 1/3] KVM: RISC-V: SBI FWFT: Fix stale feature exposure
 after runtime extension changes
MIME-Version: 1.0
Message-Id: <20260528-kvm-get_reg_list-v2-v3-1-170969a8599f@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780036122; l=5665;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=gufrfTZMS1eYNpCVXosGyGtRLMto/FMoEgCvhEzoK+g=;
 b=WWBCwq4jwkp6SRoxOcz1Jqdq+qxsnLAk5+EHEMyZpoZoggSowU9LIrRhG1Qp2dAA/kMgX6pIr
 cPdeKvX0qchBNiYTAP5ttS8UXUQdcjMuvfybLhSsR98eOz9wk6ya0ST
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_232845_098411_9A213783 
X-CRM114-Status: GOOD (  16.33  )
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

Fix a bug where FWFT features could be incorrectly exposed to guests
after userspace disables their dependent ISA extensions at runtime.

The 'supported' field in kvm_sbi_fwft_config was set once during vCPU
initialization based on the initial hardware/extension availability.
However, when userspace subsequently disables ISA extensions via the KVM
ONE_REG interface, the 'supported' field was not updated. This caused
the following issues:
1. FWFT features would remain visible and accessible to guests even
   after their prerequisite ISA extensions were disabled
2. Guests could configure FWFT features that depend on disabled
   extensions, leading to undefined behavior
3. The static 'supported' flag and the dynamic supported() callback
   could disagree about feature availability

The fix introduces a two-layer checking mechanism:
1. Add an optional init() callback to the kvm_sbi_fwft_feature structure
   for features that require hardware probing during initialization. This
   separates the one-time hardware detection logic from the runtime
   availability check.
2. Add runtime checks in all FWFT-related functions that call
   feature->supported(vcpu) if the callback exists. This ensures feature
   availability is re-evaluated based on the current ISA extension state.

This approach maintains the cached 'supported' field for initialization-
time decisions while ensuring runtime availability is always determined
by the current vCPU configuration, not initialization-time snapshots.

Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 2eab15339694..dde6e39aab5e 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -35,6 +35,16 @@ struct kvm_sbi_fwft_feature {
 	 */
 	bool (*supported)(struct kvm_vcpu *vcpu);
 
+	/**
+	 * @init: Probe and initialize the feature on the vcpu
+	 *
+	 * This callback is optional. If provided, it will be called during
+	 * vcpu initialization to probe the feature availability and perform
+	 * any necessary initialization. Returns true if the feature is supported
+	 * and initialized successfully, false otherwise.
+	 */
+	bool (*init)(struct kvm_vcpu *vcpu);
+
 	/**
 	 * @reset: Reset the feature value irrespective whether feature is supported or not
 	 *
@@ -137,10 +147,12 @@ static bool try_to_set_pmm(unsigned long value)
 
 static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu *vcpu)
 {
-	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	return riscv_isa_extension_available(vcpu->arch.isa, SMNPM);
+}
 
-	if (!riscv_isa_extension_available(vcpu->arch.isa, SMNPM))
-		return false;
+static bool kvm_sbi_fwft_pointer_masking_pmlen_init(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
 
 	fwft->have_vs_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
 	fwft->have_vs_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
@@ -231,6 +243,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pointer_masking.enable) /
 				 sizeof(unsigned long),
 		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
+		.init = kvm_sbi_fwft_pointer_masking_pmlen_init,
 		.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
 		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
 		.get = kvm_sbi_fwft_get_pointer_masking_pmlen,
@@ -281,6 +294,8 @@ static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
 
 	if (!tconf->supported || !tconf->enabled)
 		return SBI_ERR_NOT_SUPPORTED;
+	else if (tconf->feature->supported && !tconf->feature->supported(vcpu))
+		return SBI_ERR_NOT_SUPPORTED;
 
 	*conf = tconf;
 
@@ -365,6 +380,9 @@ static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
 		else
 			conf->supported = true;
 
+		if (conf->supported && feature->init)
+			conf->supported = feature->init(vcpu);
+
 		conf->enabled = conf->supported;
 		conf->feature = feature;
 	}
@@ -408,6 +426,8 @@ static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 		if (!conf || !conf->supported)
 			continue;
+		else if (conf->feature->supported && !conf->feature->supported(vcpu))
+			continue;
 
 		ret++;
 	}
@@ -430,6 +450,8 @@ static int kvm_sbi_ext_fwft_get_reg_id(struct kvm_vcpu *vcpu, int index, u64 *re
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 		if (!conf || !conf->supported)
 			continue;
+		else if (conf->feature->supported && !conf->feature->supported(vcpu))
+			continue;
 
 		if (index == idx) {
 			*reg_id = KVM_REG_RISCV |
@@ -465,6 +487,8 @@ static int kvm_sbi_ext_fwft_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 	if (!conf || !conf->supported)
 		return -ENOENT;
+	else if (conf->feature->supported && !conf->feature->supported(vcpu))
+		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
 	case 0:
@@ -502,6 +526,8 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 	if (!conf || !conf->supported)
 		return -ENOENT;
+	else if (conf->feature->supported && !conf->feature->supported(vcpu))
+		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
 	case 0:

-- 
2.43.7


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

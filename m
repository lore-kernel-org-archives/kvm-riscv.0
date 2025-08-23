Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4224CCA0FE1
	for <kvm-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrJFkCwaSAkwLdUeD+6V09Ig7JYhH777nt+1m1EeGRU=; b=KQyp2tKoMa9c8w
	hFTbpLKlfexoGlF0394MGnn4CGIHJNtRAgRuaipGG10lHCb6ybMWDbVJn7r0912VKyuN1lqlmUiDx
	W0EH5Gw+5FHcD23Bnscwwuanrwg7FfUTKf2oQaWHLnF9xve7oNucOZ42AGg3Qp1jhSAhQMB+hZIAI
	zR7DQHsaH2oyr796ZzP7g447l5cZMzPWKjbDmWXFrB0D/TxpckPSpzp3gDz+2b5oEGhZUD1CNdbYo
	eYd9YM566c8LlLpLW9ZO6GCJo5WvdzdHJ3ZVTyEx9bi4G/UE0ODUPKCor04KKrk9BuY6Nfu233GR5
	/UoTIqa0ak1rNVJmRsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprFc-000000052wV-3s72;
	Sat, 23 Aug 2025 16:37:56 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqf7-00000004xSK-2Wfk
	for kvm-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 16:00:15 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2e60433eso2240412b3a.0
        for <kvm-riscv@lists.infradead.org>; Sat, 23 Aug 2025 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755964813; x=1756569613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Chrrw+dyIJSlBaNuFfzfLJBXunJM56lFjN13/1zM0cU=;
        b=U/rrESb/lccyxSAqNXrUKruf4cytxEHQXn6MRIzfQOB7R8h7UKk3+OTAy+C4bFC70O
         bd+acd3Fwg99ZwJsYDUUpE8uwh+BB6WEikJKRAWSwGj2hJy40jEWbNuS9cP3r4zm0PVo
         6NymjhJTKgK02Kx5OwftX7HZNcrNyZZAWyxrgixBhjaVb/uMt/UeA8prKDxtLdwIm2r0
         U6KpUOtng+UXtbCuZa0RaL3lfURJSwzlZYLKKqo0wZkSyWwkG0UZWTNbcFdHRiH14o9K
         T0To93OwAxhPtKpi12ujG1KpgiIVocsZWuF0rfObCt3IhkH+3fs0pMSPpS1nlHmcmNFu
         fpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964813; x=1756569613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Chrrw+dyIJSlBaNuFfzfLJBXunJM56lFjN13/1zM0cU=;
        b=gVM/LIzQzI+U5hQl1wT9Ynm56VYj8FmLTp8hOH5M0D51gRq3mO9/wfOTv7koof+8Tv
         VanVPXQJ1WAkhh6Tnwy6llA7XOOuR3zBSK7cc1TCmQ+BmseksdB86QTghIjjw8MYziE5
         eo3blily75yZL4vheaAGrEfucPk28+1lsJUPnmBq/J3RzEa+0OgD+u4dIShySOb6Fyhh
         +OOLLktb4LUsl2g904Dvelam1wJ6+cd5Fq77s3LFdwhoQNHunF4qijx+wh4SFFV3L+wR
         LRYlf/FMVtq1jXe3Nsyw2RnPuMvL1wNNbALFN1Rzd1bpXSUoWaJ2Mi6Hrv8BJ5fC/uw4
         +aYA==
X-Forwarded-Encrypted: i=1; AJvYcCVAH0wCqhqGFjI9CH8amDnil8TNVufx+UcQypf2TuqOZsBdbmCLuGgajOnGTW34dupOvCHh+dbDizE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTMaJv28CXt2bNkyhWROAn8G+VoiyWTbz6G2vCjHdxrhKJfug8
	jV8mNIKqkcEmao1hCeFUcEU3rHTvKSZXc15p0lGeZCRyFQVY/BlWzUsdH4Ev7+C7Smo=
X-Gm-Gg: ASbGncvpHltHsh5TsQHmXURLNUzc5NzMfmtFWyo9NUUr4lEZVGHHTo0vXx7XZbfKEFw
	RwZqlh4V5OaUjkkQkbITZIpCMnPhAyf7JWpocRr2FuwDEsLYabAUMNWKsa98clADcfI5iXeeJpV
	fCUHpxp1TvQ+Y9oQAjNcVWUL5BL+LX8Ck20T/XQFDWulloiW9Rq/r3iVZhVa61Ctt2JnFvD3B2E
	LxxQN3kKUTXuQ9Y/vTvR8s1QWfWWXz1Nd1M9+Nib9LN6/OOOo6u2zfFT1X2uDnvPd7uWWAiupfn
	BiyXfj4UNsQwK20AViZ5E7m6oqSfFmgY0PkBwwFXrdMjGFf29CzEwGZ+QXEJF1bYnt4U/TICxvd
	Kn0kOhnav7MZEZLWHIU6oD/GCQavxEBL9BfoIp+s3g0alZXfqqnab4srBGtXtKw==
X-Google-Smtp-Source: AGHT+IESNcTGvVN4k0EYaaXCdIDdf4qv1awjmTqd/O8lynLE/hwFMmWAV0QVQZM1K89/KGK7Pb4KXg==
X-Received: by 2002:a05:6a00:2e96:b0:76e:885a:c33c with SMTP id d2e1a72fcca58-7702fad486emr8086610b3a.26.1755964812754;
        Sat, 23 Aug 2025 09:00:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214b81sm2804464b3a.93.2025.08.23.09.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:00:12 -0700 (PDT)
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
Subject: [PATCH v3 2/6] RISC-V: KVM: Introduce feature specific reset for SBI FWFT
Date: Sat, 23 Aug 2025 21:29:43 +0530
Message-ID: <20250823155947.1354229-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250823155947.1354229-1-apatel@ventanamicro.com>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090013_643132_D1CA8B2C 
X-CRM114-Status: GOOD (  13.91  )
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

The SBI FWFT feature values must be reset upon VCPU reset so
introduce feature specific reset callback for this purpose.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 164a01288b0a..5a3bad0f9330 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -30,6 +30,13 @@ struct kvm_sbi_fwft_feature {
 	 */
 	bool (*supported)(struct kvm_vcpu *vcpu);
 
+	/**
+	 * @reset: Reset the feature value irrespective whether feature is supported or not
+	 *
+	 * This callback is mandatory
+	 */
+	void (*reset)(struct kvm_vcpu *vcpu);
+
 	/**
 	 * @set: Set the feature value
 	 *
@@ -75,6 +82,13 @@ static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
 	return misaligned_traps_can_delegate();
 }
 
+static void kvm_sbi_fwft_reset_misaligned_delegation(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	cfg->hedeleg &= ~MIS_DELEG;
+}
+
 static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
 					struct kvm_sbi_fwft_config *conf,
 					unsigned long value)
@@ -124,6 +138,11 @@ static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu *vcpu)
 	return fwft->have_vs_pmlen_7 || fwft->have_vs_pmlen_16;
 }
 
+static void kvm_sbi_fwft_reset_pointer_masking_pmlen(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.cfg.henvcfg &= ~ENVCFG_PMM;
+}
+
 static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 						   struct kvm_sbi_fwft_config *conf,
 						   unsigned long value)
@@ -180,6 +199,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
 	{
 		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
 		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
+		.reset = kvm_sbi_fwft_reset_misaligned_delegation,
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
 	},
@@ -187,6 +207,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
 	{
 		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
 		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
+		.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
 		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
 		.get = kvm_sbi_fwft_get_pointer_masking_pmlen,
 	},
@@ -321,11 +342,16 @@ static void kvm_sbi_ext_fwft_deinit(struct kvm_vcpu *vcpu)
 
 static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
 {
-	int i;
 	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	const struct kvm_sbi_fwft_feature *feature;
+	int i;
 
-	for (i = 0; i < ARRAY_SIZE(features); i++)
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
 		fwft->configs[i].flags = 0;
+		feature = &features[i];
+		if (feature->reset)
+			feature->reset(vcpu);
+	}
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

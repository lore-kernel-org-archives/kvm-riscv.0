Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D364CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrJFkCwaSAkwLdUeD+6V09Ig7JYhH777nt+1m1EeGRU=; b=Y3eeK29zy0+Tpl
	cHKgmwFTAB8DH8rt0LewOTN6PpuuDSZf+yQLrdc3VkuIRuQZsOEOnPFeAFhMRHPPrM/1l91NR2Xq1
	F2gLxhpvVl/95PHv6Nq/4lHU9lB4Hp64gTO7WcZoGq1eRFSenBuyjHBPjwXbqOr4JAz9cuy2rL4p7
	epBI7gZfBB9HwLsB5iqOpoWAbBvgR8LCSkjiiJaGs+exhHcr5OyxHPiV5vjC7k9n+P4gWfLDuLGYV
	KdLvcISZei/jTvR+bsSVXIUrSrFTxiy69YAB2VhqnljlocKVR2cs6xUXjBEAABD/iYZIMPA+5Uvu+
	yx4w5z+oAqnSiD/ksiog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncaA-00000005ez3-0GPK;
	Sun, 17 Aug 2025 12:33:54 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unca7-00000005exI-2Jzw
	for kvm-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 12:33:52 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-32326e71c31so2968218a91.3
        for <kvm-riscv@lists.infradead.org>; Sun, 17 Aug 2025 05:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755434031; x=1756038831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Chrrw+dyIJSlBaNuFfzfLJBXunJM56lFjN13/1zM0cU=;
        b=gq1P0r6ieioxN/m2E9PsDtSvZcHnAgEZMXDWztMT+AcZ0Nwf37aaR13f121OV486i9
         BDwsfj6TcYJOJ8nEzvEhawlB2EB0yXzfuzZ62hJ6B5gMdZfVqVc2wtd+dk0mD0lmirE9
         3iaV+P1RTYW8IcL/JOz1tm/5sknzAvzipGoVT7CKlXCnsDX6jvMwAvWpxLQC/J0eRk9o
         MED+DMvlvteAgdwVy1rKHohAxBoF/WIgZ6btUrOabYB/lI95o8GCiilcEZekQ6/X+77g
         sQvq7q18mz6+tQFXivv0S+AyWGgqKoGTgWc3gr79M+VKAWKoUhQKruqVTD4mvlC304Ab
         zRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755434031; x=1756038831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Chrrw+dyIJSlBaNuFfzfLJBXunJM56lFjN13/1zM0cU=;
        b=fBTkm7YJLcVSPb2RE+xg/T0yK6/cLF/8tbcVgP3fknVXjmTz7zD8mGvU6eXYkl9xPg
         mHeiarzrEyxfBqWXVPoGFXDdvgXjutQDsGvjQA4bGI8AtVO2GBs7hqtKqAlyGBduAmy4
         h3J8MIbwPlC7GXhV/lMz02lU7KP1oPgrlESSdEB1UbVoumnTChw0i92sTPXygX2xY10+
         Th0P/21pfRNytu6VGdMVZEnTeCu/z4nu0NAiywm1XnAffFK3td/j8x10MB/Ff6K+tXmy
         mvSHs5TncslNGtB6+MCbgHDsfv1/j/dFLbkJvB2UMsFuUQNsScikxLvIhm7mgEDuLxks
         fd3A==
X-Forwarded-Encrypted: i=1; AJvYcCWwNJoJ+/p2zWB1AOMXF5wBcb51dWZ13oxsyNDWWaUgxpc52+AWMI8ay6brRPHZCoYOS1nw57pxpJA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVj0wbs3tGgq6CZc6E3ypXtwJGeY5YQlEIKeIV64SbbojUQr7e
	2QD2QIXKmqeFqPWQyy2wy4ePmaV6pfZAUuzLRdFNKrrZBvWB+9IWBxD+fQQzdOpjwXw=
X-Gm-Gg: ASbGncsrjRhSrZMfZ5adIP0IUzrkaUp2lGZY6M24wcWuNvn42fhKyOK+M+885wVUGcE
	YMyu7S3k4DVDJLwWZ+UR6PkUTIjJQ4ZJrvNu31THufHrUGBHUpYA+yJs1giduUbDlu4keq88Rqy
	w9RkADWtH8BuLGg/Mbp8c935vibgtHp98vpWbgeocIQlxusdtb/ol3o3gpfxAdrxswuiV8nG2oy
	MdeKnCNNzDaWjMbBtgoFQdlDz2Ec20YqlQ0X//dVjmyiqzqDbeLdfQ0Ua0i8LTBv3y+bxqxDi7n
	x2bdeNjSUMOmAJ6jx8XxbE5l2H+EOuuhzWmKwJelm/QcaEU2k9n+ePjUnrog4k8xSyncM06HTZW
	gOALS9IyUUnEnDxodk81l2do1FoXkqrbqErWAEUfZQr5DH9Lj9Sl1nD8=
X-Google-Smtp-Source: AGHT+IETV30d+U1cTWNm+PcAX8EyUCyQ87TNGD5UPWd2IWqoSPinHs4gpy114d5b7XZmASQs/fhxjw==
X-Received: by 2002:a17:90b:1f8f:b0:312:959:dc4f with SMTP id 98e67ed59e1d1-3234db7148cmr7188813a91.5.1755434030859;
        Sun, 17 Aug 2025 05:33:50 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232b291449sm4480912a91.0.2025.08.17.05.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:33:50 -0700 (PDT)
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
Subject: [PATCH v2 2/6] RISC-V: KVM: Introduce feature specific reset for SBI FWFT
Date: Sun, 17 Aug 2025 18:03:20 +0530
Message-ID: <20250817123324.239423-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817123324.239423-1-apatel@ventanamicro.com>
References: <20250817123324.239423-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_053351_589083_4B05D818 
X-CRM114-Status: GOOD (  14.14  )
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

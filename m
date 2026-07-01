Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C0BC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfzPcuIui7TbjhmorTCJ+hE9Fwgmm4m9viYZeVh8pZY=; b=sJEBWDtYOXv44s
	K5mQukItL+hAqlgZbD7os2HugaIBFvUMHmVnxzh2bcxoA2N4rAhGuC45CqTWVb8EF2hobbYfT28Eq
	mLX7ZCjQhNvy9sEaIxXiXhyqTQayIGT5WK5v7rB77o3mKn9klLEQT0nIOIxRYUF9dMQ39S553gRSO
	FsfmRnwr0RechOwbPsohULN6qv6vQfo9PVFH5DX5q9ZVc5xeN1Iqryaz4nEH2zZ6y40Kghp1ewkpB
	TWLGFt4bioRE0Ozb1YtMuD1NuZ8VO+IUsJ0XTyFuUQenYTPfcxEYLhYjhhQ+rOPBmshn46dg4AYYU
	0d/pZeFHPQLUq8WA+Pog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werY8-00000001EG7-2whB;
	Wed, 01 Jul 2026 09:48:08 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werY6-00000001EDG-1TM7
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 09:48:07 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-37ff436a048so198481a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899285; x=1783504085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yrr5FtvU4l5TINA7e2cy7RSaKqJTIqgiZF3cWni4toU=;
        b=DXGHU593ElB87Mvsph6QW9xs8Y4dSw//nEPJZHi7BzXi9LC3Fvha8RUApI3kFTXHqy
         qI8dDvpPFAKYhBOwgqQX3QU8OLCX7t/nCzBoFdGslondPSWetVrhfgpX4ZoGpHjPK5es
         3Ppyy0TKtD0NTcXwtEAFlIBrODXhwKKk2TNxPBEq8TX44hfzGwRKMWtvOqKs/d7lkhks
         Wzr8rVFU7xXImDTv/XHZ2Z3Bg6mNj0lxg4anDYspILv9Nxd5eCkYGiZDHIn39pz2pbyA
         tqh8R48yuhFRfZ50dh4lQ97FDCIpJQzm9EOMIPWLoIrXE95W4RXwaDEoImPjJN5KWl6u
         fknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899285; x=1783504085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yrr5FtvU4l5TINA7e2cy7RSaKqJTIqgiZF3cWni4toU=;
        b=G2tUYCw7TnenFLi5FMwuIHcsugicGojsKDOeLdOU9E+OXa4hSJKt6d33+s/kgr2vpw
         /oDGK19oegaV0JpqtmjFIXqSylvVeZO3TahbDJBiU2p9ewB8T2w9Kvpo0lw8vfeoG309
         JFBv1oavrUTp3p3+ujNo1ktArA3K0KI8+dex3uF32/5GzgeRkQwc+rLCPgmzY/71Dtfe
         NhVAztF/YZEa8ZUEH7U7BgkWxAWfSbAb61qdpPDJCva5768wTXE7quKkSZcj8WW08rUX
         ko0g6RltwK6VNgkv8VqghD8SGHxPQLdlZWf4Hf38BZqiX2EjPhCiIJCumHgt5AWUGqhe
         N7KQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYpp4OmBlwmUwzHJvJsZk1zsXTNEhKZqr55bQCe3I1kH11vzh9ReKQzYqYNl65AA+9wBmTCzUxO3o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4zqcaXSgzAD9RmeUv0CMvUyd2uMzJK6l/34cMqJwGpLM/nP/P
	+MNsxZ3njMw1teWscLkFSNMs6ko3M8CHlrYM60sS1cZe7t5pac3TdeP1
X-Gm-Gg: AfdE7ckeu26fi+lM1XPrSXnnFk5jVd00INF9I5IvcBzQhNHvDxouZJ5okmnovq8hHD/
	wrtSDKKPtkiskl/fiMaqxsrAkWilu0njSyScwHpu2fdL0zqITocjH990FO64uTcBRIvYqYeMaCF
	XLT9ycVH5If0qg3OFLj0DQwn+Cjd0xqQsz9wDYzyOe2a9hUWJ6kVbaYm835xkyWbOA7Z6AFH42l
	0h5jTkHb4b3eX6t1X/U0g8BZUfmbdia72TvDbKKx+TdPWjzTL9JgEmyqxxzF/oEkOz8MKi/tdP1
	GT6e/JPqHOlRPX4/2NRx0GlMYe/LZW4h3Et6qH3ssY9hMvi2uTW35WYTp/jJWFOauObCY8BvmcC
	uCrwx2tdpTp6KRd4jdetJ6d+DYoIVWHeEV52R+ksTLcaOPwN5lXy/5il+TFgcEp7m3DUxrpxZzi
	x7F2eEU4q5OM0=
X-Received: by 2002:a17:90b:3b4f:b0:37f:9ce1:736a with SMTP id 98e67ed59e1d1-380aa21ecd0mr967241a91.32.1782899285410;
        Wed, 01 Jul 2026 02:48:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095ea9ef3sm1590317a91.17.2026.07.01.02.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:48:05 -0700 (PDT)
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
Subject: [PATCH 2/3] RISC-V: KVM: Add SBI FWFT validation support
Date: Wed,  1 Jul 2026 17:47:29 +0800
Message-ID: <20260701094731.1022163-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701094731.1022163-1-inochiama@gmail.com>
References: <20260701094731.1022163-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_024806_483556_0722C964 
X-CRM114-Status: GOOD (  12.03  )
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

Since the KVM SBI has extension parameters validation support,
implement it for the SBI FWFT support.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index bc514ae6521d..74eab72b2dd9 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -604,6 +604,30 @@ static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
 	}
 }
 
+static void kvm_sbi_ext_fwft_validate(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
+		feature = &features[i];
+		conf = &fwft->configs[i];
+		if (!conf->supported)
+			continue;
+
+		if (feature->supported(vcpu))
+			continue;
+
+		conf->enabled = false;
+		conf->flags = 0;
+
+		if (feature->reset)
+			feature->reset(vcpu);
+	}
+}
+
 static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
 {
 	unsigned long max_reg_count = sizeof(struct kvm_riscv_sbi_fwft) / sizeof(unsigned long);
@@ -756,6 +780,7 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
 	.init = kvm_sbi_ext_fwft_init,
 	.deinit = kvm_sbi_ext_fwft_deinit,
 	.reset = kvm_sbi_ext_fwft_reset,
+	.validate = kvm_sbi_ext_fwft_validate,
 	.state_reg_subtype = KVM_REG_RISCV_SBI_FWFT,
 	.get_state_reg_count = kvm_sbi_ext_fwft_get_reg_count,
 	.get_state_reg_id = kvm_sbi_ext_fwft_get_reg_id,
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

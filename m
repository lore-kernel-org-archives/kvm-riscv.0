Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F53AC54FCD
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZEP6A/JCFL1nrkzaXayO/y4haXXM3jMH7eHeyDESWo=; b=vvp15gep6xaoHN
	CKME7MUzSRHYMDJrbhh6sQLjJU9kpjEyIehZUKY9DVY9WfDyWP24bErR/CBTbQQlJZxTi/ZB9fvaZ
	hPqZPxP+rMsWDx6GRGq6UyfRo2inZ/ErvDsVA1BnGycKoiMTUGJhK2YYqvcT9zGeD+I0Ps/bQgB7i
	y+Zc0iww0fsOZPff+wfGTnPjzOf+SlqCjEg9K5/S/+eR/SalqBH6CBwf+SlQsoFjmrLGcs3+bf7es
	3u3yhrkzzRdc95ZwWuBTWG+4dIAwYiN2IWQqVXX/QqYHvtjn3pP11Ybq80WLedLA3IVIAcDQu8yQE
	deyveA3mOJP/Y8GnWfQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDen-000000096zp-0nuI;
	Wed, 29 Jul 2026 23:25:49 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDek-000000096x7-1CVq
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 23:25:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38101f85591so165712a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 16:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785367545; x=1785972345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig1ihYaIcCdMTQNvyfvc5KxHcD85RFL0JcLOryGs+LA=;
        b=a3CJDA8AWRM6oLscxY4XUwyIK/5DJsxTUqHYxLx1v03901qQOCkuBd6ceL5MY/FWnj
         yTrbGlNuplWX35g2Bn3Q1iqwjHQdUBmxnhX7TZ1dFv5oKfbwwhUBdIPUsoXz8upYG7I8
         ZogofafVu90cX4KmcmsDklm11mlXzjMA5t6pLC1JYyVu3YlIdij6f2+9kZWlGetKnkD7
         ouQBt/wyb6RNX2VzWnbeiLYoqaz1AEjT6mzXDs7/p5tcfiLAEBby+DVTIEcxSlES+07U
         zR47DH8YTjJPXF1riNcY5svrx0sG+i4lNsh/MLtuNonLSfyodY9gAisRwie+R2itKuv5
         1m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785367545; x=1785972345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ig1ihYaIcCdMTQNvyfvc5KxHcD85RFL0JcLOryGs+LA=;
        b=rJDlejfPR7UnCQOU3bSpgbSyJ80S/MfDuJWfdCQK+3W+MbE+Iv8Zy+fcAYlTbMukWx
         QMnTqNQHQ6tzTAHIkBgXaw7KkdNfi8w5s5VWWeadOin5PwPj0LXTza2TOszS13LrgswL
         0zcTSzQzoLYuIWW+NKOBnFl1kM7JoaMlQ7d+2rhlGKW8C1HIeC/A11tsTxO4KXUqV6d2
         kjtXkeoxOd4pNFIL80kRvP0v9jC4TgKIH/INU8nwZWuXaXiInNZM0YthLCNFibs730uC
         Asj0TsTcDBD5gBMvs23mM8jhIw+XDwVc8iYAtKAYCxxZnpcpIApg5LDcBiEYW4+oUSYa
         H6EA==
X-Forwarded-Encrypted: i=1; AHgh+RpxKfLhGQOV4Cz+TJTTrrsk6mO5YniCl1ioWNwQvwqXXSSqWDeg0rlMXwIp9eqFwKF04EngNqEGNg4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Sj032DUHXImvJVQQFmpHHihX04zaxwyGbuqH/K7XuLZ6ERa/
	/2rXJxxZJdhSZ43xInaaY96+Hch9uZdrmie87ZPm+BgSq13JBzkkxScf
X-Gm-Gg: AR+sD100phtX+sCgIR5gfpu/3NqVvz/v7ToklHkUxxMNhcb6mEXWvkKNrIIl9YoSjEq
	2jFTpzOb+B7Cfo99Nv6hb+YRRNVTySqeccfgO8gdhiq4gvrPKXryl/fFm1EJfpgK8869gWLqdCP
	yAAUoJZ1dGxnEoA9umO5U5cjsG/p3pu2DDnzb8h9z4nD32GblqD/KWsG+VDvxYSBhEwR+rzV06/
	qP9rRNhdb/GiYBWD3l1HZjE90SUzKyhnMTsOqeJzl9Ee8uwKln9TMkdI4NGT9zM2FU+uOxOjbnt
	2M6I6hdqynDupRUtEVpsYIAO486/jz6wM8Z4A2jmkizMgf046bzYeDzZgJSbtiZ6BQLDUSvYHg6
	gcRQqfhebDQvWmnxklviZs8D1YhFfjTyAwCCelexZFbDSGgm8dlq9z87rZLJH0FDOSWLDrzpEvB
	bpxX3EoIywhpotbiMvURnGdY9zvghLmLY8YNcuFKha0sgWRBZIE9MvZKoIMJw=
X-Received: by 2002:a17:90b:2b4e:b0:37f:9e21:91d6 with SMTP id 98e67ed59e1d1-38f9bb15cd4mr230876a91.13.1785367545337;
        Wed, 29 Jul 2026 16:25:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b770e54sm90102a91.13.2026.07.29.16.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 16:25:44 -0700 (PDT)
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
Subject: [PATCH v3 2/4] RISC-V: KVM: Add SBI FWFT validation support
Date: Thu, 30 Jul 2026 07:25:23 +0800
Message-ID: <20260729232527.139183-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729232527.139183-1-inochiama@gmail.com>
References: <20260729232527.139183-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162546_357299_846EE02B 
X-CRM114-Status: GOOD (  11.96  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 03153fd8d15f..56fb59afe02a 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -603,6 +603,30 @@ static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
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
+		if (!feature->supported || feature->supported(vcpu))
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
@@ -755,6 +779,7 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
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

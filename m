Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057A9C43458
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9u9KNig7No5VrStF0mZQl6qcqKkNtYJbz9/TdMy7/I=; b=yj15eg29qIkdBb
	8eThZgVBFKovyEMDigjl8BkiVvHYbo+PqYYE/GNkFY5UamgLHy/TYVj4xVJM4TrRbvi3i94OWZuJN
	budL2GHJ/x5C/PYMjAd8NmrhOYKOO0lkmfh4YqPuKB2ItjYU9XzW9jgFOxr4x+O9IWOUOuYzjTLsj
	zZ574b+/D3y3fmq+w+VetzOSOUwX/vk+byoK7w8oYMcaqOmvDjDTNyqVhtcXMXtsNa2OWpXUSnsBB
	XiS7tEPrXIZptlSe8uPIsXTOy4uZMkPwBbX7dZRoiEzBUmFN5qlibskVhbih5l1oAhkkH8ahpT2hL
	DaDCMkr1XeOYJWkPIKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp7-0000000BMc4-2L6Z;
	Mon, 06 Jul 2026 02:12:41 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp5-0000000BMZO-02vZ
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:12:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cad225673bso20248175ad.3
        for <kvm-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783303958; x=1783908758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SEkM1NCzGGDiH3CjwqUYg+RpOTMUxR/dI++pF9WMd4=;
        b=QR7PoGqIy9jFOfNCWXWRujOisL+g2GLNZpPMJn72ilsRsQmWyqcDvtM73frepWpYX5
         6hVodVPmwPJiKZdB40XvZy8GMM24a4utwVwE9EfPBc87cLIPeb2Fvl7tujGiufbU+H9j
         OsZyaNFf9voXTYXCwVfvuqGpjRs+d6V5s5bZhFLCRuEBH0rkr0E74u9h4xeydQ8m4H5V
         Mvbdiew/mzNwf/yAUSFkj04nmFfXMNQbL4gZuEzvuZv7F3QuleZ9Hmm5g3HjtHFjrWLd
         quQXdVDGwWP37LA9MdH1zR0jVbt+fzib8SMcj74iLneYjjLwezzgxt2vjEmUokbwlhpp
         2LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783303958; x=1783908758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SEkM1NCzGGDiH3CjwqUYg+RpOTMUxR/dI++pF9WMd4=;
        b=pIoMmiGFzcEyuMtUmS7MZjsDj/yxkly0kPFmtOsrbgIyr6xF9W77VoP0mw9Itg4/VE
         7VTJFtr8bytZ7rZwQUspp/q3DfYIEMdrDurrlgBLAkJY9TOYd1Z/NYnKo1RtfddJZSPy
         sEZhnhvOIpJEofdnj6ex1wKTz/J9CXhbKz2gCkAFy+96TUDhWqnMGFvqET+WXnaobopK
         qE3BYbt74t/ZyCK47J/a8wfVerE6RZVLVklFAuTJe/UWYcgsTqprP9H8f1zk71Exqj+k
         Xrl1M92Bikz0a33OnlKdEtO5lSRPbkOqAFTNlN2JJLysCMwGbDJmOOZ0VSAqscJMXiOi
         Thtg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9ubJJxQUQTLq2bP12qr9g0V9QIngdpPbiul4ms/WTivKiv8em5+o+H33wLBN5nXxp9Dgaq75WU04=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHBvLcTzoflQumo3L7NrFqvW/0eWqex0r7764vy10VEfmQjWW1
	FlEmxcC5oecpV+p7ctOh/BFrFoWICMdbkl9o8Po5D8Rov+cg4sW+7cHr
X-Gm-Gg: AfdE7cnzFfMhExD2SY6HZGTYJ9upSM44+Fad7Uwbevz/UdUKPZF/R9gedbAPGOtX2AR
	Edb7YVL1GClCXDtsZtlpA8tOO09m6JJBoBOexgdzDmPN+UJt9AJLInHH9IMFm/02prsS5RLTwBl
	8t9XT5kNJF+gO+hQsUnxBLCRg5LlEnxgk1rUtSxYDn5t+seCEynPTIMbqtge6rWNOeOFrLEXrJm
	1GpFt8ZUx7sS6ECgaa36rfsQ4YFVFLK0oJaV/A5eAtT9y9WXi13dng70ubaabRShLuODUktSP6f
	YdC2nDyjJnP/NLHSR98YtXiHb3E3MW1W/UDmpZqwbClowz8EjGbx7de4ByYExW2HPxWBerwSnXY
	KYCzDZqMbeIol4PbHhpbwV1xztCgBEdEf8Ku79ticQKW7XrSS7fFzY0wltXvZbUrF
X-Received: by 2002:a17:90b:4d0f:b0:381:21c1:75c0 with SMTP id 98e67ed59e1d1-38280e98e25mr8543507a91.15.1783303958078;
        Sun, 05 Jul 2026 19:12:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127c1c68bsm4006978a91.7.2026.07.05.19.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:12:37 -0700 (PDT)
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
Subject: [PATCH v2 2/3] RISC-V: KVM: Add SBI FWFT validation support
Date: Mon,  6 Jul 2026 10:11:51 +0800
Message-ID: <20260706021154.210289-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706021154.210289-1-inochiama@gmail.com>
References: <20260706021154.210289-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_191239_056727_94EB1D18 
X-CRM114-Status: GOOD (  11.75  )
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
index bc514ae6521d..0aa1f9a57c90 100644
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

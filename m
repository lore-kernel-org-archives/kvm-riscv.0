Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86D2C54FCD
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+MN96B16tXxv0nBP0yT1ZqJuLq+2ZWV7u5kpP0sulA=; b=wXxuCz5JOdlZFW
	7h0UK77aVMHNKj9y6rRYS0hS99YvF6ZZ/xtMYt7Kjr9OaSkpG0nSckU7jvYW1cJDE3P45slvktMHk
	Z09HKSHPELKwzRBCgBlQNMEdZFPVafPlu+jhStolEwN6lJ5VbB6UjJw6zQf4mtjnKsBFRpCAI8EVx
	c3rRBp7Mnwt6FhusXzbBEOVhqqWgklowiyEzbZx5a/X0e1a62Tkavul7cZe5YI0acKzL5Uk66QQR7
	73TnTKvYS0qq3NgONnEL8TTf6ZUy07u1bPj6NmDUbeaG55BvYUsJbNDASuCpT9k5t9PPmLC3O7lY9
	sN/nQffCoTQmJYrGQCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDes-0000000973s-2DEY;
	Wed, 29 Jul 2026 23:25:54 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDep-0000000971J-1xjv
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 23:25:52 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1208350a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 16:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785367550; x=1785972350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kW8oqLZffY6X0abqSuvd+PUmx3S3p3riWWcGYu4Az1s=;
        b=BxnCfS9ACJOmxqbzHEDwrFio4C2fOr7Uc5a1lzde1j8SwmbqpetGYoijaujp2h0tZm
         9GHi6C5zvA4P/YXL4Ki3RlSI0nI0+dN2ZpxOsfqhRNumx3AGcss2mvmXeVTgmWKFELZv
         +AQhMlE136+59xdmm7j1HC7pGNyRUuftXakJxhqfik/IraanfXS0TpP9/YrhnHjiiMjX
         I6yGxm9zy3XJXc+EFJrAJzgt7caKqePe4XQEh19QQMOD30wZGcmZeJA349feSE0A10VC
         jjVQf2Qcl/yCNbIMMHXB4jr8X5g/5azuKOaLMH9czR8C7u6o4BENC04708OwnFNuLcuh
         QicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785367550; x=1785972350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kW8oqLZffY6X0abqSuvd+PUmx3S3p3riWWcGYu4Az1s=;
        b=pazDY3mRLE/o02zB8JRTzMFwoUb2E4Tn3OUvQkLqAP5zYue2fa/873OYbZ4stkGOYX
         IWUiBs6ZhDpaUavo2R/0kuzujhOdYMwqY9Me5Rq8gH0+lPLmg3Ajw4RLpGQziS1egGHm
         kR+DBr11Q7ytLbxvv584YWo3bbHoraGNHm+RLw3ejtdRj7Fkw8ICP7+ECNr8FfRjBolW
         4xK4BBR3eZVKj7ae1fkkVpXJyXtmKFKJh73aCIUJysDOPBNR8glqEGjR/SH9xrHzjRyI
         FmOCuc2q6P/HbJ7dyEbN2FD/xTmiQ4uHYkXXCMmEvd18+f1/gQIjeFXs/Ww461KEqcLF
         UHpA==
X-Forwarded-Encrypted: i=1; AHgh+RpbCc4Zx5t2Mqq7eubwwdjWSMFs5pPSTioFnWho4bnRRvH+9+vC2vGOZF4OtUo1GyoZlxmDppygcjE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9OZwUlZeuQNF2yW1Szs4O1ihns5D8I+kK8kKLwEFPSipM205B
	euwvDU69TNGfAEh3FoC4k4QCcoA59iFmTtSrrm4YAFr8MUUgOdUTFkzZ
X-Gm-Gg: AR+sD13om6nzgqDcKL1I8WuxHPXOHczZlG3wLe+gRAcjBWLZ/7Sc4yP7m9wmW4qUAkD
	9wYtHWSM3kyfJjeShyKkEFteor9tOmO+TJPKPN1QwNESe5WyVHxtnp5k2Yj8vtWuGSnbMcfkJ2f
	YGFZPmiEribhp6gJvYR2D79bH1r2yMNy3uSxJWtNqQNIDQd3uwjn3sCLdbIPH9pUMPnLCbXfAJy
	OzY7ihA0APW40C6P8YSpCXGG3v2YYmYIVXcRFEqmYFAE3Am25Ril+mmTMXYM4Ge0PToexOuFrFS
	8s3lYfNo0zj5bOBjkDIO0eqtflUia7FyO9MYvdp6E2bv/53zbq1SZ1P8sVDNVezJefPTEg+8p8Y
	mM9G6yzJd6tAPj8r7oc9bTZD7Xr/AEF5CMq4TNZmEXtAJrTRNf48fhpbL2kmNC8rXLeQMZnMP88
	vxR5CLvanuHWBYw6pcZ/l3st1NlVxPfU01xqt84qHrkBHJe8wRjcHDyaybIEE=
X-Received: by 2002:a17:90b:1b43:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38f9c032891mr269925a91.34.1785367550506;
        Wed, 29 Jul 2026 16:25:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b7ace53sm90033a91.17.2026.07.29.16.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 16:25:50 -0700 (PDT)
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
Subject: [PATCH v3 4/4] RISC-V: KVM: Mark the reset callback of FWFT extension always dirties CSR
Date: Thu, 30 Jul 2026 07:25:25 +0800
Message-ID: <20260729232527.139183-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729232527.139183-1-inochiama@gmail.com>
References: <20260729232527.139183-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162551_543694_EB9EAED5 
X-CRM114-Status: GOOD (  10.03  )
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

As the CSR is only flushed when the csr_dirty is set, always set the
csr_dirty field in kvm_sbi_ext_fwft_reset() so the CSR change can take
effect immediately. This unconditional set should be safe as all
supported FWFT features change the CSR state currently.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 56fb59afe02a..2e35e7e12327 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -601,6 +601,8 @@ static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
 		if (feature->reset)
 			feature->reset(vcpu);
 	}
+
+	vcpu->arch.csr_dirty = true;
 }
 
 static void kvm_sbi_ext_fwft_validate(struct kvm_vcpu *vcpu)
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

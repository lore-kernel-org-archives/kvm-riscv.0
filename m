Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB31BC021A7
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8usBV0dxkU02uaH9Yjz6qyoksx3VggizooRpCiVHBBU=; b=hZ1005AYTZooRV
	fkoae+V439wyyUPi0YkZ0dF8WxQzGgzz4Y1u5EqgNZ0yxE8Zhfr1CiRxqeDWSdfJkkpHOZpL6jVob
	F0fYC3HyRLUKEqgv9KNyBT0jDzZfh6SF4EceinDOH6g97pSmIAi3U5lLcQ6NfTms6tX7Th8fvVVUv
	Mz6VDrYGVpSmxWD58yyCq2h/VlBvFJwIIO0gYhzp9qlXj2uQPecnSrMtSso+vOM6H3JoXDb6uc969
	E48IWjw+lsU/ZJaFuQTIvPq1jPZZj2e5iPDcLs2ePCSvSO51+WjT1Rn2Sbdd2vQreVm65v5Blai4Y
	zq00VqxGD0lOGBpKtYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkg-00000003nTi-2gkN;
	Mon, 17 Feb 2025 08:45:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkc-00000003nNy-1ocX
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:45:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38de1a5f039so3867033f8f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739781913; x=1740386713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPqGeqDxSe+aOIAEww9m1M//H8GA90MJiJy6W/MxoXw=;
        b=cNFpYyJ/GEcZddWnyfOY2ZaQUQHv3CvOnSwKRCcuR9jYW4FITTXhigOYByj0ZlPV8Q
         lRSpWWWSx5ABsGlJkUEvt53i5eVFwMPpzpcFVMXzha65oIYH7LpXY1d85shE5tFV15hQ
         wH8n3RP6ZmD6adXvFCOSO+GpnLbqqvxQl5pXZG5EVO7aPkESUTHKhH3rvAXzJlZwat+V
         WuRpbvqM10tg3vGxShRLrmFennaNXTnDT3jHA9mPvpztDC0HQx9B65fKJLXN9lxOz+PC
         v+QCQxQon8rOqP9tm42kv2PNzBwI0QX+ft3ZG5k59TrBTm1tL1zUNDD/5kJuAYH7zHu9
         36ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739781913; x=1740386713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPqGeqDxSe+aOIAEww9m1M//H8GA90MJiJy6W/MxoXw=;
        b=AP3/5XmSlufuULx26zR3lIotwS6+Y9sc+H66fYXN5UqpH1P6FF0eB9ziMdNDcAG0k4
         PNWcHjqWeDI4xzf4vVbeuyTdTmgWw3KoxHdCyvM9KqwnZLf2RZvcuVm3axMLSQMZMYVX
         fQH3H6VwizkR9myT4yDuKqKkPvEWs2ByzOfsh05w2h6eDu+mjz7uNJ+9bzPkrtJzD9V2
         fdaGd3HDZ+UHozqLWGrDGLEpXIZA1kS0VUsS53J6bwJKLVlPV+izEzVlRtmQ6Ji97lfS
         jslbb5S19wGEK0IezqiWkgf3bRN/YryHNUSa1la0I4XO4/YTfxDtownPOQ0Nb2QcwFHC
         +bZA==
X-Forwarded-Encrypted: i=1; AJvYcCV8K4/q9yOeiZ0evo8LlID6Uj9+CHOTOyW59HxtpLjTBqGahs4SgiyHpvCXWA/w2xp5HeYA7N+AmQk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoaTT/fuC/ZUHZH/g0xJy1lwaUUOlf4Mrr0q8btuuBgKr6wQZh
	qdNLMHTWPm+kltUX4xUzlmINHvnBE+kCFNBAhmNf1agwhBrUNJ+UmmM0ZVeYuoYrbgZpQHxt1iL
	9
X-Gm-Gg: ASbGncsqM043lzSdBudkmw4RxGTGu13ZygGsZAPL41v6uq5MqIN6/btTMvss/g/XqTa
	v8zd+LUcR4RxZ7QVmqoBcqx/nBPFiV1HBv+Vk+2TBUv4WZFZXgs9AoSL3VUCj8Np1IxS1sDO3HD
	MaAbvagHqJB1MfakQTeOWzekUQ9jH+bV7FxV6BUT759AjGTBRet+m7mcqkxzM9XZI4dZz++Dyxc
	9fMspptlABCjw1QlK4x/M9+qinNpKXr0gXzNdvanG5Y7fOZYGdoI/Ly1SaRmm3AiSiUtw1sRwDI
	iWE=
X-Google-Smtp-Source: AGHT+IFw2SQlG3mEiHsZKLXfCIe42+z2FtTbwXKzNb64tTScHuV6pXuwf02llElP/bUJfKsa7cfpqA==
X-Received: by 2002:a5d:648b:0:b0:38f:31fe:6d12 with SMTP id ffacd0b85a97d-38f33f295f7mr8268862f8f.19.1739781913174;
        Mon, 17 Feb 2025 00:45:13 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccdccsm11661079f8f.24.2025.02.17.00.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:45:12 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com
Subject: [PATCH 4/5] riscv: KVM: Fix SBI TIME error generation
Date: Mon, 17 Feb 2025 09:45:11 +0100
Message-ID: <20250217084506.18763-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217084506.18763-7-ajones@ventanamicro.com>
References: <20250217084506.18763-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_004514_474844_6CD8019B 
X-CRM114-Status: GOOD (  11.12  )
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

When an invalid function ID of an SBI extension is used we should
return not-supported, not invalid-param.

Fixes: 5f862df5585c ("RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v0.2")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_replace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 74e3a38c6a29..5fbf3f94f1e8 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -21,7 +21,7 @@ static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	u64 next_cycle;
 
 	if (cp->a6 != SBI_EXT_TIME_SET_TIMER) {
-		retdata->err_val = SBI_ERR_INVALID_PARAM;
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 		return 0;
 	}
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

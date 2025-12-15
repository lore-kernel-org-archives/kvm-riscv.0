Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAD7D5B84A
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eGAFCl1MEiin5VJc8/nGPAy0vPvAwM3VWf96VYenACg=; b=p4c2DBh7Z8/WrsV6q2M67JHCSl
	0P8jVvWSiJMCiodIFn4sTRrw+pGFBlEPfKSxUOKNGBM4W0x6yRqleGtXlvf4y1pH0uTDpt4vH+QMI
	qccheKVGitkZZ7sByRLlixf1CMBdqW5vCOtxasbaHFngdHSIaRWj782qUmIHTKDb9rY1gOeSeySCm
	QJTyiuf5Lq/rY/WoYWrmH1GFhQYh7gVKWF56jet0Kbx9TEj91dKIIoY01jmXrQnjBB/ix+L0d4vpj
	nW+B4Fy128Mc+RpdMbtossZfiz0zl4Aq8r51JaO9cTbxaYlL8Gr3K+0T04Xm4dW+TmSi/UDa374cf
	vEIUP3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvR-00000003wPp-2d8E;
	Mon, 15 Dec 2025 15:55:53 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvP-00000003wNk-0XEL
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 15:55:52 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4776079ada3so30803385e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 07:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765814147; x=1766418947; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozb3WNjr0r/hE1f6GMZd7Idc+wYYTjRgIGjeMMU1tjI=;
        b=GHOQXcSWrt3IbQnReuhf/wxdSGrQ7gWAASFLCMuYWkK4NPI7YvgvKS/07lHhyM+eCC
         2TrrS2hJ1HNiuIAltqwkY3nGH+9tUsUcGwqwTW+j9Wv69J0b46cRUtMeIXkBkX0wQd0K
         PR0CGCeTzFsHJ6SCng5BiKhSN9fSr+G7D0vSzkyJeT0iK3UlFObYsWfpbfoQqn2n/4jH
         FQOCdpXBUVf+fsVYGP30NgLD2sLpBLgwIdpSLH94wzdUJzM+tyaeGmxQStlYANPgOqES
         Jzo+O4sXB5oDtyUEcGMlaz+ASa0VgBFAiHZeobsHzh+QDex+XjM7KbmsBSXFpKHDauqm
         uT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814147; x=1766418947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozb3WNjr0r/hE1f6GMZd7Idc+wYYTjRgIGjeMMU1tjI=;
        b=nHHZA0YVPiJkBLN3ukzmvRN+Mq0h1/ex8wHx5CD7qbnNmCUAq0SZsnfpW5oMl5GopO
         cuBKeXwmP9ru/9NzM4PpD3Thl4Muzfyz6w+EHaqavaMHcdzuvnmx8IauNxAjtbEsRwhV
         MLyGVnhxpKcOYaW3akhUozMA/vFgohcqj8b1agFXeilUQpR7p9qeR2hBIj1R81SQUk7i
         GMAnl8D8zq6FmAia4dpaACSP3Q0L/ViHlfDIn3zijbSbutkkWlBUbJ55iu979H+mnIdL
         weVO+jKIFYVywZ697buren7O9iBJOxr8X5xyB+ZX6V4lfVBk7NXQSwzpWw8X1/YNi0tP
         PxfA==
X-Forwarded-Encrypted: i=1; AJvYcCUrKnbRTkrVkLrLgA9GWKysSZxfvvYewlKoUR2O4/u2+m3q0RXTyDdk9ZZYWyGpqpvN5F3VfxPDm8c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmNhqvy46mX+Ji4vQnDa3joOccJw8HU3VS8y+1aXtVNVMkdSBE
	WEoiNL3Wf8sBqqKILZjAaLaywR8hKDPnDXEvJaW+d2nCHVzAOsCH3CnzygMvSe5MdlQDQaK6zil
	7qg==
X-Google-Smtp-Source: AGHT+IEA3qzwHHfgsxMrJtwJjrbKjzJPwpmzlnx20u2uHp1w/Y/C+4dLQqaNvlIkM5w1MLH3+iZmaCYi9Q==
X-Received: from wmpy17.prod.google.com ([2002:a05:600c:3411:b0:477:4a46:9980])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f09:b0:477:fad:acd9
 with SMTP id 5b1f17b1804b1-47a8f916685mr100374585e9.34.1765814147228; Mon, 15
 Dec 2025 07:55:47 -0800 (PST)
Date: Mon, 15 Dec 2025 15:55:40 +0000
In-Reply-To: <20251215155542.3195173-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215155542.3195173-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215155542.3195173-4-tabba@google.com>
Subject: [PATCH v1 3/5] KVM: riscv: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_075551_174770_DD6E14C6 
X-CRM114-Status: GOOD (  11.04  )
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

The implementation of `page_align()` in `processor.c` calculates
alignment incorrectly for values that are already aligned. Specifically,
`(v + vm->page_size) & ~(vm->page_size - 1)` aligns to the *next* page
boundary even if `v` is already page-aligned, potentially wasting a page
of memory.

Fix the calculation to use standard alignment logic: `(v + vm->page_size
- 1) & ~(vm->page_size - 1)`.

Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V 64-bit")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 2eac7d4b59e9..d5e8747b5e69 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -28,7 +28,7 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
 
 static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 {
-	return (v + vm->page_size) & ~(vm->page_size - 1);
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
 }
 
 static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
-- 
2.52.0.239.gd5f0c6e74e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

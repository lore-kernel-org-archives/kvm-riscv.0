Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ED5D232EC
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 08:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Z/BoHJlfusVHUqxB3rxroC+693I/rWEbF8s8SriD+tw=; b=TRYqix3Sx6yUsUdGOB5Jh0oO9J
	MziGraBnaeDhsesjdOVbDVlU0NVrZ+dHv1KJNZhH9FClA7+nqq1RzF4r3UQZcG6Ux1WhrOxQ1RlyY
	FFhB4Vje5aHBfZu/5VsBsxGsKbmW7S6mSMxXtom+lebhfWDAP4uS00uHmIj5dsa0bbrW0sFics2x8
	31o9jDEYDD+mltGCPCSznIVssUQi7Fhewtw/GYqI7I4bpsswQ/m4A2ESpmWFcZy3obD4Ew6Vt/rqY
	ysNAdpCE/OqQ2xJ3K02hlA48T0sDGOgImTZj87lcuYA0V63m0A6BbISmi/yIAo6Oy22M67xHX8dLY
	AfbJZ4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lV-00000001so4-450Z;
	Fri, 09 Jan 2026 08:22:39 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lJ-00000001sX8-10bO
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 08:22:31 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-430fb8d41acso2814444f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Jan 2026 00:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946942; x=1768551742; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WTwC3FF8o3D1tLIxF1rzohdijBesrjYjdFLpGAMOcJc=;
        b=ff2AmhBHMxXLlIY/3wOYl0C2pChM/bv0TGMJCue4UrJ3BH6HyVrEpzWnTPsddBZmFH
         8h7NNEIZQ4Wm25jC3YZmaBgJKJyuLOE4G6wpU+IbiElSagINp162UW+SNyaRrpGcZ4qc
         0L4Jj9M2I1SeG0nxXW9TkX1aWKbGmqGTD3QFfR+UNIj92ol2ddNGPZ4SnE17lQUe7SGD
         ahy7ntvbS55R3P+uzsHWeY8JsXQdkB296Dpo/lDpnP3+GXZCzQ4gE3R/gdkyHcaTqTD0
         SldJJLTnVConxt5RGdMBECwu2TzlQLH2qcVSOvWuQzBwhQOSP/qnNnHHv113iHgdn501
         XVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946942; x=1768551742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTwC3FF8o3D1tLIxF1rzohdijBesrjYjdFLpGAMOcJc=;
        b=JXZIsh+S/Z12PCO3wi/UjOQJY3ol2RoO27UFBevT7McgDOUH98Oygl3PlmtfifeBA0
         CtJlznD03weIMrGKYAnjme2wOcPYUlS0ut/uDvqayUBJwu2Lw7TLJce6Gf5RFzEOH5hJ
         qhwmSBaPXjgy9BV+rwQRusCQGvuck272b1o5irfDBcP/k/AOJSbIzq/dm9ziE7idhc2Y
         30HlhPug3FfqOyxL+lBhBjUynA8rqxju7BLKWEY0MgEPIEmOQNrdhPcLghmnk4xuIaoO
         VuRNrK9iFFOq4bnXhu5ZlP1CIeogFIVKpxY3M/JflLAr/xtYqrzy6iKbAeAvEICoXaKS
         MxVA==
X-Forwarded-Encrypted: i=1; AJvYcCVVD+vfUQwvehGiesAiAIwaEoKWq0Y0fEXS8YsUZ9JH+kdnbK17YgQ/h9RtfB1IsooI0JzZGOPvNo8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/FBkzn+SbhyiLMN71QvYZkP8mpzO4jB5FqdLR4j7pmnpl7l5s
	h2kK+T4Z2HX0Szev9FzgL/36H5wBNw+BpFK4xcZZ4PEyk/3xTvYb0PWO0YKTj8sygZQ3ad7WPlk
	irQ==
X-Google-Smtp-Source: AGHT+IEbTZ+JAQZIIX5R/diRf8NtI3qcRyEYMj72NqYPRiSA2F4mmy/NK7W30kPtTdFlYjIQg8wuM2wdbA==
X-Received: from wman14.prod.google.com ([2002:a05:600c:6c4e:b0:475:dadb:c8f2])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6287:b0:475:dcbb:7903
 with SMTP id 5b1f17b1804b1-47d84b17b7cmr101603035e9.9.1767946942620; Fri, 09
 Jan 2026 00:22:22 -0800 (PST)
Date: Fri,  9 Jan 2026 08:22:16 +0000
In-Reply-To: <20260109082218.3236580-1-tabba@google.com>
Mime-Version: 1.0
References: <20260109082218.3236580-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082218.3236580-4-tabba@google.com>
Subject: [PATCH v4 3/5] KVM: riscv: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, 
	seanjc@google.com, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_002225_452280_6F6D5D67 
X-CRM114-Status: GOOD (  10.62  )
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
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
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
2.52.0.457.g6b5491de43-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

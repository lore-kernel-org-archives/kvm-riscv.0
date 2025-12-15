Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED4AD5B846
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G7FZ7Isi2CV4gVJKCqnABzAUepbey7phgjVJcyQvikY=; b=SR0uzZjnGwusuJdjBrI3vxxgJk
	feMv8ROf9SvLcvyEhfI+UL6UnK53fLJXKNRhzQvYqf5pGq0HVnsNH8BUS0GX7tRc00dzVzcrldVDS
	L3xfj3JhpQZ8FYzFv17+8GFYby+vTZXlqMFv3SWj9eNlI1sNdsMo52fJzZWXyEgXBSwC09zf0IIhl
	KKnROJrVvtpRGtm1U5CgWV0DMOQ1Fg/jQuUA4yLq3kIE/0MEWQyWM5EMLFEXKwGJgnT+rodUvBGZ0
	X1sOYXPOM6/b4hgKc59caqGcc6/5GafOA+45rybLGRyJFksQu4qtKHbdK1zNKSZIihBMAPHOXTnjK
	W5uuD4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvU-00000003wQo-3fu3;
	Mon, 15 Dec 2025 15:55:56 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvP-00000003wNZ-0aE6
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 15:55:53 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477563a0c75so23565565e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 07:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765814146; x=1766418946; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YA7YNO0BIUCF/IaZgjS1+s+NSnXmnEjkXZMNklvVQWE=;
        b=Rf8PAtkriY8LZ8RTy2cq7OLW/i3S0o4d26x9YIiLPjTFQy2Bu22utMf918/gIPihT6
         d8vXpa6zwug9PMVp+vBHV3/73ZXoFuVRMjpaqqeYWvWSPSS2MZWYqmz/7KnBy4xu3O0N
         FyYC+xcM0FZbMys8Ife1+HMG/5rjMjkil0sFQFqJsKTjqMlt7SZYidEnAJ+1pP8tlAWS
         /9CQNe4vzPxSYWktrpZQSDMdaAeJsMsYjq9gyHd5oCd5BQwwSVI1uXGUy4mZkQnlxXuF
         UfftcTwQnGcGeJ5vNC00YYYNFoFw0r7GWtVVcmDrNeOUw6XMJNPpqXL0g8XDR/mv3/PC
         vpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814146; x=1766418946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA7YNO0BIUCF/IaZgjS1+s+NSnXmnEjkXZMNklvVQWE=;
        b=grt8oJk6c1tGjv4zhsYdyQmQv8Ch3v4k1wY2H25fZW5adWI6tfivEauranqSqG+8DR
         RgHcSU92D7pbLaWKocKVUqsJnj9CHVn/uVf4k/4PDI93+QqaiwB9Teqf7FRnqP4iFuQt
         OuKJQKFYZaI3YRo6xkivPYVFIh/6TnYt+IhOha1SA7ow7I5ur0fUtXBAZ4ZnCn7RdBHc
         ZMwqg0z2t+cIRWcXWYTgibBRyr7B9o4oa0PuTW9kDsQR7eu5kCyzxBRz1NEOV8FS/a6Z
         +KUFhUckRsyo0JQU9rxBFsHwmHFZf3aueobRyVsW9s37pX3OI5FkQeoRoRMHDLM5T5ly
         7zmg==
X-Forwarded-Encrypted: i=1; AJvYcCUpAVT5HJmfLU6Lr+RzSZG6Npx8fR+2vCJZq3wi6rIs8hYWrpLWouuMqtClQOqNJhzV815zxIAIRrQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBpaumQyO2067ibwprTBGDVNl5O38PMokWpjx3yF1HWwzA+yiy
	UI53ojRytAEwal7W11v+0u0KzC3DGethDdte0zoVjJlmJEz3ZeSHYliT40UteeWL+gTvOqSgiqi
	gJg==
X-Google-Smtp-Source: AGHT+IHVONBeIFBkzi6rtmUEcrmrzmdxikWNKTnci9gPY1tpEK1eVpHJS0UNsoTsuHS+M0gT57IgyrzmMw==
X-Received: from wmon4.prod.google.com ([2002:a05:600c:4644:b0:477:a678:a39a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e42:b0:477:7d94:5d0e
 with SMTP id 5b1f17b1804b1-47a8f90e838mr109916135e9.27.1765814146029; Mon, 15
 Dec 2025 07:55:46 -0800 (PST)
Date: Mon, 15 Dec 2025 15:55:39 +0000
In-Reply-To: <20251215155542.3195173-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215155542.3195173-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215155542.3195173-3-tabba@google.com>
Subject: [PATCH v1 2/5] KVM: arm64: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_075551_183286_FB0DE72C 
X-CRM114-Status: GOOD (  11.34  )
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

Fixes: 7a6629ef746d ("kvm: selftests: add virt mem support for aarch64")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/lib/arm64/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 5b379da8cb90..607a4e462984 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -23,7 +23,7 @@ static vm_vaddr_t exception_handlers;
 
 static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 {
-	return (v + vm->page_size) & ~(vm->page_size - 1);
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
 }
 
 static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
-- 
2.52.0.239.gd5f0c6e74e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

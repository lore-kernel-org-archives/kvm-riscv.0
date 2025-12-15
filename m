Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9258D5B854
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G7FZ7Isi2CV4gVJKCqnABzAUepbey7phgjVJcyQvikY=; b=dRm2lLt1aHTQHlWL5rL7avERXm
	Fl7ipR9nMsFmsjM0VjaGKOL1re1wiwuepbgPTERkSeIV8f8y5xYRksOR51+8zt/YtD0lufH0XKeVM
	X3GczBPJBU5pptR/o9zFThYuf3XtE9gF9meZVNmfEC0sV7Xm3M1TxfdhbYn8jrsKO/C0lZC4HesIJ
	3uIkJpI5v2Qfd62Caw5fPf5eCGQ8FoRKtP9LWaNy3PFUeC7tiJfM2092hotMl/xG1pyo8pbw6HzJ4
	dLFy3rDHpqP5NN7e71xJ7+Mf90z+e5UJEGAxSSjhJxVBSXUjGYOGhQpqQW0A1TjlVaZG3yUQfq+Z3
	k6W3hxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnm-000000041c2-1oU1;
	Mon, 15 Dec 2025 16:52:02 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnj-000000041Yo-3s83
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 16:52:00 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47799717212so30747425e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 08:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765817518; x=1766422318; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YA7YNO0BIUCF/IaZgjS1+s+NSnXmnEjkXZMNklvVQWE=;
        b=n7YEmDg6fjtB2narkqmMNCQe/Q+sYw+dVzibCXIYfolinF5dcwVBrdNJ4HVgSfgyYO
         080rkYCHU6eaLVd0gVHLhJF64Hso3rxka9bz3WT87700jt9rDT2bKptY0DBhjoHBI3I5
         xSKI+WMsK741Q3Hr21Pz+6igz/o3m0803s4nXVsL9Fng3mSQzrDnthqlPirfPbvPkmM/
         lpESg7ZmVgLg67+Ah3v6gXY4YXmWWDcUgjByJiB5qIrhATr0oyZNhJn492ISp1eQpxCD
         eEM1KjWXCp7vNU3KgM9WXsj5vQ4paq2QBW9ipCIkxQpw89dkbQdgKtnmC6gxkSY9ckdc
         QIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817518; x=1766422318;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA7YNO0BIUCF/IaZgjS1+s+NSnXmnEjkXZMNklvVQWE=;
        b=lAQtQ6urOwjzBrB4XMJ6fFJJ2xn4T+bk7HPfc9pCUYQ9d3/3cgsJaHbAlEGhCRiGhi
         cPwYpQrxe9ugHsjqzxhKfdENUtYihbHkXR4KKlJlMa1tgJGZES5cIo7LWIOSXFwqxn3b
         abjGaWKX6k9H0BaMa3vQIc9VHJ3GF2VviDjCoW94LBkwhFjLXNu/Y29zj+rGtMi/pKyg
         tGUV1UVlUt/TnKDeq6voRKKgfnRZxEBSAE92oyWSRi5mjPRgyeAWjQ3bKU0jbXwGgTE0
         oc/H312PuZZqZ1X8O8gf174xhJHDM5ODD1J2oqOFtslw/eaVIlYG0TWuZHYQMx/vCm9z
         nR5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4KkUZLnoDxmNoMvmtpy12/GZCcBttJXZVDdyX1fIRRIatGmYgHi22SKzWBCCMlmwUcS49NOEoIXs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwW6LcR2RIHDVk0hSmpK811PimD/Y/gnZ8pg0qK2D1nnoU/qQHU
	VHVgC8dsvNN5exElrqNuUc2lv83fer+HlzgHHJ5Q1QPLRHcNQcLO42hXwbBPbkw8gJXOrW1cGdN
	rRg==
X-Google-Smtp-Source: AGHT+IHUB40lOCD80Q5A00V1WQKvc1RxNXM54i1GatM+tLTBSJUgVajSxluMfJ5vbUhuhTOMyPxhV+F0hQ==
X-Received: from wmpo35.prod.google.com ([2002:a05:600c:33a3:b0:477:14b1:69d7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a012:b0:479:3a88:de5e
 with SMTP id 5b1f17b1804b1-47a8f92029emr95871135e9.37.1765817518200; Mon, 15
 Dec 2025 08:51:58 -0800 (PST)
Date: Mon, 15 Dec 2025 16:51:52 +0000
In-Reply-To: <20251215165155.3451819-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215165155.3451819-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215165155.3451819-3-tabba@google.com>
Subject: [PATCH v2 2/5] KVM: arm64: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_085159_959420_6F1C0120 
X-CRM114-Status: GOOD (  11.20  )
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

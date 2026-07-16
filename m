Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2E1C44501
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAwsSjZf2rHXd3/oT0O683oh31kbnT9HpHzc8hzl33w=; b=BeHdwIQn9PwfWk
	0ImH+DqKi52iXiWQ/oyAlPN5PuX6OO4o0RhVmxjwZ1kNZIyOmJ0eMkX/Bw7dL+UFGhHlZNwZfn+Lm
	ysKuXgjPMLEMJoA72UdHE0JHyfM6EDSAfau95XaJH+Vn63rjMRe5ewPyF8Ea7Ea3tsmEP+0Ma4AU1
	b0UoKT06KwVL5XdmrXkGC9WI0pobJ4wZetEy7HrrY4cwIbClZKZIfye0L43gJsvc+MTHO1DLJ+1pA
	beNckaSn8fM+mffQIGO9BDC5DUWrZQjmD+oLwsJw3f6nDxf0bYOv0f3kueBYuHVsTYnKrfueID3AB
	h7oTKyXdkQU78GxZE1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRt-0000000HJWE-3e5h;
	Thu, 16 Jul 2026 12:44:21 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRm-0000000HJMm-30w9
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:20 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-848743155bcso1367535b3a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205854; x=1784810654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqzuyyB7zI40Qj8rdd4/j/Hz77YcBH2L+r/0EHWbI6M=;
        b=C6QRhTV5mo9nVNw+cIvrpS+ZP5zIUiQq87LD0j4lydPnGdyMTOTLOwYOJrcxM71/fa
         z27E8weFdL1sogXnC5TJvbQ6zh7G5iuwtW7EfYQ3lqAHgmFCLB5A4DNKunJDShlyT4e7
         um0/ibTQhd63a5Nznh9pn9i0z6vWvyV9ylM7b56l4yRfugpUXH08jkUiVCer1hCfxorS
         weRTJNm+xvbZb6pd2O4gVnlohmHMjdzn/+lzkp03LXkp/6QDxayOy1UWJO9406nWkB0/
         8q1jynlwydR6nlI8eXEkPXVv8imA8ULuwE/atD5O8jWLVt0Wh0Jq4Rjiv2A6a0VkdWJQ
         rynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205854; x=1784810654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqzuyyB7zI40Qj8rdd4/j/Hz77YcBH2L+r/0EHWbI6M=;
        b=U0Y8Cq/vke7sREaPqeR7ek+s8gqXo1fqd6aTK2E1bqlwk9+izmgghISoSEJAT2e5cO
         qW1cvk/sTiRPrLxNX044wugJ1nmwcaElXTDwC+3TwIQS7WGSb6yzaKl6LAfnbawDkLeD
         jIOc5apQuCjArD1iqxLWZ5LbOgh/1ZQi7CwzezF+IvsT+fzl7eyMNZUnl+knOnQrbuLc
         22Xb6wU6zdr4YRbBp9TzeQJgm92R0jKcQuJ+kPeoeiAHaHFoSULqN7yETnaLP016abSY
         caErBOnSojSPPUo/9tiBYQBhvb5a4BRzwuczjf6Mpt0WJf5NzoFoVCzFW8op64n9Gyxg
         OZBg==
X-Forwarded-Encrypted: i=1; AHgh+RpNTh2tGKNFjwIpA0m6kPGPKGx4DEwWfj48Qzwqmsy1mGeN2rfj8dxg+4cNpHrqXVV79BN9Ju/r6+k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVednn/9mcdS2z9TJdqTc8gNqXfBfPE0EP0Q1TwmVCKKk1hC7c
	CC5pBs+trzS2R4B2duNN4CmGUA/gqmc0BF03ZEbJ7ikvQ0EkPl1yqUvxcoR58k0ABMI=
X-Gm-Gg: AfdE7clovzRCEe1aYO4ZJ9a3VdFqK3B17zZ0+qTMDYiaLW4hd/HT1VNxsUjAZGV1xk8
	Kmzji8bZh8/8E60YIrI371Sjre7gDZ+yqKtq/0kq11ThMEjzEmlvWzhvGwjIsbJ/bmxjwKIlG0I
	X1Qxe4PmbJo8WNZfo42SKAcRz/Y6Wa8LBYa0yARsYq89jUkSSANdvADx9GQsYL/eRbG8OfmzVQk
	9RWFgpywftqXypkNjI2xT7TCsjUT2vfE0WoL0NlVhLiGrO0bXBEktXa7fLWLkjZphqwDPc4tPp0
	VWlBS207APM9xMR+A0wuGnDUenSBlPcJA8aFc2s0ESaw8zL1lAwNdiiQ/lXbwKyCLLmjP3Z8R/e
	9WwYq5lIC+OAnn6BD+cNmIHZM7bVsC3oIqDj6BOOJVT5DKG+xgegaPV4r1XIG6rNVrRpgcmObgf
	VpC9jTiu/JPVnPrM9k979s4l4=
X-Received: by 2002:a05:6a00:21d2:b0:845:c6fc:2821 with SMTP id d2e1a72fcca58-84889604f51mr19555102b3a.22.1784205853705;
        Thu, 16 Jul 2026 05:44:13 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:12 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 10/15] mm/gup: add fast-GUP specific lockless PTE helpers
Date: Thu, 16 Jul 2026 20:41:45 +0800
Message-Id: <138d74aa9863ae8ff445e16a2798d062895b75bc.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054414_770869_D792BA44 
X-CRM114-Status: GOOD (  10.50  )
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

fast-GUP snapshots a PTE without holding the PTL, pins the page, and
then revalidates that the PTE did not change. Keep both reads under the
same lockless PTE semantics by defaulting the fast-GUP revalidation to
ptep_get_lockless().

Introduce fast-GUP specific PTE snapshot and revalidation helpers. The
default implementation preserves the existing ptep_get_lockless()
semantics, while allowing architectures to override the helpers when the
public lockless getter provides extra semantics that fast-GUP does not
consume.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 include/linux/pgtable.h | 18 ++++++++++++++++++
 mm/gup.c                |  6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index da14328093a86..62943fcbf7046 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -813,6 +813,24 @@ static inline pte_t ptep_get_lockless(pte_t *ptep)
 }
 #endif
 
+#ifndef gup_ptep_get_lockless
+static inline pte_t gup_ptep_get_lockless(pte_t *ptep, pte_t *rawp)
+{
+	pte_t pte = ptep_get_lockless(ptep);
+
+	*rawp = pte;
+
+	return pte;
+}
+#endif
+
+#ifndef gup_ptep_revalidate
+static inline bool gup_ptep_revalidate(pte_t *ptep, pte_t raw_pte)
+{
+	return pte_val(raw_pte) == pte_val(ptep_get_lockless(ptep));
+}
+#endif
+
 #ifndef pmdp_get_lockless
 static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
 {
diff --git a/mm/gup.c b/mm/gup.c
index 99902c15703b0..72fb147193e55 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2842,10 +2842,12 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
 	if (!ptep)
 		return 0;
 	do {
-		pte_t pte = ptep_get_lockless(ptep);
+		pte_t raw_pte, pte;
 		struct page *page;
 		struct folio *folio;
 
+		pte = gup_ptep_get_lockless(ptep, &raw_pte);
+
 		/*
 		 * Always fallback to ordinary GUP on PROT_NONE-mapped pages:
 		 * pte_access_permitted() better should reject these pages
@@ -2871,7 +2873,7 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
 			goto pte_unmap;
 
 		if (unlikely(pmd_val(pmd) != pmd_val(pmdp_get_lockless(pmdp))) ||
-		    unlikely(pte_val(pte) != pte_val(ptep_get_lockless(ptep)))) {
+		    unlikely(!gup_ptep_revalidate(ptep, raw_pte))) {
 			gup_put_folio(folio, 1, flags);
 			goto pte_unmap;
 		}
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

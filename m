Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDE0C4450A
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8SMmrvhvuA2mVsy9ZuPksGf0SxhYs9rFhP/TFZPeSc=; b=k02G34shzEaWg0
	3UQdW2AGVo0wcV+GC8yRI1PvF4YhLyduNb952rt8Hbu0mjZVv6Zrgl8aSywnjhP/M6IW99mW/H991
	i4WafB2j9Pj0TcWjy5qvUhN2562YDXOJ4MdQcRLgA6Zv5idKVwqbzpYDrLyhIK8JlD4iT57ajEsgA
	gdIVpBNgjKZGgs5yniK43KkDAL1FuNY9mkC06ydWMm9ZPSS2UZdY/7jyab/ROBRcRz+EWnoRHjJ2v
	3sZ2/HBFMupNpCpCrXECRYOCwsDdvNZVjUPyrTGX+ZO6F6oUNqv0ZwPheQ8PxxOkRppzjUW5AupN0
	3iuboVuE5dJqa25tz+sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSF-0000000HJx7-0Duu;
	Thu, 16 Jul 2026 12:44:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSD-0000000HJth-03ZW
	for kvm-riscv@bombadil.infradead.org;
	Thu, 16 Jul 2026 12:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s0haKjxFEA+XqfWLiPeMGRklJhvkZG2bsdABvuKjaV0=; b=BnowcMcnbk1gDaqz7jikTxFaIP
	jP9pD+e4n1x/4V0aOZhX3vK9uFMQKTGMMsflgwunFSkPJyMepYxIL1T1dEy9sxbcxoCSa9r3ckAEK
	l8Z7VhsbEq6U+AAkEwizrsr6mRjcWvcHGFgWQnJctpv7Q7JWqnX9gH91sMaJyg2q3kfEEppWzzJie
	Su7tGg3nQcBqgyJhKKYutdLgAhaNCpqoODXTKdUwgFkaS6X00Gq63tv8Vo5uBfl/3aJSe0DbXSS3q
	nIoQBsAxtJFWJ9GpBRZJ/Jcy8C4MVZ6dnKhC68ljAoZCF4ctjbUiHN2WRo+2irvnfrvgEul/uCocj
	cFIVebcQ==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkLSA-0000000E37K-0bST
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:39 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ca913a601fbso4545373a12.3
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205872; x=1784810672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0haKjxFEA+XqfWLiPeMGRklJhvkZG2bsdABvuKjaV0=;
        b=bNzOVh7I4KaEO+bBuo529tYKucrzCStv4ETdl9vE4rKZgwVkg0B2iqUd5ulFShjcNV
         CrcGmE4ACoXM+COE4QQU0UD0CzR55uT0zyt7zhiMLPHMVwZnH53C+9dSdySO14QgM3vG
         kMMpduIiHTgBdWCYi+KSRwWiV24nke872fqgsl9hxaapP5IviXlB+JD8IW8JFvRhFxHH
         R18BUOxMvBhjh/d4SsMJ/NhYZSnKvtfnFA56zVEb6VrYZC2r8dxG4Sx9/eRvvVT9afe0
         k6kA4SFAp9VljycYPQKeySYoKD4p8Q0XykmpBqWdiXb81YWYm3yyXuVWYlUZkcYznOE6
         hxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205872; x=1784810672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0haKjxFEA+XqfWLiPeMGRklJhvkZG2bsdABvuKjaV0=;
        b=TVfbxgX+2g7kaB9PLoQ3NVZZENIDzo93IenQOvOucZXgJ8HkW7EDg/3Y63V4nm99o/
         MzGESQxt/gm41a985uTw3Fl1aQdA/5B+d/8THNJAIk6uq8t/5MtvHLyDaN+GDBHwF5jJ
         5nweUrMw18lraIdD4yWyE1qoy+tyDYP3EOwQVtGn1RsUBuDjJjONw0JD7N2alWMRj5jr
         LNTeqmf0OcqX7louP3K7gTLQmkjA0v6V7YiHjMjK99VB3N0J9JrFrS18OfLKVKPHCXZl
         vCMFDbJ117OHGnQbJBsmq4mO9tYS0n/BafJM3PIVSU9SGfNrgN0jJyxe3/uYVk5BG3Et
         S3lQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWnco5xgP85HhTdvxZWYwkiiwvIYhYuueHick830d9EH33PwTpNpumNy4cWO7s01hkkPIi5bi0jVQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Lj1iUbifOaoNwkSpu9P3Jiqeoo3BNQ0ZaT4r2IBcduzVnpAj
	ob5wVC1EVjgN7hhKDNq4RQA2l8Y8R0Bow+6lOZv2NWYPF6E+w/HF0SX1NgrSbvXT5Hg=
X-Gm-Gg: AfdE7cnYsZKQ/ibuhdv+BAX8fatKLM5N/xYdX4bmbR0cnMJDwPDNo/iKAkfe7MpWv7M
	+uhPWfbh1LFoZgD1byl2z2eiByjEp5UTTKeu/PoVRyUVX+yf+c5CAWjZEnSOgsdYrXNlCd66w3e
	3LQwaSFWllj89VdhaLvca2RupO/7aDvu8k1tifXkm3RMXjW2Ytn/YvicV9WAS72jTvjyRI+8LXx
	XZrY2dtptdhTB7r/QEd+aEZv3wzblTltIfiRLaO17uPJdlgtdreVRiEowl2w9RpcMTWI+RTMfr/
	k+QiSCmcUIzStMUlITQaT3cJ9e0TfTyNvRpcSAg2a8atwVO5C9WehDas+3keDYjrQNjFmhu9sTp
	CxRGWJzHJTgdTVpfs6NcSmyx8nbs0XxUV3U061LfEDOxVJ2c4/1+OT21wb84PfuVGVrUgDDRbpE
	Yr5/XX1STeaNfg5ih8afvhwBpM+5giFJOxfA==
X-Received: by 2002:a05:6a20:e615:b0:3c0:9c19:6590 with SMTP id adf61e73a8af0-3c3576c37f6mr12235735637.74.1784205871769;
        Thu, 16 Jul 2026 05:44:31 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:31 -0700 (PDT)
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
Subject: [PATCH v2 12/15] arm64: mm: avoid contpte A/D aggregation in fast-GUP
Date: Thu, 16 Jul 2026 20:41:47 +0800
Message-Id: <92fbae3247b4bf0d7989ba20a8763ecb836d0279.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_134438_314368_D2C89E3B 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

fast-GUP only needs the PTE state for the current virtual address and
revalidates the raw PTE after pinning the page. It does not consume the
contpte block-wide accessed/dirty aggregation provided by the public
lockless getter.

Override the fast-GUP PTE helpers to use the raw PTE for the current
entry and raw revalidation. Keep the public ptep_get_lockless() semantics
unchanged for other lockless users.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/include/asm/pgtable.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 018781a1fcbee..d1e08dce9f7c5 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1760,6 +1760,22 @@ static inline pte_t ptep_get_lockless(pte_t *ptep)
 	return contpte_ptep_get_lockless(ptep);
 }
 
+#define gup_ptep_get_lockless gup_ptep_get_lockless
+static inline pte_t gup_ptep_get_lockless(pte_t *ptep, pte_t *rawp)
+{
+	pte_t pte = __ptep_get(ptep);
+
+	*rawp = pte;
+
+	return pte;
+}
+
+#define gup_ptep_revalidate gup_ptep_revalidate
+static inline bool gup_ptep_revalidate(pte_t *ptep, pte_t raw_pte)
+{
+	return pte_val(raw_pte) == pte_val(__ptep_get(ptep));
+}
+
 static inline void set_pte(pte_t *ptep, pte_t pte)
 {
 	/*
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

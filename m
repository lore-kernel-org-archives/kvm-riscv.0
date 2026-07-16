Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0121C44501
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0aB/xGlfZ47FCxsHfQ16DntZ7QEfUVxqhnUD4XAyNg=; b=gELKOZAmJ3n4Fl
	9JmHmfEM2++sqHvMCKKM7s47bHGwLf9Nwy5GN0HfR1fSnqNb1J8y28X6+0Sptxvv+t8aKvXWP9YeA
	sNc99Uyfmf1FMhDdGmp4yySgOJr0+NGpr3eY749yrljBGmZHNgQ7w4OZt/WcrpwFgAc7XEmpsynw2
	3BUkSiHCqDyLrhHupEAaPqxDWRgZznndJxCi4bSmqDz3zJgnWC1NqavvLJhElUZS8FDsxgLBqiSMG
	GenqVHYqwaDztac8kGS29NZIDN9MgPFQPsMpHZYRaoIpBNATgGMZHLmSOFViHFEI+8Us4p6kOQzDK
	NP6yET1oQvu8CCRYD7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRO-0000000HIpk-1PKr;
	Thu, 16 Jul 2026 12:43:50 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRL-0000000HIlW-1SME
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:43:48 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8484f229529so2313745b3a.2
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205826; x=1784810626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpVNfPM2loki1/2WSjY19UJOAg4x0MrZ4b63t+Pbr9Q=;
        b=lyuLzvXdRLLhuj3d0zlhHMLxj0HW8DPPBBF7R6Jeh8ri+hWUfH1q8kX3WET4DPz3dV
         WR4beW/y/8pWRtKc06E6QMASC2Z8tkgtCnwBllF25jevxhBm4/prqmNA1bva/Lo2pop/
         GFePlMjjEbY1QgFlUEUcx1yEgcYK8hiboTnrtJC1WSXhl4kEHXPFd3/H+ODoDk6u4Nhp
         umHphZ93fZysNQctOji8wG3nijRUlkhk1pI5O6jYV2ur17pdTGaJnlhYsLRgowT+Nlx7
         wY7umP1QNrXF1agpFU76NpqI6IxvlFf/rmt1mb+GgykEfFyBFemCK7l+ZT+GdB0Q0mOU
         lFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205826; x=1784810626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpVNfPM2loki1/2WSjY19UJOAg4x0MrZ4b63t+Pbr9Q=;
        b=f+oLPjEqaXP+gLZgvk4EF4OYFJx8vX+FGbWtFNwyzM9i6erakQh2fNUg3d4bUzlqx7
         BbG44rUbX0o7mxmHRNBrK0wLRqSkt8Fy5hrjDLvaSqulGPnCYnFTK6o7/JLIfSeoMC7K
         OXyRnlTmlcj4KEToNgdfTRqnRNV9x1AwtXu4YT5lqa/mwgqIaW8S4tFol+dNmyaeKEW5
         LBrPI1EYlNx8T9uz4SXP2xV084JEw6ji0TvTqXGQN/Pbtmu1XMRyE4ZmNvxoUN/xqzb6
         vOwAiVokTw+KEpApg8U/MRVcZY5QIwvedC+uE5JFodj1l3tcJeiOLtZP/ovPFt7rBdup
         fORA==
X-Forwarded-Encrypted: i=1; AHgh+RrGy6FJE7cyCzH4Weubylgqi7prc+4QRR+sPkR7X0pTpq4ch4rnwdWotohlNS7m8u27YjUmImc+UE4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2GsRy6YKNHarqSaDrUnH4c6xSZSSHORsnDc8AIoAPPmk8sSs0
	mbPVsmAboNZsWymcfvLOMAEx9Z1Ervl4af7i7pVzaltvxMJu4y/pA7egywK60EwWkuA=
X-Gm-Gg: AfdE7ckreQy2AaEwN3K32650a+Ovc6JUPQWkfEeC3dz8Imk0EItdiv7+bBpxTVb62Ky
	Yw8/ZJVymVFN2iuI1wWJqxKFYhxmIV0AkVVz5S3sUejlnWlyvKd4SxI4D8jM3GUJIWhV/pc7t1o
	ieMLcDEdaBV652DkzpWP8E2uEwdElvzUd8HmJgtPIs1j+mivOZis1iImMbtxaOl3/TxCJvduBza
	Ogc/MxBCbIY+QYHLp+sTljHVfS8pejiHMix72xEeitFVaBNOQo/VNGQJC/7ewdnZjMcA2RDfZF6
	fPK49fTBW3EpVnYTSw1aohjNp5IiJTzm+pEezIgGy9899lxYZulQY1dx4ugLb+7HtG/gSbJ+9i/
	CHXzi8A1zFOilqbZr+iobQ9wfUdZGtY8isB7sz0OBy/l8uGOxcDs8UZZ5IXl9V2unmvTCofCAWp
	Sgb4/5JTNiI8hzqgbGLdWNMmk=
X-Received: by 2002:a05:6a00:451c:b0:848:2f74:d8d8 with SMTP id d2e1a72fcca58-8488986dd0bmr19929855b3a.73.1784205826475;
        Thu, 16 Jul 2026 05:43:46 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.43.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:43:45 -0700 (PDT)
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
Subject: [PATCH v2 07/15] riscv/mm: preserve Svnapot leaf-size semantics for page-table consumers
Date: Thu, 16 Jul 2026 20:41:42 +0800
Message-Id: <180084b20de76f7ad61641e9b7abe6d103caf5f3.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054347_390270_687216B2 
X-CRM114-Status: UNSURE (   9.04  )
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

Svnapot keeps a folded 64KB mapping encoded in the page table, while the
public PTE helpers may expose a logical per-page sub-PTE view to generic
MM users. That logical view is suitable for leaf-style PTE consumers, but
it must not change the effective leaf size reported for the mapping.

Use the original page-table entry for leaf-size queries, so page-table
consumers continue to observe the Svnapot leaf size instead of incorrectly
treating a folded mapping as PAGE_SIZE entries.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index da7ffea0dcd98..e4b9c05014c00 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -580,6 +580,17 @@ static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
 					napot_cont_size(napot_cont_order(pte)) :\
 					PAGE_SIZE)
 
+#define __ptep_leaf_size __ptep_leaf_size
+static inline unsigned long __ptep_leaf_size(pmd_t pmd, pte_t *ptep, pte_t pte)
+{
+	pte_t raw_pte = READ_ONCE(*ptep);
+
+	if (pte_present_napot(raw_pte))
+		return pte_leaf_size(raw_pte);
+
+	return PAGE_SIZE;
+}
+
 void __napotpte_try_fold(struct mm_struct *mm, unsigned long addr,
 			 pte_t *ptep, pte_t pte);
 void __napotpte_try_unfold(struct mm_struct *mm, unsigned long addr,
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

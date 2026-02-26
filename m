Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2107AFC592F
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 11:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bNHFNo9EGka0TjIQFP+idoy66oMtNJsww54KKiX1Jpg=; b=KxSHRYpZ3wCNgb
	KM30TmwFtvCRULx1SH3stHfx0ZGjwVKqPv0lVVWZDdTEBvElkY/m5LvjYiXOTLojODflLbuPYQznR
	xPo9/7aeFcQEZD/lGxjpYbIvbRdXNtjwYJtJP+x6g0qgu7Q9pYrCr937wxBoczI5qij5WwJsfEI8L
	F+ow1eItMEuU5I/KfVk6jtqftLj9IqQO8yrXMQjwbOpLi8maIl1l6rnZsQEMBy6Ad8ih6ulT53OV4
	wI8Caf59x1cVd77yjCzI0E4+VQ0hYsG6CF6Rh2yjCvzZFfGEb+ogLW38BYrmLgWd+mw97zf3SsN9P
	RGbUrYO2XOCl3+WI+MAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZIQ-000000060RA-33xF;
	Thu, 26 Feb 2026 11:12:42 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZIN-000000060Qc-3LYR;
	Thu, 26 Feb 2026 11:12:41 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fM81r3FFGz5B12j;
	Thu, 26 Feb 2026 19:12:32 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl2.zte.com.cn with SMTP id 61QBCSIt045768;
	Thu, 26 Feb 2026 19:12:28 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp05[null])
	by mapi (Zmail) with MAPI id mid12;
	Thu, 26 Feb 2026 19:12:31 +0800 (CST)
X-Zmail-TransId: 2b0769a02a9fca6-36487
X-Mailer: Zmail v1.0
Message-ID: <20260226191231140_X1Juus7s2kgVlc0ZyW_K@zte.com.cn>
Date: Thu, 26 Feb 2026 19:12:31 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <liu.xuemei1@zte.com.cn>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBSSVNDLVY6IEtWTTogU2tpcCBUSFAgc3VwcG9ydCBjaGVjayBkdXJpbmcgZGlydHkgbG9nZ2luZw==?=
X-MAIL: mse-fl2.zte.com.cn 61QBCSIt045768
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Thu, 26 Feb 2026 19:12:32 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69A02AA0.001/4fM81r3FFGz5B12j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_031239_985753_ACD32880 
X-CRM114-Status: UNSURE (   7.56  )
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

From: Wang Yechao <wang.yechao255@zte.com.cn>

When dirty logging is enabled, guest stage mappings are forced to
PAGE_SIZE granularity. Changing the mapping page size at this point
is incorrect.

Fixes: ed7ae7a34bea ("RISC-V: KVM: Transparent huge page support")
Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 0b75eb2a1820..c3539f660142 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -535,7 +535,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
                goto out_unlock;

        /* Check if we are backed by a THP and thus use block mapping if possible */
-       if (vma_pagesize == PAGE_SIZE)
+       if (!logging && (vma_pagesize == PAGE_SIZE))
                vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);

        if (writable) {
-- 
2.27.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3415CEB7EAC
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hwBNdzGMpbsxsEVjkqjsVWArWNbIZcaiL2/EKkVtf0=; b=ifloGWGh0nBFma
	31RY9rEhjHXOy4cZRKX0L4p49mH/j+XtvscXL7JeYEgs507lyr8knVC00S6h0kKO8S2QAJfP+H14H
	SPCpO1/kocrEXlGp3cVl60X0wFvkJy9gq4LUP2L6fgnGumDQe5u/lTVcv9C25/yBX2LEmnmlzNgsI
	J7DiqCgoPiMyV0N2gp+TXjZMzegJEDIwSKN/xDj2i+kPatC5ssaYHOOK6P4nogY2eUt9lRC90HXyx
	qZ7JxPFKoiw1hVdRbNILmInaMgubnD9waj1+cB33NTugVTgYgMazmPP64AWFiI91QTjsX8iL4p30W
	rpqm0vW/Ni4TBi14DivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiZI-0000000GsGU-3rNp;
	Wed, 04 Mar 2026 09:31:00 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiZF-0000000GsFY-3Pdz;
	Wed, 04 Mar 2026 09:30:59 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fQnTq1RMmz8Xs72;
	Wed, 04 Mar 2026 17:30:55 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl1.zte.com.cn with SMTP id 6249Uk2v099658;
	Wed, 4 Mar 2026 17:30:46 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp06[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 4 Mar 2026 17:30:49 +0800 (CST)
X-Zmail-TransId: 2b0869a7fbc9022-35137
X-Mailer: Zmail v1.0
Message-ID: <20260304173049328qFHOTh8G2sgzCY7pyCVpr@zte.com.cn>
In-Reply-To: <20260304172139131ChDubMSpGDUB03lY4UCbK@zte.com.cn>
References: 20260304172139131ChDubMSpGDUB03lY4UCbK@zte.com.cn
Date: Wed, 4 Mar 2026 17:30:49 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDMvM10gUklTQy1WOiBLVk06IFNwbGl0IGh1Z2UgcGFnZXMgZHVyaW5nIGZhdWx0IGhhbmRsaW5nIGZvcgoKIGRpcnR5IGxvZ2dpbmc=?=
X-MAIL: mse-fl1.zte.com.cn 6249Uk2v099658
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Wed, 04 Mar 2026 17:30:55 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69A7FBCF.000/4fQnTq1RMmz8Xs72
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_013058_012948_57087297 
X-CRM114-Status: UNSURE (   7.97  )
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

During dirty logging, all huge pages are write-protected. When the guest
writes to a write-protected huge page, a page fault is triggered. Before
recovering the write permission, the huge page must be split into smaller
pages (e.g., 4K). After splitting, the normal mapping process proceeds,
allowing write permission to be restored at the smaller page granularity.

This ensures that dirty logging works correctly with huge pages.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/gstage.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 92331e9b0bb8..27ea6bb81553 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -171,6 +171,9 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 {
 	pgprot_t prot;
 	int ret;
+	pte_t *ptep;
+	u32 ptep_level;
+	bool found_leaf;

 	out_map->addr = gpa;
 	out_map->level = 0;
@@ -179,6 +182,12 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 	if (ret)
 		return ret;

+	found_leaf = kvm_riscv_gstage_get_leaf(gstage, gpa, &ptep, &ptep_level);
+	if (found_leaf && ptep_level > out_map->level) {
+		kvm_riscv_gstage_split_huge(gstage, pcache, gpa,
+					    out_map->level, true);
+	}
+
 	/*
 	 * A RISC-V implementation can choose to either:
 	 * 1) Update 'A' and 'D' PTE bits in hardware
-- 
2.47.3

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

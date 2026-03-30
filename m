Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC664FF495F
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/AFahk29Dwg3ocbPjTu4DEPALl7SAUIDefXtELIIKs=; b=tAHvIT0/Wfeiwz
	Dthfj7kjYNhdFEBQFEQOJ0XCYBnuQ24AjE8zyMSRHqfWagdxtRoncQLSDzYpHcGcDsqIMuU9R2R6j
	c7w/YGCtBbr3emHI8hAb4zR+YNQvH/dOZhojROIX3yEoFUgFVy5Dio2vlkCW+zE8Ejst7dMDfmspx
	qsi04Jm0uQYBY2HD1MJrAxRcYWFmkkQxY1EjwGTaZcuqs35cQQCnQnbFWsTimjloaCQBHny8aQ7oM
	AtpCp7829K4ZFw6EH/vA7Rzl5Bm9WkPmRsIg8EFQ5NalslAelKwWYHFlmlQFKzfv8F7mWMEOVWMfs
	jQ8jOrxzAORoU+RMzsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77iR-0000000Ap46-2W5y;
	Mon, 30 Mar 2026 08:11:19 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77iO-0000000Ap3d-0I1P;
	Mon, 30 Mar 2026 08:11:17 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4fkkTZ4XM2z4xQXF;
	Mon, 30 Mar 2026 16:10:58 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl1.zte.com.cn with SMTP id 62U8AoVV052344;
	Mon, 30 Mar 2026 16:10:50 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid12;
	Mon, 30 Mar 2026 16:10:52 +0800 (CST)
X-Zmail-TransId: 2b0569ca300cccd-3bc1a
X-Mailer: Zmail v1.0
Message-ID: <202603301610527120YZ-pAJY6x9SBpSRo1Wg4@zte.com.cn>
In-Reply-To: <202603301608170032mtkGKX7wRcAkPKDQ5I-F@zte.com.cn>
References: 202603301608170032mtkGKX7wRcAkPKDQ5I-F@zte.com.cn
Date: Mon, 30 Mar 2026 16:10:52 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHY0IDEvMl0gUklTQy1WOiBLVk06IEZpeCBsb3N0IHdyaXRlIHByb3RlY3Rpb24gb24gaHVnZSBwYWdlcyBkdXJpbmcgZGlydHkgbG9nZ2luZw==?=
X-MAIL: mse-fl1.zte.com.cn 62U8AoVV052344
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Mon, 30 Mar 2026 16:10:58 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69CA3012.001/4fkkTZ4XM2z4xQXF
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_011116_665347_A6B0CA02 
X-CRM114-Status: UNSURE (   9.97  )
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

When enabling dirty log in small chunks (e.g., QEMU default chunk
size of 256K), the chunk size is always smaller than the page size
of huge pages (1G or 2M) used in the gstage page tables. This caused
the write protection to be incorrectly skipped for huge PTEs because
the condition `(end - addr) >= page_size` was not satisfied.

Remove the size check in `kvm_riscv_gstage_wp_range()` to ensure huge
PTEs are always write-protected regardless of the chunk size. Additionally,
explicitly align the address down to the page size before invoking
`kvm_riscv_gstage_op_pte()` to guarantee that the address passed to the
operation function is page-aligned.

This fixes the issue where dirty pages might not be tracked correctly
when using huge pages.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/gstage.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index b67d60d722c2..d2001d508046 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -304,10 +304,9 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 		if (!found_leaf)
 			goto next;

-		if (!(addr & (page_size - 1)) && ((end - addr) >= page_size))
-			kvm_riscv_gstage_op_pte(gstage, addr, ptep,
-						ptep_level, GSTAGE_OP_WP);
-
+		addr = ALIGN_DOWN(addr, page_size);
+		kvm_riscv_gstage_op_pte(gstage, addr, ptep,
+					ptep_level, GSTAGE_OP_WP);
 next:
 		addr += page_size;
 	}
-- 
2.47.3

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

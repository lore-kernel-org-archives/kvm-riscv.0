Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D58CD37B9
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6N0BbQD8Vqv36kRHaaMNjbY1HkgW62UIZtdoLM7iXkI=; b=ELVF6x2JCj30JQ
	1C5RUGJ2nslqUXm83lr2kEORYOeZMdn52BjAbjAa6Yg91aDsVdQGTlzun8Wy+8/sAds6mEBhr+qgH
	vWfWYHK7U5j4FctNS9uQXTPWSHqWRqRrAnnOcEtWDUDuhQKbghzkiVWyCETFyOda0F8/ZZkqr9TIP
	I99SQ3shGN5CR3nQOaptbcWyuX0Jd7qbvJTD+l6atNR5Huur12e6Jql5LW0XokgJEkWhS89DpZeh1
	Ix39UhtlaWlBw0XmUYCxnOM1Hm9VSXSkahuLdd37OgfKfxChkWghBY2zwyHCPocjhoLgJP1jB/plP
	Tai7ULSEqA8lsTEHP8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOqu-0000000DKXb-1lgy;
	Mon, 11 May 2026 11:31:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOqr-0000000DKVl-3OPg;
	Mon, 11 May 2026 11:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Date:References:In-Reply-To:Message-Id:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AGDgH5W/fbVmR0Evm0KlC5NaBLklHhjrpvHq9pBctdU=; b=ZGTaUN1F3hnO2GcyIRJFICO4oi
	Yoy8Cm9669A184C6b0WQPc9Vpez1RqixGWqY7w8GNy8QyMgdc0k8SX2ayb21S5TdbUyC4T9PFmXAw
	SF2gdx3Gitd0idfUyK1WdDfgChEMb7p0r6PtAIc796Iuvikwehz0VbvVmb/bdWPnWGRahwsPajY4i
	cuMX/Dn0OQGU2UYQwLykZO6SbuA5ho2YfoRZ3vRMQHrUWsYoGTGQBSfH8MjxYe3AxJwKQZqbUS6vA
	C+Y1QaVA8khrWFnIPRMbIdojO/QnljiIWcoDxiSCyjzKGgOrCDbs7Av1p8knCUlUAJH0AewzusEj6
	3UUVK0wQ==;
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOqm-0000000BTj0-3RGp;
	Mon, 11 May 2026 11:31:07 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gDcx23sZnz8Xs6v;
	Mon, 11 May 2026 19:31:02 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 64BBUx8g013401;
	Mon, 11 May 2026 19:30:59 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202605111130.64BBUx8g013401@mse-fl2.zte.com.cn>
Received: from njy2app02.zte.com.cn ([10.40.13.116])
	by mse-fl1.zte.com.cn with SMTP id 64BBTFMV000366;
	Mon, 11 May 2026 19:29:15 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app04[null])
	by mapi (Zmail) with MAPI id mid204;
	Mon, 11 May 2026 19:29:18 +0800 (CST)
X-Zmail-TransId: 2afc6a01bd8e1c1-4ac99
X-Mailer: Zmail v1.0
In-Reply-To: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn>
References: 202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn
Date: Mon, 11 May 2026 19:29:18 +0800 (CST)
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <linux-kselftest@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>
Cc: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <pbonzini@redhat.com>, <shuah@kernel.org>, <wu.fei9@sanechips.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDMvM10gUklTQy1WOiBLVk06IEZpeCBza2lwIG9mIHZhbGlkIHBhZ2VzIGluwqBrdm1fcmlzY3ZfZ3N0YWdlX3VubWFwX3Jhbmdl?=
X-MAIL: mse-fl2.zte.com.cn 64BBUx8g013401
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Mon, 11 May 2026 19:31:02 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A01BDF6.000/4gDcx23sZnz8Xs6v
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_123106_367506_FD83E942 
X-CRM114-Status: UNSURE (   8.37  )
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

Same as kvm_riscv_gstage_wp_range, the possible valid pages should not
be skipped if !found_leaf. Different from wp case, which can
write-protect more than asked, unmap can't do that, no splitting is
added right now but a warning is logged instead.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 arch/riscv/kvm/gstage.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 2b141a78ecac..d78f5aeb8b40 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -395,15 +395,19 @@ void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
                if (ret)
                        break;

-               if (!found_leaf)
-                       goto next;
-
-               if (!(addr & (page_size - 1)) && ((end - addr) >= page_size))
-                       kvm_riscv_gstage_op_pte(gstage, addr, ptep,
-                                               ptep_level, GSTAGE_OP_CLEAR);
+               if (!found_leaf) {
+                       addr = ALIGN(addr + 1, page_size);
+               } else {
+                       if (!(addr & (page_size - 1)) && ((end - addr) >= page_size))
+                               kvm_riscv_gstage_op_pte(gstage, addr, ptep,
+                                                       ptep_level, GSTAGE_OP_CLEAR);
+                       else {
+                               WARN_ONCE(1, "Skip unmap range addr: %#llx, end: %#llx, page_size: %#lx\n",
+                                               addr, end, page_size);
+                       }

-next:
-               addr += page_size;
+                       addr += page_size;
+               }

                /*
                 * If the range is too large, release the kvm->mmu_lock
--
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

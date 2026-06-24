Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B03CDB47F
	for <kvm-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKpYlOn6Rl9Yh5A4vKsJ+5GO+Eethd4a1tHqlDXngio=; b=TBFPpao3Xpu6hE
	rAc36j032oAqBpBMlgxQiqVF4nV9WuOE7mKvVsfX94wwHloK92jnTlDzm8k1Q8XxvnUlYTzfI9Htv
	5B0oi0MqnbNGoVbPrPLlaLkCsR+835flbQgwyyoBpAJQbrygOA4WPugt7tqzlTc824T5DFXvKCpj+
	xOH4RpvLEloe4JJWIigm9AZbpW/LznKFfusj1mGlhTuR+30PnJ18rjtxXyaGoKILt3ez2bPLI+a/r
	aWwgS4kWKM0A1s8WwO0i1zpqw/BCto8XjWbdKwgoc8ArMPpFPVvxSrhuYIRkRNrADKDz1OwUYh8rK
	oMWq2AbzLWPtQKQ1G8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIhz-00000007NU4-2Okx;
	Wed, 24 Jun 2026 08:11:43 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIhx-00000007NTc-0nXN;
	Wed, 24 Jun 2026 08:11:42 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4glZQf5NtCz8Xrrg;
	Wed, 24 Jun 2026 16:11:38 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl1.zte.com.cn with SMTP id 65O8BQd1093302;
	Wed, 24 Jun 2026 16:11:26 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp06[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 24 Jun 2026 16:11:28 +0800 (CST)
X-Zmail-TransId: 2b086a3b91304e2-46faf
X-Mailer: Zmail v1.0
Message-ID: <20260624161128723A8RgX9GQcthwS3so76Ou2@zte.com.cn>
In-Reply-To: <20260624160054463wcDvJaMoydSggcNOWgcfB@zte.com.cn>
References: 20260624160054463wcDvJaMoydSggcNOWgcfB@zte.com.cn
Date: Wed, 24 Jun 2026 16:11:28 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <atish.patra@linux.dev>, <alex@ghiti.fr>, <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYzIFJFU0VORCA0LzVdIFJJU0MtVjogS1ZNOiBTcGxpdCBodWdlIHBhZ2VzIGR1cmluZyBLVk1fQ0xFQVJfRElSVFlfTE9H?=
X-MAIL: mse-fl1.zte.com.cn 65O8BQd1093302
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 24 Jun 2026 16:11:38 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A3B913A.002/4glZQf5NtCz8Xrrg
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_011141_384881_40AB54AE 
X-CRM114-Status: UNSURE (   5.07  )
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

Split huge pages on the range specified using KVM_CLEAR_DIRTY_LOG.
And do not split when enabling dirty logging if
KVM_DIRTY_LOG_INITIALLY_SET is set.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/mmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index bc3bad67d507b..cbda927dd24e3 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -164,6 +164,9 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	kvm_riscv_gstage_init(&gstage, kvm);

 	kvm_riscv_gstage_wp_range(&gstage, start, end);
+
+	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
+		mmu_split_huge_pages(&gstage, start, end);
 }

 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
-- 
2.43.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

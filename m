Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BD9CDB47F
	for <kvm-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggDPY1aAa0LCYafE1/rs0tdOUCoZ/ou7KTZ81YNLq9k=; b=lR/pYPLf5PqiGg
	wOAMNxRGG0GjJkvCs+tFBzvqv+7vlnvnVB11GFByi83gB4Jn4kVbIeYkW/z0yVTXSVQfvCUNOPq/o
	xbTteVboKnJPHKZUjd5/I7J88mtV0QgsVEwPQZudV9HJQOzeP2YK7tzY4O/HX9CZaYQFFiKP2s9Jt
	WmwOiSyuoHkzGMAGINpLvJ0qq5OZox8N6Ov3x5MieLaB32F3rtbAhCAGe7ysH3uDbiLLyGyS8reAM
	Pp6MI+goV/ZuoTVdaZOiw4Ouepj8vao6jnNtwomYO2gSx8wi8xn5ts5a4fnC2lMWaf8ug9z1AJ6kk
	HyWyyoxzphhd5PzEw6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIg9-00000007NNF-0dDP;
	Wed, 24 Jun 2026 08:09:49 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIg6-00000007NMc-1wsj;
	Wed, 24 Jun 2026 08:09:47 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4glZNR5X33z8Xrrd;
	Wed, 24 Jun 2026 16:09:43 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl2.zte.com.cn with SMTP id 65O89VmN002647;
	Wed, 24 Jun 2026 16:09:31 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 24 Jun 2026 16:09:33 +0800 (CST)
X-Zmail-TransId: 2b066a3b90bdafe-1c3f8
X-Mailer: Zmail v1.0
Message-ID: <20260624160933260NTWchyx5a1-4pAhy9HVE4@zte.com.cn>
In-Reply-To: <20260624160054463wcDvJaMoydSggcNOWgcfB@zte.com.cn>
References: 20260624160054463wcDvJaMoydSggcNOWgcfB@zte.com.cn
Date: Wed, 24 Jun 2026 16:09:33 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <atish.patra@linux.dev>, <alex@ghiti.fr>, <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?wqBbUEFUQ0ggdjMgUkVTRU5EIDMvNV0gUklTQy1WOiBLVk06IFJlbW92ZSByZWR1bmRhbnQgVExCIGZsdXNoIG9wZXJhdGlvbnM=?=
X-MAIL: mse-fl2.zte.com.cn 65O89VmN002647
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 24 Jun 2026 16:09:43 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A3B90C7.001/4glZNR5X33z8Xrrd
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_010946_658767_5450D6D2 
X-CRM114-Status: UNSURE (   6.44  )
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

The function kvm_arch_mmu_enable_log_dirty_pt_masked() is called by
kvm_vm_ioctl_reset_dirty_pages() and kvm_clear_dirty_log_protect().
Both callers already perform a TLB flush after enabling dirty logging,
so the TLB flush inside kvm_arch_mmu_enable_log_dirty_pt_masked() is
unnecessary. Remove it.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/mmu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 95e83c50addf5..bc3bad67d507b 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -160,14 +160,10 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
 	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
-	bool flush;

 	kvm_riscv_gstage_init(&gstage, kvm);

-	flush = kvm_riscv_gstage_wp_range(&gstage, start, end);
-	if (flush)
-		kvm_flush_remote_tlbs_range(kvm, start >> PAGE_SHIFT,
-					    (end - start) >> PAGE_SHIFT);
+	kvm_riscv_gstage_wp_range(&gstage, start, end);
 }

 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
-- 
2.43.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

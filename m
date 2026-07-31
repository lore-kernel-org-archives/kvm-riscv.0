Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CEDC5516D
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OipscBqsDf9KqJGlkAcyI58XZvzFXurRWLVpK2YiTgM=; b=X26OIk1MWTWeSd
	VC3N48oyWBTUUeuuFsRcRQElhwj9Wh5mcqKJ+bolSupOTOsxJmtanNqSX8rpWVxXlH0C2vEk/k7GW
	TjoIeJ9LkoAu5sznARk9GnkGPyE2BLMZ/VEneeTc8e0Crg3nkZBy3pZlLsqDCR9FoX5ZE8aZpJy/P
	eiL6nyOVTjHBa2h1HRzWVIFwZFdJqbPmKIlbUJmDu7mjnkgVK+2PFOVva5HOzytDZBiajWTFkveNY
	CcRYIp79TZoJa+bwflDU4odxz+bit1T4t3GDNkr8WcGVI/tg4KQJnsnIF98U4eYxfSu0uNYdx2B05
	ub8BQRArzqmvHqpbJAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjLn-0000000C9jG-2PTO;
	Fri, 31 Jul 2026 09:16:19 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjLg-0000000C9eX-3AwB;
	Fri, 31 Jul 2026 09:16:18 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hBL5z5jTnz57HS5;
	Fri, 31 Jul 2026 17:16:07 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl1.zte.com.cn with SMTP id 66V9Fsox003236;
	Fri, 31 Jul 2026 17:15:54 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Fri, 31 Jul 2026 17:15:56 +0800
X-Zmail-TransId: 3e816a6c67cc010-3c182
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Wang Yechao <wang.yechao255@zte.com.cn>
Subject: [PATCH v5 3/5] RISC-V: KVM: Remove redundant TLB flush operations
Date: Fri, 31 Jul 2026 17:12:08 +0800
Message-ID: <20260731091215.1549430-4-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260731091215.1549430-1-wang.yechao255@zte.com.cn>
References: <20260731091215.1549430-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl1.zte.com.cn 66V9Fsox003236
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 31 Jul 2026 17:16:07 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A6C67D7.001/4hBL5z5jTnz57HS5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_021614_994602_0987D346 
X-CRM114-Status: UNSURE (   8.25  )
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

The function kvm_arch_mmu_enable_log_dirty_pt_masked() is invoked from
two distinct call paths:

kvm_clear_dirty_log_protect()
  kvm_arch_mmu_enable_log_dirty_pt_masked()

kvm_vm_ioctl_reset_dirty_pages()
  kvm_dirty_ring_reset()
    kvm_reset_dirty_gfn()
        kvm_arch_mmu_enable_log_dirty_pt_masked()

In both scenarios, the caller already performs a remote TLB flush after
dirty logging is enabled, so the TLB flush inside
kvm_arch_mmu_enable_log_dirty_pt_masked() is unnecessary. Remove it.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/mmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2362eeb6c08a5..5a93cffa9ad7f 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -163,14 +163,15 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
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
+
+	/*
+	 * remote TLB flush is not needed here since callers of
+	 * kvm_arch_mmu_enable_log_dirty_pt_masked() already do it.
+	 */
 }
 
 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
-- 
2.39.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

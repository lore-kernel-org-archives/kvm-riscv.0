Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171A8C43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwvNotO6V+ZPN7uxqlrEmbDwe54J0X5Jh+2NQ8IPj/A=; b=ON5W6ToeW+pDbP
	ydIBTtCenHQn8uoWsHV8Waa2/xeyIcETP5nQwAueDgIlxEG5Uue3zqNHoUjUJ9ww0PJ6ZTJ/k9sDI
	2pHXPMS8wpXkq+dVbfcPMmFsiC1kDMsgWxqIzyhVbGj5MfiiaFukGXCMp+yJ2Cl4c8mnTh4/lrSZP
	xdcjYvQ4sJUhft6oVMtGdnhQAXpnPEEbLg87CW39jFdRXevik19gt8UTEqkqNmGlku8uuqGMlQI6B
	x+xuIfLfuNfXM3N2WOXUMJFB6ooBLmj/BPLtu5M3xZpC7oFec/hUBJPoDspza/fIFjprrED4vDaMb
	6H5CcGHce36O5/EOZhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetmp-00000001ntg-3Szq;
	Wed, 01 Jul 2026 12:11:27 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetmm-00000001nox-2rpv;
	Wed, 01 Jul 2026 12:11:25 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gqzPw0jlrz55RJV;
	Wed, 01 Jul 2026 20:11:16 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl2.zte.com.cn with SMTP id 661CAxLr077498;
	Wed, 1 Jul 2026 20:10:59 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Wed, 1 Jul 2026 20:11:01 +0800
X-Zmail-TransId: 3e816a4503d5008-1d5ea
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
Subject: [PATCH v4 3/5] RISC-V: KVM: Remove redundant TLB flush operations
Date: Wed,  1 Jul 2026 20:09:46 +0800
Message-ID: <20260701120954.129873-4-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260701120954.129873-1-wang.yechao255@zte.com.cn>
References: <20260701120954.129873-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 661CAxLr077498
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 01 Jul 2026 20:11:16 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A4503E4.000/4gqzPw0jlrz55RJV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051124_885011_B8BB25FF 
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
---
 arch/riscv/kvm/mmu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 363238efaedb4..056c0abe278af 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -162,14 +162,10 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
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

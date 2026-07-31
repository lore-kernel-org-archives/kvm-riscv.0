Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E57C55167
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bg9OV48F9wG6x0MUpjAMaBCJI/8zS5lQBVYwvA9eKss=; b=OcEOLDUoYCdoWq
	RiGqdCNhvIjaNLBAUDi+/FO01rw4ijcQGB27U/N7D9OllCPOR/bFYSiMu2CxoA2bOj3IUwzN5i6OB
	bprezFXOWYyr2t9EQ9JSUHC7ZfmJ/t5M21nrcJt4CO+QBWbS5Pz1KPbWciR8EzOm0JampekBuVSyr
	EQ72IWbZYLF0PUWYNcvNTFpdLXY7RtFRFn8uIvcDMEbMuNDU4lo7NNkSL87WUrKkdQnrV//Ih4efB
	P4Xsq6bpHJdNZELGUmTWfEGnZ8U8xPvujxFt0zA+Us9j6yLd6Ot9L7AkJftlC9gSPqzczdGbTPV1H
	ewL/75ug5/qTb8+pLCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjLc-0000000C9dP-21jE;
	Fri, 31 Jul 2026 09:16:08 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjLX-0000000C9bo-3qcH;
	Fri, 31 Jul 2026 09:16:07 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hBL5s0h1gz8Xrrj;
	Fri, 31 Jul 2026 17:16:01 +0800 (CST)
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl2.zte.com.cn with SMTP id 66V9Foe5064452;
	Fri, 31 Jul 2026 17:15:50 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Fri, 31 Jul 2026 17:15:52 +0800
X-Zmail-TransId: 3e816a6c67c8010-3c14a
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
Subject: [PATCH v5 1/5] RISC-V: KVM: Add the split page cache for ioctl context
Date: Fri, 31 Jul 2026 17:12:06 +0800
Message-ID: <20260731091215.1549430-2-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260731091215.1549430-1-wang.yechao255@zte.com.cn>
References: <20260731091215.1549430-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 66V9Foe5064452
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 31 Jul 2026 17:16:01 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A6C67D1.000/4hBL5s0h1gz8Xrrj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_021605_037450_D196AD16 
X-CRM114-Status: UNSURE (   8.79  )
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

Add the split page cache for dirty logging enablement and the
KVM_CLEAR_DIRTY_LOG ioctl.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/mmu.c              | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index e2d5808169e44..71e455d166905 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -86,6 +86,7 @@ struct kvm_arch {
 	pgd_t *pgd;
 	phys_addr_t pgd_phys;
 	unsigned long pgd_levels;
+	struct kvm_mmu_memory_cache pgd_split_page_cache;
 
 	/* Guest Timer */
 	struct kvm_guest_timer timer;
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 8a0aa5e0e216e..2017d292f4ca7 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -677,6 +677,7 @@ int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
 	kvm->arch.pgd = page_to_virt(pgd_page);
 	kvm->arch.pgd_phys = page_to_phys(pgd_page);
 	kvm->arch.pgd_levels = kvm_riscv_gstage_max_pgd_levels;
+	kvm->arch.pgd_split_page_cache.gfp_zero = __GFP_ZERO;
 
 	return 0;
 }
@@ -704,6 +705,8 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 
 	if (pgd)
 		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
+
+	kvm_mmu_free_memory_cache(&kvm->arch.pgd_split_page_cache);
 }
 
 void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu)
-- 
2.39.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

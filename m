Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49768CD4851
	for <kvm-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2waoVVq2j6P3fO19UHPnTNM8iCoc9PZkgn5p+kYcQo=; b=AdHenIKzUTD/GA
	uduah06tzAv9lAFD6q2J4t6zXTeje4o5nOV8rxa8GWdDDCB2CVivsZ1Hc0VqdyIGZahCshqvu0kPX
	EfXM2u4jKYsLkHuzxEYicMbBhkWE9weITJJXC8Luc2G2+jSMfEifJgqjv8fTrOIKPWjNtSe2uE3Ei
	XOxUAgnagtKcskKLZ/3obx7pctHq3D934jKlPOeHGGBu08WfG8xKWKu71oV53kKkL9ulhYLfKavjH
	FOMhws+l0B/ypP1kHA9sHdeKUp6TM7UC7Zm7amZXrdoMX3Rmzjh1QLK9A9A6IEwkj0F9fl59Da9WU
	+PeH0BIocWoob/TFM9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4FU-00000001bt6-06IH;
	Wed, 13 May 2026 07:43:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4FS-00000001bs6-0m6k;
	Wed, 13 May 2026 07:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Date:References:In-Reply-To:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JSx6mtzXPNy5M87BMloYAq9Xdcn5kFgirhjAN6hXV0c=; b=jHxvHnbXYYPWuIH3T8EFbuHs1q
	zH32N2wG1a8G8kobazntj/DztEe8KZUaHtYLUAyrMffYGtvXyNN/+Vk/tDiG2AqtQXW612o5TirhC
	wKfKWiUV9K/8+kVjXXwXrVTNodw2iAt1DmmfOPCPhTlxl2memN72s5pZKPI6WQ8Ixvac0j7DGMxoP
	6WEz5aP0f9uYN35RAL4Wl10eGQ0w5V9AP3QzLCgFLhkxalFha0o+WHScw69RsmNCF9a09EikOZmIm
	HHTn8JuEa8TmN1gK3QOPRh32tRX+vayWq67IK6i/iIfGE0KqHtRuHOXDO7vw9/FU+X3XjGL7iuDSO
	9z6XzUyQ==;
Received: from mxct.zte.com.cn ([183.62.165.209])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4FN-0000000BCyy-2Xt0;
	Wed, 13 May 2026 07:43:16 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gFlmw7479z51Sjv;
	Wed, 13 May 2026 15:42:56 +0800 (CST)
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl2.zte.com.cn with SMTP id 64D7gnL4098084;
	Wed, 13 May 2026 15:42:49 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 13 May 2026 15:42:51 +0800 (CST)
X-Zmail-TransId: 2b066a042b7b6c7-fcc10
X-Mailer: Zmail v1.0
Message-ID: <20260513154251861FBOlxl8ySih_oqyoJL1iA@zte.com.cn>
In-Reply-To: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn>
References: 20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn
Date: Wed, 13 May 2026 15:42:51 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDMvNF0gUklTQy1WOiBLVk06IFNwbGl0IGh1Z2UgcGFnZXMgZHVyaW5nIEtWTV9DTEVBUl9ESVJUWV9MT0c=?=
X-MAIL: mse-fl2.zte.com.cn 64D7gnL4098084
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Wed, 13 May 2026 15:42:57 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A042B80.000/4gFlmw7479z51Sjv
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_084313_996089_DFDB63A7 
X-CRM114-Status: UNSURE (   6.47  )
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
---
 arch/riscv/kvm/mmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 14c558ee5f15..2cdea3e3ed4b 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -147,6 +147,9 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	kvm_riscv_gstage_init(&gstage, kvm);

 	kvm_riscv_gstage_wp_range(&gstage, start, end);
+
+	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
+		kvm_riscv_split_huge_pages(&gstage, start, end, true);
 }

 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
-- 
2.27.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

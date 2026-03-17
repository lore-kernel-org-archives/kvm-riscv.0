Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B436DFD874A
	for <kvm-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 11:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FMHSkl/9eq+FpRWIFjD4hZtrBV7B2xCal2FjichBMEk=; b=Y1//BZGmVX+t09
	m6HWED4gQMAyDaucMMOCZW8T/rhOstBWMSSJCvHdaHpJje/cbQVMtB9+SfwqAteYQr9XTe8xEL8yf
	1O32t3iZnylLzjJPtD9RQbQ3yp0BXt2UfXASECPK+JHT/zITlUZ2AQ8rtyKb2n2w4v1/zTU96U1z3
	e+s5lCdFuaf75U6wroTgfdQDHxFzf2U377smuYtfj0ohdgC2sfAgM//q5VS4FRcNCFHALe7r5AwXg
	L5R1mBnLZclcM/8+9LN9u4cXyNnrRRCEpl4kt1pLfjgok8Ch6clHK0CSuEid9Sml26LNy/TaN5PeB
	r8mDwqqWOejYj0TSkhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sur-00000006DMB-1HMR;
	Tue, 17 Mar 2026 11:48:53 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sun-00000006DHI-3M6d;
	Tue, 17 Mar 2026 11:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=s9
	IU2IA+qffEatxA+OQV2y2PbABqMCPV4NHMrG4Jiks=; b=DzKVecJ/SnNywN4Xo0
	7dElOCcrtSYj25kVgdNgS4KOCzKUzb+qCPg9J4dSaag2qMo7ivKKpm0g0ezINleY
	yJpUXkVyso8sXseUtrGBHXkXuZ8xxVEB7WhGgTTYzYTbZW06GvVYy+nNxpBgbsKn
	L4wVHeKWA/UyGcv13gZwD7lek=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAHqYhwP7lpCgwKAA--.596S2;
	Tue, 17 Mar 2026 19:48:06 +0800 (CST)
From: "rom.wang" <r4o5m6e8o@163.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yufeng Wang <wangyufeng@kylinos.cn>
Subject: [PATCH] riscv: kvm: add null pointer check for vector datap
Date: Tue, 17 Mar 2026 19:47:59 +0800
Message-Id: <20260317114759.53165-1-r4o5m6e8o@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: PigvCgAHqYhwP7lpCgwKAA--.596S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw13Cr17XF4rJr48AFWrKrg_yoWDArg_G3
	WxXa4Sq3yrAF4jvw4DKa1fGF1Sgr97K3yUGrn3Krn7WFW09w4DC3yDXF4rZFyUZ39xG3Z7
	Jr4jvrW2y343tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8O6pPUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 3uurkzkwhy0qqrwthudrp/xtbCzRa1K2m5P3YGCwAA3R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_044850_435278_A523B037 
X-CRM114-Status: UNSURE (   7.95  )
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

From: Yufeng Wang <wangyufeng@kylinos.cn>

Add WARN_ON check before accessing cntx->vector.datap in
kvm_riscv_vcpu_vreg_addr() to detect potential null pointer
dereferences early, consistent with the pattern used in
kvm_riscv_vcpu_vector_reset().

This helps catch initialization issues where vector context
allocation may have failed.

Signed-off-by: Yufeng Wang <wangyufeng@kylinos.cn>
---
 arch/riscv/kvm/vcpu_vector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 46fbf48f2503..e989cb9f1ac4 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -129,6 +129,7 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
 		if (reg_size != vlenb)
 			return -EINVAL;
+		WARN_ON(!cntx->vector.datap);
 		*reg_addr = cntx->vector.datap +
 			    (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
 	} else {
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

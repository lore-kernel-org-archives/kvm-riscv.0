Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0DFCD8CB9
	for <kvm-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H0nYNT08bwyCRJiiFiQuDukHIPO3suj7m5UATaKQRPw=; b=G6en8c3aPUpsSP
	kKLgujj16agBVGUKG9QwxTzyjk5ayY9bigZcUNosp6fgxDK4UP1wAbNCtJGr9O1MBuIyrOBmJii1w
	PfN3i4Bnwc+LrSkD5qGqiFpNNBSr/HEGlhoDWHh5knESpNJZKts4WmgbsWWUyPajkrhjQvPgxrfiQ
	mM5kxkQY5tQ7CVA3Jlq9Qwgyd5PfRjZsvcwHiT2VEXxlSnZoNSr30/tzkA/5dFee2aBiY+DLlGskC
	u8vjYRI/Q394ZCJj5gVVTamCW2jo8UEc0zc5Gr5zSRuX72A/Z9P9grOHCqwNmM+VsfgMP8lKL6yEQ
	smaZSNy979zjm8pIU8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFPX-00000007I2p-45jG;
	Wed, 10 Jun 2026 09:39:48 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFPS-00000007I1T-1oDQ;
	Wed, 10 Jun 2026 09:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781084373; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=GyfQE1u5dCjMDM2v0WiYWSshT6A2JnI5znH7LSfoXSk=;
	b=FMVQ1XPI2plEtu2DorVyHUiEeNbhAwRNmcTefns0i/+FxsCJFasfV2h9vKGw/nuK657buvwZm/n+C4HAGdyH7X18QDVRqIBVzt3TdICiky0hF/6wH69cCmarcxhYaBLfwJrK4HPSiTJ9df6xmQkBDmPha0vNWE+SoHSUkSvOGFs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0X4aGPG._1781084366;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X4aGPG._1781084366 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 17:39:28 +0800
From: fangyu.yu@linux.alibaba.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] RISC-V: KVM: Avoid redundant page-table allocations in ioremap topup
Date: Wed, 10 Jun 2026 17:39:22 +0800
Message-Id: <20260610093922.51617-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_023942_814227_AAFC0071 
X-CRM114-Status: UNSURE (   7.87  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

kvm_riscv_mmu_ioremap() currently tops up its on-stack page-table
cache via kvm_mmu_topup_memory_cache(), which allocates up to
KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE (32) objects per topup.

ioremap only consumes non-leaf page-table pages, at most
pgd_levels - 1 (1 to 4) per call, and for contiguous mappings
within the same huge page the non-leaf pages are allocated once
and reused by subsequent pages. Topping up to 32 objects therefore
triggers many unnecessary GFP_KERNEL_ACCOUNT allocations on every
call, all of which are freed when the function returns. In hot
paths (such as vCPU migration), this creates avoidable allocator
churn and wastes CPU cycles.

Use __kvm_mmu_topup_memory_cache() with a capacity of pgd_levels so
the on-stack cache is sized to the maximum demand of a single
mapping. This removes the redundant allocations and reduces per-call
overhead without changing behavior.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024270..873a5dde4b92 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -39,6 +39,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 	pgprot_t prot;
 	unsigned long pfn;
 	phys_addr_t addr, end;
+	unsigned long pgd_levels = kvm->arch.pgd_levels;
 	struct kvm_mmu_memory_cache pcache = {
 		.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0,
 		.gfp_zero = __GFP_ZERO,
@@ -61,7 +62,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 		if (!writable)
 			map.pte = pte_wrprotect(map.pte);
 
-		ret = kvm_mmu_topup_memory_cache(&pcache, kvm->arch.pgd_levels);
+		ret = __kvm_mmu_topup_memory_cache(&pcache, pgd_levels, pgd_levels);
 		if (ret)
 			goto out;
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

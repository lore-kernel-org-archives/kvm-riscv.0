Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD93F531DE
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Awemrw8QHUZz+I97BD5qZZ+0i3OJcmJD4XMnfuA0hKM=; b=PE5rn+0g1OFlcg
	t3YZ9tY4isDOWXyQdNtbShDCWECiIojrO1I9OSjIaMkhTGICagsXfgSXgZqO2DCQ00punaHYpK8xv
	QH7gNOffF0rZ3CxGJvm5thZLtMP26/S0J2D/HV50pHhMghInts5id1JBEsi9Gcf/+87/aFM0WJs+y
	iUz9+AswcK5iU4pTdDAK46keVv85MMFLnSrsVLxOtgRqBH/QVsvKbevNwacNC4veEHxsVuqX0Tb4p
	D4WRQm9V482sJhRBeGkjOAW0qASvymjQVHrqIxIxFGYu5DPysNU7apG2UdcV0V5ez8nqWd5CHzDZp
	Lvv/AvXWntsXBtHY38BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbXJ-0000000HBnX-33Om;
	Tue, 14 Apr 2026 11:02:29 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbXH-0000000HBlr-0Q1D;
	Tue, 14 Apr 2026 11:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776164543; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=1oJx6C7bTbqFRerwQikbn4XOKcny9PNxkWumn9MgJrw=;
	b=nufAsqCotC4rx1MDZhdNVshrOQ93u9/+cOCSFDgLxdYzTPrxnrsKFHyOel3fjULL1jxbbZNx5lPTqQgTmxEgDQsxbLOE5grDaSUBIJf0s0mK0Uaxa7cSEPDoCU9hFPcKOjpPCI+zqUu0q5eUxXAx+cY9dz+089i7JAMd2rqA6go=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X11DRTQ_1776164538;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X11DRTQ_1776164538 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Apr 2026 19:02:19 +0800
From: fangyu.yu@linux.alibaba.com
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tjeznach@rivosinc.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	baolu.lu@linux.intel.com,
	vasant.hegde@amd.com,
	anup@brainfault.org,
	nutty.liu@hotmail.com,
	jgg@nvidia.com
Cc: guoren@kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v2 2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits
Date: Tue, 14 Apr 2026 19:02:12 +0800
Message-Id: <20260414110212.79526-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260414110212.79526-1-fangyu.yu@linux.alibaba.com>
References: <20260414110212.79526-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_040227_352012_B194878A 
X-CRM114-Status: UNSURE (   6.98  )
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

When the RISC-V IOMMU page table format support Svpbmt, PBMT provides
a way to tag mappings with page-based memory types. Encode memory type
via PBMT in RISC-V IOMMU PTEs:

  - IOMMU_MMIO   -> PBMT=IO
  - !IOMMU_MMIO && !IOMMU_CACHE -> PBMT=NC
  - otherwise    -> PBMT=Normal (PBMT=0)

Only touch PBMT when PT_FEAT_RISCV_SVPBMT is advertised.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/iommu/generic_pt/fmt/riscv.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
index a7fef6266a36..57e51e5def9f 100644
--- a/drivers/iommu/generic_pt/fmt/riscv.h
+++ b/drivers/iommu/generic_pt/fmt/riscv.h
@@ -64,6 +64,8 @@ enum {
 	RISCVPT_PPN64 = GENMASK_ULL(53, 10),
 	RISCVPT_PPN64_64K = GENMASK_ULL(53, 14),
 	RISCVPT_PBMT = GENMASK_ULL(62, 61),
+	RISCVPT_NC = BIT(61),
+	RISCVPT_IO = BIT(62),
 	RISCVPT_N = BIT_ULL(63),
 
 	/* Svnapot encodings for ppn[0] */
@@ -237,6 +239,12 @@ static inline int riscvpt_iommu_set_prot(struct pt_common *common,
 		pte |= RISCVPT_R;
 	if (!(iommu_prot & IOMMU_NOEXEC))
 		pte |= RISCVPT_X;
+	if (common->features & BIT(PT_FEAT_RISCV_SVPBMT)) {
+		if (iommu_prot & IOMMU_MMIO)
+			pte |= RISCVPT_IO;
+		else if (!(iommu_prot & IOMMU_CACHE))
+			pte |= RISCVPT_NC;
+	}
 
 	/* Caller must specify a supported combination of flags */
 	if (unlikely((pte & (RISCVPT_X | RISCVPT_W | RISCVPT_R)) == 0))
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

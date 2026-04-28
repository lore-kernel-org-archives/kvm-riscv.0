Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC04FF886D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTFp7j4bbJiFl4WIQNAgTlZaxKGEW02BjoNtMRJoZK4=; b=RvYsktkZftP1Is
	FsM2wJ5ALKQOXIgMohBw2sYrgCSvGfyQmmh794S+pPwEMY6nV46PhEq+4JP/4PdTYi73Eamsw7qRc
	IJ+kmLxNk+c3ccGKHKmMGrYuCsReSHFgUzpD9xh2+rNCD5vgGaTQX8oAjIOSWNtAe8cq8acLMp39D
	dn1APBDcSHeahNd4z98OkinJwk8R8pRQDweNlzTd/rhwtpfniFqr2nlEbDZdawahv7iZ4WxTg/ysC
	P5PgsoUdawY4iFqVGKeYnjlSX/YKxFU+rgjBn54mDYfDn0GqdhFUhHqkLtCrXyhWrr3/5nzfgVXvg
	Lt+eFFzRwS2IRHrX7bkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiGm-00000001V3B-44mu;
	Tue, 28 Apr 2026 13:14:32 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiGh-00000001UyR-2dgd;
	Tue, 28 Apr 2026 13:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777382057; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ZUHnJEfer0hml+VpdHPHpDcwMmO2L2tgfhLYa+ZhlhQ=;
	b=GEu9WpZOqSenq+1BndKUEqxPoVHpxwo/3xqYAms/DPenZ4A2z/hFwBpbhcnIUZVLjBY0eSbDhski4A+DjtnJdlDjKAl4HeWdN9jNzNBwU26GEkGxE14DCbTWJpC7zJMdwfaegM6/Je1pIG9SrmXgcGQmb3AzPkPRl0qELidoVbM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0X1ubIDQ_1777382052;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1ubIDQ_1777382052 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 28 Apr 2026 21:14:13 +0800
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
	atish.patra@linux.dev,
	skhawaja@google.com,
	jgg@nvidia.com
Cc: guoren@kernel.org,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [RFC PATCH 01/11] iommupt: Add RISC-V Second-stage (iohgatp) page table support
Date: Tue, 28 Apr 2026 21:13:49 +0800
Message-Id: <20260428131359.34872-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_061428_234468_5BEEE3EA 
X-CRM114-Status: GOOD (  15.70  )
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

Add support for Sv39x4/Sv48x4/Sv57x4 Second-stage page tables used by
the RISC-V IOMMU iohgatp register. The x4 root page table is 16 KiB
instead of the usual 4 KiB, covering 2 extra GPA bits (hw_max_vasz_lg2
= 41/50/59).

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/generic_pt/fmt/riscv.h | 64 +++++++++++++++++++++++++---
 include/linux/generic_pt/common.h    |  5 +++
 include/linux/generic_pt/iommu.h     | 17 +++++++-
 3 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
index a7fef6266a36..4fe645e60375 100644
--- a/drivers/iommu/generic_pt/fmt/riscv.h
+++ b/drivers/iommu/generic_pt/fmt/riscv.h
@@ -37,7 +37,16 @@ enum {
 	PT_MAX_OUTPUT_ADDRESS_LG2 = 34,
 	PT_MAX_TOP_LEVEL = 1,
 #else
-	PT_MAX_VA_ADDRESS_LG2 = 57,
+	/*
+	 * PT_MAX_VA_ADDRESS_LG2 is the upper bound accepted by the generic
+	 * pt_iommu_init() range check.  It must cover both first-stage and
+	 * second-stage (G-stage) modes:
+	 *
+	 *   First-stage  (fsc/iosatp): Sv39=39, Sv48=48, Sv57=57
+	 *   Second-stage (iohgatp):    Sv39x4=41, Sv48x4=50, Sv57x4=59
+	 *
+	 */
+	PT_MAX_VA_ADDRESS_LG2 = 59,
 	PT_MAX_OUTPUT_ADDRESS_LG2 = 56,
 	PT_MAX_TOP_LEVEL = 4,
 #endif
@@ -124,6 +133,14 @@ riscvpt_entry_num_contig_lg2(const struct pt_state *pts)
 
 static inline unsigned int riscvpt_num_items_lg2(const struct pt_state *pts)
 {
+	/*
+	 * Second-stage (iohgatp) root page tables have 4x the usual number of
+	 * entries (2048 = 2^11 instead of 512 = 2^9) to cover the 2 extra GPA
+	 * bits in Sv39x4/Sv48x4/Sv57x4.  Only the root (top) level is
+	 * enlarged; all other levels remain at the standard 9-bit index width.
+	 */
+	if (to_riscvpt(pts)->second_stage && pts->level == pts->range->top_level)
+		return PT_TABLEMEM_LG2SZ - ilog2(sizeof(u64)) + 2;
 	return PT_TABLEMEM_LG2SZ - ilog2(sizeof(u64));
 }
 #define pt_num_items_lg2 riscvpt_num_items_lg2
@@ -254,6 +271,7 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
 	struct pt_riscv *table = &iommu_table->riscv_64pt;
 
 	switch (cfg->common.hw_max_vasz_lg2) {
+	/* First-stage (fsc/iosatp): Sv39 / Sv48 / Sv57 */
 	case 39:
 		pt_top_set_level(&table->common, 2);
 		break;
@@ -263,6 +281,22 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
 	case 57:
 		pt_top_set_level(&table->common, 4);
 		break;
+	/*
+	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
+	 * The top level is the same as for the first-stage counterpart.
+	 */
+	case 41:
+		pt_top_set_level(&table->common, 2);
+		table->second_stage = true;
+		break;
+	case 50:
+		pt_top_set_level(&table->common, 3);
+		table->second_stage = true;
+		break;
+	case 59:
+		pt_top_set_level(&table->common, 4);
+		table->second_stage = true;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -283,10 +317,17 @@ riscvpt_iommu_fmt_hw_info(struct pt_iommu_riscv_64 *table,
 	PT_WARN_ON(top_phys & ~PT_TOP_PHYS_MASK);
 
 	/*
-	 * See Table 3. Encodings of iosatp.MODE field" for DC.tx.SXL = 0:
-	 *  8 = Sv39 = top level 2
-	 *  9 = Sv38 = top level 3
-	 *  10 = Sv57 = top level 4
+	 * Both first-stage (fsc/iosatp) and second-stage (iohgatp) share the
+	 * same MODE numeric values for a given top level:
+	 *   top_level 2 -> MODE 8  (Sv39 / Sv39x4)
+	 *   top_level 3 -> MODE 9  (Sv48 / Sv48x4)
+	 *   top_level 4 -> MODE 10 (Sv57 / Sv57x4)
+	 *
+	 * The union members fsc_iosatp_mode and iohgatp_mode occupy the same
+	 * byte; the caller selects the appropriate name based on domain type.
+	 *
+	 * See "Table 3. Encodings of iosatp.MODE field" (DC.tc.SXL = 0) and
+	 * "Table 2. Encoding of iohgatp.MODE field" in the RISC-V IOMMU spec.
 	 */
 	info->fsc_iosatp_mode = top_range->top_level + 6;
 }
@@ -294,6 +335,7 @@ riscvpt_iommu_fmt_hw_info(struct pt_iommu_riscv_64 *table,
 
 #if defined(GENERIC_PT_KUNIT)
 static const struct pt_iommu_riscv_64_cfg riscv_64_kunit_fmt_cfgs[] = {
+	/* First-stage (fsc/iosatp): Sv39 / Sv48 / Sv57 */
 	[0] = { .common.features = BIT(PT_FEAT_RISCV_SVNAPOT_64K),
 		.common.hw_max_oasz_lg2 = 56,
 		.common.hw_max_vasz_lg2 = 39 },
@@ -303,6 +345,18 @@ static const struct pt_iommu_riscv_64_cfg riscv_64_kunit_fmt_cfgs[] = {
 	[2] = { .common.features = BIT(PT_FEAT_RISCV_SVNAPOT_64K),
 		.common.hw_max_oasz_lg2 = 56,
 		.common.hw_max_vasz_lg2 = 57 },
+	/*
+	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
+	 */
+	[3] = { .common.features = BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+		.common.hw_max_oasz_lg2 = 56,
+		.common.hw_max_vasz_lg2 = 41 },
+	[4] = { .common.features = 0,
+		.common.hw_max_oasz_lg2 = 56,
+		.common.hw_max_vasz_lg2 = 50 },
+	[5] = { .common.features = BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+		.common.hw_max_oasz_lg2 = 56,
+		.common.hw_max_vasz_lg2 = 59 },
 };
 #define kunit_fmt_cfgs riscv_64_kunit_fmt_cfgs
 enum {
diff --git a/include/linux/generic_pt/common.h b/include/linux/generic_pt/common.h
index fc5d0b5edadc..e82dff33ece8 100644
--- a/include/linux/generic_pt/common.h
+++ b/include/linux/generic_pt/common.h
@@ -181,6 +181,11 @@ struct pt_riscv_32 {
 
 struct pt_riscv_64 {
 	struct pt_common common;
+	/*
+	 * True when this table is used for second-stage / iohgatp
+	 * address translation.
+	 */
+	bool second_stage;
 };
 
 enum {
diff --git a/include/linux/generic_pt/iommu.h b/include/linux/generic_pt/iommu.h
index dd0edd02a48a..f27d229ff318 100644
--- a/include/linux/generic_pt/iommu.h
+++ b/include/linux/generic_pt/iommu.h
@@ -328,7 +328,22 @@ struct pt_iommu_riscv_64_cfg {
 
 struct pt_iommu_riscv_64_hw_info {
 	u64 ppn;
-	u8 fsc_iosatp_mode;
+	union {
+		/*
+		 * First-stage (fsc/iosatp) MODE encoding:
+		 *   8 = Sv39, 9 = Sv48, 10 = Sv57
+		 * Used to program DC.fsc.iosatp.MODE.
+		 */
+		u8 fsc_iosatp_mode;
+		/*
+		 * Second-stage (iohgatp) MODE encoding:
+		 *   8 = Sv39x4, 9 = Sv48x4, 10 = Sv57x4
+		 * Used to program DC.iohgatp.MODE.
+		 * The numeric values are identical to fsc_iosatp_mode;
+		 * the caller selects the interpretation based on domain type.
+		 */
+		u8 iohgatp_mode;
+	};
 };
 
 IOMMU_FORMAT(riscv_64, riscv_64pt);
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

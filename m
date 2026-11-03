Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F29606A332
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d04ZESKY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=V0MrX0vo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eLC4lKRTFtZqTSxlxGSzD1A+NPAGxy8GTWby62cbSwQ=; b=d04ZESKYqvQ1NTs2bQmfGI/23e
	4NecAMiKs7xNyiOZaJuDz/h16Y404kvJseKxUQDKnvxFF14mk2bHlf4mJZ0n8HN5R66Vj3y1+hfg1
	Ino9hS4HJrAcS/oYchW5T2YJ2lZgiU4p3HVw8d9Mr76pVqMibpX8DTvf17LeconZog94y68HCKLj8
	Ul4cCzUCOpfOTqYCUBSIc6CjrOjEKLtYKUnPgeIvdCPmJp0/34z4mYy9Tgtah/jqZu4FcufCik2cV
	LbHq+/lRvfyTHwLp88ymmu6V94y2vQKEX2KQnxj0sS3sOjlSCF/FUR0o0FA1bPY1mndeXncGO7pJc
	lYiVnZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODEL-00000002J22-2ihM;
	Tue, 03 Nov 2026 12:03:09 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODEI-00000002Izx-3qY6;
	Tue, 03 Nov 2026 12:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793707384; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=bHdV+uBKMbmZEFk857VJk5Itb2ycFnnVw8kcF5qHilM=;
	b=V0MrX0vo5lWpCCDK/+Ap47yZtjqF4gmsHsXUgT13ESVqxfrmqq9Yn0bG3adNOPArOISCkopRqp89SxuGcBcaCaDFt6BO3J7zZAKKJu60rusmHRQ0R1T4lD+3dOHCziwG7q/+SEmxQxyvBLFbLnJWywLS8nEo/FHtZThAT5DLONY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XE2qGyW_1793707381;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE2qGyW_1793707381 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 20:03:03 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com,
	tanchi25@mails.ucas.ac.cn,
	gong.shuai@sanechips.com.cn
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v7 02/10] iommupt: Add RISC-V Second-stage (iohgatp) page table support
Date: Tue,  3 Nov 2026 20:02:28 +0800
Message-Id: <20261103120236.53474-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
References: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_040307_318154_9D5257E1 
X-CRM114-Status: GOOD (  15.74  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Add support for Sv39x4/Sv48x4/Sv57x4 Second-stage page tables used by
the RISC-V IOMMU iohgatp register. The x4 root page table is 16 KiB
instead of the usual 4 KiB, covering 2 extra GPA bits (hw_max_vasz_lg2
= 41/50/59).

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/generic_pt/fmt/iommu_riscv64.c |   2 +-
 drivers/iommu/generic_pt/fmt/riscv.h         | 109 +++++++++++++++----
 include/linux/generic_pt/common.h            |   4 +
 include/linux/generic_pt/iommu.h             |  11 ++
 4 files changed, 102 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/generic_pt/fmt/iommu_riscv64.c b/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
index 1bb74114fb02..fa61839e5599 100644
--- a/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
+++ b/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
@@ -8,7 +8,7 @@
 	(BIT(PT_FEAT_SIGN_EXTEND) | BIT(PT_FEAT_FLUSH_RANGE) | \
 	 BIT(PT_FEAT_RISCV_SVNAPOT_64K) |                      \
 	 BIT(PT_FEAT_DETAILED_GATHER) |                        \
-	 BIT(PT_FEAT_RISCV_SVPBMT))
+	 BIT(PT_FEAT_RISCV_SVPBMT) | BIT(PT_FEAT_RISCV_S2))
 #define PT_FORCE_ENABLED_FEATURES BIT(PT_FEAT_DETAILED_GATHER)
 
 #include "iommu_template.h"
diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
index ae9a76514416..d4445e463fa9 100644
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
@@ -126,6 +135,12 @@ riscvpt_entry_num_contig_lg2(const struct pt_state *pts)
 
 static inline unsigned int riscvpt_num_items_lg2(const struct pt_state *pts)
 {
+	/*
+	 * It is not allowed to call pt_num_items_lg2() at the top level, this
+	 * API restriction is specifically an optimization avoid overheads
+	 * dealing with concatenated tables here.
+	 */
+	PT_WARN_ON(pts->level == pts->range->top_level);
 	return PT_TABLEMEM_LG2SZ - ilog2(sizeof(u64));
 }
 #define pt_num_items_lg2 riscvpt_num_items_lg2
@@ -261,20 +276,41 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
 		       const struct pt_iommu_riscv_64_cfg *cfg)
 {
 	struct pt_riscv *table = &iommu_table->riscv_64pt;
-
-	switch (cfg->common.hw_max_vasz_lg2) {
-	case 39:
-		pt_top_set_level(&table->common, 2);
-		break;
-	case 48:
-		pt_top_set_level(&table->common, 3);
-		break;
-	case 57:
-		pt_top_set_level(&table->common, 4);
-		break;
-	default:
-		return -EINVAL;
+	unsigned int top_level;
+
+	if (pt_feature(&table->common, PT_FEAT_RISCV_S2)) {
+		/* Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4. */
+		switch (cfg->common.hw_max_vasz_lg2) {
+		case 41:
+			top_level = 2;
+			break;
+		case 50:
+			top_level = 3;
+			break;
+		case 59:
+			top_level = 4;
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		/* First-stage (fsc/iosatp): Sv39 / Sv48 / Sv57. */
+		switch (cfg->common.hw_max_vasz_lg2) {
+		case 39:
+			top_level = 2;
+			break;
+		case 48:
+			top_level = 3;
+			break;
+		case 57:
+			top_level = 4;
+			break;
+		default:
+			return -EINVAL;
+		}
 	}
+
+	pt_top_set_level(&table->common, top_level);
 	table->common.max_oasz_lg2 =
 		min(PT_MAX_OUTPUT_ADDRESS_LG2, cfg->common.hw_max_oasz_lg2);
 	return 0;
@@ -292,30 +328,57 @@ riscvpt_iommu_fmt_hw_info(struct pt_iommu_riscv_64 *table,
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
+	 * See "Table 3. Encodings of iosatp.MODE field" (DC.tc.SXL = 0) and
+	 * "Table 2. Encoding of iohgatp.MODE field" in the RISC-V IOMMU spec.
 	 */
-	info->fsc_iosatp_mode = top_range->top_level + 6;
+	if (pt_feature(&table->riscv_64pt.common, PT_FEAT_RISCV_S2))
+		info->iohgatp_mode = top_range->top_level + 6;
+	else
+		info->fsc_iosatp_mode = top_range->top_level + 6;
 }
 #define pt_iommu_fmt_hw_info riscvpt_iommu_fmt_hw_info
 
 #if defined(GENERIC_PT_KUNIT)
 static const struct pt_iommu_riscv_64_cfg riscv_64_kunit_fmt_cfgs[] = {
-	[0] = { .common.features = BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+	/* First-stage (fsc/iosatp): Sv39 / Sv48 / Sv57 */
+	[0] = { .common.features = BIT(PT_FEAT_SIGN_EXTEND) |
+				      BIT(PT_FEAT_RISCV_SVNAPOT_64K),
 		.common.hw_max_oasz_lg2 = 56,
 		.common.hw_max_vasz_lg2 = 39 },
-	[1] = { .common.features = 0,
+	[1] = { .common.features = BIT(PT_FEAT_SIGN_EXTEND),
 		.common.hw_max_oasz_lg2 = 56,
 		.common.hw_max_vasz_lg2 = 48 },
-	[2] = { .common.features = BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+	[2] = { .common.features = BIT(PT_FEAT_SIGN_EXTEND) |
+				      BIT(PT_FEAT_RISCV_SVNAPOT_64K),
 		.common.hw_max_oasz_lg2 = 56,
 		.common.hw_max_vasz_lg2 = 57 },
+	/*
+	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
+	 */
+	[3] = { .common.features = BIT(PT_FEAT_RISCV_S2) |
+				      BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+		.common.hw_max_oasz_lg2 = 56,
+		.common.hw_max_vasz_lg2 = 41 },
+	[4] = { .common.features = BIT(PT_FEAT_RISCV_S2),
+		.common.hw_max_oasz_lg2 = 56,
+		.common.hw_max_vasz_lg2 = 50 },
+	[5] = { .common.features = BIT(PT_FEAT_RISCV_S2) |
+				      BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+		.common.hw_max_oasz_lg2 = 56,
+		.common.hw_max_vasz_lg2 = 59 },
 };
 #define kunit_fmt_cfgs riscv_64_kunit_fmt_cfgs
+/* Sign extension is only valid for first-stage configs, not S2. */
 enum {
-	KUNIT_FMT_FEATURES = BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+	KUNIT_FMT_FEATURES = BIT(PT_FEAT_SIGN_EXTEND) |
+			     BIT(PT_FEAT_RISCV_SVNAPOT_64K) |
+			     BIT(PT_FEAT_RISCV_S2),
 };
 #endif
 
diff --git a/include/linux/generic_pt/common.h b/include/linux/generic_pt/common.h
index 1b39b27f0cfa..a87d8e3dc26d 100644
--- a/include/linux/generic_pt/common.h
+++ b/include/linux/generic_pt/common.h
@@ -197,6 +197,10 @@ enum {
 	 * Support Svpbmt extension: encode page-based memory type (PBMT) in PTEs.
 	 */
 	PT_FEAT_RISCV_SVPBMT,
+	/*
+	 * Using second-stage / iohgatp address translation.
+	 */
+	PT_FEAT_RISCV_S2,
 
 };
 
diff --git a/include/linux/generic_pt/iommu.h b/include/linux/generic_pt/iommu.h
index 13ebb72a67de..59edb5cf9408 100644
--- a/include/linux/generic_pt/iommu.h
+++ b/include/linux/generic_pt/iommu.h
@@ -328,7 +328,18 @@ struct pt_iommu_riscv_64_cfg {
 
 struct pt_iommu_riscv_64_hw_info {
 	u64 ppn;
+	/*
+	 * First-stage (fsc/iosatp) MODE encoding:
+	 *   8 = Sv39, 9 = Sv48, 10 = Sv57
+	 * Used to program DC.fsc.iosatp.MODE.
+	 */
 	u8 fsc_iosatp_mode;
+	/*
+	 * Second-stage (iohgatp) MODE encoding:
+	 *   8 = Sv39x4, 9 = Sv48x4, 10 = Sv57x4
+	 * Used to program DC.iohgatp.MODE.
+	 */
+	u8 iohgatp_mode;
 };
 
 IOMMU_FORMAT(riscv_64, riscv_64pt);
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

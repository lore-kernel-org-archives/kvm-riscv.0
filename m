Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7540A606B1C3
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HHl0pnBO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4L083k7Tr2v0MUbAldju8HYe1upM1wWvQeFC3a5IICM=; b=HHl0pnBOlhb30h63Ly4pyoXJ3a
	JU/qwjwpiFl8p3JcdhD7B91pGGRx6Gc5R8F8i+DJYFwK4m9/HZQqOOHg8aw0wxDpFINr861hqDjGu
	BHRssuqJDFpGjXSfcv7fJjJ/uhZM0eo9jTHydS0DOj5gIjLUjHBK2GfTAP2j6DvW5rDv9xsF+WiAU
	GSGwBKsyn+VbXbwk2YVYimVX1k6h6+fMpX96jsSMUqGDzG2ZrXoh8x9byyoS9AD8QcMP2Vne7k7Sx
	I+kfj2YFUrsTo6vOEAZw/2NwhG9ZAeicrhrSubYdKLtnNtF5HyNcOluHPd/FPCUkKRgQokZqPAqX/
	fFCLwlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2BW-0000000C2Qz-0LxJ;
	Thu, 19 Nov 2026 13:28:18 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2BO-0000000C2J1-0GiG;
	Thu, 19 Nov 2026 13:28:16 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jVfRJ1GPMz4yjjM;
	Thu, 19 Nov 2026 21:27:56 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl2.zte.com.cn with SMTP id 6AJDRneA070443;
	Thu, 19 Nov 2026 21:27:49 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 19 Nov 2026 21:27:52 +0800
X-Zmail-TransId: 3e816afef95702f-56468
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Tomasz Jeznach <tomasz.jeznach@linux.dev>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fangyu Yu <fangyu.yu@linux.alibaba.com>,
        Tan Chi <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>
Subject: [RFC PATCH v3 01/10] iommu/riscv: Use DC.tc.V as the device context valid bit
Date: Thu, 19 Nov 2026 21:27:35 +0800
Message-ID: <20261119132744.396426-2-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 6AJDRneA070443
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 19 Nov 2026 21:27:56 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFEF95C.000/4jVfRJ1GPMz4yjjM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_052810_467867_99A4A2E3 
X-CRM114-Status: GOOD (  15.12  )
X-Spam-Score: -1.9 (-)
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Previously, riscv_iommu_iodir_update() accepted only a partial device
context and used bit 0 of the translation attributes as the valid
flag. It also kept only GADE in DC.tc and dropped the other fields
needed to pass guest translation settings for nested domains.

Now that the function accepts a complete device context, take the
valid bit from DC.tc.V and copy all defined TC fields so the guest
configuration reaches the hardware.

Use the DC field macros for the remaining device context updates as
well.

Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 drivers/iommu/riscv/iommu-bits.h |  6 ++++++
 drivers/iommu/riscv/iommu.c      | 28 ++++++++++++----------------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index 65d1f2250011..80c32f00ee5e 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -348,6 +348,12 @@ struct riscv_iommu_dc {
 #define RISCV_IOMMU_DC_TC_SBE		BIT_ULL(10)
 #define RISCV_IOMMU_DC_TC_SXL		BIT_ULL(11)
 
+/*
+ * All bits of dc.tc as defined by the spec. Bits 12-23 and 32-63
+ * are reserved for future standard use, bits 24-31 are for custom use.
+ */
+#define RISCV_IOMMU_DC_TC_DEFINED	GENMASK_ULL(11, 0)
+
 /* Second-stage (aka G-stage) context fields */
 #define RISCV_IOMMU_DC_IOHGATP_PPN	RISCV_IOMMU_ATP_PPN_FIELD
 #define RISCV_IOMMU_DC_IOHGATP_GSCID	GENMASK_ULL(59, 44)
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8c15710d60b6..f6e92b086c12 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1132,7 +1132,6 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 	rcu_read_unlock();
 }
 
-#define RISCV_IOMMU_FSC_BARE 0
 /*
  * This function sends IOTINVAL commands as required by the RISC-V
  * IOMMU specification (Section 6.3.1 and 6.3.2 in 1.0 spec version)
@@ -1243,18 +1242,14 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
 
 	/*
-	 * For device context with DC_TC_PDTV = 0, translation attributes valid bit
-	 * is stored as DC_TC_V bit (both sharing the same location at BIT(0)).
+	 * Only defined bits are writable by the driver.
 	 */
 	for (i = 0; i < fwspec->num_ids; i++) {
 		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
-		tc = READ_ONCE(dc->tc);
-		tc &= ~RISCV_IOMMU_DC_TC_GADE;
-		tc |= new_dc->tc & RISCV_IOMMU_DC_TC_GADE;
-		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
+		tc = new_dc->tc & RISCV_IOMMU_DC_TC_DEFINED;
 
 		WRITE_ONCE(dc->fsc, new_dc->fsc);
-		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
+		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_DC_TA_PSCID);
 		WRITE_ONCE(dc->iohgatp, new_dc->iohgatp);
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
@@ -1377,11 +1372,11 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
 			return -ENODEV;
 
-		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
-			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
+		dc.fsc = FIELD_PREP(RISCV_IOMMU_DC_FSC_MODE, pt_info.fsc_iosatp_mode) |
+			 FIELD_PREP(RISCV_IOMMU_DC_FSC_PPN, pt_info.ppn);
 	}
-	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
-	     RISCV_IOMMU_PC_TA_V;
+	dc.ta = FIELD_PREP(RISCV_IOMMU_DC_TA_PSCID, domain->pscid);
+	dc.tc |= RISCV_IOMMU_DC_TC_V;
 
 	if (riscv_iommu_bond_link(domain, dev))
 		return -ENOMEM;
@@ -1544,9 +1539,10 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
 
-	dc.fsc = RISCV_IOMMU_FSC_BARE;
+	dc.fsc = RISCV_IOMMU_DC_FSC_MODE_BARE;
+	dc.tc = 0;
 
-	/* Make device context invalid, translation requests will fault w/ #258 */
+	/* Make device context invalid (DC.tc.V = 0), translation requests will fault w/ #258 */
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
@@ -1569,8 +1565,8 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
 
-	dc.fsc = RISCV_IOMMU_FSC_BARE;
-	dc.ta = RISCV_IOMMU_PC_TA_V;
+	dc.fsc = RISCV_IOMMU_DC_FSC_MODE_BARE;
+	dc.tc = RISCV_IOMMU_DC_TC_V;
 
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

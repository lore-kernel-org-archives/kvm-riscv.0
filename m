Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E60FF8868
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFrIeKOf3X4pfyqcMer+OIEmKNjHkiWAin0GjNXDe6g=; b=EH9vJA4dyBnOSw
	KRhIXAgySb4letFhJrGCUkQSeeP1ocr3Kw55J01YMycFZCjgaGMx5R/7qJmj6ta3s9596+/OYdtu4
	xKUBdtUhJDRin/l153rgSbK5OI/rk4HowQPI1PAd8bWfZnjGjvvOalcNr7InW82YTH9NbzEsljDB2
	CyCxYYdPRis12nnXe7M9Dz3COayw9qo2cNU77CBuPFiSNI+KHGRYN6T1q5fs5rB3QFB/OnSV5bUJI
	uxAp8gNyPonO4UtTNdzCBTvTeuYglGRl9yCFiwbbTrgHozCgb7CVpWIj6GMCQm+29EIwdpfH/RxIT
	ywYCUgjlSXNC1WVG2XMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiGs-00000001V9w-3lwR;
	Tue, 28 Apr 2026 13:14:38 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiGo-00000001V21-27eK;
	Tue, 28 Apr 2026 13:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777382071; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=d/CJi0j31iQURubrtaBsC+TOdWT/tV2UED1jlPNtsn8=;
	b=Vq7xQ+Ymo/WIzal6MCHBB0r8IMky3c6KFcvL+quLqYys7jK0VEl6yCI2G6StgxP4rv33erNkWY+bJaf9MMeI5G4Pqw9+D/AC+1eQAaAGDz7XO4o9IcBbO2wIyOGK1HwOZwozTpy7+1VOJmwNUuh5QMh4odtHSKdoPAU9ZJac2bI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0X1ubIGF_1777382064;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1ubIGF_1777382064 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 28 Apr 2026 21:14:25 +0800
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
Subject: [RFC PATCH 07/11] iommupt: Don't preset D when RISC-V IOMMU dirty tracking on
Date: Tue, 28 Apr 2026 21:13:55 +0800
Message-Id: <20260428131359.34872-8-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_061434_732124_1B95B3A7 
X-CRM114-Status: GOOD (  10.70  )
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

When mapping writable pages, the RISC-V format code currently
pre-sets the PTE D bit unconditionally.

If hardware dirty tracking is active (DC.tc.GADE set), the IOMMU
sets D autonomously on the first write. Pre-setting D makes every
new mapping appear dirty immediately and breaks dirty tracking.

Introduce PT_FEAT_RISCV_DIRTY_TRACKING_ACTIVE and, when set, leave
D cleared for new writable mappings so hardware can capture the
first write. Keep pre-setting D when dirty tracking is inactive.

Only meaningful for second-stage (iohgatp) page tables.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/generic_pt/fmt/riscv.h | 13 +++++++++++--
 include/linux/generic_pt/common.h    |  8 ++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
index 4fe645e60375..0281356cfaf6 100644
--- a/drivers/iommu/generic_pt/fmt/riscv.h
+++ b/drivers/iommu/generic_pt/fmt/riscv.h
@@ -248,8 +248,17 @@ static inline int riscvpt_iommu_set_prot(struct pt_common *common,
 	u64 pte;
 
 	pte = RISCVPT_A | RISCVPT_U;
-	if (iommu_prot & IOMMU_WRITE)
-		pte |= RISCVPT_W | RISCVPT_R | RISCVPT_D;
+	if (iommu_prot & IOMMU_WRITE) {
+		pte |= RISCVPT_W | RISCVPT_R;
+		/*
+		 * When hardware dirty tracking is active (GADE set), the IOMMU
+		 * sets the D bit autonomously on the first write access.
+		 *
+		 */
+		if (!(common->features &
+		      BIT(PT_FEAT_RISCV_DIRTY_TRACKING_ACTIVE)))
+			pte |= RISCVPT_D;
+	}
 	if (iommu_prot & IOMMU_READ)
 		pte |= RISCVPT_R;
 	if (!(iommu_prot & IOMMU_NOEXEC))
diff --git a/include/linux/generic_pt/common.h b/include/linux/generic_pt/common.h
index e82dff33ece8..4606c7464c27 100644
--- a/include/linux/generic_pt/common.h
+++ b/include/linux/generic_pt/common.h
@@ -193,6 +193,14 @@ enum {
 	 * Support the 64k contiguous page size following the Svnapot extension.
 	 */
 	PT_FEAT_RISCV_SVNAPOT_64K = PT_FEAT_FMT_START,
+	/*
+	 * Hardware dirty tracking is currently active: DC.tc.GADE is set and
+	 * the IOMMU will set the D bit in PTEs autonomously on write access.
+	 * When this flag is set, new mappings must not pre-set the D bit so
+	 * that every write is correctly captured by hardware.
+	 * Only meaningful for second-stage (iohgatp) page tables.
+	 */
+	PT_FEAT_RISCV_DIRTY_TRACKING_ACTIVE,
 
 };
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55205C87FDA
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNI0uPCguP7Ka5M7P56TG2ifaHpTWI1HtZkJgWR4Q0k=; b=YFLMy2YLqogbKT
	VupcKzz3h80rn05yoCsktHvYnR1irf/y3GpgDNf4R4qMOsoXrScmfNmFuioQ4wMcJGPuWtVdkdDbw
	VIcCgxx/Bz3ZPGCfrDoSmVpXrpVUVN902MqQsSey1JI8ReQ58wDgOPcKnmzgPjnXxwAlQS7ofzs5P
	wGjpvbW5KQO8iwZw2Jdp4+RdXe27Fvrg+382OS1qztmMQFrxoX36Uq5AvJLOyfqYMMzuE88+BLeNh
	8m9udgIuonB1gNiYpkwqcxltoMJ8EK/G/ALwrxcJB6X8BRXrjb6E+4xkv48xbldFYW32ZfX9UJ/Vz
	risgUzFdBOKxDZXw0S5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLkn-00000006ZSE-0N8H;
	Mon, 11 Aug 2025 06:11:29 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLkh-00000006ZKV-29bK;
	Mon, 11 Aug 2025 06:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1754892681; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=XDEJbKTMYToe/P3nkdkZb7Pdk39snYZKhujzTlABfAU=;
	b=PlnfDRfNrbtrNW4nrEdFXjnVVaibQAJ9qicTVWWTcA1N0zVSbmE+snd/ej0Yohf2pWI1KtxSLkPwJ6YUIimtp5Ijz2zNqBY9c8JSi4mfSmvUcQPYumq2MwfQggV045/TAKDtHXtzs+IgNp++FUbLSJiudLCj/TV5R4AQCCy6qvo=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WlP-vAn_1754892676 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 Aug 2025 14:11:17 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	atishp@atishpatra.org,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	sunilvl@ventanamicro.com,
	rafael.j.wysocki@intel.com,
	tglx@linutronix.de,
	ajones@ventanamicro.com
Cc: guoren@linux.alibaba.com,
	guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [RFC PATCH 5/6] iommu/riscv: Add MRIF mode support
Date: Mon, 11 Aug 2025 14:11:03 +0800
Message-Id: <20250811061104.10326-6-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
References: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_231123_864990_DAA1758B 
X-CRM114-Status: GOOD (  14.11  )
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

If the guest interrupt files are exhausted and the MRIF is supported
we configure the MSI PTE with MRIF mode,  and set  the  NPPN and NID
using notice MSI from host irq.

Otherwise, we redirect the guest interrupt back to the original host
irq and inject the interrupt into the guest machine through irqfd.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu-bits.h |  6 ++++++
 drivers/iommu/riscv/iommu-ir.c   | 35 +++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index d3d98dbed709..3af6436d5c5c 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -39,6 +39,12 @@
 /* RISC-V IOMMU PPN <> PHYS address conversions, PHYS <=> PPN[53:10] */
 #define riscv_iommu_phys_to_ppn(pa)	(((pa) >> 2) & (((1ULL << 44) - 1) << 10))
 #define riscv_iommu_ppn_to_phys(pn)	(((pn) << 2) & (((1ULL << 44) - 1) << 12))
+/* RISC-V IOMMU MRIF Address <> PHYS address conversions, PHYS <=> MRIF[53:7] */
+#define riscv_iommu_phys_to_mrif(pa)	(((pa) >> 2) & (((1ULL << 47) - 1) << 7))
+/* RISC-V IOMMU nppn <> PHYS address conversions, PHYS <=> nppn[53:10] */
+#define riscv_iommu_phys_to_nppn(pa)	(((pa) >> 2) & (((1ULL << 44) - 1) << 10))
+#define riscv_iommu_data_to_nid(data)   \
+		((((data) & 0x3FFULL)) | (((((data) >> 10) & 1ULL)) << 60))
 
 /* 5.3 IOMMU Capabilities (64bits) */
 #define RISCV_IOMMU_REG_CAPABILITIES		0x0000
diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 73f552ed5b65..f3ebf62de53e 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -150,9 +150,12 @@ static int riscv_iommu_irq_set_vcpu_affinity(struct irq_data *data, void *info)
 {
 	struct riscv_iommu_vcpu_info *vcpu_info = info;
 	struct riscv_iommu_domain *domain = data->domain->host_data;
+	struct device *dev = msi_desc_to_dev(irq_data_get_msi_desc(data));
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_msipte *pte;
 	int ret = -EINVAL;
-	u64 pteval;
+	u64 pteval, mrifval = 0;
+	bool mrif_support = (iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_MRIF);
 
 	if (WARN_ON(domain->domain.type != IOMMU_DOMAIN_UNMANAGED))
 		return ret;
@@ -186,12 +189,38 @@ static int riscv_iommu_irq_set_vcpu_affinity(struct irq_data *data, void *info)
 	if (!pte)
 		goto out_unlock;
 
-	pteval = FIELD_PREP(RISCV_IOMMU_MSIPTE_M, 3) |
-		 riscv_iommu_phys_to_ppn(vcpu_info->hpa) |
+	if (!vcpu_info->mrif) {
+		pteval = FIELD_PREP(RISCV_IOMMU_MSIPTE_M, 3) |
+			 riscv_iommu_phys_to_ppn(vcpu_info->hpa) |
+			 FIELD_PREP(RISCV_IOMMU_MSIPTE_V, 1);
+		goto update_pte;
+	}
+
+	pteval = FIELD_PREP(RISCV_IOMMU_MSIPTE_M, 1) |
+		 riscv_iommu_phys_to_mrif(vcpu_info->hpa) |
 		 FIELD_PREP(RISCV_IOMMU_MSIPTE_V, 1);
+	if (mrif_support) {
+		mrifval = riscv_iommu_data_to_nid(vcpu_info->host_msg->data) |
+				riscv_iommu_phys_to_nppn(
+				(u64)vcpu_info->host_msg->address_hi << 32 |
+				vcpu_info->host_msg->address_lo);
+	} else {
+		/* If the guest interrupt file is exhausted and MRIF is not supported, we
+		 * redirect the guest interrupt back to the original host interrupt and
+		 * inject the interrupt into the guest machine through irqfd.
+		 */
+		struct irq_data *irqdata = irq_get_irq_data(vcpu_info->host_irq);
+
+		irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata,
+						vcpu_info->host_msg);
+		ret = -ENODEV;
+		goto out_unlock;
+	}
 
+update_pte:
 	if (pte->pte != pteval) {
 		pte->pte = pteval;
+		pte->mrif_info = mrifval;
 		riscv_iommu_ir_msitbl_inval(domain, pte);
 	}
 
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

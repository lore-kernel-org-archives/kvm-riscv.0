Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E246C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zP6qo3wkxZqFZb2/pTFxIAGup+I/nL6yLl2hs6NmxSo=; b=h8IxI+gr2Sopcb
	HXaQ3ljimR2BJI5iHs3AfCnGFZvbPWJl1QyVtt7PAqO/ZUl1pSR7iyRYDautqHhNo1pxb8HTzijv0
	zTjooesKTf+lWFgdc8gF0miPObS9gpuAw1BkOtkKMOXzDZXVjCEA6SDR/4ejcdnVY/wMyuC4zv93B
	TB8LdHvp73H0EXPrQHz1YA4DWu3vzrHEwHxzwmzcQfQ/ZWDzhB6NW9Z8MahsGHucbG4OtsJtegHuB
	YPmhiZ0+4CFOetJtzRpJZojPQRYK4PDcxYl739ZlgZpeXtLT2pO+MoPqqBTGp2CPgGv0lB56hvo5T
	yUzPzel61e5zixWL757A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wem8J-00000000bnt-1Oty;
	Wed, 01 Jul 2026 04:01:07 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wem8H-00000000bmy-0eVQ
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 04:01:06 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-30df5854e1eso1087933eec.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 21:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782878464; x=1783483264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1e3YXWFANhBpw4yjMWQhabBTa2QrRN36l2rv62U94S4=;
        b=j1/R4+Acc56nErJV2o+DbdrGALZMAhI+/NRZ2q8J2/3TVvIaH1kYu3an+aisd2EJDD
         CCzndEjoIOVkIuAAZwsiAgEJXqG8OdkXW8Cu+fJX+oPWSBBwWI4Nxd2WuhEWpxbfLzfQ
         t6ZgVoBvS/Kyf4kXoB4a0LcdFRlMwpxY2eUPKkM/5PbWxHrwziiPRevQ6ynpN0qO4KzI
         U7WkdFknHuLEfe6Rawh5kXzuCo6ORBCuJpnlvfp0PGfsYKBnhzE6lFmcIf28t+P8Oh6F
         wvGpaDH4nCAvyzjOIi+4JdDtvhtP/wpS/CV9YwShVvcTUIrhnr1ibqku6whNnnlXbIzE
         ZUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782878464; x=1783483264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1e3YXWFANhBpw4yjMWQhabBTa2QrRN36l2rv62U94S4=;
        b=YHQxxA4VpiSSDA5aUmdp503l9DE6xXn5HQVtEB+ixtmxFncc/IBrgjThheh0qLCLgA
         dfxMikPZNAd6AQRuT7YtKLTju8L0etg3m42yRpSfoYzyig2T8+SX16F+/PfUNb5YPTxm
         VGoqolUZS4rmCqEnZNsoanE+aQOYZwdU227Z8umGazKvhBnAQx/zAxLLWRUm+wb5wP1Q
         Mvd0ijuErylpqGm8xRqp/yvxn476Hl3NXLjqMvVfBqFAben7j+2DfiJzVW0pR/DhI7VV
         fVc38wNhe90iAfTn1xmEntBmNZzKowOzJSSaq83p+D3pohT+q/4CipeglbTEpj0iIR5c
         dd8A==
X-Forwarded-Encrypted: i=1; AHgh+Rqepp6czf/ONsNvhaJEu59VnmPWIddFQCr0jZV6vS7v3A6Oj4LSecUZk3DNw3XRTSsH12ajUdBUSSg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwN9k0DPm4ukF3dyNd/p94Bbqk/Wu7hYvxEu4RBq53+rww+dXrb
	vd7oVJa1voLuunALlxOMrEd/SWqzRa7rhQDyATsj26768jfQ5hYiMfUz11dXQ0veZ1w=
X-Gm-Gg: AfdE7cmHE0YcUREGyYAmEfE74GHPd9+k5SDockQaBCRf8bpWwlf2xrwtv8uWeOlaQc6
	xBxHuTz5p+1JmfgZlYUG6F51XfWY3iz45AoHIsOvGr8DoIqzhiy/UiD06Szag96Tlo2m7qmwxJm
	lWquSSKX2iApb8NUlI11rHCRbYhg09VelgC+ldLyCqFSO82mMrI8Z82CRR3Ftg0OoinwoCCHFgU
	DiQ7N256HGokrOmSkTBkUpBD2iYuWjKTjwpuhYBXWaxgxDyVLmXy/QmscO6gxafaIkRLKji1gBe
	BKlC/UNMIkmJSumtor6CgbbQNcfOFBy5DpR09ECBqKnOw4DbuELGxVaBRDM/o2Our1Wj/BxaLx+
	q6deBAlJBN05xntzQqJxso+V5HooRYbsSr7FAvpEwHLZsHMs9SJDNe9o1zJ1uG5EeaOOlNRe93B
	+mzyfh+g7IHV1rEJiVjHfxgUklNIx3ieEDPdcX/TMxSvcHxMMW5tk65nwAxiHpnvK6
X-Received: by 2002:a05:7300:148f:b0:30c:ab96:7305 with SMTP id 5a478bee46e88-30efe97a06bmr77957eec.21.1782878463972;
        Tue, 30 Jun 2026 21:01:03 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm14024287eec.27.2026.06.30.21.00.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 30 Jun 2026 21:01:03 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [RFC PATCH 1/3] iommu/riscv: Complete MRIF MSI PTE setup
Date: Wed,  1 Jul 2026 12:00:14 +0800
Message-ID: <20260701040017.42707-2-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701040017.42707-1-zhangzhanpeng.jasper@bytedance.com>
References: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
 <20260701040017.42707-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_210105_207103_075E88E8 
X-CRM114-Status: GOOD (  17.68  )
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

The MRIF path can retarget an existing MSI table entry, but it does
not fully handle installing a new MRIF MSI table entry.  It also encodes
the MRIF target with the normal PPN helper even though a RISC-V IOMMU MSI
PTE uses MRIF_ADDR[53:7] in MRIF mode.

Add a dedicated MRIF PTE helper and use it for both the new-table and
retarget paths.  This keeps the normal MSI PTE encoding unchanged while
programming the MRIF address and information fields when vCPU affinity
requests MRIF delivery.

Publish MRIF entries so the notice information is visible before the
valid PTE word is installed.  When rewriting a live entry, clear the PTE
word first and order the mrif_info update before publishing the
replacement PTE, so a racing device MSI does not observe a valid MRIF PTE
with stale notice data.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 drivers/iommu/riscv/iommu-ir.c | 96 ++++++++++++++++++++++++++--------
 1 file changed, 75 insertions(+), 21 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index ccbb7aa74a25..82fbb44d6df0 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -119,10 +119,11 @@ static void riscv_iommu_ir_set_pte(struct riscv_iommu_msipte *pte, u64 addr)
 
 static void riscv_iommu_ir_set_mrif_pte(struct riscv_iommu_msipte *pte, u64 addr, u64 mrif_info)
 {
+	pte->mrif_info = mrif_info;
+	dma_wmb();
 	pte->pte = FIELD_PREP(RISCV_IOMMU_MSIPTE_M, 1) |
-		   riscv_iommu_phys_to_ppn(addr) |
+		   riscv_iommu_phys_to_mrif(addr) |
 		   FIELD_PREP(RISCV_IOMMU_MSIPTE_V, 1);
-	pte->mrif_info = mrif_info;
 }
 
 static void riscv_iommu_ir_clear_pte(struct riscv_iommu_msipte *pte)
@@ -131,6 +132,17 @@ static void riscv_iommu_ir_clear_pte(struct riscv_iommu_msipte *pte)
 	pte->mrif_info = 0;
 }
 
+static void riscv_iommu_ir_update_pte(struct riscv_iommu_msipte *pte,
+				      const struct riscv_iommu_msipte *pteval)
+{
+	/* Rewrite live entries without exposing stale MRIF notice data. */
+	pte->pte = 0;
+	dma_wmb();
+	pte->mrif_info = pteval->mrif_info;
+	dma_wmb();
+	pte->pte = pteval->pte;
+}
+
 static void riscv_iommu_ir_msitbl_inval(struct riscv_iommu_domain *domain)
 {
 	struct riscv_iommu_bond *bond;
@@ -337,14 +349,65 @@ static bool riscv_iommu_ir_vcpu_check_config(struct riscv_iommu_domain *domain,
 	       domain->group_index_shift == vcpu_info->group_index_shift;
 }
 
+static int riscv_iommu_ir_get_mrif_info(struct irq_data *data,
+					struct riscv_iommu_ir_vcpu_info *vcpu_info,
+					u64 *mrif_info)
+{
+	struct device *dev;
+	struct riscv_iommu_device *iommu;
+	struct msi_desc *desc;
+	struct irq_data *irqdata;
+	struct irq_chip *chip;
+
+	*mrif_info = 0;
+	if (!vcpu_info->mrif)
+		return 0;
+
+	if (!vcpu_info->host_msg)
+		return -EINVAL;
+
+	desc = irq_data_get_msi_desc(data);
+	if (!desc)
+		return -EINVAL;
+
+	dev = msi_desc_to_dev(desc);
+	if (!dev)
+		return -EINVAL;
+
+	iommu = dev_to_iommu(dev);
+	if (!iommu)
+		return -ENODEV;
+
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_MRIF)) {
+		irqdata = irq_get_irq_data(vcpu_info->host_irq);
+		chip = irqdata ? irq_data_get_irq_chip(irqdata) : NULL;
+		if (!chip || !chip->irq_write_msi_msg)
+			return -EOPNOTSUPP;
+
+		chip->irq_write_msi_msg(irqdata, vcpu_info->host_msg);
+		return -ENODEV;
+	}
+
+	*mrif_info = riscv_iommu_data_to_nid(vcpu_info->host_msg->data) |
+		     riscv_iommu_phys_to_nppn((u64)vcpu_info->host_msg->address_hi << 32 |
+					      vcpu_info->host_msg->address_lo);
+
+	return 0;
+}
+
 static int riscv_iommu_ir_vcpu_new_config(struct riscv_iommu_domain *domain,
 					  struct irq_data *data,
 					  struct riscv_iommu_ir_vcpu_info *vcpu_info)
 {
 	struct riscv_iommu_msipte *pte;
+	u64 mrif_info;
 	size_t idx;
 	int ret;
 
+	ret = riscv_iommu_ir_get_mrif_info(data, vcpu_info, &mrif_info);
+	if (ret)
+		return ret;
+
 	if (domain->pgd_mode)
 		riscv_iommu_ir_unmap_imsics(domain);
 
@@ -378,8 +441,10 @@ static int riscv_iommu_ir_vcpu_new_config(struct riscv_iommu_domain *domain,
 	idx = riscv_iommu_ir_compute_msipte_idx(domain, vcpu_info->gpa);
 	pte = &domain->msi_root[idx];
 	riscv_iommu_ir_irq_set_msitbl_info(data, idx, domain->msitbl_config);
-	BUG_ON(vcpu_info->mrif);
-	riscv_iommu_ir_set_pte(pte, vcpu_info->hpa);
+	if (vcpu_info->mrif)
+		riscv_iommu_ir_set_mrif_pte(pte, vcpu_info->hpa, mrif_info);
+	else
+		riscv_iommu_ir_set_pte(pte, vcpu_info->hpa);
 	riscv_iommu_ir_msitbl_inval(domain);
 	refcount_set(&domain->msi_pte_counts[idx], 1);
 
@@ -393,15 +458,13 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg
 	struct riscv_iommu_info *info = data->domain->host_data;
 	struct riscv_iommu_domain *domain = info->domain;
 	struct riscv_iommu_ir_vcpu_info *vcpu_info = arg;
-	struct device *dev = msi_desc_to_dev(irq_data_get_msi_desc(data));
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_msipte pteval;
 	struct riscv_iommu_msipte *pte;
 	bool inc = false, dec = false;
 	size_t old_idx, new_idx;
 	u32 old_config;
 	u64 mrif_info = 0;
-	bool mrif_support = (iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_MRIF);
+	int ret;
 
 	if (!domain->msi_root)
 		return -EOPNOTSUPP;
@@ -422,18 +485,9 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg
 	if (!riscv_iommu_ir_vcpu_check_config(domain, vcpu_info))
 		return riscv_iommu_ir_vcpu_new_config(domain, data, vcpu_info);
 
-	if (vcpu_info->mrif) {
-		if (!mrif_support) {
-			struct irq_data *irqdata = irq_get_irq_data(vcpu_info->host_irq);
-			irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata,
-					vcpu_info->host_msg);
-			return -ENODEV;
-		}
-		mrif_info = riscv_iommu_data_to_nid(vcpu_info->host_msg->data) |
-				riscv_iommu_phys_to_nppn(
-					(u64)vcpu_info->host_msg->address_hi << 32 |
-					vcpu_info->host_msg->address_lo);
-	}
+	ret = riscv_iommu_ir_get_mrif_info(data, vcpu_info, &mrif_info);
+	if (ret)
+		return ret;
 
 	new_idx = riscv_iommu_ir_compute_msipte_idx(domain, vcpu_info->gpa);
 	riscv_iommu_ir_irq_set_msitbl_info(data, new_idx, domain->msitbl_config);
@@ -444,8 +498,8 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg
 	else
 		riscv_iommu_ir_set_pte(&pteval, vcpu_info->hpa);
 
-	if (pteval.pte != pte->pte) {
-		*pte = pteval;
+	if (pteval.pte != pte->pte || pteval.mrif_info != pte->mrif_info) {
+		riscv_iommu_ir_update_pte(pte, &pteval);
 		riscv_iommu_ir_msitbl_inval(domain);
 	}
 
-- 
2.50.1 (Apple Git-155)


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

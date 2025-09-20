Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521DACAC5AA
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9W11lNBPCWJlAqGtYZzT27Y3adFFDSJjctSnPpYihZ8=; b=IBtpondgEjCyTt
	clTHtbARhTBR2PTMJubK0iQ44soD0GzRKw1Iyx4cNxr49hOLWEp/jHNnrXNsJpwdM1TWgNWxB3+9b
	XgdPliPBtOMR2tzU6yFNR4bv8HpXvsg5BPIkuMMUPCSy825GYzwMy1wqVTS7xMqk60Mhc2DzGBuUM
	nReZSywM6P1LVmCDdHRhLx1wVFFm8xNJ5OpljDyKmnGi+aV+yyJQe2N0EiODGT0kUPKEhP8/jodV7
	SKxbR/6MzdKTBO1mm22aEKYgVWIoYUNVAehtXNHpsrtHrlmNSNi954A8A5fHpXD0hWS5xDvZ1ljeJ
	iEl1WGkgae/2gNPW+8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MX-00000005tkm-0At1;
	Sat, 20 Sep 2025 20:39:17 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MP-00000005tW3-10fS
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:12 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-8b9a246a26fso41351339f.3
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400748; x=1759005548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hI0KkCC908juzA+gLK6iwf+tDIKeFweMVpvJKlXZSdQ=;
        b=lb6OWqMFYsIebYS9P3RP4UdOuvJ9TgDXJNI86ujQcomJqTkwmDUvyIaSmqgjOJnuxw
         yNJLkwf3Q//lNDrlesWmOMUDnNL3sdMfxNfpqONSHGs0t8FECPdpx7TqfmyQrlD6oBro
         PM4WnqiCWJwwnsgq8kbThdjiDPqJAPW9A2ukBNdcwqoRBnENcDREUJiSpfM+3d+zV7Yv
         LJJnSAJ0TgAXLyEhaU7Jpz6SUTEcG8tLrrRpXkBzSXUagOr191LYA03H7CavZqlv5ms4
         ZX68Z97GNqB1tF1YfpKm8Ao3thbHae1Evr1doyXN0SZmcILMjEJQ4cHsVYNjoJRrRJCX
         oL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400748; x=1759005548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hI0KkCC908juzA+gLK6iwf+tDIKeFweMVpvJKlXZSdQ=;
        b=UILxIPdwCb6P0f3p84NhltB/cA0eG4WJ8hYhyZayJDJdsqQ5XBURSAJ2OBq31ncj1V
         7H4iPYQNm649SPpuO0+WZ2JEfzGweuZpZMWBgqrENXo6PGeZYDPhC2H1nGDo4hYHfRSX
         dcFOUSYMj03v6ij0whhIc2tYslrhQWmQ0a2R93/DJJp+fx2luqLTwoO9iQ3s8WwbHrNI
         3zHKgVLxM2z+qZh2SGq9p26J1hOosve9yN9VL77T8mYboyoUPfML8aSbpnpAVX8smg3I
         LZ6wGM3egXyaM3YRZ3af4gYXWzTja5HVZHp1x6x0fHf3pkfhJq9/oiCC90rII4jgRYvW
         6t5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXl5CDBsM85/7M+oDeMU8FO0H1MsbyDZN7daUb400bAbfbEzNfAFC+MeU//XoNZLE+EkSqSlCqJV4E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4CGF5NyagzhOLWN2Nhye2dubwBQCrjXVCpEuXcJ/2Jg/X7I4f
	4j6F6r9T7kZR3c6893nmEWmat9e52gZD0UgdAst3tI8VwyTFpkkxRIO6mudXrCylsgg=
X-Gm-Gg: ASbGncu/Xi4OqVyq29xThtPuADFJWyZistOOhZeB/BuE3FAwTZDI+7CmqBIjah2rtOr
	5ApbKRj8lt/mkv9T8fkzGYcxPLxihCWZr5UkRNxvyHlgBPqHW/bDgyMBTWI8mqbASSMZpYWcWwj
	OtXymKJc2uqom5PwjYmWwCMTvQoYdLQNhhaLuixhyUehHtdMFADCiezG3tYdlmXYTzY758pDmtC
	FmZVe4hYjzrBQoCk9kBye7VAInRjY8vlTIPSt4ZJFO0CvySGW47vaLlZoW0DAELEMYYjQqWLfLQ
	eULMH5M+l9cujJH/WMQia3tLn0sXprYi7enrIF9IiBGeZ4AtWoOyT1p0T0AhT79RMQqxs3klftV
	gvvn+LP5SAKFTvoCM6eBQ/4MH
X-Google-Smtp-Source: AGHT+IFJgtbAqkbkjXlxObLQUPDKlz44e0dr9Vutprt6NCQKthpg1P2JZGIWX+/KF2ezfdpqgFeHqw==
X-Received: by 2002:a05:6602:4897:b0:8a6:d20a:ee1 with SMTP id ca18e2360f4ac-8ade0ed8ff3mr1019606639f.18.1758400748282;
        Sat, 20 Sep 2025 13:39:08 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a46da3e981sm283735739f.9.2025.09.20.13.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:07 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 12/18] iommu/riscv: Add guest file irqbypass support
Date: Sat, 20 Sep 2025 15:39:02 -0500
Message-ID: <20250920203851.2205115-32-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133910_134900_7BB2B4E6 
X-CRM114-Status: GOOD (  22.65  )
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

Implement irq_set_vcpu_affinity() in the RISCV IOMMU driver.
irq_set_vcpu_affinity() is the channel from a hypervisor to the
IOMMU needed to ensure that assigned devices which direct MSIs to
guest IMSIC addresses will have those MSI writes redirected to
their corresponding guest interrupt files.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-ir.c | 165 ++++++++++++++++++++++++++++++++-
 drivers/iommu/riscv/iommu.c    |   5 +-
 drivers/iommu/riscv/iommu.h    |   4 +
 3 files changed, 171 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 059671f18267..48f424ce1a8d 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -10,6 +10,8 @@
 #include <linux/msi.h>
 #include <linux/sizes.h>
 
+#include <asm/irq.h>
+
 #include "../iommu-pages.h"
 #include "iommu.h"
 
@@ -164,6 +166,48 @@ static void riscv_iommu_ir_msitbl_inval(struct riscv_iommu_domain *domain,
 	rcu_read_unlock();
 }
 
+static void riscv_iommu_ir_msitbl_clear(struct riscv_iommu_domain *domain)
+{
+	for (size_t i = 0; i < riscv_iommu_ir_nr_msiptes(domain); i++) {
+		riscv_iommu_ir_clear_pte(&domain->msi_root[i]);
+		refcount_set(&domain->msi_pte_counts[i], 0);
+	}
+}
+
+static void riscv_iommu_ir_msiptp_update(struct riscv_iommu_domain *domain)
+{
+	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_device *iommu, *prev;
+	struct riscv_iommu_dc new_dc = {
+		.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
+		      RISCV_IOMMU_PC_TA_V,
+		.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
+		       FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
+		.msiptp = virt_to_pfn(domain->msi_root) |
+			  FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
+				     RISCV_IOMMU_DC_MSIPTP_MODE_FLAT),
+		.msi_addr_mask = domain->msi_addr_mask,
+		.msi_addr_pattern = domain->msi_addr_pattern,
+	};
+
+	/* Like riscv_iommu_ir_msitbl_inval(), synchronize with riscv_iommu_bond_link() */
+	smp_mb();
+
+	rcu_read_lock();
+
+	prev = NULL;
+	list_for_each_entry_rcu(bond, &domain->bonds, list) {
+		iommu = dev_to_iommu(bond->dev);
+		if (iommu == prev)
+			continue;
+
+		riscv_iommu_iodir_update(iommu, bond->dev, &new_dc);
+		prev = iommu;
+	}
+
+	rcu_read_unlock();
+}
+
 struct riscv_iommu_ir_chip_data {
 	size_t idx;
 	u32 config;
@@ -279,12 +323,127 @@ static int riscv_iommu_ir_irq_set_affinity(struct irq_data *data,
 	return ret;
 }
 
+static bool riscv_iommu_ir_vcpu_check_config(struct riscv_iommu_domain *domain,
+					     struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	return domain->msi_addr_mask == vcpu_info->msi_addr_mask &&
+	       domain->msi_addr_pattern == vcpu_info->msi_addr_pattern &&
+	       domain->group_index_bits == vcpu_info->group_index_bits &&
+	       domain->group_index_shift == vcpu_info->group_index_shift;
+}
+
+static int riscv_iommu_ir_vcpu_new_config(struct riscv_iommu_domain *domain,
+					  struct irq_data *data,
+					  struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	struct riscv_iommu_msipte *pte;
+	size_t idx;
+	int ret;
+
+	if (domain->pgd_mode)
+		riscv_iommu_ir_unmap_imsics(domain);
+
+	riscv_iommu_ir_msitbl_clear(domain);
+
+	domain->msi_addr_mask = vcpu_info->msi_addr_mask;
+	domain->msi_addr_pattern = vcpu_info->msi_addr_pattern;
+	domain->group_index_bits = vcpu_info->group_index_bits;
+	domain->group_index_shift = vcpu_info->group_index_shift;
+	domain->imsic_stride = SZ_4K;
+	domain->msitbl_config += 1;
+
+	if (domain->pgd_mode) {
+		/*
+		 * As in riscv_iommu_ir_irq_domain_create(), we do all stage1
+		 * mappings up front since the MSI table will manage the
+		 * translations.
+		 *
+		 * XXX: Since irq-set-vcpu-affinity is called in atomic context
+		 * we need GFP_ATOMIC. If the number of 4K dma pte allocations
+		 * is considered too many for GFP_ATOMIC, then we can wrap
+		 * riscv_iommu_pte_alloc()'s iommu_alloc_pages_node_sz() call
+		 * in a mempool and try to ensure the pool has enough elements
+		 * in riscv_iommu_ir_irq_domain_enable_msis().
+		 */
+		ret = riscv_iommu_ir_map_imsics(domain, GFP_ATOMIC);
+		if (ret)
+			return ret;
+	}
+
+	idx = riscv_iommu_ir_compute_msipte_idx(domain, vcpu_info->gpa);
+	pte = &domain->msi_root[idx];
+	riscv_iommu_ir_irq_set_msitbl_info(data, idx, domain->msitbl_config);
+	riscv_iommu_ir_set_pte(pte, vcpu_info->hpa);
+	riscv_iommu_ir_msitbl_inval(domain, NULL);
+	refcount_set(&domain->msi_pte_counts[idx], 1);
+
+	riscv_iommu_ir_msiptp_update(domain);
+
+	return 0;
+}
+
+static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg)
+{
+	struct riscv_iommu_info *info = data->domain->host_data;
+	struct riscv_iommu_domain *domain = info->domain;
+	struct riscv_iommu_ir_vcpu_info *vcpu_info = arg;
+	struct riscv_iommu_msipte pteval;
+	struct riscv_iommu_msipte *pte;
+	bool inc = false, dec = false;
+	size_t old_idx, new_idx;
+	u32 old_config;
+
+	if (!domain->msi_root)
+		return -EOPNOTSUPP;
+
+	old_idx = riscv_iommu_ir_irq_msitbl_idx(data);
+	old_config = riscv_iommu_ir_irq_msitbl_config(data);
+
+	if (!vcpu_info) {
+		riscv_iommu_ir_msitbl_unmap(domain, data, old_idx);
+		return 0;
+	}
+
+	guard(raw_spinlock)(&domain->msi_lock);
+
+	if (!riscv_iommu_ir_vcpu_check_config(domain, vcpu_info))
+		return riscv_iommu_ir_vcpu_new_config(domain, data, vcpu_info);
+
+	new_idx = riscv_iommu_ir_compute_msipte_idx(domain, vcpu_info->gpa);
+	riscv_iommu_ir_irq_set_msitbl_info(data, new_idx, domain->msitbl_config);
+
+	pte = &domain->msi_root[new_idx];
+	riscv_iommu_ir_set_pte(&pteval, vcpu_info->hpa);
+
+	if (pteval.pte != pte->pte) {
+		*pte = pteval;
+		riscv_iommu_ir_msitbl_inval(domain, pte);
+	}
+
+	if (old_config != domain->msitbl_config)
+		inc = true;
+	else if (new_idx != old_idx)
+		inc = dec = true;
+
+	if (dec && refcount_dec_and_test(&domain->msi_pte_counts[old_idx])) {
+		pte = &domain->msi_root[old_idx];
+		riscv_iommu_ir_clear_pte(pte);
+		riscv_iommu_ir_msitbl_inval(domain, pte);
+	}
+
+	if (inc && !refcount_inc_not_zero(&domain->msi_pte_counts[new_idx]))
+		refcount_set(&domain->msi_pte_counts[new_idx], 1);
+
+	return 0;
+}
+
 static struct irq_chip riscv_iommu_ir_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_ack		= irq_chip_ack_parent,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_set_affinity	= riscv_iommu_ir_irq_set_affinity,
+	.irq_set_vcpu_affinity	= riscv_iommu_ir_irq_set_vcpu_affinity,
 };
 
 static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
@@ -334,7 +493,11 @@ static void riscv_iommu_ir_irq_domain_free_irqs(struct irq_domain *irqdomain,
 		config = riscv_iommu_ir_irq_msitbl_config(data);
 		/*
 		 * Only irqs with matching config versions need to be unmapped here
-		 * since config changes will unmap everything.
+		 * since config changes will unmap everything and irq-set-vcpu-affinity
+		 * irq deletions unmap at deletion time. An example of stale indices that
+		 * don't need to be unmapped are those of irqs allocated by VFIO that a
+		 * guest driver never used. The config change made for the guest will have
+		 * already unmapped those, though, so there's no need to unmap them here.
 		 */
 		if (config == domain->msitbl_config) {
 			idx = riscv_iommu_ir_irq_msitbl_idx(data);
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 440c3eb6f15a..02f38aa0b231 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -957,8 +957,9 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
  * device is not quiesced might be disruptive, potentially causing
  * interim translation faults.
  */
-static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
-				     struct device *dev, struct riscv_iommu_dc *new_dc)
+void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
+			      struct device *dev,
+			      struct riscv_iommu_dc *new_dc)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct riscv_iommu_dc *dc;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 130f82e8392a..5ab2b4d6ee88 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -124,6 +124,10 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
+void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
+			      struct device *dev,
+			      struct riscv_iommu_dc *new_dc);
+
 void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
 			  struct riscv_iommu_command *cmd);
 void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu, unsigned int timeout_us);
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C75CAC5B0
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QKB1sw4U2K3HIpebcTySsnhJjLHuHJnaoyTj2W+NEY=; b=pEy7m4Ky0MdXGC
	YvsIYmJMSszEynTEfZWOrgX03LY2EOKo/wFue9j5yYyBSSD8h2Bmzmx7bJU5eW0JT4M1cglotgDgD
	ACEdMeN5eWLVfj1E7SIvyBgtziux2bnAHO0KDD87f3aPHRFVUFoGhuiTvIZIngIrmhWbraM6HGcxa
	3WEzceNYGfFYYUTqT9iH4ucqoL+VdzluHvqqJQ3Q2Dhj/0CMI3RVKcNmPHElnpVRb2eXqypkKWTjg
	psnPfuWKjvJ09nP/zD/Epnll16FUREvVC4TPjLbwqXDopzqhZw5jg13IzekqRyu143Nj4+z2bLHkf
	nsEM8gFEsTvRMynDUIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MS-00000005tbl-1O76;
	Sat, 20 Sep 2025 20:39:12 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MN-00000005tUG-2iKg
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:08 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-424081ae9f2so14537235ab.0
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400747; x=1759005547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLOgLIfPePBzUWNKI9OUk1ZH4Tzzj3tfMuaJlKPwZCo=;
        b=KUMSU0jzTGw3sHCk+pmNYXDx3t3Ksn3bM5MNfh9y3y/VZU5cR9zBXGpNKrQJVaz1sV
         OaYjVUYkQVMU0t1ZGmn3PR716lz/9m+V0+TZf2yTqDcwut1E+2efkF8Mb77rfARPy4tK
         NAh+wx+4Pl5rdRlzkXE0cj02fC7VIyFNrRJD4nhPiUmRqKhBNg25ABpn3myMZ7aY+/gC
         vVgA+gsWJFiQrbeusKVGexryS8l6/P80J0GRn+QWVnpItsGJ5hdMk/3I34DMXHNatmF4
         zwgK/czhILX0UOxttpm2Sx/rwEuGg58c5zuZ+RIkwW025DMCnzBQUtoUNZF3HkvBGi+y
         ybEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400747; x=1759005547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLOgLIfPePBzUWNKI9OUk1ZH4Tzzj3tfMuaJlKPwZCo=;
        b=niERQ7aKqs7Y3DJdelHOMsEAeDQ/gj/yLrVAkwNxXE0+OSp3DpV//0Iru7IOPLUhOX
         autGpWo1wkz+rmJqEeFnEPyfu0U4ZmcRjZ6DtF33+9b1uv4I7eHJerJ9l60nD3huJLDa
         wmod9ZYbz6PLs3IrqXKpA4TW/VrUnnWn9PNAg06Ltt7pcTVEubAj/USF128kTXt6E0TD
         IBTiv6gpG1SQYc8OwaH1y448y4wxp21lTYjBxees3dLnTg9YNJcSzUBZA3pVKjuhCVkH
         a6NnIOIbdfLuAgPuh0tBFSE1UD5ZX5rMaQcx8bAl63qludi0pBwhUcxXYLERtUuGpF+Z
         dgJA==
X-Forwarded-Encrypted: i=1; AJvYcCVBTFzeKCOdsJmH+xJJDah+oFY5gGIvGPiCpugqbV3ykV/Pb9YVnASjIxgNda1gQwUvWW+Geu5HLVY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJhhLtUaIRkOpPtx3NYpNImWMv9j8+/qa9Xu9Fvzc+w8WL+vs
	8ZfMINjJBZRhpKZToAzG+yEGdW+dERP7QCLJax6MSgZ8x8FWeNgl7WqV35nBGxd1Hi+nNFwiQaC
	jGFFGMq8=
X-Gm-Gg: ASbGncsO3hcRbI3lpZMiAgNoC1s/pYsTNr8GGDcA8BUlyc5M8Hu4e/R3dSurtPJdNcL
	YW8EeXbIK6gnMXEaVsTsm/h0oqFmwuGy8erX9vA6/xiQQMxNtT5JY2crL0qXLWSwXzPndHc6ixM
	KdflEnskmGOP+oD9CnHvFO/3yNCLWAzeIQfJaw0LStDr06EzRxn7Wr0EzQDrcjjRY/vMLOnQE6l
	gf9TaX+ABQNfQq9klCwWsTZ3ihrn53lCvyuuzzM3zQW9McjAFysmqCgs62UAXprcThASWxPgzeW
	w06GRWBmhyoFRqUGR4njZja2zXU/t0Mu1YwVmsY8nB24TO5ac2OhpcKziuXtrlFu3zXwtJakrex
	NiIWSpX++SkjWtwYdmqnL6Hq3
X-Google-Smtp-Source: AGHT+IEWlWgkYSGO8sbLjeEJVsqweL0Gl+KFRCXKq/6gJAMJHxAY6N4lyWxDMwaZbg9QR7K4TJrpzg==
X-Received: by 2002:a05:6e02:1a64:b0:423:5293:5739 with SMTP id e9e14a558f8ab-424819748bamr113626355ab.19.1758400746834;
        Sat, 20 Sep 2025 13:39:06 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244a4938b4sm38308745ab.11.2025.09.20.13.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:06 -0700 (PDT)
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
Subject: [RFC PATCH v2 11/18] iommu/riscv: Maintain each irq msitbl index with chip data
Date: Sat, 20 Sep 2025 15:39:01 -0500
Message-ID: <20250920203851.2205115-31-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133907_707817_173E0F4D 
X-CRM114-Status: GOOD (  19.16  )
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

Track each IRQ's MSI table index in the IRQ's chip data of the IR
irqdomain along with a generation number. This will be necessary
when support for irq-set-vcpu-affinity is added as the msitbl
configuration will change to match the guest. When a configuration
changes then it may no longer be possible to compute the index from
the target address, hence the need to stash it. Also, if an allocated
IRQ is not mapped with irq-set-vcpu-affinity after a configuration
change (which will unmap everything), then we need to avoid
attempting to unmap it at free-irqs time.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-ir.c | 75 +++++++++++++++++++++++++++++-----
 drivers/iommu/riscv/iommu.h    |  1 +
 2 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index b97768cac4be..059671f18267 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -164,11 +164,42 @@ static void riscv_iommu_ir_msitbl_inval(struct riscv_iommu_domain *domain,
 	rcu_read_unlock();
 }
 
-static void riscv_iommu_ir_msitbl_map(struct riscv_iommu_domain *domain, size_t idx,
-				      phys_addr_t addr)
+struct riscv_iommu_ir_chip_data {
+	size_t idx;
+	u32 config;
+};
+
+static size_t riscv_iommu_ir_irq_msitbl_idx(struct irq_data *data)
+{
+	struct riscv_iommu_ir_chip_data *chip_data = irq_data_get_irq_chip_data(data);
+
+	return chip_data->idx;
+}
+
+static u32 riscv_iommu_ir_irq_msitbl_config(struct irq_data *data)
+{
+	struct riscv_iommu_ir_chip_data *chip_data = irq_data_get_irq_chip_data(data);
+
+	return chip_data->config;
+}
+
+static void riscv_iommu_ir_irq_set_msitbl_info(struct irq_data *data,
+					       size_t idx, u32 config)
+{
+	struct riscv_iommu_ir_chip_data *chip_data = irq_data_get_irq_chip_data(data);
+
+	chip_data->idx = idx;
+	chip_data->config = config;
+}
+
+static void riscv_iommu_ir_msitbl_map(struct riscv_iommu_domain *domain,
+				      struct irq_data *data,
+				      size_t idx, phys_addr_t addr)
 {
 	struct riscv_iommu_msipte *pte;
 
+	riscv_iommu_ir_irq_set_msitbl_info(data, idx, domain->msitbl_config);
+
 	if (!domain->msi_root)
 		return;
 
@@ -186,9 +217,17 @@ static void riscv_iommu_ir_msitbl_map(struct riscv_iommu_domain *domain, size_t
 	}
 }
 
-static void riscv_iommu_ir_msitbl_unmap(struct riscv_iommu_domain *domain, size_t idx)
+static void riscv_iommu_ir_msitbl_unmap(struct riscv_iommu_domain *domain,
+					struct irq_data *data, size_t idx)
 {
 	struct riscv_iommu_msipte *pte;
+	u32 config;
+
+	config = riscv_iommu_ir_irq_msitbl_config(data);
+	riscv_iommu_ir_irq_set_msitbl_info(data, -1, -1);
+
+	if (WARN_ON_ONCE(config != domain->msitbl_config))
+		return;
 
 	if (!domain->msi_root)
 		return;
@@ -219,11 +258,11 @@ static int riscv_iommu_ir_irq_set_affinity(struct irq_data *data,
 {
 	struct riscv_iommu_info *info = data->domain->host_data;
 	struct riscv_iommu_domain *domain = info->domain;
-	phys_addr_t old_addr, new_addr;
 	size_t old_idx, new_idx;
+	phys_addr_t new_addr;
 	int ret;
 
-	old_idx = riscv_iommu_ir_get_msipte_idx_from_target(domain, data, &old_addr);
+	old_idx = riscv_iommu_ir_irq_msitbl_idx(data);
 
 	ret = irq_chip_set_affinity_parent(data, dest, force);
 	if (ret < 0)
@@ -234,8 +273,8 @@ static int riscv_iommu_ir_irq_set_affinity(struct irq_data *data,
 	if (new_idx == old_idx)
 		return ret;
 
-	riscv_iommu_ir_msitbl_unmap(domain, old_idx);
-	riscv_iommu_ir_msitbl_map(domain, new_idx, new_addr);
+	riscv_iommu_ir_msitbl_unmap(domain, data, old_idx);
+	riscv_iommu_ir_msitbl_map(domain, data, new_idx, new_addr);
 
 	return ret;
 }
@@ -254,11 +293,16 @@ static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
 {
 	struct riscv_iommu_info *info = irqdomain->host_data;
 	struct riscv_iommu_domain *domain = info->domain;
+	struct riscv_iommu_ir_chip_data *chip_data;
 	struct irq_data *data;
 	phys_addr_t addr;
 	size_t idx;
 	int i, ret;
 
+	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL_ACCOUNT);
+	if (!chip_data)
+		return -ENOMEM;
+
 	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
 	if (ret)
 		return ret;
@@ -266,8 +310,9 @@ static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
 	for (i = 0; i < nr_irqs; i++) {
 		data = irq_domain_get_irq_data(irqdomain, irq_base + i);
 		data->chip = &riscv_iommu_ir_irq_chip;
+		data->chip_data = chip_data;
 		idx = riscv_iommu_ir_get_msipte_idx_from_target(domain, data, &addr);
-		riscv_iommu_ir_msitbl_map(domain, idx, addr);
+		riscv_iommu_ir_msitbl_map(domain, data, idx, addr);
 	}
 
 	return 0;
@@ -280,14 +325,22 @@ static void riscv_iommu_ir_irq_domain_free_irqs(struct irq_domain *irqdomain,
 	struct riscv_iommu_info *info = irqdomain->host_data;
 	struct riscv_iommu_domain *domain = info->domain;
 	struct irq_data *data;
-	phys_addr_t addr;
+	u32 config;
 	size_t idx;
 	int i;
 
 	for (i = 0; i < nr_irqs; i++) {
 		data = irq_domain_get_irq_data(irqdomain, irq_base + i);
-		idx = riscv_iommu_ir_get_msipte_idx_from_target(domain, data, &addr);
-		riscv_iommu_ir_msitbl_unmap(domain, idx);
+		config = riscv_iommu_ir_irq_msitbl_config(data);
+		/*
+		 * Only irqs with matching config versions need to be unmapped here
+		 * since config changes will unmap everything.
+		 */
+		if (config == domain->msitbl_config) {
+			idx = riscv_iommu_ir_irq_msitbl_idx(data);
+			riscv_iommu_ir_msitbl_unmap(domain, data, idx);
+		}
+		kfree(data->chip_data);
 	}
 
 	irq_domain_free_irqs_parent(irqdomain, irq_base, nr_irqs);
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index aeb5642f003c..130f82e8392a 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -36,6 +36,7 @@ struct riscv_iommu_domain {
 	struct riscv_iommu_msipte *msi_root;
 	refcount_t *msi_pte_counts;
 	raw_spinlock_t msi_lock;
+	u32 msitbl_config;
 	u64 msi_addr_mask;
 	u64 msi_addr_pattern;
 	u32 group_index_bits;
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

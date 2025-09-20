Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636CECAC5AA
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jS1kIu1gSlfkSIerK4BR78YrC/jRTo4aceVFdeWM760=; b=aQKivC/SQBgWNg
	OC8QgAci+thnwOJRiSLkSSxxQb2pYZDZue01+QEyZJ1nrS/r0qdR5aDs3aZi7OtdolUR7yYZG7IHr
	LWJbghceirAZgvGUDdpzbrnh/Vw8BxIKd9oG1SKxXf8RcDKhpoxxWlGBfp1SjAyewCFyMl5lqa4EC
	r/UsTNWoBjziU0Z+9pF7JfuV/9MbY8ZXRE3OwX8Z+5tA95+HoyeiCjjIZYPgR27tZcX6Hth/kFPEq
	2/cYKRMNl7NmqMGnPpyjMq3xlz8DU6ImOJjlP55dgl/RQ/Ow99cWQ9b3Qi+bfl+TzK//wfgg/rSub
	pZVlDw/OwvbBFHulPcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MM-00000005tSF-0DOc;
	Sat, 20 Sep 2025 20:39:06 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MH-00000005tL8-3U49
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:03 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-424da17e309so10011855ab.2
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400741; x=1759005541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+FxtKFkaMzqfsBOx/+M2AhSickIS3oj89OMniHKUZk=;
        b=SHlucInInEvo/OYcGrGyIE6Z2/0lXvm9a9dCur05RqcpjkckV7c09Mr7q/ky796r+E
         HaQrKo1RxRb8xHiDJ5pLsUwMmVnMLEXWtDmEDEB+3y9YQb7GJepI3WhyuZe/mJSHmWy4
         oesVuMFoeslSwjsAcicgc6QEzFUR3XbgtVWTevmxL/cci9W+ufMJ0/Z5YDFk+bQ1zwN2
         7hO9i+e9GOA24lVIzDrown7s0KRKkAYZQNClQyH0mxQ6w0+UR3a0I+VqqMORpNentpJq
         zsydUaiI6kvs3ErCNDG5GgUs+89N8knJstW3SdW+NSlzRybkefmoHDhANu6fLSddxuUI
         3VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400741; x=1759005541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+FxtKFkaMzqfsBOx/+M2AhSickIS3oj89OMniHKUZk=;
        b=mVqD1awlkK/QddiLVej2XCMyStcAukVtIA9Kljhuhg5IH0vtjOctbZyMmzf5R0odXT
         KbeiUSYBsH7zXdCHiO98w9AOTTTygffJDdEKVr1p9WH+AST8oSvaA76cmJ+cdVM4OfrT
         cOfVc8XnwAIF6AQjCBm+jkqV6ZXNj1Pm/heTkGz3N5DXg7tisSejVCexP8I0zQclcuhl
         6Ooh5idufMRZBtICxrCWr/k/nV5Azhy+7Uh2skFWgT/FuLDGubtDZKWwgFTBtZCTMu4i
         JL0M6nbICsrz72AbWPY6MaB2AVR0n7J1eJSF16JVqMRsKFxp8oYymAW4OwnZkZUOiYzV
         LLsg==
X-Forwarded-Encrypted: i=1; AJvYcCXmoNHCxq0vEyJo/GshkZDv3v2FNWava1PfoQPqv0wHE+9jZdLzsi7Ob3Z2oL3/I4vdtaoJrYJKyts=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbmbRNFps7g54bjIcUz/afncCgFdeIXWJByQJBXGmPr+WyJLba
	FcJnRsTY8cRZVe6XVZhamHaMBYccM+JJzvdkvqMT+aXrWqVuudEGR8xSob6NEweF3/c=
X-Gm-Gg: ASbGncul+48zrnT7Df3CpfNEU/pgUzC4LKb0CPYyShI6rJq0hO5IHFoYQF1yLTWbmFs
	30GZNSGNtnq6mj62ZsgqSib0T4LTM/Ycx5w+Ry2QpXDi1Jkqyh4ZZJ2h+E2Wi4Fwp5D280Yy136
	XggQcBmkNPef6b7gdssfaJJtnlnwi+k4ru+c/6mRvmeS31ZSs75yFHD4i+jHf5ehPPymAi4LKhV
	75518ruKYwHuDQbOd+IbYnMpxCg89GAjFdVsg2QzUH+eVOwD2vlYxUljXYsXrnccz2hzbIqEwe5
	7onCZtxsq49DFYJVjXk2gxXjYkbJgXMlJOJaQu6L9+qG5CVXmP13FEaTm0hrH129fXarpdrRsBi
	05ScX2FEq8lTyrPJTKpaAV/uA
X-Google-Smtp-Source: AGHT+IFxmBfdoZnMs3c0M0178SC39JXmddc/LJRJQPqbnDUoA8qGm+QsdfK/ozn9beIf3j5HQa9YAA==
X-Received: by 2002:a05:6e02:1aa8:b0:424:8166:9b7b with SMTP id e9e14a558f8ab-42481927117mr116642155ab.9.1758400740851;
        Sat, 20 Sep 2025 13:39:00 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afaa351sm39931975ab.29.2025.09.20.13.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:00 -0700 (PDT)
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
Subject: [RFC PATCH v2 06/18] iommu/riscv: Implement MSI table management functions
Date: Sat, 20 Sep 2025 15:38:56 -0500
Message-ID: <20250920203851.2205115-26-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133901_897692_02F5D414 
X-CRM114-Status: GOOD (  22.11  )
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

Export more in iommu.h from iommu.c and implement functions needed
to manage the MSI table.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-bits.h |  7 ++++++
 drivers/iommu/riscv/iommu-ir.c   | 43 ++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c      | 36 +++-----------------------
 drivers/iommu/riscv/iommu.h      | 32 ++++++++++++++++++++++++
 4 files changed, 86 insertions(+), 32 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index 98daf0e1a306..d72b982cf9bf 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -715,6 +715,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
 	cmd->dword1 = 0;
 }
 
+static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
+{
+	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
+		      FIELD_PREP(RISCV_IOMMU_CMD_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
+	cmd->dword1 = 0;
+}
+
 static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
 						  u64 addr)
 {
diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index bed104c5333c..290d91a6c6cd 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -106,6 +106,49 @@ static size_t riscv_iommu_ir_nr_msiptes(struct riscv_iommu_domain *domain)
 	return max_idx + 1;
 }
 
+static void riscv_iommu_ir_msitbl_inval(struct riscv_iommu_domain *domain,
+					struct riscv_iommu_msipte *pte)
+{
+	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_device *iommu, *prev;
+	struct riscv_iommu_command cmd;
+
+	riscv_iommu_cmd_inval_gvma(&cmd);
+	riscv_iommu_cmd_inval_set_gscid(&cmd, 0);
+
+	if (pte) {
+		u64 addr = pfn_to_phys(FIELD_GET(RISCV_IOMMU_MSIPTE_PPN, pte->pte));
+		riscv_iommu_cmd_inval_set_addr(&cmd, addr);
+	}
+
+	/* Like riscv_iommu_iotlb_inval(), synchronize with riscv_iommu_bond_link() */
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
+		riscv_iommu_cmd_send(iommu, &cmd);
+		prev = iommu;
+	}
+
+	prev = NULL;
+	list_for_each_entry_rcu(bond, &domain->bonds, list) {
+		iommu = dev_to_iommu(bond->dev);
+		if (iommu == prev)
+			continue;
+
+		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		prev = iommu;
+	}
+
+	rcu_read_unlock();
+}
+
 static struct irq_chip riscv_iommu_ir_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_ack		= irq_chip_ack_parent,
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 0ba6504d4f33..7418e91d8edd 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -26,12 +26,6 @@
 #include "iommu-bits.h"
 #include "iommu.h"
 
-/* Timeouts in [us] */
-#define RISCV_IOMMU_QCSR_TIMEOUT	150000
-#define RISCV_IOMMU_QUEUE_TIMEOUT	150000
-#define RISCV_IOMMU_DDTP_TIMEOUT	10000000
-#define RISCV_IOMMU_IOTINVAL_TIMEOUT	90000000
-
 /* Number of entries per CMD/FLT queue, should be <= INT_MAX */
 #define RISCV_IOMMU_DEF_CQ_COUNT	8192
 #define RISCV_IOMMU_DEF_FQ_COUNT	4096
@@ -480,15 +474,15 @@ static irqreturn_t riscv_iommu_cmdq_process(int irq, void *data)
 }
 
 /* Send command to the IOMMU command queue */
-static void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
-				 struct riscv_iommu_command *cmd)
+void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
+			  struct riscv_iommu_command *cmd)
 {
 	riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd));
 }
 
 /* Send IOFENCE.C command and wait for all scheduled commands to complete. */
-static void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
-				 unsigned int timeout_us)
+void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
+			  unsigned int timeout_us)
 {
 	struct riscv_iommu_command cmd;
 	unsigned int prod;
@@ -804,28 +798,6 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 #define iommu_domain_to_riscv(iommu_domain) \
 	container_of(iommu_domain, struct riscv_iommu_domain, domain)
 
-/*
- * Linkage between an iommu_domain and attached devices.
- *
- * Protection domain requiring IOATC and DevATC translation cache invalidations,
- * should be linked to attached devices using a riscv_iommu_bond structure.
- * Devices should be linked to the domain before first use and unlinked after
- * the translations from the referenced protection domain can no longer be used.
- * Blocking and identity domains are not tracked here, as the IOMMU hardware
- * does not cache negative and/or identity (BARE mode) translations, and DevATC
- * is disabled for those protection domains.
- *
- * The device pointer and IOMMU data remain stable in the bond struct after
- * _probe_device() where it's attached to the managed IOMMU, up to the
- * completion of the _release_device() call. The release of the bond structure
- * is synchronized with the device release.
- */
-struct riscv_iommu_bond {
-	struct list_head list;
-	struct rcu_head rcu;
-	struct device *dev;
-};
-
 static int riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
 				 struct device *dev)
 {
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index dc2020b81bbc..1fe35f1210fb 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -17,6 +17,12 @@
 
 #include "iommu-bits.h"
 
+/* Timeouts in [us] */
+#define RISCV_IOMMU_QCSR_TIMEOUT	150000
+#define RISCV_IOMMU_QUEUE_TIMEOUT	150000
+#define RISCV_IOMMU_DDTP_TIMEOUT	10000000
+#define RISCV_IOMMU_IOTINVAL_TIMEOUT	90000000
+
 /* This struct contains protection domain specific IOMMU driver data. */
 struct riscv_iommu_domain {
 	struct iommu_domain domain;
@@ -89,10 +95,36 @@ struct riscv_iommu_device {
 	u64 *ddt_root;
 };
 
+/*
+ * Linkage between an iommu_domain and attached devices.
+ *
+ * Protection domain requiring IOATC and DevATC translation cache invalidations,
+ * should be linked to attached devices using a riscv_iommu_bond structure.
+ * Devices should be linked to the domain before first use and unlinked after
+ * the translations from the referenced protection domain can no longer be used.
+ * Blocking and identity domains are not tracked here, as the IOMMU hardware
+ * does not cache negative and/or identity (BARE mode) translations, and DevATC
+ * is disabled for those protection domains.
+ *
+ * The device pointer and IOMMU data remain stable in the bond struct after
+ * _probe_device() where it's attached to the managed IOMMU, up to the
+ * completion of the _release_device() call. The release of the bond structure
+ * is synchronized with the device release.
+ */
+struct riscv_iommu_bond {
+	struct list_head list;
+	struct rcu_head rcu;
+	struct device *dev;
+};
+
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
+void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
+			  struct riscv_iommu_command *cmd);
+void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu, unsigned int timeout_us);
+
 struct irq_domain *riscv_iommu_ir_irq_domain_create(struct riscv_iommu_device *iommu,
 						    struct device *dev,
 						    struct riscv_iommu_info *info);
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

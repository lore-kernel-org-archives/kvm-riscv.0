Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388A2CA5FA2
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkHRFQK/tfGdoJcIrrT5/iOpjZtT4IsCTQnkRDVFs0k=; b=MqTcOjdx0RWdzl
	wb9CYWe9DSR50IlJmz3d2HxWuOf1Rp7KhsZyGxFvTzp60+W5bNqNAwt8YOOkYoIUx/jnFTlIjeJKe
	1AP9YLjH3aLwr5JSr1dVVohStYC95JT8i8cMN22bDzNHOqWUmxmd/3nLZGd5TDXwfTYZQjg3pY9w2
	iPMg1E/ygcQ/dYQP6BNDk3A5A7VcexDf6sd2Y84ueamIIgEEVvD4Lar+LI4FTnia0zEtMkPD1h0qG
	N9USlW8Y3kR946upiU9k4PQDXtPWoa+40yWD7qbzjih6TOtjpJXiTCbL2KA7svYqgDkIODBKu4nH8
	VohE16XCtShQBSC55EMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOt-00000000laA-3Z8C;
	Mon, 28 Sep 2026 14:32:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOq-00000000lXh-0s5T
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:32:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAVHd1042576
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fXARlnUet2M
	hiIY+g7vNvo27h1dCmw8pyLb+qL38EuQ=; b=OcNy+T6zPRquLP+sx+2pJIVxXAu
	iloExvb24ljR/wERPOc2mqHIz8LSh5TFaOYiAlCBRGWVoAaReKzYUuLKPqEPsSW4
	ZyZZydUCHV/sThrv65cyzoDz//rcoNJINKKxojBoV5TFr+dm/tRHMSPzHKG0cQ8C
	G04wUuB1B3LrYnQGfBxSPJu3G0/uvud5AvS6Q4NLb1sSnnAAjTo5papmWFi7DdT+
	NYxsHuasNvhtRzvWK6hXol4U6jvifKztKU7pLBjO+B0UdDnLCY8q2FKEglAE3gWL
	qjJWYZbmZ7U1pvXCjii1oCyJRcMlmvA+iln5gnyj2UMljM0Nvw+nHqfn3rQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5msr6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7989d8ef4a6so416347137.3
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605930; x=1791210730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXARlnUet2MhiIY+g7vNvo27h1dCmw8pyLb+qL38EuQ=;
        b=gbNdGLd3YHqEUAvP8cMFft5TzhimEBd2/cOY4Han4pmum1IQLr+f7kXSEYJe3nYdbM
         EHDdwlQg2g5SAjBKtXff51VBvDp8Wcbqhw5yJQ7uOnnNafr0Wqlgvc8Uj9vJWU4JTfbX
         FiGW3+neH727NViQwR4U2he7/wKgLZZnBHeKrnH1IJ1VzVLD4xxYgXTu7AOEeyiydbMT
         QZAYv1QLGkLPMru/Vyj60H32hUWULJtR/6fGfJxiEJ0sNjtmsPoEJPIG4OBhap6yloE6
         Le19bXXjL370Dzuj0F47veeRQyFrysLomPLRmj9ss3ypmtUY10y2lESGC4Er+i3PL4v/
         zwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605930; x=1791210730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXARlnUet2MhiIY+g7vNvo27h1dCmw8pyLb+qL38EuQ=;
        b=T4DVXBVnFd9mSFgB/G4dDSsfKkbHr6Elb+lZnEok1GO+0/3lbnQiIVft79nIJ58Jrq
         PtZhGUgEVoyB+y7kc/QQ2o5vTBX1HEeiQk7jgSv+u5iUiijWtoq+MWceCwt/jUtfAtl4
         I94NFPMjJDMoWuRtjSEpasqy8SnwQ/WKJr32pzrXz6azGLbjBrrict8Lr1+KTUCqpUpa
         hQyDHRYuORcX3rEws9DDy6nDAtRUZqJK0wTfujRMmUwUjdAWsSx0zvp6litAVrukbFh1
         utONdI91u42YaZYZsLNT9pFaDY+6W1h6zqcpy8DtweVUnVQSA2lXU5Ybtb8MidoLF7cg
         qp3w==
X-Forwarded-Encrypted: i=1; AKwUvBzqwo0Lg63gCy8ij6PztMoNMhn1ZlHfghgVQKsWf/+fvlGPD/kfvItlJAm9VvVIHyZ0lFfcvO5YE24=@lists.infradead.org
X-Gm-Message-State: AFq9FYKFvl1Mb2WKhgndnMhMjrt4pL5iUL9qtHrrFSH6LEkFYLCy+pIB
	ybVjHIhyEXkQHuWimTRddTrxLXHl0a06/gc2xfcvzoeFlFRTDjxeLHZmdIocH2KaWDf/yvTbSc2
	n+uXE12EOUfIcjd8xST7Usc6iveKuQ4TgteZkA5oEkyw45WlGNlbE58BkNOgvG/E3APl0
X-Gm-Gg: AYBFou3jDDrB9HS/a1WysHFcdmSqMWk7lO+K13UtAt6lPBlsoyugzi0Li4hHTzXh1Ta
	ZTQorXiHiSvttRD/DrnCGoREYLSIh0UmdUovhvstH2E+WtnxoNdNz8a+GrxiHT8I1NRCEPNb8Tm
	E7dlD2cmrjv32MwD7k4bQsiQO2QpcEb7BTLh1DOth77hX4sjqZ9sfPeGU7oYgQSmG0196PO+hhF
	mBM9ldYAkjkxolD1TiBnyQWFM2/3FaY9fPq8FbfwQT/d8sKlmE9CQxKAQsl3GxKt2K5EOCcyZCh
	skXR1jdIc3NiJJfsd7Jm1+m6i8OjOSecTb7R+SVSMlzvZT81yCfRthPdXeJYu5Be2CaUl17G62v
	LotQwkU2Xcia0MgAhXjd9KvDVOxNHiIFJNTx17w==
X-Received: by 2002:a05:6102:3750:b0:79f:eeb7:d643 with SMTP id ada2fe7eead31-7b1c50409d9mr2497056137.10.1790605930244;
        Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
X-Received: by 2002:a05:6102:3750:b0:79f:eeb7:d643 with SMTP id ada2fe7eead31-7b1c50409d9mr2497042137.10.1790605929656;
        Mon, 28 Sep 2026 07:32:09 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd110c3esm296984266b.63.2026.09.28.07.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:08 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 07/14] iommu/riscv: Prepare MSI table updates for interrupt remapping
Date: Mon, 28 Sep 2026 16:31:06 +0200
Message-ID: <20260928143113.49838-8-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: SH6pOwKHLSA64xzqvhsJzApWY-j5FcQq
X-Proofpoint-GUID: SH6pOwKHLSA64xzqvhsJzApWY-j5FcQq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfXzb6SZ+wIPI3V
 nJnFHDMLNeeySZpw6mTmzfNCAYS+JLYLkI6TQvFZv9FP/AAfU3fiApkIdMLY/We9dRHw59+kvTK
 wKGtgt78tI0GF4971QktammOAnwj9iQVS3UcwAbBnR5P0QbEs6A30ywoMfLwyo7e2siJgfOTvSR
 ypGJfGnbwRU1w3RhjkXdkHBlqHw4av/CrXUKmUHtcTyEcSbQD1myVOE8pi4DhIz+8k7aYSJQ7oS
 MiPih5U+mBMwRFep0lVG0gDE2YNoEw7DZDMcugibhIfDePQwiYFpeePKRxkZXafF2VrS0jNwXps
 K5+d5XtHgabFX/DAb1tHJYW5NuMlk/OCKkBMWMgQghlTdXvcFJM/A4DGcVll65/VIG7qrRO0k/z
 dKsKnYG66ifn5josDG522bKDFTqyBNOz5D0QWbMAZjeNZOE/CAJ6Oh4mRFrz6jlA6JyjrHPO57b
 2e8MnaQxAeRoLsdDksQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX5ZgFHL6HBAmp
 ad2m7L2col49+D/aqw0Om3lsKv4ZTqe94GtERFdj1sDCmsRXr0n+CDEfIhNMb9EXlpFRfICMRKx
 Np75zsA9Atu2xfzDJpZgTnGCmJPpqeo=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba7a6b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=tpFWYQdyHN71iLxetsoA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073212_379309_539691E7 
X-CRM114-Status: GOOD (  19.54  )
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

Guest interrupt-file mappings require interrupt-remapping code to
install or remove the MSI page-table pointer and address extraction
fields in every device context attached to a domain. Devices joining an
active MSI domain also need their device contexts initialized, so check
for an active MSI domain at attach time.

Add helpers to publish those fields to bonded devices and to invalidate
one or all MSI PTE translations. These helpers will be used by the IRQ
bypass implementation.

The per-device nr_forwarded_irqs counter is insufficient to detect
active MSI tables for the domain, so we introduce another counter which
is domain-wide. Like info->nr_forwarded_irqs, later patches which
introduce interrupt remapping support will manage the newly introduced
nr_forwarded_irqs counter.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 65 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  5 +++
 2 files changed, 70 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 86d5795a12dd..db4539fbcb95 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1189,6 +1189,28 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 	rcu_read_unlock();
 }
 
+void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr)
+{
+	struct iommu_iotlb_gather gather = {
+		.start = addr,
+		.end = addr + SZ_4K - 1,
+		.pt.leaf_levels_bitmap = 1,
+	};
+	struct riscv_iommu_domain *domain;
+
+	domain = container_of(msi_table, struct riscv_iommu_domain, msi_table);
+	riscv_iommu_iotlb_inval(domain, &gather);
+}
+
+void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table)
+{
+	struct iommu_iotlb_gather gather = { 0 };
+	struct riscv_iommu_domain *domain;
+
+	domain = container_of(msi_table, struct riscv_iommu_domain, msi_table);
+	riscv_iommu_iotlb_inval(domain, &gather);
+}
+
 #define RISCV_IOMMU_FSC_BARE 0
 /*
  * This function sends IOTINVAL commands as required by the RISC-V
@@ -1311,6 +1333,11 @@ static void riscv_iommu_iodir_update(struct device *dev, struct riscv_iommu_dc *
 		WRITE_ONCE(dc->fsc, new_dc->fsc);
 		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
 		WRITE_ONCE(dc->iohgatp, new_dc->iohgatp);
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT) {
+			WRITE_ONCE(dc->msiptp, new_dc->msiptp);
+			WRITE_ONCE(dc->msi_addr_mask, new_dc->msi_addr_mask);
+			WRITE_ONCE(dc->msi_addr_pattern, new_dc->msi_addr_pattern);
+		}
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
 		WRITE_ONCE(dc->tc, tc);
@@ -1329,6 +1356,40 @@ static void riscv_iommu_iodir_update(struct device *dev, struct riscv_iommu_dc *
 	riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
 }
 
+static void riscv_iommu_msi_table_set_dc(struct riscv_iommu_msi_table *msi_table,
+					 struct riscv_iommu_dc *dc, bool activate)
+{
+	if (activate) {
+		dc->msiptp = virt_to_pfn(msi_table->root) |
+			     FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
+					RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
+		dc->msi_addr_mask = msi_table->msi_addr_mask;
+		dc->msi_addr_pattern = msi_table->msi_addr_pattern;
+	} else {
+		dc->msiptp = 0;
+		dc->msi_addr_mask = 0;
+		dc->msi_addr_pattern = 0;
+	}
+}
+
+void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate)
+{
+	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_bond *bond;
+
+	/* The MSI table lock excludes bond updates for this domain. */
+	lockdep_assert_held(&msi_table->lock);
+
+	domain = container_of(msi_table, struct riscv_iommu_domain, msi_table);
+
+	list_for_each_entry(bond, &domain->bonds, list) {
+		struct riscv_iommu_info *info = dev_iommu_priv_get(bond->dev);
+
+		riscv_iommu_msi_table_set_dc(msi_table, &info->dc, activate);
+		riscv_iommu_iodir_update(bond->dev, &info->dc);
+	}
+}
+
 /*
  * IOVA page translation tree management.
  */
@@ -1514,6 +1575,10 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		kfree(bond);
 		return -EBUSY;
 	}
+
+	if (domain->msi_table.nr_forwarded_irqs)
+		riscv_iommu_msi_table_set_dc(&domain->msi_table, &dc, true);
+
 	info->dc = dc;
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(dev, &info->dc);
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 2876703a6698..deb57b6a6c4b 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -71,6 +71,7 @@ struct riscv_iommu_device {
 struct riscv_iommu_msi_table {
 	/* Protects attachment, interrupt forwarding state, and MSI PTE updates. */
 	raw_spinlock_t lock;
+	unsigned int nr_forwarded_irqs;
 	unsigned int nr_ptes;
 	struct riscv_iommu_msipte *root;
 	u64 msi_addr_mask;
@@ -81,6 +82,10 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
+void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr);
+void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table);
+void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate);
+
 #define riscv_iommu_readl(iommu, addr) \
 	readl_relaxed((iommu)->reg + (addr))
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

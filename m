Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1C0CA5FA2
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYvopDguCelXymaru41UZTzyvkjFtWWC1WjI615WBZU=; b=kg2IHj9bWq2Xgz
	twuOo329s378sYbOaOFh6vCJONlHpW7Bi+F/dF/Qnu1yg1NfvmUYKPmvRTG1eMTW4kvVh1lVMMSyx
	BxI9tk2S1MQj4vIChdFy4RlXH6Iq8yai8vs1HdjNh34BK9vGD7KRXQtYUO5pjsHQpGdqZv9dAGJNo
	Xhd7nTCajuWNRP4qx1R/+7KpkodMbLvuUy6zECQqSPpRV0I9NfDnOMw70li7pgdP98iopMkQstWZV
	u5a+xxxB5owrYAWiwW7lMzT2SGmsYBGN5qllVsG5fTsO+PUnVxE1mhNstHfDFaHBwCs8tOhLla7R+
	l035oCkjcwICvlmjw4FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOL-00000000lMH-1Kiv;
	Mon, 28 Sep 2026 14:31:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOH-00000000lKT-2K2i
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:31:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SC4Xrw038626
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fnEGeXO1CU+
	HZ91pW3NLrROTKl2nGT8dwWEHiiWpE0w=; b=MOS1EdWxOybfBOix7icqGEJix+o
	apWHm7pTzOj7QugvSyaGuoGVfeOc+UeR+lqpSg+tGWiMh2aMMz3XKdVPkzsqsDMk
	my9Sk4Vt0vEiWx7p6ETG8/4HXQ1zN1LsisG94fc2nS+DdIKYMKz5qMnImJ3ABxER
	4Xrb2rldPC+l/AhbGn+uNJxgvEsWv/3a6tV2pj1lssxRxQ1Hc3OS9XQrs5Q1W7aC
	LUhrt/O4BBXYOZJr+lF+KHBcYz7ZtnbX0RcHEsBYRFPWyntcFy4Jf/l8Sd6aVUql
	ykVBgI7Gc/Q3JsUYsqguq66kmDwoxJj89uY99wc7xzGjo0aLtkR/IqO8ljg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx38jsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:31:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso217610241.3
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605896; x=1791210696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnEGeXO1CU+HZ91pW3NLrROTKl2nGT8dwWEHiiWpE0w=;
        b=cgeJjysSCjt81M2B3g4wQakj5y0cyVVUs7xdqQGujq4FfsbF/+X/FCAi0br0c9DXdw
         ewsx8dYBYCOHSMqEWHgSCVzolWbc1Q8xihAa3e7EUHZlsQj25DpdKfaMYUvaPptmxmp3
         NtrAx2ygfS0GNn0+pN/kywxjROf/4KzIejv7cMh0shSXTMSCTIpRTq6Pv8/a5li8VVVj
         619tgu8aq/DcPKQleeIze4ux1j7UziOYArvyEPy0lvg6KlLdOc/rLoruDbTVPYe9T3C8
         PuU0oA/vMyjuPQgL79FS4HHn7FEunTD6hzv/J8LsfdPlMFkrcWAsywuBd9h8EfK8TIYz
         rpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605896; x=1791210696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnEGeXO1CU+HZ91pW3NLrROTKl2nGT8dwWEHiiWpE0w=;
        b=lteDIJFEpCSbAOfGIYMqADKYkro+vqzDju7lYhopitDpRrqZqG2MmEubzxF0/s2Ctc
         ISiRQBj39CQziIoFVR/aKvnVlb2LAzjCyU7oh/lURN8/lf/QtzT0NiCyZnP7EggT4TZH
         EKnx2Jo1a8cVU3rJNqTu08IrKkhcEYDUHl35P+36CS2WPjrjvxXrAy3XyXsifz5JIKah
         IHuzhVmNgXudFNmrCsjLKIqfSkc8TbDUc9KAV05hoJ5gQhR0igTu/5kf+998MQtX7eM/
         j6DVISf67Kf7rwEDL7beuHkfvx7OA4OQ9sorzOh9BNPiU7F+ywEwwQAxryDVFOAuihTu
         Zxjg==
X-Forwarded-Encrypted: i=1; AKwUvBwrvtK5XEfqp5BYq+uHuwS2PZ25XmtoqWfO7bMX/D2CQC3uMZkk0Ha1jQ+EfkyXMGGvrigE/0n7kfM=@lists.infradead.org
X-Gm-Message-State: AFq9FYKsYIdluZK9I5m3UDgAo0EXnQR7xFjPOYOUccgQwDfpAZTg98To
	2OFynld1ZDw8n/mXlt+iheTmv9iLCgmSmC6zqfJSZ81CSm1kpo8rBVOWlfs8A4LKizVvclzooXO
	U6HuJurUPImkRvn02U4pCGPmvJfsqGTK0xHt+UmF+NJkAyYmKgd82Qa6+6uNWMYfmvZuc
X-Gm-Gg: AYBFou06xWNrOdb8fbKCFbbG+G+7EKz0ppAlu05e3qW/ccCn8T8xmt7m23X71qTU0QA
	DhFdkUa2HFIiUBKvJF5sIP4Hg7fL2Gji2qKfb0H08ThpuF7BW731kupcTvhT8tmldztDv9uR8su
	ZKgvp4NB+2Ywlgjj8UW2rjI9F6ZqB5YroofbE2JlnBOAAxRJxGNz4wNE2Xg+mwTAt7r3Cv/T5m0
	TixOHCv8VHJaPOq1Dnl+6kcO67CSGjY8EfhMWj/VuWVmbXc3rlG9IgvKGaHr9MYnvSvDHzVW19F
	CpGLkEHLSqe8XRsdamBiNUgHE4WUo/eDf36Z8NmysyEImTgaB30MlZYCRAe64kn5TdQks4FB6dW
	IVxu5dO/W2XkZ63FVMUkqTp8cs5S2bCI68XvEjw==
X-Received: by 2002:a05:6102:3914:b0:7b3:b84b:ec61 with SMTP id ada2fe7eead31-7b3b84c1495mr1397631137.34.1790605895889;
        Mon, 28 Sep 2026 07:31:35 -0700 (PDT)
X-Received: by 2002:a05:6102:3914:b0:7b3:b84b:ec61 with SMTP id ada2fe7eead31-7b3b84c1495mr1397528137.34.1790605892520;
        Mon, 28 Sep 2026 07:31:32 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bca9dsm292277066b.71.2026.09.28.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:31 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 01/14] iommu/riscv: Allocate MSI tables for second-stage domains
Date: Mon, 28 Sep 2026 16:31:00 +0200
Message-ID: <20260928143113.49838-2-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfXzrunH7srvqMH
 fE/EfgGtHIXt+S062HQ/qRYZ2NwZyGzGF7gMLnfqgbRoqjZlIgRa1ppO6Q3iWGPtcYIq0LdKe6t
 MVL8YOka0QBiMJ/YUqlmshNzn+9fT221Bj0InyWhnvdhTu1JcBpS2bQG+gsoD7+dfau2njpNH3U
 wq3Jew9sYDkgVg8c6LyMetaOWC9iOqz0wDJ97cAkTr4bAsihLGAGlsD5s0ZXMy8pYQqp7yBDgQi
 57JBMMGqlXfq8QMXULiDDxIsxoqtBbAGSVfufqkwp+0N2xU0aJZGEIWE57IBFGoSXG6VgFT99pT
 uNRfDbw67vnMgY7sDUdfKpqQIjJ+fdHWWYdTnj8TmBW8ApvlbntOcIVc1RKvxEP8rPcH+yLXzUw
 MuqnlH76lafmgoXZaZQh0GYLJu/Vhe0x37ItErbvWKTtc+rTARMIPzrpJwp4GZP+KpvTWedd1Mx
 ENi6uS/9U5/Es+megJw==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6aba7a48 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=9ujTGIzx3EpO3AdiBq4A:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: GlwMgXROG0kqKKq4ucnlEnw_7ZU8tWY7
X-Proofpoint-GUID: GlwMgXROG0kqKKq4ucnlEnw_7ZU8tWY7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX7qA38LjlN0NF
 xSVcLKofJ/RFcOWFaRkzuiQQFh4locmjBKkcWVR4XLUnOYt3DzwqIXdww8iAtsp/eX8wt7xT5tg
 Co9tEx9P6hWw2p5l9BVCuM3pXCNwIzI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073137_598155_16945ECA 
X-CRM114-Status: GOOD (  20.80  )
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

IRQ bypass maps guest IMSIC addresses through a flat-mode MSI page
table owned by the second-stage domain. Allocate the table lazily
during device attachment when the attaching IOMMU supports MSI_FLAT,
and free it when the domain is destroyed.

The required capacity depends on hypervisor support and VMM policy.
Expose the runtime-writable riscv_iommu.nr_msi_ptes parameter to set the
MSI table capacity of new second-stage domains. It defaults to 512
entries (8 KiB), and zero disables MSI table allocation for new domains.
Existing domains retain the capacity selected when they were created.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 61 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  7 +++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 0953aaf594cb..3bbb4d0d0a85 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -22,6 +22,8 @@
 #include <linux/iopoll.h>
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/kernel.h>
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/generic_pt/iommu.h>
 
@@ -30,6 +32,16 @@
 #include "iommu-bits.h"
 #include "iommu.h"
 
+#undef MODULE_PARAM_PREFIX
+#define MODULE_PARAM_PREFIX "riscv_iommu."
+
+#define RISCV_IOMMU_DEFAULT_NR_MSI_PTES	512
+
+/* A zero value disables guest MSI table allocation. */
+static unsigned int riscv_iommu_nr_msi_ptes = RISCV_IOMMU_DEFAULT_NR_MSI_PTES;
+module_param_named(nr_msi_ptes, riscv_iommu_nr_msi_ptes, uint, 0644);
+MODULE_PARM_DESC(nr_msi_ptes, "Number of PTEs for new second-stage domains (default: 512)");
+
 /* Timeouts in [us] */
 #define RISCV_IOMMU_QCSR_TIMEOUT	150000
 #define RISCV_IOMMU_QUEUE_TIMEOUT	150000
@@ -847,8 +859,10 @@ struct riscv_iommu_domain {
 	};
 	struct list_head bonds;
 	spinlock_t lock;		/* protect bonds list updates. */
+	struct mutex mutex;		/* serialize domain state updates */
 	int pscid;
 	int gscid;
+	struct riscv_iommu_msi_table msi_table;
 };
 PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 
@@ -1303,6 +1317,7 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 		ida_free(&riscv_iommu_gscids, domain->gscid);
 
 	pt_iommu_deinit(&domain->riscvpt.iommu);
+	iommu_free_pages(domain->msi_table.root);
 	kfree(domain);
 }
 
@@ -1338,6 +1353,37 @@ static bool riscv_iommu_iohgatp_supported(struct riscv_iommu_device *iommu,
 	return false;
 }
 
+static int riscv_iommu_msi_table_alloc(struct riscv_iommu_domain *domain,
+				       struct riscv_iommu_device *iommu)
+{
+	struct riscv_iommu_msi_table *msi_table = &domain->msi_table;
+	struct riscv_iommu_msipte *root;
+	size_t size;
+
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT))
+		return 0;
+
+	guard(mutex)(&domain->mutex);
+
+	if (msi_table->root)
+		return 0;
+
+	if (!msi_table->nr_ptes)
+		return 0;
+
+	size = array_size(msi_table->nr_ptes, sizeof(*msi_table->root));
+	if (size == SIZE_MAX)
+		return -EOVERFLOW;
+
+	root = iommu_alloc_pages_node_sz(NUMA_NO_NODE, GFP_KERNEL_ACCOUNT, size);
+	if (!root)
+		return -ENOMEM;
+
+	msi_table->root = root;
+
+	return 0;
+}
+
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 					    struct device *dev,
 					    struct iommu_domain *old)
@@ -1347,6 +1393,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct pt_iommu_riscv_64_hw_info pt_info;
 	struct riscv_iommu_dc dc = {0};
+	int ret;
 
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
 
@@ -1354,6 +1401,10 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		if (!riscv_iommu_iohgatp_supported(iommu, pt_info.iohgatp_mode))
 			return -ENODEV;
 
+		ret = riscv_iommu_msi_table_alloc(domain, iommu);
+		if (ret)
+			return ret;
+
 		dc.iohgatp =
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
@@ -1425,6 +1476,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	spin_lock_init(&domain->lock);
+	mutex_init(&domain->mutex);
 	iommu = dev_to_iommu(dev);
 	cfg.common.hw_max_oasz_lg2 = 56;
 	/*
@@ -1484,6 +1536,15 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 			ret = -ENOMEM;
 			goto err_free;
 		}
+
+		/*
+		 * Capture the current number of MSI PTEs now since it must remain
+		 * stable for the lifetime of the domain.
+		 */
+		kernel_param_lock(THIS_MODULE);
+		domain->msi_table.nr_ptes = riscv_iommu_nr_msi_ptes;
+		kernel_param_unlock(THIS_MODULE);
+
 		cfg.common.features |= BIT(PT_FEAT_RISCV_S2);
 		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
 			domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 6d5c70e9ac6d..6bea9da71ff3 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -68,6 +68,13 @@ struct riscv_iommu_device {
 	u64 *ddt_root;
 };
 
+struct riscv_iommu_msi_table {
+	unsigned int nr_ptes;
+	struct riscv_iommu_msipte *root;
+	u64 msi_addr_mask;
+	u64 msi_addr_pattern;
+};
+
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

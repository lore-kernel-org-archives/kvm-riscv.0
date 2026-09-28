Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED01CA5FA5
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pa50kd2FqLg4w+Bg49MdSx+iojhb+QY7QA/0H77UXc=; b=YTTcy8e3Ztf2Ug
	2TfK6K3AWKK6ZsqLq3VgKDTQd5fUODOBdKbO7Hrzj2xyNtspxC0t8pfa98j6gU+lnzkWZS+RHgU4B
	/mpg+unApt3ohAxqOizaGM6jHhhehFGtvwVz2o72iphfP2pcITMW2YjwJb1Bi4Y830AgcTdr6dlNi
	o1EpvWlvnnRUnRx4Xp2lIs5yh8cMXDO4NRnDNDP5gViSBAgazMzcQhWizV/HPeTgOVhtN1W6pIN4e
	R20AyZGFWTcj8Cx03zNnaUraD+/nXNFWIhAoDlckSjT1eqMlENlOrd2D9gHqudhv4VQWtpvF7lShO
	N/o1ZrQpMIGx1FGbhPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVg-00000000nL3-0LLQ;
	Mon, 28 Sep 2026 14:39:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVa-00000000nFD-2f1U
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:39:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAPrK1683260
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jvlI2T8w+64
	hQrpum98oA1DnDUfoowHi2+WuxN0638E=; b=ninvSctiq/nMCrPjojeVd+h7piV
	MkS2L0yVYz80LV5d/CefxgMB16lyAZhxotakiwoBSpDK+1NKDQLiDyBCcl6JhcL5
	0cVwUZ2Lgk7ZKuCNfd/Dp/nJAWjYmR7S2mmbcrUcZsprSqQM5fj+HuvbAOXn3x45
	ALQZ2QnrTVXvEtxkzgwL8rVJg/Y9I0Cbzb+LPsN6OrFjDBC8cbcVETgQa/t6y5wX
	wsF8RTOlSs7uYGLAvc3y8W4UF98GAfijitszPClypIQKEN0ib4RvALb9cZ0sxP1H
	/FygaS5wZHxSsf47sjUpIdUEtJEP/+158ZrYE6ERboIsnX1Nb8d6xOMa1wQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfks64g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:39:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14383177746so6419915c88.1
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606347; x=1791211147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvlI2T8w+64hQrpum98oA1DnDUfoowHi2+WuxN0638E=;
        b=EyAg9nOEnfdPPqWCWPF+181sjCzxrnmiuRM1PkXmpVncPggRuZDzQIN5zEOnO0xK+P
         W/mU2gLrJvaeK823KGOkeawNuv0xZfYOlTZn7+RyxkDPrrL9Terodz+Emzn56LUUqOh5
         Tw70vWxAZ9AqcDnoHpzxKF99w+FVjsdVmeZtFX89+1g3YH78+lUtm1D6b2zjVOOYpZVY
         f1Uhh6sQarKzZQP5SiXEI3nH2QfBEQLSYzsVwKCmfJTK1XwOGgfQ/8n/2Aw6kHKeXP1g
         O0ONyy8NkX4kz49Oyk4Yos4YtNyPAvy2p03Cu1aMG+hDvhcYy6spPD60a5x9iwEdSSBx
         pQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606347; x=1791211147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvlI2T8w+64hQrpum98oA1DnDUfoowHi2+WuxN0638E=;
        b=dytFCE28i4u5cnrnx7USeIJ+xcUYqSSwR+Yv1hS9WetvjBtnkqzcRCvPGbmpiCTGYS
         Epb1oQdXmM2R037BxZEuXs9wE9o6lrAR7NxUpAKhg3uRgg8+N6cyxNBn/z2G4WdRtegh
         pcxLY92gF7ZCvaa8w5Kr9mkEzQyuTk3g52pXNd/a2VleDc6PMrJr+gAuc8VVF6Kn+gCy
         fxm8CQWaGKA40DCUzNgYqukMxKWZ9k5lPYvzd0oXOOFAxPdU+n6p+zLOizJAPWV8rOQP
         ZJLWG6IeyjlxrsYa3qhthuxwzpm5jseeMjSN0ILdLftubgI73QuvkAKXm84ou5mzmxqY
         OgXg==
X-Forwarded-Encrypted: i=1; AKwUvBxmdB99xTt3WXQHtWLsxY3YODhuUvLJzjkbpUBN7B1z5fYd5WTD3EhwZLMuqrkFze+K9FLMAdqwXOM=@lists.infradead.org
X-Gm-Message-State: AFuF++kI1pVSJkgSwtC17X+Y/5Q8bBi6upw2Zv6TbvKDuGtD9U+pXSEe
	9N3c5IEe5yB1rPetFdVFtGJvIgWQwM2mglcdyLa51L3oxA3AoVKUNAjPw+1F343aPllfewvbSqB
	5AFEGudxDXCVSqqDsF/D3tVmdWWzWwtgzkrHNrti6Xltx7JtOk9ARXklnc1Cf9Uh2BYku9KDs35
	Pc
X-Gm-Gg: AYBFou32sl7zGSJoCvYgd34D+gcQn1kdI3hGbR5VFyAEgkYDh9UiPpyX/POIecrQm7o
	vClrDM+jwpDTZV+e2QuTOIHNMf7iU5qLJPaWDFI7bXq+jvBBxm8WfN4lJJ2WkR+kxRVmpJotNfU
	OJiHXrRAO0khprIedPmxqcHPXtscyrEll66SXCFPUd0WqWmPOHuBO6G8SWsATppkOhGTUgQ7geH
	RJ/QZiUpJo1TPQxYUIaPnluJ3AeWyNX0kPJb4OZBkpkITgYuhE40W96agKyQDw9BxpkjWHvcR1a
	kcmi96k/7wcmqDDkhLB3b2nV5oZkyW46xdyhfisqwiazGbfKlxjRvE5Q1WkM8bgIxYpykU80zfN
	zVIcgj6NnvKtSzFa9k6RRjU3GiInYlLk3gSx9+Q==
X-Received: by 2002:a05:7022:380d:b0:144:eaa7:2758 with SMTP id a92af1059eb24-146ce39b1camr10732844c88.19.1790606346858;
        Mon, 28 Sep 2026 07:39:06 -0700 (PDT)
X-Received: by 2002:a05:6102:869c:10b0:7af:81dd:a9d3 with SMTP id ada2fe7eead31-7af81ddbe26mr2436839137.29.1790605898562;
        Mon, 28 Sep 2026 07:31:38 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae76ad030sm484086466b.36.2026.09.28.07.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:37 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 03/14] iommu/riscv: Serialize MSI table publication with domain attachment
Date: Mon, 28 Sep 2026 16:31:02 +0200
Message-ID: <20260928143113.49838-4-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX8RfZUv6I/HeI
 4XjkQOT+WW19I4CDyda8S7WEXzWF/JcRCmFrN25jyPHOXx2Tu8pk6C2o230O0TySCilJ6yWTAvi
 m6p2NCuXidMi8Fdjt7dw4rLvXVp9qrdTv6kamEjf2A2gXuk2NLJ2Qs5m8BeTPVbps9BhmvDWVHz
 2bssg6wUVaJMcVeoSTiPqt+BC6SQVL6EYWys8vgbK4ThFnGE81ehMnq928jyn3UOkZvuFJB2mgd
 TAWvGMJknKEFLARQxAdvE4xT3Fg/kR5irIs0XYJycY4CPJ7z8Pn5cDDhDXKF/9um4YSoBaBEIvG
 iL0LdC5hpEfA3KtQUPe6062Vv/dCluZMWC9jOCMFgVVNHBYA33acmq/0rR0YOxksOXIy+hlk6lk
 pT7WHoKRZniDUxHwRiNJhsLnUvm0oevwZ+iMge93IRZYgPDzn20Dv4SDRzWAUdctACrhQ2n2h2a
 wcbKzcFZyHRFGqqMagA==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba7c0c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BJuWs42claz3fuW2R7YA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: er-MfUN3l2jGRfIMc-ypmk9i96QEjnuH
X-Proofpoint-ORIG-GUID: er-MfUN3l2jGRfIMc-ypmk9i96QEjnuH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXxv2JMdsddhod
 8wXxHtTuFZr1dxW3vzjD5xKk5ZpoIzyKkfdV3xm8OIVL6qASD5ZueAKjuLt+agpACzx5o5xCGd9
 IFW1rwpXeiiO9IWO1an4rQbODwnCH4w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073910_864280_5AAE7F4C 
X-CRM114-Status: GOOD (  19.88  )
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

DMA mappings update entries behind the page-table root installed in each
attached device context. The existing bond and barrier protocol ensures
that attachment either observes a completed page-table update or is
included in its IOTLB invalidation.

MSI forwarding also changes whether the MSI page-table configuration is
installed in each device context. The first forwarded interrupt
publishes the configuration to all devices bonded to the domain, while
the last removes it. These domain-wide updates can run concurrently with
attachment because devices in different IOMMU groups have different
group mutexes.

Serialize attachment to domains with MSI tables against forwarding state
and device-context updates. During domain replacement, lock both old and
new MSI tables because either domain may process forwarding changes for
other attached devices while this device moves. This also prevents an
old-domain RCU walk from overwriting the newly installed device context.

Order the locks by address to prevent opposite-direction replacements
from deadlocking. Domains without MSI tables continue to use only the
bond lock for list updates.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 64 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  2 ++
 2 files changed, 66 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 09ec8c3e4a72..57f2884dec42 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -874,6 +874,60 @@ struct riscv_iommu_info {
 	struct riscv_iommu_domain *domain;
 };
 
+static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
+{
+	struct riscv_iommu_domain *domain;
+
+	if (!iommu_domain || !(iommu_domain->type & __IOMMU_DOMAIN_PAGING))
+		return NULL;
+
+	domain = iommu_domain_to_riscv(iommu_domain);
+	if (!domain->msi_table.nr_ptes)
+		return NULL;
+
+	return &domain->msi_table;
+}
+
+static unsigned long riscv_iommu_msi_tables_lock(struct iommu_domain *domain1,
+						 struct iommu_domain *domain2)
+{
+	struct riscv_iommu_msi_table *first = riscv_iommu_domain_msi_table(domain1);
+	struct riscv_iommu_msi_table *second = riscv_iommu_domain_msi_table(domain2);
+	unsigned long flags = 0;
+
+	/* Address order is stable when the domains reverse roles. */
+	if (!first || (second && first > second))
+		swap(first, second);
+
+	if (!first)
+		return flags;
+
+	raw_spin_lock_irqsave(&first->lock, flags);
+	if (second && second != first)
+		raw_spin_lock_nested(&second->lock, SINGLE_DEPTH_NESTING);
+
+	return flags;
+}
+
+static void riscv_iommu_msi_tables_unlock(struct iommu_domain *domain1,
+					  struct iommu_domain *domain2,
+					  unsigned long flags)
+{
+	struct riscv_iommu_msi_table *first = riscv_iommu_domain_msi_table(domain1);
+	struct riscv_iommu_msi_table *second = riscv_iommu_domain_msi_table(domain2);
+
+	/* Recreate the lock order and release the pair in reverse. */
+	if (!first || (second && first > second))
+		swap(first, second);
+
+	if (!first)
+		return;
+
+	if (second && second != first)
+		raw_spin_unlock(&second->lock);
+	raw_spin_unlock_irqrestore(&first->lock, flags);
+}
+
 /*
  * Linkage between an iommu_domain and attached devices.
  *
@@ -1388,6 +1442,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_bond *bond;
 	struct pt_iommu_riscv_64_hw_info pt_info;
 	struct riscv_iommu_dc dc = {0};
+	unsigned long flags;
 	int ret;
 
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
@@ -1421,10 +1476,12 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		return -ENOMEM;
 	bond->dev = dev;
 
+	flags = riscv_iommu_msi_tables_lock(old, iommu_domain);
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
+	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
 
 	return 0;
 }
@@ -1474,6 +1531,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	raw_spin_lock_init(&domain->lock);
+	raw_spin_lock_init(&domain->msi_table.lock);
 	mutex_init(&domain->mutex);
 	iommu = dev_to_iommu(dev);
 	cfg.common.hw_max_oasz_lg2 = 56;
@@ -1569,13 +1627,16 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
+	unsigned long flags;
 
 	dc.fsc = RISCV_IOMMU_FSC_BARE;
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
+	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
+	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
 }
@@ -1594,13 +1655,16 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
+	unsigned long flags;
 
 	dc.fsc = RISCV_IOMMU_FSC_BARE;
 	dc.ta = RISCV_IOMMU_PC_TA_V;
 
+	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
+	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
 }
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 6bea9da71ff3..2876703a6698 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -69,6 +69,8 @@ struct riscv_iommu_device {
 };
 
 struct riscv_iommu_msi_table {
+	/* Protects attachment, interrupt forwarding state, and MSI PTE updates. */
+	raw_spinlock_t lock;
 	unsigned int nr_ptes;
 	struct riscv_iommu_msipte *root;
 	u64 msi_addr_mask;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

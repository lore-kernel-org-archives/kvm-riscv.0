Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66229CA5FA5
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynfcBZXl8ZGvFgOvtztj+hk7BSNB9dsNxbNGeZBP0g0=; b=UzxnOo5FCJGTD+
	TLFoSihlOMgNdV2EQyhkBEHWxpsLSWL82a0eyFNqVOEDdt8PY9ut9mP96+M9raiKsissLEtD04HXi
	jUjLQMy9M60DKRn0gp1N8W6SUzSrQo01aDRYwnLcRhPZdWUlpwdhGKZR8g7415Ur2kAASDmRkrkDC
	dd32/5kmXLragu9am55SqEWOWshlmwuDtlLbs+av3/ha+W2IhqbDgCpBBm9jm7WafrEtQJunpMimG
	AqdgOGHuFCnHgJaeNcnbjzgDx11oZy9fyw29WdpKBrjNlgciyhVMLtjTnGgAZ4+chTWj/uJF0UEb5
	Aj6ieMPMOiXFj5lZNcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCUZ-00000000mpW-4BQx;
	Mon, 28 Sep 2026 14:38:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCUW-00000000moH-41Vf
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:38:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAR8x1450501
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SgBxAUOx84U
	cn9DyKFIg2KlUymyjg92B5RIf9l+yQcg=; b=PeL9p4w26BhoNlRqOvQ3LSV7n/M
	IktOMye2ZvfZB0pICaZ3TBWrcQlguntFEJzgoIjtjths47tJk1xoUZly2IPaQszy
	pNIDDoUjuy9W6cB/mpFxHlby71PtXHVdx0VWz6WtEILSV8JQfkeE87kr7Ib7ZPIG
	TOC7sMO2YdQEslR/txVR634Jw5qrZWxsKyoGjrLuyh/QQjmvwNSaJ/WsFebp67mG
	IImMljNxomfy+bPYM3oRVTQ8paB3pwle9mjd3f8s58TbjX1938Z7pGGKc7eXz9Rg
	gV+3ERanv7za6SCrYk/1jUrCxiIAqpgci3qNcOuCurOWNf5dPF9aV7CCWrw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxhwkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so12643989c88.0
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606282; x=1791211082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgBxAUOx84Ucn9DyKFIg2KlUymyjg92B5RIf9l+yQcg=;
        b=fkrS0SVEowSbUuoXzYSEcUUXSQcw/GPLPViUFPRHm3xV5gS6SbJj1hWb0no0orunXN
         F2ovqXTxmv3DfIO+XITTChj67o6tnru12M0BDX+GXpekdHHIJUYoU/MyMIBi2I1P9hz5
         r4ixpUpSpl3q5EXaHTK3ewRP90FF4m9f99lHQq08YNzJFf3hOr7Nkmc4cV085IrmWMrv
         c4pVRw2R8eSt1cSf/4dhEvoygSuH5iK5qnV0oi+aji5t9vyQ4hczvdstxGlm/4aqPQMQ
         LVOXBT3WrqZHeHwuFILW+4Xm4ol0w1wKitOhVh4fxF7NuveCvJUO0BpuLO1jfwElOh8v
         tLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606282; x=1791211082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgBxAUOx84Ucn9DyKFIg2KlUymyjg92B5RIf9l+yQcg=;
        b=dbCDk8NUbw9OhjDj71L6jmCQbUHSF9PHRXj9A59RWW/N5Mv63fnqlWFOM1HWk3kCGh
         6TL10e4fDDmxCaIzsfdZSs3Pk/3XbawGeoJ+4VenQut1/qFgx5eYmgcTzfMUFAg4MK2i
         bv1BtDyUWtjEi8QtOmmWkboggqUXePigNNGj6sjISYnlgNNGmqbYQZ07KyDAYwCUIuFN
         uNu7p3uGNVAAmRu2H74CKsexO7VOoxYF2xZ4uOerPFRV4LwDXzOi9ax8fYBekLoBfzmP
         M729GvedPR8mM1JDP8/hCt1JGbwcWfKH2xeK3UBt/BSoMPIpLIC1bqiGfHDct7pfAId3
         P9zw==
X-Forwarded-Encrypted: i=1; AKwUvBw3WDtQbVB/M6pb5ska/UpUBF8NhDTo1IzqQ64vGyhxWmSZn7rgzLghzhaOkH4z+caNrpqG2Es5ves=@lists.infradead.org
X-Gm-Message-State: AFuF++k98YvomHiRG3mz8ru+QW7GXiHP0UF9IifYJZhNGVDlZL+DwKI/
	VonRmU64Uu2nBlwYyQLGXN5bKRGm5YTboiK0D4jLhUCgTaXn8GVBw4vwXrpgr0lW56Vx2xuAh/m
	Ot9Q87N7uyULiB+F+/WNXzcgF7aUOikOll9SNkzferwwkOyfymTFKylY75f+vI43JF0ARyWKhxx
	u8
X-Gm-Gg: AYBFou2MmnqK/bluA8QjV3aPebTgxkBWClD+VxCsTi/LplTpajUH3/AKu40vw9Wq0Ae
	swAcdulxVj3jgYP0ND+XEMdhcxiOk8pdPVOy6VqdW+P2Jez3ilUh+l5A9nENt8K/hI/jryqtght
	rY+V2hBl8zKlIoBMFgBOMD6LljCTakoI2rMneXehFcRNUp8cGDUCXzMxSD2hOVXY/sZwgckGYEC
	bQMjDe0CV9m0o+LJm5Sdr0qivsU97h7FHkQuwt/VQJWw3H1xv7wwdXCqZGWL+EeNC5iCqsIdDa8
	ev7B5G9G3GUNIVh0/L3/qA2FwV8HnTEfb6orEBrp8/MJcddpYg4CDWbq4h3Bv9tcmO8WiMJ1QsJ
	6OJi7Pn9KXEB//fJAWQPtaC7RgjJ7UDQzZxnBmQ==
X-Received: by 2002:a05:701b:4205:10b0:147:cd15:3eb with SMTP id a92af1059eb24-147cd1506b8mr7730850c88.6.1790606282359;
        Mon, 28 Sep 2026 07:38:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4b1a:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7af1e4f8b12mr3623511137.24.1790605896839;
        Mon, 28 Sep 2026 07:31:36 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc097csm4205378a12.12.2026.09.28.07.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:36 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 02/14] iommu/riscv: Prepare domain bonds for outer locking
Date: Mon, 28 Sep 2026 16:31:01 +0200
Message-ID: <20260928143113.49838-3-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: eh3RGf08KvD8ZgW--xseX576Kn1-Xzau
X-Proofpoint-ORIG-GUID: eh3RGf08KvD8ZgW--xseX576Kn1-Xzau
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX+gg08gKXp8wX
 yUUTVo5MLPdkLs+O3teUXrSScCoR7qQLXkL0rT54fF3svC810kYDub9rfaIvL3/nR84L2LC77Hs
 rHz3MzcDti/kkmYo7+thSezbt8uO9tw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX9YEFrBJ7aVNU
 GJCDkKD/EW7jtVbBtUzTak1rFbdNJAQz8kgipar0JVQyc9b+u5tqAHKRjnIkKsUFUyAHJitd0Ak
 cFTovqRENl0Pno9tFP1F3rAZUDdhXta7I2fwtKEfX/x9emJCn/1sAZCSvLCsxGLFmmTItp3e5Jh
 cIPLbGE2lktt+K/Al0M7W/a32s1414Ed2eT38aGJCexh2L7MwINFOVtXzIWWR3Cp4NlTloKbnO7
 xz1pDwvHAqd2m4pAkbMzUP7TkZXe2WS3Fpv+5WU+9ITbBgq2JHXFF5MlDsCTU++yanLUrxgUYPM
 +rpwmaTyrGQhEnjf2WdzK8d+gKFPz6rMRS9Pz9eC58W2pB2ncjHMJBmFK6g9t/m67JvlWCJBeiv
 hq6d9AzKeA59Yoayeu52/FsEWlaY0m4Qz4vhdCUqf5hIV3wjxFutkti/lL/oCJgqmv92u/tL2MW
 OyMdKERtHyAQPKXcNFw==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba7bcb cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=69OsnF3JIPtLgHPxktkA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073805_117934_8D401068 
X-CRM114-Status: GOOD (  17.76  )
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

IRQ bypass will serialize attachment under a raw spinlock. Bond updates
retain their own lock, so make it raw for safe PREEMPT_RT nesting.

MSI forwarding will acquire the MSI table lock under the hardirq-safe
IRQ descriptor lock. Nesting the bond lock below the MSI table lock
therefore requires IRQ protection even for domains without an MSI
table, where attachment takes only the bond lock. Use irqsave/irqrestore
in both bond helpers to avoid a HARDIRQ-safe to HARDIRQ-unsafe lock
dependency.

Also split allocation from list insertion so a future outer lock can be
taken after the sleeping allocation.

No functional change intended.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 3bbb4d0d0a85..09ec8c3e4a72 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -858,7 +858,7 @@ struct riscv_iommu_domain {
 		struct pt_iommu_riscv_64 riscvpt;
 	};
 	struct list_head bonds;
-	spinlock_t lock;		/* protect bonds list updates. */
+	raw_spinlock_t lock;		/* protect bonds list updates. */
 	struct mutex mutex;		/* serialize domain state updates */
 	int pscid;
 	int gscid;
@@ -896,34 +896,27 @@ struct riscv_iommu_bond {
 	struct device *dev;
 };
 
-static int riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
-				 struct device *dev)
+static void riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
+				  struct riscv_iommu_bond *bond)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
-	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_device *iommu = dev_to_iommu(bond->dev);
 	struct list_head *bonds;
-
-	bond = kzalloc_obj(*bond);
-	if (!bond)
-		return -ENOMEM;
-	bond->dev = dev;
+	unsigned long flags;
 
 	/*
 	 * List of devices attached to the domain is arranged based on
 	 * managed IOMMU device.
 	 */
 
-	spin_lock(&domain->lock);
+	raw_spin_lock_irqsave(&domain->lock, flags);
 	list_for_each(bonds, &domain->bonds)
 		if (dev_to_iommu(list_entry(bonds, struct riscv_iommu_bond, list)->dev) == iommu)
 			break;
 	list_add_rcu(&bond->list, bonds);
-	spin_unlock(&domain->lock);
+	raw_spin_unlock_irqrestore(&domain->lock, flags);
 
 	/* Synchronize with riscv_iommu_iotlb_inval() sequence. See comment below. */
 	smp_mb();
-
-	return 0;
 }
 
 static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
@@ -932,12 +925,13 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_bond *bond, *found = NULL;
 	struct riscv_iommu_command cmd;
+	unsigned long flags;
 	int count = 0;
 
 	if (!domain)
 		return;
 
-	spin_lock(&domain->lock);
+	raw_spin_lock_irqsave(&domain->lock, flags);
 	list_for_each_entry(bond, &domain->bonds, list) {
 		if (found && count)
 			break;
@@ -948,7 +942,7 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 	}
 	if (found)
 		list_del_rcu(&found->list);
-	spin_unlock(&domain->lock);
+	raw_spin_unlock_irqrestore(&domain->lock, flags);
 	kfree_rcu(found, rcu);
 
 	/*
@@ -1391,6 +1385,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_bond *bond;
 	struct pt_iommu_riscv_64_hw_info pt_info;
 	struct riscv_iommu_dc dc = {0};
 	int ret;
@@ -1421,9 +1416,12 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
 	     RISCV_IOMMU_PC_TA_V;
 
-	if (riscv_iommu_bond_link(domain, dev))
+	bond = kzalloc_obj(*bond);
+	if (!bond)
 		return -ENOMEM;
+	bond->dev = dev;
 
+	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
@@ -1475,7 +1473,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
-	spin_lock_init(&domain->lock);
+	raw_spin_lock_init(&domain->lock);
 	mutex_init(&domain->mutex);
 	iommu = dev_to_iommu(dev);
 	cfg.common.hw_max_oasz_lg2 = 56;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

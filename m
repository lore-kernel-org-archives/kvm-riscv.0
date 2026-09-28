Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0385FCA5FA2
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSntlZ7gyB1+/C7r/2Ma36Amz94ToQ13GZDPkVsiexs=; b=GtJeb94pgYTFL/
	mli6+VfQzaQtwVygJSyU6Xb/qGtfGuszwN8Hh6nrTysVKtVr2K8SOMCkHyqZrkM/cq0Lo8gRtG004
	v50SwlPaKzvNWOyGIxFMj0vO3SQEDCTxe1vXoPI79u+kmcHYzNKMHnhCx7CJ65ban00DFIztfkebG
	p/mVLQ5pnDRCayZMx0A3/aiHqXayWqynJMWPg8H3po7QU+YUxF8UuU0XXcgJ1DkpUnQcPftuS/qCy
	Mes+lnrn3xQh5l7lzqdOEy5HP8f+gvIVt6atvhT7eWHw3geepbSQJmHv7eDRM29IHUTDbbtEXWJuH
	8QXm5x6u0ivFsO/SeOQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCWR-00000000nh7-2bCN;
	Mon, 28 Sep 2026 14:40:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCWO-00000000nf0-3bSg
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:40:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBARNs482015
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g7ykt7LSEJe
	/IvR1ZzOjMBU3wKZ7WY6AweTJQ2yjaag=; b=A1khsbUY53TyX+IouxKKcQgcDYK
	8RmG3YIwh2qQRPk8L9AOg75iU5OhtzUQo61HU6vp30hzLq8NwzUNx3kABtBGg8bB
	zFC3VvlPM/YcW73HckfLlY8b6h1eHSfB79tRRdkKLZYXGZvUlzpOCqLolVE/fOMz
	9SDa14kaU0pqJkAuyegYSvTOjpLEQO+VzjNVEX2T6oCjSEhv0VsItB82zWcvTth0
	KSM3IeTuI+7qhUIK0Vdgz4ClN4LxsH7fpUi4hsp+TVNP04VOUCVNboUePJxH0T4v
	MDK4OqUJJhF49TuMdt+sEFKGLQ5SyOyP5hOVkMx67Z2RNROj3R9QZAJNVzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt11vs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:39:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53323d5b9ffso31651421cf.2
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606398; x=1791211198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7ykt7LSEJe/IvR1ZzOjMBU3wKZ7WY6AweTJQ2yjaag=;
        b=ksJIR08X37T8AIzbaGNrvvjdhhs1wC7Pvd3JvqnOBX1VaRlVbeaz2tSwS788N8nKxn
         xXB2/Ys0JHcCksqR65nubQEXs+IRcsXC1706gc7rQHIZgTOEydxwJc02+n+0mSN67Qpv
         FhyGbAqFlwmk5QAFSO+C5JUxQdSm6Gdiq+ugkYxRbwe7TzEOw+S0uiNweLAZLeAB9tTr
         Dn9Ky7zsH47wWCKKLgXg2NbXh+11bdiPsuEUm9p+drPucrEmguuAha8RaTM7vnheEEBy
         IgQrVEdE7XNyC1cKt7Atd0fUH6AMqDjZAGOjPE5eKOQcj4Del2aBiuw3TgdBxSsKWz/o
         Qe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606398; x=1791211198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g7ykt7LSEJe/IvR1ZzOjMBU3wKZ7WY6AweTJQ2yjaag=;
        b=fx1RtVkT+83cCGUJy4YVzNsmkbzu1zm+kVoMb7mVQI1nztSY8CfGX+GGsm/62PtOAm
         o7rtVV7wYHNToiO5faCHCEbuV+gCN8wa4upcF5NVGkwfrqcQ6PrP95mNFwO12IrUXkJp
         bOJPghwJgUPV24pAXnwOh1eRKjlq5ACGVcFs3uqQin+XvhqmJpfpp23Gj7QmepAjMiW4
         Yng6YIUZuMaaWxx+Us0VqZZ4N2qD9waBC+1y5YoVXdv4KhQoX+4kUg4zfVFhbtaov/E9
         yezpqMiBXdS+SvfHDwprKHhBrOd2CPDo5sHaElajtfBYGDOeZNMIqlPBmS8zmU1Gktto
         Le5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzl5SFtZAA9GAiSRoLMQgnmHyYZyMFVHdmkMJGI9mmthWIwWYk0Kr5V7kjQEyuVToKSfa2nFZQ9d6M=@lists.infradead.org
X-Gm-Message-State: AFuF++nJzR35K8hJNIYbNBkbePDSg9MEQhBy7mGc0U1ZfZPzjGcX9nGL
	1fnBT8Dud0NIFnR4ZsnFtpB6GGEISFMG/Tqa49+E6SP01NTBFZwhxrjAITvYz63lYBDL48KoHa9
	MU1lduZ6fPWbM0dj33RonCLm8X6BHaEY8+yq01Mqye+orc0YJoYafW17HHO9KaF8SwS5j
X-Gm-Gg: AYBFou2ZkZBTA10aDp4Ss2Moeu/ZZ6tr37rsFop7dBaw8PcGR4E03WQB74LbBJk/LkY
	Di5Xh9hKuy1ARNkzaRzJz2R4b1aDLompZiDcv3LA4gXtDvljCBx/+ak8Gof2cJO7JSRJ/fBsX1a
	gSUI4+BYCtuF1+HBF0N0bfFELv14pgKZq2S7EhnPNRfv+k1yBQmEledrwoTv/xBIk3SZlfbA1Uu
	r/gMskcm6SznjXMCzBtLVWOtKHmYj3i7WTssJyIo24b7jhhAjTnhlzOItaxX7J2F6AhYh0L7Id+
	DJzWK54p4ppWAlxQZzUJEFuQSX/n0z8cR6owa2DYZqjEP2batYHFgZUL1zxtdppIqQCHQ2LwUZ+
	glrdOnAGCUTLtJu2LjsBq9RMomSZK06vvojeo6w==
X-Received: by 2002:ac8:5a86:0:b0:533:35aa:700 with SMTP id d75a77b69052e-53335aa0b59mr109090121cf.50.1790606398066;
        Mon, 28 Sep 2026 07:39:58 -0700 (PDT)
X-Received: by 2002:a05:6102:32d0:b0:7b2:7aac:8ccf with SMTP id ada2fe7eead31-7b27aac8d4bmr3266533137.29.1790605937424;
        Mon, 28 Sep 2026 07:32:17 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dcf626b3esm211882366b.27.2026.09.28.07.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:16 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 11/14] iommu/riscv: Prepare info->domain for concurrent RCU access
Date: Mon, 28 Sep 2026 16:31:10 +0200
Message-ID: <20260928143113.49838-12-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX2gVnh9q0LL5J
 hANC3x0nR9u5ECk+lhKjOdalAmfkn82lLynIolGxo2tzff0rDssKHYbxrKGj5Jvs1la9AW/CMgQ
 l+WHb3lU2VcOQEg6906JNu/oNTQiHfXUb1aDEm/VJEnoi6+1pYEcZedpRUbXTxUEO+a3nuoxZ6V
 D7fH0YtlnnFjYJAiftCcy1UVDem6/7LBmu6yVA1dAcSzZIa2x9YQxO7AXWYlqJzUcF+ppzGkFF/
 ufmu8+PzTY6Eqyj9d5BTovNJIk0jMHCoeHM7f31P7m6MA7WEPmRxABkppa4JmO0lh9nYJwse88X
 whyeeKhICspXPHr+9QQmJE7dNOdp1VxfUW+LIOv8EgZ+CIJq+Ifuzy6Bw02NIEuKRxQgGiPS/qy
 hROaxltpfxrhdAprFR4z4EN8XBMZ4fHX2jm76AwAcKNdwDch7aNlZ4npXTyCWKLwXCwFIrrmn/H
 TmhWTY5cu4utTlrzbiw==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba7c3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YVOiLqTVN_ovv9J5ge0A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: scyPG8MUbx58K0B09aE7EqpSktSG79B9
X-Proofpoint-GUID: scyPG8MUbx58K0B09aE7EqpSktSG79B9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX5URgMm9FZ23A
 Ij6UVZM2tYFATER1WZvAMQcZUDOEWuEHkxgjG9L/mm3Gyx9PtD0dHtjguWlj0C2mmRs85S7Yxc4
 3jExuvAjrAD7E78CnkuohiE6mHW38+4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_074001_503971_7214974A 
X-CRM114-Status: GOOD (  19.72  )
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

Upcoming interrupt-remapping callbacks need to resolve a device's
currently attached domain from IRQ context, concurrent with domain
switches.

Protect info->domain with RCU and wait for readers before freeing paging
domains. Provide an RCU accessor for the domain-owned MSI table so
interrupt-remapping code does not need the private domain definition.

Use the stable old domain supplied by the attachment callback when
unlinking its bond instead of dereferencing the now RCU-protected
info->domain.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 34 +++++++++++++++++++++++++---------
 drivers/iommu/riscv/iommu.h |  5 ++++-
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 7a8b40d311ea..514470291fd9 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -869,6 +869,16 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 #define iommu_domain_to_riscv(iommu_domain) \
 	container_of(iommu_domain, struct riscv_iommu_domain, domain)
 
+struct riscv_iommu_msi_table *riscv_iommu_msi_table_rcu(struct riscv_iommu_info *info)
+{
+	struct riscv_iommu_domain *domain;
+
+	lockdep_assert_in_rcu_read_lock();
+	domain = rcu_dereference(info->domain);
+
+	return domain ? &domain->msi_table : NULL;
+}
+
 static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
 {
 	struct riscv_iommu_domain *domain;
@@ -968,18 +978,22 @@ static void riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
 	smp_mb();
 }
 
-static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
+static void riscv_iommu_bond_unlink(struct iommu_domain *iommu_domain,
 				    struct device *dev)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_device *iommu;
 	struct riscv_iommu_bond *bond, *found = NULL;
 	struct riscv_iommu_command cmd;
 	unsigned long flags;
 	int count = 0;
 
-	if (!domain)
+	if (!iommu_domain || !(iommu_domain->type & __IOMMU_DOMAIN_PAGING))
 		return;
 
+	domain = iommu_domain_to_riscv(iommu_domain);
+	iommu = dev_to_iommu(dev);
+
 	raw_spin_lock_irqsave(&domain->lock, flags);
 	list_for_each_entry(bond, &domain->bonds, list) {
 		if (found && count)
@@ -1415,6 +1429,8 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 
 	WARN_ON(!list_empty(&domain->bonds));
 
+	synchronize_rcu();
+
 	if (domain->pscid > 0)
 		ida_free(&riscv_iommu_pscids, domain->pscid);
 	if (domain->gscid > 0)
@@ -1577,8 +1593,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	info->dc = dc;
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(dev, &info->dc);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = domain;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, domain);
 	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
 
 	return 0;
@@ -1732,8 +1748,8 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	info->dc = dc;
 	riscv_iommu_iodir_update(dev, &info->dc);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = NULL;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, NULL);
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
@@ -1760,8 +1776,8 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	info->dc = dc;
 	riscv_iommu_iodir_update(dev, &info->dc);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = NULL;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, NULL);
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 4c1c681ba2a2..ed973979d795 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 #include <linux/iopoll.h>
 #include <linux/irqdomain.h>
+#include <linux/rcupdate.h>
 #include <linux/sizes.h>
 
 #include "iommu-bits.h"
@@ -85,7 +86,7 @@ struct riscv_iommu_msi_table {
 
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
-	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_domain __rcu *domain;
 	struct riscv_iommu_dc dc;
 	struct irq_domain *old_msi_parent;
 	unsigned int nr_forwarded_irqs;
@@ -100,6 +101,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
+/* Caller must hold rcu_read_lock() while using the returned pointer. */
+struct riscv_iommu_msi_table *riscv_iommu_msi_table_rcu(struct riscv_iommu_info *info);
 void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr);
 void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table);
 void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

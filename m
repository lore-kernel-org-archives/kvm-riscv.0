Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D5FCA5FA7
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oa9IkojYidF1QrK+m2jVQH4nnrBKFoHMRuYiaDHlYK0=; b=b+pQ1RV8v2Tyqr
	e5NGuARkyvheZQnmFCvTTLIkVONFvjasKy8mvM0P0+HHH35Z/65777Vp6/6qsyaciUi+QBe6ia3xc
	OZMAc5icbpd3nlF5c0uCp/jhFRHm53RIzIAVxrcKNxV6HcXhzZI/fDTy1AEkIZKt39C/um1Ws0KwH
	GLGfKwl+6TtTCpJwUtD75t7TUuX64dRuXhJ3/hEWZO8T/9Ps0DgwxUDy1qj1Zx2WpWzYRzY6cbK11
	6IB4Mn0KwMSSVWYT4W+GQCrutW296TT7MDq/nUePQVZuKJ2hWZbzJRjdWt395h2seHoHGzq9QFuju
	uUckx+FFRJw9PmiJcbeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCWp-00000000nsm-32ML;
	Mon, 28 Sep 2026 14:40:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCWn-00000000nrW-2vB5
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:40:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdsOI1895242
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GRnT15XNTnT
	hRrBqENhdYd5BF9k1QXVVKb1KnU2gCEA=; b=WoWqgFa0/f0SN3SxSiWmUYkaO6R
	1oUPDoF+umGUVOzH8Iad152juDLgd09JrFVAoyVqzgKDeuVTc0SofRQLlaq/r2jj
	AZOuJuxqL/LJm6+Ql53rM8Tu1gQ8PVh9S50+ip25xjUGERpRkidq5Lnb+44pGtsj
	zW/v/K9crCbqVwiv6MqJ/1B24qVLQG2E2BSxZmdrMkh7dafVV5239BDB9qj0v9FU
	cnlBFAPlrIcg08lMKPnlQBDW4yxuxvljDet6l/Mr6PXArm2yZ0H3vuaEoffiD1tD
	/P6GAPhY417P4dxn//WksCEIQAQW/58B99QxTOwGltQ5alIzz882n1cq2wQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s20vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:40:25 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2f2b8d88fso5146217b6e.2
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606424; x=1791211224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRnT15XNTnThRrBqENhdYd5BF9k1QXVVKb1KnU2gCEA=;
        b=S+6ueXY40qzuRflV56hNAKuZ8gku4YLfJT/VvfKB6FbbCpGWGu2ADGbhgXkU99S51G
         JJ9dKQolaI4AZ9UbG7GVTE3KpvaXuse2dmj+QDlFF+ccxE6iV6hEaD6FX+dhoNSXeJd2
         OJFGe2ySIduXf/D5Ef4KXhVsHGkaa3oCBPEvXAk3YYvVMXXjRrcTaTz45LtuA4quLhpU
         ZWjzNw97VzOWE62C16k+Yv+z8BNm+dWAmgbiBpm0XL3wvDvX+VFBatC743vqUjlmJYqJ
         JtyoP2McYoLMgCZL+fxSj5/sHsML7rTeGQrhQDkWaezEe6qFR5mSm7Yo/WHyexHAy96b
         cqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606424; x=1791211224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRnT15XNTnThRrBqENhdYd5BF9k1QXVVKb1KnU2gCEA=;
        b=eNqyH1typzMa5dyzCkQ4MLER1NnwPkuSvnK1C0HF93DR2H3/Ms4Ew5pUecTRzPX5UM
         z9N6LHZsMzwUGegSfwKp4K8Dkx9rY4XPE9DFu/qgSJMsuUUV3OF81IfWj1s3fKwaBpHw
         LrnZxH9bJIY8J+w40AmeE0Hr+fTsse9OKuz9ns7/bpD20WufHVPrz/wDQgTuqTDyqLLS
         iv+bqjRo6mMKZA/FVBSMtW4MNZtU08LBtBAVRCuE8fThXoSCJUfl3xtA8CNw1B6WWXKh
         2QqzswCCnK3nhNb7Kb7eRIFn/PG9l/eFPx2vUZ9qeIdHha0vx0ubMBPoGsax7WObX/BY
         z4lQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeny4wFthG9UEx7xOB8x5BpiSO3M62A2MO5LlulAsXpcBwHxpSxjTX0JajUNZ66z9t1dARWLvsl8w=@lists.infradead.org
X-Gm-Message-State: AFuF++mC22Y6gODjuYd18CLHkxzJ8VcbP9MjBZF4h8fJd16RS8sr3Cuz
	BIDyYQEXizmX7WH5p9hqNwpXaP0D2N9lnK0VVZE56PS2vAont75Kayouhq+beJPHmZwSXJkHGr8
	oco0zRc8ukqFRyv6xQmumGAm0+PUckAbUwdkqb9OvZ6r6rz7YLYmGYcy8IFfBtaWR1mASB9Tz4d
	Fu
X-Gm-Gg: AYBFou2kRiQjbdimib3SeyoMpG0X7jZJj+ZF65W3+T5y5gjNbUWursEyMkRIsIGmL8l
	KSsNklQ7Qtj3+7FBsFF+wWmr4AlfwjehF9rP1jFWL66jdaAADF0JytuzgLBC48ChmuPYkdfUmeY
	7c0PriaXyFGwYXXE2ZzBuGTs9XMLBT3wX0MjGXGBaU0O4wqsFHwzUoeamVbwqmGaMKB4tSSRd17
	J6Qz/nRavrc+UdQ5VKSlqce2JkNNaEl/yPJtISMrDWJL+2QPiPxobB5SupIUtgat3fU31QcZqmS
	lPsuo+EI+YsqSEaiE4LOMuxbefMAAvhsKnEb0qZBDwupn7cSCDqIAeyteailbwbUsaUk/Teelqm
	Oep32zSmfEp+2YmzS7R5DsLvb8V73Mia50nqW3Q==
X-Received: by 2002:a05:6808:1811:b0:4cb:f21c:a799 with SMTP id 5614622812f47-4d72ac45fd2mr17716287b6e.33.1790606424333;
        Mon, 28 Sep 2026 07:40:24 -0700 (PDT)
X-Received: by 2002:a05:6102:c12:b0:7a1:f7d2:e823 with SMTP id ada2fe7eead31-7af1ecf6d75mr5364910137.28.1790605939177;
        Mon, 28 Sep 2026 07:32:19 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc0cddsm4296359a12.14.2026.09.28.07.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:18 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 12/14] iommu/riscv: Prepare interrupt remapping for IRQ bypass
Date: Mon, 28 Sep 2026 16:31:11 +0200
Message-ID: <20260928143113.49838-13-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXy73z/9OrO9K4
 XuVNDsRKb6OPc4DShRxW39jSZBTPkaBP2inEDW3PwdQnaiujDxEV7Ln0p9YT3kh8b721BMaVxK3
 sIca5bkujFCL6XR4JEZKbxp5K2z8X2C5JO76yLTgh1dQ6zW4Lo1/owOeMTckAbIAsWDb5imMgiZ
 Ho5d1Kx59CgqaPItV+zzt80bnPZe5/ogiOa+e+FSFxq3+4fzDnyeZbD2hxDlZu9KgXrsHrzntVQ
 fZPUtukWkUb+R5DUSksUZJ2rmf5AANlfB6wPUmumClD2eGNw+yaOCveVCXIZ5qjpkNFco20BGbj
 v3U5mGc7fgIkfNcZoCIn8jE73BrF0E01MHLClao3JWEPtXzJQF56+Vnc6pqxeNAhwoIdwYcx6Zp
 /Xm8YCY9hHRBcmkZjFcXTgYUbVpwHjMKyeF8MPrhWn42c7uZS8MasUX3dRPKwuuahh6SHr134qs
 dC3SWsWZ8C/dP9aA9yA==
X-Proofpoint-ORIG-GUID: xP0Vx7DcJ5unCao1ZYLA2aP4NEJZjSJD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX4eg/h+xb6Q+y
 tpw6PtnYp5MWpvYcz46RMWMdJ4qbeMSWqVDb7a0jRsqjF0V3jex00mfEWupq4D9kCYmXe3ePsmE
 GjnAqJdUP0u7j49sW5yaSZkuSA0Qlu0=
X-Proofpoint-GUID: xP0Vx7DcJ5unCao1ZYLA2aP4NEJZjSJD
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba7c59 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=E4clnSanGcVZL-NzkHIA:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_074025_743354_A52ED578 
X-CRM114-Status: GOOD (  21.68  )
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

IRQ bypass changes the meaning of an interrupt from host delivery to
delivery through the guest's MSI table. The transition therefore has to
follow the device's current IOMMU domain and must not race with a domain
replacement.

Wire the interrupt-remapping irqdomain into irq_set_vcpu_affinity() and
serialize the callback with MSI-table publication and attachment. Since
one table is shared by every device in the domain, also require all
forwarded interrupts to agree on its owner and address layout.

Leave the hardware operations as stubs so the locking and state-machine
requirements are established before MSI PTE programming is added.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 140 ++++++++++++++++++++++++++++++++-
 drivers/iommu/riscv/iommu.h    |   1 +
 2 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index c5603cb9f258..22da76987c7c 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -11,12 +11,150 @@
 
 #include "iommu.h"
 
+static int riscv_iommu_ir_irq_set_affinity(struct irq_data *data,
+					   const struct cpumask *mask, bool force)
+{
+	if (irqd_is_forwarded_to_vcpu(data))
+		return -EINVAL;
+
+	return irq_chip_set_affinity_parent(data, mask, force);
+}
+
+static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
+				   struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	return -EOPNOTSUPP;
+}
+
+static int riscv_iommu_ir_deactivate(struct riscv_iommu_msi_table *msi_table)
+{
+	return -EOPNOTSUPP;
+}
+
+static int riscv_iommu_ir_update_target(struct riscv_iommu_msi_table *msi_table,
+					struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	return -EOPNOTSUPP;
+}
+
+static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
+						       struct riscv_iommu_info *info,
+						       struct riscv_iommu_ir_vcpu_info *vcpu_info,
+						       struct riscv_iommu_msi_table *msi_table)
+{
+	int ret;
+
+	if (!vcpu_info) {
+		if (WARN_ON_ONCE(!msi_table->nr_forwarded_irqs || !info->nr_forwarded_irqs))
+			return -EINVAL;
+
+		if (msi_table->nr_forwarded_irqs == 1) {
+			ret = riscv_iommu_ir_deactivate(msi_table);
+			if (ret)
+				return ret;
+		}
+
+		msi_table->nr_forwarded_irqs--;
+		info->nr_forwarded_irqs--;
+		irqd_clr_forwarded_to_vcpu(data);
+
+		if (!msi_table->nr_forwarded_irqs) {
+			msi_table->owner = NULL;
+			msi_table->msi_addr_mask = 0;
+			msi_table->msi_addr_pattern = 0;
+		}
+
+		return 0;
+	}
+
+	if (!msi_table->nr_forwarded_irqs) {
+		if (vcpu_info->cmd == RISCV_IOMMU_IR_UPDATE_TARGET ||
+		    irqd_is_forwarded_to_vcpu(data))
+			return -EINVAL;
+
+		ret = riscv_iommu_ir_activate(msi_table, vcpu_info);
+		if (ret)
+			return ret;
+
+		msi_table->nr_forwarded_irqs++;
+		info->nr_forwarded_irqs++;
+		irqd_set_forwarded_to_vcpu(data);
+
+		return 0;
+	}
+
+	if (msi_table->owner != vcpu_info->owner ||
+	    msi_table->msi_addr_mask != vcpu_info->msi_addr_mask ||
+	    msi_table->msi_addr_pattern != vcpu_info->msi_addr_pattern)
+		return -EOPNOTSUPP;
+
+	if (vcpu_info->cmd == RISCV_IOMMU_IR_FORWARD) {
+		if (!irqd_is_forwarded_to_vcpu(data)) {
+			msi_table->nr_forwarded_irqs++;
+			info->nr_forwarded_irqs++;
+			irqd_set_forwarded_to_vcpu(data);
+		}
+		return 0;
+	}
+
+	return riscv_iommu_ir_update_target(msi_table, vcpu_info);
+}
+
+static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg)
+{
+	struct riscv_iommu_ir_vcpu_info *vcpu_info = arg;
+	struct riscv_iommu_msi_table *msi_table;
+	struct riscv_iommu_info *info;
+	struct msi_desc *desc;
+	struct device *dev;
+	int ret;
+
+	if (!vcpu_info && !irqd_is_forwarded_to_vcpu(data))
+		return 0;
+
+	if (vcpu_info && vcpu_info->cmd != RISCV_IOMMU_IR_FORWARD &&
+	    (vcpu_info->cmd != RISCV_IOMMU_IR_UPDATE_TARGET || !irqd_is_forwarded_to_vcpu(data)))
+		return -EINVAL;
+
+	desc = irq_data_get_msi_desc(data);
+	if (WARN_ON_ONCE(!desc))
+		return -EINVAL;
+
+	dev = msi_desc_to_dev(desc);
+	info = dev_iommu_priv_get(dev);
+	if (WARN_ON_ONCE(!info))
+		return -EINVAL;
+
+	scoped_guard(rcu) {
+		/*
+		 * RCU keeps the table alive, but the device may switch domains before
+		 * the table is locked. Recheck the association under the lock.
+		 */
+		for (;;) {
+			msi_table = riscv_iommu_msi_table_rcu(info);
+			if (!msi_table || !msi_table->root)
+				return -EOPNOTSUPP;
+
+			raw_spin_lock(&msi_table->lock);
+			if (msi_table == riscv_iommu_msi_table_rcu(info))
+				break;
+			raw_spin_unlock(&msi_table->lock);
+		}
+	}
+
+	ret = riscv_iommu_ir_irq_set_vcpu_affinity_locked(data, info, vcpu_info, msi_table);
+	raw_spin_unlock(&msi_table->lock);
+
+	return ret;
+}
+
 static struct irq_chip riscv_iommu_ir_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_ack		= irq_chip_ack_parent,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
-	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_set_affinity	= riscv_iommu_ir_irq_set_affinity,
+	.irq_set_vcpu_affinity	= riscv_iommu_ir_irq_set_vcpu_affinity,
 };
 
 static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index ed973979d795..a42f0b6a88d4 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -82,6 +82,7 @@ struct riscv_iommu_msi_table {
 	struct riscv_iommu_msipte *root;
 	u64 msi_addr_mask;
 	u64 msi_addr_pattern;
+	const void *owner;
 };
 
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

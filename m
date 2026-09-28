Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152BBCA5FA5
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/loQfw7cjV9mo3rlmmYewzmPH/p3nkzULiLqssKb9ic=; b=q+/ia6L6EQ+gg3
	nSLN5XohpCNvTe4JoSnTvcyFGhs9nR94dlJl1SHOMLiO8QZXNa9NXVF/bbx/6R7UplYZ7fWVm6FjD
	fBAnGvn2F4RdaPXMBOMMz9+leapOuIkWCpEFsvqwgqh4ezx1ZUPYUg1f85laAHx4PvYma2zLMW15q
	ecfpA7RLteOidPLDTbN1QG+rxedkc+K0/yQwE2OqBikqbD7ch2Hkm4GA+jvmj3o5YoNh/WT4PiXXK
	D9f/wXrjaqDJcbyZtKwwQwaumcbPL1v9J7AJQXX/9OCaysx6uYJzHNcyCAW//eSZdbKHIxzrsdqRQ
	jkz64GG7GfNqBHcfPDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOs-00000000lZ9-38Yl;
	Mon, 28 Sep 2026 14:32:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOo-00000000lWo-1giZ
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:32:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAAVt1682778
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JEj5sNGlPSI
	l2VeO8kXPsfyM5B41IeUh30FccYbnAeE=; b=fqtV9yvyZMRv+2BDcCzmGqd4bu7
	uoPeUO4RAl2KdRrPVf5fHKtGKl/m3VpR65PJ++GqrjrE0bs1luViQsWOpnWxqrUG
	BYzC+0tZ6yVNO7Llz35/BU+El3NAKDP1iZ56B8VGxg0ebZ6dll9Bx+GR4WF1zw79
	RzAHA4paBWEz2cqB4Ymfv/21P5NIjrNPxJEUAwNTCeXqsAbG8CNOMCuPEq5O0IIa
	YaqdNvj7czkZH9/htZy4uMrAY5aiQA2xOFFfZ9ypXuG55JiCCF1UIygba1Lk7xJn
	Kku50sKAzmWRa1bMVd2accQVToJbjnOjCZ0aoXXbP+xb4Lopm2b6105p2yA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfks5b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7909e307799so3029545137.3
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605928; x=1791210728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEj5sNGlPSIl2VeO8kXPsfyM5B41IeUh30FccYbnAeE=;
        b=YJZsMg3VHAldJqLuYFC/LN461F1kWGwWg/rSnIQb2473aozzp232hEWVzJg+uq5i0a
         Lr+/IZlOQZaq1Hrk9I3Wo/kIXo6Aeh69bkjfC+OdnZdg6FikwQn11ET4onIgxCrma0TY
         ATNldt8S+GmrDE8H0H6MOrMZULal8n2dn9OA6cP3VUysv8sMB59OfUZUAfUvEudNSzAN
         MTSBUWb1bikNNFoQQrBnOysmlirXiIupo0271C9zJ0nC21Y1kvMz3ssB7DZxOhXoJ8BJ
         O/IVmo3etHjTSVM+fNVpkS8l2eF29TVe6FN/ysiXV8Cyr2VOgioY2KlNLE/1mPYdJ2sL
         Htww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605928; x=1791210728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEj5sNGlPSIl2VeO8kXPsfyM5B41IeUh30FccYbnAeE=;
        b=kOfzyebtMPsdEIvHLG30HqUVfLZINeIPeZcl3j2OHBGFnEMiaCHIXREc/+Rtmck74/
         uyWh+yV3jLIBTg+o8nQublBkOi9Jr5ykIsz/ZVuI2B2U1e7lS2kjArs4MBavIjAjd/es
         U35mBUrkO1RXjvv5YeJc0Dn3T+Q3dcpwOIBYpGoVYdZgQc8udVQCqGfyHJqfb0HBM/CB
         JXSQ277j9I3sMF4fbGs+Jj0YZ5u1Bp1b/Fzk9jUhAe8jsjjOVxD7w0SHsc7CEzK6mcac
         xvWQxAXCnt416+PSU91eV/o2D3RTVypIqLGJR8N8sOk235RvMbjsg5IyWDcP7Z4RyfhC
         HFDg==
X-Forwarded-Encrypted: i=1; AKwUvBwiuHLfGj/ZOKWOAD7wYPTlUMYLGlT1LVoSZzzUpGozXPMzoxUf4XKZ6rifxUYcYJWGjev++MlD4JE=@lists.infradead.org
X-Gm-Message-State: AFq9FYJL64cTbcPXAiLzUzxwXhb8ZBFw6xG0PbjfxMpnHhXkkIkLLQXW
	AqhPV1n4SYti58puBFj5wjg3oINiLQlR/OUdn6VS4sas2Sx3IHYGw2H7L+aaRJDq4/LvGm4wVkZ
	KnoIqoFi/XMRGWnmK9zyBUm/gLBSG6GIGxSKqg6OnmhLd6nQ7dXRfFJeTvAykp2Mrnz1H
X-Gm-Gg: AYBFou0lcHNfk8TQp0bOw9zuMnNFihhOyA9u9fBJsMyfXPCLhEucQgrV/njEobSCKnG
	88S+ePiMrwvfb2oAKdxBrTfDcOEf6GMnAFWx03qTf7PdvCsidmXzX47F9gvX5ZiT0YlhO2vmR9p
	tvxc+agEeMuJmZQDonJzTyNlMQeDMVwv1F7BnChNlFqyZ98dth5EORhhPXtKuR2urYwQhh2WrP7
	zK4lDxTiFoA1BQvEyM469pMRyf06qZb2GfvNXWwjKH+6wcvfmT2cd8Kql7L+tMZT4pCvRHcNYUM
	Vo9tCbPKhIHfMN5Ytp6Ktw5WlLxP8DLkyenjVAyE4XY+sWF6qIJwmIZQmgitTNnL7WsiHLoUcie
	zBsd8iNjv9Ixf9JalyMmcba9a0/IxH9d28TfilQ==
X-Received: by 2002:a05:6102:a4f:b0:7b3:4af0:976 with SMTP id ada2fe7eead31-7b34af062e2mr2413925137.21.1790605928491;
        Mon, 28 Sep 2026 07:32:08 -0700 (PDT)
X-Received: by 2002:a05:6102:a4f:b0:7b3:4af0:976 with SMTP id ada2fe7eead31-7b34af062e2mr2413665137.21.1790605918611;
        Mon, 28 Sep 2026 07:31:58 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae76a68aasm470794566b.35.2026.09.28.07.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:57 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 06/14] iommu/riscv: Cache the programmed device context
Date: Mon, 28 Sep 2026 16:31:05 +0200
Message-ID: <20260928143113.49838-7-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX2l6fHck3TvoZ
 sJPY90w1J/QkT6Job4DvUJwYuKEnqQs4LhWpafObAkoU+MEwfKtWI6Q67FySn7CZQ8AkVgjqz19
 AW1n4SwyCvD5DTfN8V2jE4mfZS1++8o5CcDj82DZdm7+FRxH5L67jiWp/rCvVuYZXc5i/QKNr84
 510glqvlkRqBprSKgwiuGRzJP0QCo4wgUDAU1wtm3XawMrH765YSKeID1jfctSglgPabmIvmBZ/
 17G+4Rk++iK5VQGQlnV6lKNjo3qQdmjlt172/p37GzKjiwagLLoLf4+2w88g1k9NEGArF4edXH1
 PigPDroSdFK4BbbgV5IlttQRem8Rf41FDcuraz7aVwPamjPNSFug53qAwVXZSDIWsr5aJV46Fml
 EKryXcy++i0OkpUgF8BfSgn+XK4xKIBlDVpt/+i9pOU5l21xrksd8MYS/+igqXojDVI1/wJRkt1
 DfQrSD1Ky0+ArTtLoKA==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba7a69 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YF9vHHK6WIIsxUIbJtgA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 3qE-ZmrJhloPXGguX8ldjv14UvdGNK-e
X-Proofpoint-ORIG-GUID: 3qE-ZmrJhloPXGguX8ldjv14UvdGNK-e
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX73jov42MAa3z
 kH4brNATYvZU+sew4f64tY/0hlO6mzm+rGo8GC9JuMDnK8vHUxNoO6T0M2/57dvbZFhB78//mKU
 WAjAbU4GayMH27SPUg+nVuJnqKmiE3I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073210_550435_BF8DE219 
X-CRM114-Status: GOOD (  13.42  )
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

Interrupt-remapping state needs to update the MSI fields of an existing
device context without rebuilding its translation fields. Keep the
software copy in the per-device information.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 2cee87ffc122..86d5795a12dd 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -872,6 +872,7 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
 	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_dc dc;
 	unsigned int nr_forwarded_irqs;
 };
 
@@ -1513,8 +1514,9 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		kfree(bond);
 		return -EBUSY;
 	}
+	info->dc = dc;
 	riscv_iommu_bond_link(domain, bond);
-	riscv_iommu_iodir_update(dev, &dc);
+	riscv_iommu_iodir_update(dev, &info->dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
 	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
@@ -1668,7 +1670,8 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
-	riscv_iommu_iodir_update(dev, &dc);
+	info->dc = dc;
+	riscv_iommu_iodir_update(dev, &info->dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
@@ -1695,7 +1698,8 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	dc.ta = RISCV_IOMMU_PC_TA_V;
 
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
-	riscv_iommu_iodir_update(dev, &dc);
+	info->dc = dc;
+	riscv_iommu_iodir_update(dev, &info->dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121DACA5FA2
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXvxpANu3jC1Jb80ZEcJ+njyJQrjgp69cBRWvMAFXpY=; b=uO74bHVzfBRCGy
	2QcyGZIX6Snc0OrniV8tG+0xFE82GP9fYcmKVMqmOqF3FzRjhHzCTDC6n+7AdixghhgB++8sXptgY
	2w2aJTpcmJygQqxafGS46LRRDtLjLLzB3+w/oqG6+q72QkSCzsFbFdV/DfDhGy89PinNFetRGue5q
	1sbgqcIRVDRmK3QHiABfkugmOS6THVWO2/VtKzgaD6YCK5CMWO/zQqBTEIQ//hwfj3TFflD4Dr5f/
	UB19EmZQs/n2b3gN4KYWNq3GEJDF+0Kxkj823DLWqu2p3+isCn3cLlN2LxeiX8lX1K8j4SH4uXUc3
	+rzDTuI9lN2zsfsVTtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOg-00000000lUP-2FGJ;
	Mon, 28 Sep 2026 14:32:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOe-00000000lTP-42is
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:32:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAP9T558663
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x8hihcxDh4v
	dXDXwpEyXNTTs8PuHmt2UDYR1utBPvS8=; b=DQh2DnuUabqm9/ORt7u8x6SNgJO
	S0gCMFqIFtppT9jcPG2Q6KRvgguxsg1JozzSSBSYi8titOZc7N9/gGHm9wQ3mLTJ
	hxxHYX6s9abAAp6b2yAx5XO2t7NvToQBApOkiqfPF7TRHts6Dr068OABC5A7fXdy
	4Rq22H/pscgK1b/9Jg+ccqKL7NJbKEBAprYPCbT3jFs4Y9uJfT2TKVjG+dr1Rf1U
	7L/CEsC94Liym0yKEG1ZbW28nJTLwJVKNxPEivUuPlZVLUDVNhxK94isvVcJbEro
	vzzM0sTIiJVQpHWx97vcuYjJBWN2MgcW54sAiuvW2EEoKviePxi24HmVJqg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq2k8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso217673241.3
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605919; x=1791210719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8hihcxDh4vdXDXwpEyXNTTs8PuHmt2UDYR1utBPvS8=;
        b=V058Mosq8Gef8Nr3J0cuezYzMVTqXknCIH2YNknD1qmVrD2w/hLnSqFexIHwqnymIv
         jyUg52Xx9+EkEgKSXdzL1eGLhB8cOvdKFyMd05BMy6AeHJdpFNVOTSLskwaYCFZWDvPv
         Em01KrpSoajSFRpqhI1biJUat1taTk39ein2yDkWfOjWOTvQw/UaW3lFrP8bvAQF05st
         mBI239SOUVyCM0ZYAq81LXtULxyc31ajN0RaCwX/QFs/YgHAjXmssxFGGXyKZNQw6gkd
         L69+TW3rVDw89jVjlv2iZBGGw5L+b/pPoS3HtiDOzJzB8qubJTdUXddxPwhPGmcTYXJ5
         5bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605919; x=1791210719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x8hihcxDh4vdXDXwpEyXNTTs8PuHmt2UDYR1utBPvS8=;
        b=ARiSoignLNaF2Ad8nrzw6jNh6ad3ToHK/hQA6PEovyCsH8OKwRulFSwqhK11tjnK3T
         NTKOLlrlu3w7IhMLxU1ERAeZqaK2r1eHVNjOQ7oNG2jvQpQ6kefRghLAOr4ffze6qnu6
         cusCF42XSUMz9qQVbny7UR1u1hrzjIsFZi9KdfHoK0kuIB7guAd2OUt5/FORxW/MioJn
         D36yDmHBexKxEbppdRTHDTTDfuCnjeDwdEGX0k8xuxrzIcFQzcV0aIlJPslQSj8ljE21
         K6uVJADNbXYEYD5lH/m6ET/2Z9+GDuo3BgzqxrBC0/k2qymiXCoxO3M6Ihn7gLO3kkH+
         ivjA==
X-Forwarded-Encrypted: i=1; AKwUvBw4PiXyBq2jsGUv50v7L+y1gA/8cC3/UUzPQESwqgSQX+CZqnyi/mnHRPRxSDf56V2Jnyckkzzt8wE=@lists.infradead.org
X-Gm-Message-State: AFq9FYKuNQcR96RuXTRcKASgBz7LWRJ/QgraHUpThXvQsPOBwCx5bCsi
	Oo6CJDknvS54BLLfsCY7b3vo2+FFOofXv3z2ohBH1TsI5V6SJxFgOQuXaMMfOkPIsuuyewxWlhN
	OubTGzgnqqYC6ktEQCB6AwEiT02n7xrIze5BPrOQzhJZ5lfX+3XRN0egljIlpCdKsdd2l
X-Gm-Gg: AYBFou1oETphd/EIyifrEk+jlYYK5b8ShJRVRs3DbnbQXHc4MpY+c2tzHzF/IfZys//
	VSk554w0oYBpm/dOr/Nmc3IPRZsQ34XhUIyeMX3Pb/dUdnDmqCa+3ObOiX6/lrHQJVp/YmwvFQE
	OVBL0lj+PqaF6vChFQo5eYOVvW/48hM3aQYjTFoS9Ndi2jbWvmcAlXo47A+gsdVA6XEzp2b7qI8
	t5h1n+5N+w2fKPy0ii78GQTkCPXYeYt3PL1INVqcjQsJZR3w0DnWj26jM6ods7UZ7P1J8j6L2cJ
	PBekP5hmzrjh8DQmlDS/D2NKuI/ePqJmxffltTXRL4nHLSVERyiqIR2ET+RRTRpLkYjFULEW6l+
	frC1jsl3zQVj1AWcG33l/6NOtBUQ44iRz+WpAkg==
X-Received: by 2002:a05:6102:36d4:b0:7b1:6028:5475 with SMTP id ada2fe7eead31-7b1602862b3mr1832822137.12.1790605919414;
        Mon, 28 Sep 2026 07:31:59 -0700 (PDT)
X-Received: by 2002:a05:6102:36d4:b0:7b1:6028:5475 with SMTP id ada2fe7eead31-7b1602862b3mr1832613137.12.1790605901953;
        Mon, 28 Sep 2026 07:31:41 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae6069145sm488812866b.0.2026.09.28.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:41 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 05/14] iommu/riscv: Derive the IOMMU from the device in IODIR updates
Date: Mon, 28 Sep 2026 16:31:04 +0200
Message-ID: <20260928143113.49838-6-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: JPUH4bvUos_vLRZLQ5wCLqMbuxavrgML
X-Proofpoint-GUID: JPUH4bvUos_vLRZLQ5wCLqMbuxavrgML
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfXz9zsNTVlmJ1+
 wTpj38YsDIKWc7aqcJPtKNzeTjXPjm2KfGE76fhu5s7z31rOHZGmyev9fTKqOnqwXtLIW8BrUu6
 iwtnYPCQ6CDPZebPypDp1+kYZoLIcOM=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba7a60 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5LAesA1oWso2HGznwIcA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX4QCtuggkFmRO
 SPQZt/xAONX5D1P5Nm0vOG3/4FK4w8RnfO86rV65UVj8r0qhUIuU/UkogcORSPCxP6pRHDXR5Bd
 NRK/uotZIp6osGWIAemDMtYl7TN7MBLdqntbvj3UAoN1DP6nNdFbw6jChTxzvrfJhuJCYglwo/p
 LxcTnhAMUvu3vz6/SjTJzzeKKixySUPS2vCk5EAyMaUCxwHSw0BEwGmA+CaCjm2GRFCNOaVh+jY
 iQaE9EApZzbtJ8sIbFDiNpbRPcU9oSq0VLQ8hYC+8sArIqZTHGF4Cxs9J6lDdmW3gJRMzbgG23Q
 qOKgT5qsC1wcmntqgQjcB8Ht0HTx2NbNYbxJQ9mDa7htYze1rZfdJ9B1mybu3fokGxfvQixsIFX
 uMvScwmvndmuQ8e6SHzl7ODelfYD8l6ztc4jLHyRAhHYf0nTNUIN0uaup0es7TCUAHDDI3d/xFc
 WyltJ4NFJjLsMLm7AYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073201_002644_0BACF24E 
X-CRM114-Status: GOOD (  15.89  )
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

All callers of riscv_iommu_iodir_update() already pass the managed
device. Derive the IOMMU instance from that device instead of requiring
callers to pass both objects.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d48667112cd9..2cee87ffc122 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1265,10 +1265,10 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
  * device is not quiesced might be disruptive, potentially causing
  * interim translation faults.
  */
-static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
-				     struct device *dev, struct riscv_iommu_dc *new_dc)
+static void riscv_iommu_iodir_update(struct device *dev, struct riscv_iommu_dc *new_dc)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_dc *dc;
 	struct riscv_iommu_command cmd;
 	bool sync_required = false;
@@ -1514,7 +1514,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		return -EBUSY;
 	}
 	riscv_iommu_bond_link(domain, bond);
-	riscv_iommu_iodir_update(iommu, dev, &dc);
+	riscv_iommu_iodir_update(dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
 	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
@@ -1660,7 +1660,6 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 					      struct device *dev,
 					      struct iommu_domain *old)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
 	unsigned long flags;
@@ -1669,7 +1668,7 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
-	riscv_iommu_iodir_update(iommu, dev, &dc);
+	riscv_iommu_iodir_update(dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
@@ -1688,7 +1687,6 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 					      struct device *dev,
 					      struct iommu_domain *old)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
 	unsigned long flags;
@@ -1697,7 +1695,7 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	dc.ta = RISCV_IOMMU_PC_TA_V;
 
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
-	riscv_iommu_iodir_update(iommu, dev, &dc);
+	riscv_iommu_iodir_update(dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

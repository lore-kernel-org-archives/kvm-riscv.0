Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03814CA5FA2
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8vQjKc7dlNnVF5dCZn/rlRU/8Kjf0nlaroy4/OBJzc=; b=z9oZdCYWgq1fUd
	B2wFVSFp6TaSE3NYC2nAIlGDKKg/TP5wG9bBt9F1ybMk8BsfaeyBGIShysV2MJgMEeW6b51egxRio
	ls13WD53u7btweO3gvgg5roZwA4XaT3xyfKS2/OgjuGyNnSaf7fibSh3yZn9/5IqLkF4mu555aiYG
	aeAELMCLU/bL5lbbBLUC6jNrndEzNk/pTKOhlJhBsdcrHbe5gcXezu6CJeBHvByjflNL2h4Nrmu9x
	PvbUukBjfV4o/8cQ29kp4Tbr6xDml7yzEg64olrEB/5fS4lquXofSISaU/utfkawNCtGHMpO7yDDN
	yqXczhL7TnFNN2w57y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVF-00000000n50-2uBH;
	Mon, 28 Sep 2026 14:38:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVD-00000000n3x-2mmF
	for kvm-riscv@bombadil.infradead.org;
	Mon, 28 Sep 2026 14:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S7rnZZ0yovPSLbhPLQejN/m5WeyZsVkheepx4ZP4TkI=; b=HDquZh6oR93Yi1fVN3An4Aqpcf
	DX3aDPse0JwKG7+/K+j89M32RjFJKvQ53+tGoB1FIdOcrUmFF06O9nPbYNMOWZNLfm6JVpPykC0wY
	K8OHo5hydgNmk/Zr0BjEnGAuw1ukQYKx2JYC7AKGdJZxWRfdpun91RfaQaZAPdXkYX5/8EeD+Oj/+
	YO+FkPC5SH/wDEJ4uzK7zpYOWs2fWa7blupHBSRVNTuiQq76wZld6ApfEg67kQmX2SEiyu8iN6/TG
	oC4ShRp1eODKsaNWHvAEJPlt6lt99xSWxhkBKX8jyZRMRkMIs4Cm+XX1GT2TSgXywuVnAU+3Xs5uy
	nG+88UmA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCVA-00000001ZwV-2i3G
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:38:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAWH8782859
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S7rnZZ0yovP
	SLbhPLQejN/m5WeyZsVkheepx4ZP4TkI=; b=HIr3XliJnfCJm0Mtc1BQqxH67pA
	Kth9aTJwGBFN9iO46A+puwz/haBzE2mHfG6X3eKpuwOvb4EVH/SsFM/PH8Ze6ESo
	V/LjHaOQfJUq4yH4cc7Zt7scQOogYZ6jy6hxUFMnxbkd2xxGg1cSS2RRw4Lh9o6W
	NSWw+RguNw9FrnoiqT7Xim3hR2/sDH9uGyiwvHldGyapB1gFu+LFGIIwob377uhu
	za9FfYrEaw5neMw/MvXCLR58qhlbSPZTds8fYHL5OQCgj0wTZUWOL7F4RPtWt8mm
	aJ9pfsVp7pEUf8I2RFafODuOnzxYaHLvna6tlEwgb/yj12PzVbeadQQtgUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav4ayp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-532df0126f6so41791131cf.3
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606321; x=1791211121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7rnZZ0yovPSLbhPLQejN/m5WeyZsVkheepx4ZP4TkI=;
        b=bKr9XZiTdjFXWtPRWu8DmyvRMc4LS649ty/c09qFmmM+uzrker19/09tVgZiwuiK8f
         c+i4Y8CHNRA/2yQOLP35LlLac6U2Cf7qChZstWc5s2Eth5mP2nNFHmtMLqX7zQr9oZjd
         u7vFL4I/jRDguTXPecws2nb1Fk7s6nKCzG2KMCbxpOER1sURE+2i31NjHIlrlEPY1YRY
         UwoDu072QUq1farAacXfRVNJcOXzR5iMvSy224FjLdqTEkTWrYMH+gxcCjptYVSDHqXs
         JVdQpjcfGBjArd9/C6og/KVvs/R9mxSv8cYHLmPtVodZ+WN4SdnPwUpRhMqIFa3neACk
         ayow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606321; x=1791211121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7rnZZ0yovPSLbhPLQejN/m5WeyZsVkheepx4ZP4TkI=;
        b=jnjCER0G0t5PJkBoHEqurD9qXn1Jv2sCbKDhA0lZ2UIcNbihvJw9HcXxudRibZhm0V
         Onrt9k+Fs6mh3HOLcvotMKy2uCDi3JP94INsRwF7U7xlA2PWfrowntNhFSC3MdhzE2vU
         hKXbnh62mFE4qfHLDT0h9gOpUWQXBFw6w/tGBE9kkTTboZU8TpBp2aFIeip3jmzKa5uU
         rGdFAzoYb1fb2LbMr8+0RmVdZ12sWQcdvke664Cl9eMsxCR45ongFA+2WhR0vwTrFcjm
         jFyjxJFOdGw9n4tvjxekw0gnz6ErD/f5+6nXa0aLmHE/awmrezfDBtUItG/j6Jp8xGj6
         by9A==
X-Forwarded-Encrypted: i=1; AKwUvBzLrzkkGgW9l7/6cdxBvN8BCGZqWWEY8U9kBAkUhtkcobpR/46JbTNbzp5PlYH3iowBJQOja8oQnMA=@lists.infradead.org
X-Gm-Message-State: AFuF++nm6k7fPgh303pg/rEPn7g9UkR1kv8d2fMEq/JvEK3AMUKvPiBV
	U7DmnYvgpU3OXBv6m+KglA5N9AwITqVQI+sUSSNin//+wsHL1YWqLy307GiaZBVrNk76QPNKDgS
	rvGR+5krqXHAApDWklEdCzOs+o0oYCG+rLcIS52rguzB5TQHRYK2cDRejt/waMyvwOcPaBUsCkz
	RM
X-Gm-Gg: AYBFou22fFYO9dg6+WzsubqBYs4y+6fF/Z8bn0No7q7VK0MAT1lGAPPILLUT2tGDQ9U
	kFykQ2fpY/niJ0isisrAKF8HhECAyNbFi0abtJWxtkf2/tm9BIy4A9U8AqPdlzrj5PP7VvIOfOk
	XUj5LON5Er6UiR737podH8TQQnBbVSFB93PFPDsKwovFE9hPfPAExJO4C/wxH2zcRQgtPaSKKCd
	35+/lU2YyCBiw97gw1YvwBF6UgwAHyZ7BvgjPf7NduLJ2XWmbGxiFb3ShExGuw7Ngkupp5pswUC
	UIHnH4onJr7U3Q+LR6vffV0y9PCMNVK9wpS4dEiZFloLfEhKtqBEnD8U/pZphX4Z16gnHT4Npi7
	O+ZyqsweZEGKnoUa7Fwylb2JHs2UERKZ2vNSjfQ==
X-Received: by 2002:a05:622a:4e97:b0:533:2271:c215 with SMTP id d75a77b69052e-5332271c8ffmr143311901cf.13.1790606321119;
        Mon, 28 Sep 2026 07:38:41 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec5:b0:7a7:198a:c2bd with SMTP id ada2fe7eead31-7af1e2f54d4mr5353036137.37.1790605943161;
        Mon, 28 Sep 2026 07:32:23 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7358f29sm476948066b.20.2026.09.28.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:22 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 14/14] iommu/riscv: Implement IRQ forwarding
Date: Mon, 28 Sep 2026 16:31:13 +0200
Message-ID: <20260928143113.49838-15-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: k4MS0duvong1WSwsuoNlvlXroh8mHdZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX0S/4k8/l5zcM
 QBootnTCZLcItQDmDC/yM0myyluPvZE8Fllekw5twm/WTJTje50u5/xP1QSt+sF1N2JRBVE917o
 XBh3tPLX6Ytr+tEQG/kVq8gEf0liqpuBP48d9o/Sq4vwQ61Aopw4D4ysHzgGUQyqKjBge1A0rBJ
 rpYEX1UHI609kEqJWAURdlMnbZtOx18yk7Zs9MFlaaQ22sukgWCnH8OrElryHxzJczOZEUfq5Dh
 foTQkWUBIxY0sYEjSJVnZgk78B2fNp6u9FCTNt8tPQr8RIQiaLzmeM2kQdNu2P9RwBTGLQstMao
 JDmhAxI56euqEtRmIefNpMkLDIHZ1XclrNLNTCABNJTaodMPS5KGhxbMYSCNVtiOTfTcjAUZ+dA
 yxTYYTo30c1KSuJI8pVQi6nWeP2I59ZsZtjVG0e1qfxL15DnaLW2/NjrJ0T/sCQH1fTAh/k5aHZ
 SICQw77WQJqsPBOXYTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX5pmVfWsMe5kL
 z6Mouy47uyKAlTxjO2v/BW0j0jL1JAvQmKzIu6Okhku2FQIvQI9WIYQwHr1itbhvXjDOgmUnBEM
 wQEeLYz3cipyHG6hpeEWv2MUk5WgrYY=
X-Proofpoint-ORIG-GUID: k4MS0duvong1WSwsuoNlvlXroh8mHdZj
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba7bf2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_LgjKRu_PPdaeAXRpTIA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153845_073430_DA3F964D 
X-CRM114-Status: GOOD (  26.15  )
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

Like DMA translation tables, MSI remapping tables are owned by the IOMMU
domain. A single table therefore governs every device attached to the
guest domain, which also requires those devices to share the same guest
interrupt-file address layout. The table must become visible before the
first IRQ is forwarded and remain active until the last forwarded IRQ
returns to host delivery.

Populate and publish the table on that first transition, and remove it
on the last. Keep domain-wide and per-device forwarding counts so domain
attachment can preserve the table lifetime without unnecessarily
blocking unrelated devices in the same IOMMU group.

A vCPU migration may also change a live target without changing the
forwarding state. Update MSI PTEs with the ordering required when moving
between basic and MRIF modes, including break-before-make when both live
MRIF words must change.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-bits.h |  27 ++++++++
 drivers/iommu/riscv/iommu-ir.c   | 114 ++++++++++++++++++++++++++++---
 2 files changed, 131 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index 65d1f2250011..51a2e660b06a 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -702,6 +702,8 @@ struct riscv_iommu_msipte {
 /* Fields on pte */
 #define RISCV_IOMMU_MSIPTE_V		BIT_ULL(0)
 #define RISCV_IOMMU_MSIPTE_M		GENMASK_ULL(2, 1)
+#define RISCV_IOMMU_MSIPTE_M_MRIF	1
+#define RISCV_IOMMU_MSIPTE_M_BASIC	3
 #define RISCV_IOMMU_MSIPTE_MRIF_ADDR	GENMASK_ULL(53, 7)	/* When M == 1 (MRIF mode) */
 #define RISCV_IOMMU_MSIPTE_PPN		RISCV_IOMMU_PPN_FIELD	/* When M == 3 (basic mode) */
 #define RISCV_IOMMU_MSIPTE_C		BIT_ULL(63)
@@ -711,6 +713,31 @@ struct riscv_iommu_msipte {
 #define RISCV_IOMMU_MSIPTE_MRIF_NPPN	RISCV_IOMMU_PPN_FIELD
 #define RISCV_IOMMU_MSIPTE_MRIF_NID_MSB	BIT_ULL(60)
 
+static inline void riscv_iommu_msipte_set_basic(struct riscv_iommu_msipte *msipte, u64 addr)
+{
+	msipte->pte = FIELD_PREP(RISCV_IOMMU_MSIPTE_M, RISCV_IOMMU_MSIPTE_M_BASIC) |
+		      FIELD_PREP(RISCV_IOMMU_MSIPTE_PPN, addr >> 12) |
+		      RISCV_IOMMU_MSIPTE_V;
+	msipte->mrif_info = 0;
+}
+
+static inline void riscv_iommu_msipte_set_mrif(struct riscv_iommu_msipte *msipte,
+					       u64 mrif_addr, u64 notice_addr, u32 notice_id)
+{
+	msipte->pte = FIELD_PREP(RISCV_IOMMU_MSIPTE_M, RISCV_IOMMU_MSIPTE_M_MRIF) |
+		      FIELD_PREP(RISCV_IOMMU_MSIPTE_MRIF_ADDR, mrif_addr >> 9) |
+		      RISCV_IOMMU_MSIPTE_V;
+	msipte->mrif_info = FIELD_PREP(RISCV_IOMMU_MSIPTE_MRIF_NPPN, notice_addr >> 12) |
+			    FIELD_PREP(RISCV_IOMMU_MSIPTE_MRIF_NID, notice_id) |
+			    FIELD_PREP(RISCV_IOMMU_MSIPTE_MRIF_NID_MSB, notice_id >> 10);
+}
+
+static inline void riscv_iommu_msipte_clear(struct riscv_iommu_msipte *msipte)
+{
+	msipte->pte = 0;
+	msipte->mrif_info = 0;
+}
+
 /* Helper functions: command structure builders. */
 
 static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 12a5d0bc77f2..b3f0a56475ed 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -93,6 +93,17 @@ static int riscv_iommu_ir_validate_targets(const struct riscv_iommu_ir_vcpu_info
 	return 0;
 }
 
+static void riscv_iommu_ir_set_target(struct riscv_iommu_msipte *msipte,
+				      const struct riscv_iommu_ir_target *target)
+{
+	if (target->type == RISCV_IOMMU_IR_TARGET_IMSIC) {
+		riscv_iommu_msipte_set_basic(msipte, target->hpa);
+	} else {
+		riscv_iommu_msipte_set_mrif(msipte, target->mrif_hpa,
+					    target->notice_hpa, target->notice_id);
+	}
+}
+
 static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
 				   struct riscv_iommu_device *iommu,
 				   struct riscv_iommu_ir_vcpu_info *vcpu_info)
@@ -134,19 +145,101 @@ static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
 		return -EOPNOTSUPP;
 	}
 
-	return -EOPNOTSUPP;
+	for (unsigned int i = 0; i < vcpu_info->nr_targets; i++) {
+		const struct riscv_iommu_ir_target *target = &vcpu_info->targets[i];
+		size_t idx = riscv_iommu_ir_extract(target->gpa >> IMSIC_MMIO_PAGE_SHIFT,
+						    vcpu_info->msi_addr_mask);
+		struct riscv_iommu_msipte *msipte = &msi_table->root[idx];
+
+		/* A populated entry in the initially clear table indicates duplicate targets. */
+		if (msipte->pte || msipte->mrif_info) {
+			memset(msi_table->root, 0, array_size(nr_ptes, sizeof(*msi_table->root)));
+			return -EINVAL;
+		}
+
+		riscv_iommu_ir_set_target(msipte, target);
+	}
+
+	msi_table->required_caps = required_caps;
+	msi_table->owner = vcpu_info->owner;
+	msi_table->msi_addr_mask = vcpu_info->msi_addr_mask;
+	msi_table->msi_addr_pattern = vcpu_info->msi_addr_pattern;
+
+	riscv_iommu_msi_table_inval_all(msi_table);
+	riscv_iommu_msi_table_update(msi_table, true);
+
+	return 0;
 }
 
 static int riscv_iommu_ir_deactivate(struct riscv_iommu_msi_table *msi_table)
 {
-	return -EOPNOTSUPP;
+	riscv_iommu_msi_table_update(msi_table, false);
+
+	memset(msi_table->root, 0, array_size(msi_table->nr_ptes, sizeof(*msi_table->root)));
+	msi_table->required_caps = 0;
+	msi_table->owner = NULL;
+	msi_table->msi_addr_mask = 0;
+	msi_table->msi_addr_pattern = 0;
+
+	return 0;
+}
+
+static void riscv_iommu_ir_update_msipte(struct riscv_iommu_msi_table *msi_table,
+					 struct riscv_iommu_msipte *msipte,
+					 const struct riscv_iommu_ir_target *target)
+{
+	u64 pte = READ_ONCE(msipte->pte);
+	u64 mrif_info = READ_ONCE(msipte->mrif_info);
+	bool old_mrif = FIELD_GET(RISCV_IOMMU_MSIPTE_M, pte) == RISCV_IOMMU_MSIPTE_M_MRIF;
+	bool new_mrif = target->type == RISCV_IOMMU_IR_TARGET_MRIF;
+	struct riscv_iommu_msipte new = { 0 };
+
+	riscv_iommu_ir_set_target(&new, target);
+
+	if (pte == new.pte && mrif_info == new.mrif_info)
+		return;
+
+	if (!old_mrif && new_mrif) {
+		/* Basic mode ignores mrif_info, so prepare it before switching modes. */
+		WRITE_ONCE(msipte->mrif_info, new.mrif_info);
+		dma_wmb();
+		WRITE_ONCE(msipte->pte, new.pte);
+	} else if (old_mrif && !new_mrif) {
+		/* Basic mode ignores mrif_info, so switch modes before clearing it. */
+		WRITE_ONCE(msipte->pte, new.pte);
+		dma_wmb();
+		riscv_iommu_msi_table_inval(msi_table, target->gpa);
+		WRITE_ONCE(msipte->mrif_info, 0);
+		return;
+	} else if (pte == new.pte) {
+		WRITE_ONCE(msipte->mrif_info, new.mrif_info);
+	} else if (mrif_info == new.mrif_info) {
+		WRITE_ONCE(msipte->pte, new.pte);
+	} else {
+		/*
+		 * Both words are active in MRIF mode, so use break-before-make.
+		 * The UPDATE_TARGET contract requires producers to be quiesced.
+		 */
+		WRITE_ONCE(msipte->pte, 0);
+		dma_wmb();
+		riscv_iommu_msi_table_inval(msi_table, target->gpa);
+		WRITE_ONCE(msipte->mrif_info, new.mrif_info);
+		dma_wmb();
+		WRITE_ONCE(msipte->pte, new.pte);
+		return;
+	}
+
+	dma_wmb();
+	riscv_iommu_msi_table_inval(msi_table, target->gpa);
 }
 
 static int riscv_iommu_ir_update_target(struct riscv_iommu_msi_table *msi_table,
 					struct riscv_iommu_ir_vcpu_info *vcpu_info)
 {
 	const struct riscv_iommu_ir_target *target = &vcpu_info->target;
+	struct riscv_iommu_msipte *msipte;
 	u64 required_caps = 0;
+	size_t idx;
 	int ret;
 
 	ret = riscv_iommu_ir_validate_target(vcpu_info, target, &required_caps);
@@ -157,7 +250,15 @@ static int riscv_iommu_ir_update_target(struct riscv_iommu_msi_table *msi_table,
 	if (!riscv_iommu_msi_table_check_caps(msi_table, required_caps))
 		return -EOPNOTSUPP;
 
-	return -EOPNOTSUPP;
+	idx = riscv_iommu_ir_extract(target->gpa >> IMSIC_MMIO_PAGE_SHIFT,
+				     msi_table->msi_addr_mask);
+	msipte = &msi_table->root[idx];
+	if (!(READ_ONCE(msipte->pte) & RISCV_IOMMU_MSIPTE_V))
+		return -EINVAL;
+
+	riscv_iommu_ir_update_msipte(msi_table, msipte, target);
+	msi_table->required_caps = required_caps;
+	return 0;
 }
 
 static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
@@ -182,13 +283,6 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
 		info->nr_forwarded_irqs--;
 		irqd_clr_forwarded_to_vcpu(data);
 
-		if (!msi_table->nr_forwarded_irqs) {
-			msi_table->required_caps = 0;
-			msi_table->owner = NULL;
-			msi_table->msi_addr_mask = 0;
-			msi_table->msi_addr_pattern = 0;
-		}
-
 		return 0;
 	}
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

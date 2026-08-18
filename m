Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63704C5DF7E
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/qKHK+7Mu4hJ+ev+Vqn47jGzjbNjPbLdBvLV7F63Kk=; b=M5Zrh/eCyxQenL
	1uN+0/iJAVpCitgxwRzRYrluL6/3lUkTP2gqWQ07LyDeF+KBr/w6j81EiP+boADLouDHAcejXfaWJ
	LF9mIJit73fIbyLM0/aKYC1GSfX1MdBYbc8WE6/fVNE7Lkfuq8mURZKgPH2CNUxK51jAqk5DhF4xr
	LAHxj1gza3WN8LQy6wmkQ4eyR3H2S52KWNQ6ZE1Kk4A+V2+6jiEvrsaf9a2yBeP5bKVYvcjDV9ZF/
	i81dZUtpkITtMGw3kmh8w5SWPRMl73/id/gdBa1RMJPYRSlNbF9NQtjDoq/v/VMLRX1CriB8wOpx5
	QqTcYRY9s8/uDE3gHywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHXx-00000007ngJ-08nC;
	Tue, 18 Aug 2026 10:59:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHXt-00000007nfP-2tVh
	for kvm-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 10:59:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABGI42056940
	for <kvm-riscv@lists.infradead.org>; Tue, 18 Aug 2026 10:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=97oyElD7Ik9opXwUE5qADXHh
	NFeKHDDf3nqCTfRJei4=; b=J60TawLLIuSg8NbfgtjwGsJfjgui/RptVu344kDD
	llEnlZc99ED1Odhs98GrZXdsPCRnQXysN50fi6sV9C+tdTfr8EeVCR0vmQoGfl5v
	ttGcLdBFc4b3bHstiQfuRnCKqD2HG/GF+oDwusUL8IyyGkBDLRsTpgqntLKj32Zq
	Ckl0AG/gfe6B9jxGHt+3vo34GRPskctLjTG1igjzEgrAhaEjaaky361TJZsdtzzm
	/kvE5xvcEwWkGGhW0oSDiAEl0ncmwLymcCCFDMV8+6Nhdjl5Ubp2v9+4G5iLCxA8
	s2WM+NId3pst9+pYQVSHe6uLWZNX/muG//QOMJel0lrPDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4frmsqd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 18 Aug 2026 10:59:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so100517885a.1
        for <kvm-riscv@lists.infradead.org>; Tue, 18 Aug 2026 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787050792; x=1787655592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=97oyElD7Ik9opXwUE5qADXHhNFeKHDDf3nqCTfRJei4=;
        b=ECWysfS3Tx5c+leN0TSq24yVI9HCgbwGPQewIDKJS0ryyAhGzYP8Jsbc7CULqTDgzI
         CTSZ73JPVGGhFOBlmmoslt23f/w0F3Py8Z9UFM2NDGzN7cnd+3OkTw3k1UjsRaledpFs
         c0fMJq/eN7x/yV+9SkHyVnHXC6mbokbmDXxbf5Mp8SXSVd0QFOVL02gma7I8D3wOdAfK
         L9ymyGguhE47Yfyd6DytcTvFrOdot64MGrhJxVs+m7OEeTVFu2XNa2YNFtaI3xY/MkhQ
         NcmdFbHIAdnax+YuXV1hQ8Bv5GzdeuQkwQWcnnZDM5a3piTpC8SfMrXqyQn/kFLa2/i5
         9rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050792; x=1787655592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97oyElD7Ik9opXwUE5qADXHhNFeKHDDf3nqCTfRJei4=;
        b=sIV9hJswNY+/EIBWnQ/xwxo1EWZ2wlkXOOXR/aKQaSEP/Vem/HCEW84y1ZAGZ2jnZD
         SOk1Uh5pyacRjDx2/I2DtdbbGgCoVz7xrLr2sULaltEJnNp2opT5glhh/UAqSkhFlTQc
         1hAcD4n9qOe9SvutjQ+FzBm50moZtvQOxXmHygDWe1avFFqI+H2Sr4b/A6cnj04MYr9V
         G/yxVKhBBVE3GetBG+qXiS/YK5A6djKE/cekDHc0c/hjK+fMKFrqxFAMgPiT9Y1xsC6h
         5zoRtkfdByNNPstOFmyIlPEqh0+vlvYbSDQNyntztA3VaL8o0na0OaVPD2/a/E7RuNHg
         1mwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoJKZSGnjk5Cl9gnRXwSMw9QK4nrVdEcrlte6E3Yy4Co3PjhqmZM4z+zVhp/Tk4e5Y/U4s2dr5UPE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzfmq0OEefJYOa8pijPqHirLzv4sabPfjRIG04IAqeZ/VXMt0X
	uSnCiTNhGUxFcq5poIlOJFxW0CJCkYeuLfD8S5dSGbWT1nMAT5jqLQwkbWUoPKsGfpVrRpbmQrM
	QtCt9yhr8oWzf5B9ZznRKbdG3Zfl0LjTybl4gCWHOGw1KiJaR4I7Tvlwl40T0M55t4nFw
X-Gm-Gg: AR+sD12tm+lOoj6ixY7dTPTV6tH42s2Al6g2TTCMS5nE3sOiWskcNYpEjKLsuZh2elX
	Yfh8m7miOQWrGbtkUpX8AMx8qelUjuMGAKM7GJADidP3ZJORBsRtTdvRq1S2qvo+dYvZgeTyMx/
	GOibKMWAEJ/CrlUEQfrdW2lhxYVyFd8ZMvg3GUqUEiKIowmtTDtNvIhtKdS26l0UEJ+dAYQBTp7
	e0EjFyOufcr+bgwezyfVab+3+8cXZ+f38WsqalF/+54nVLxgbD0ovWTDL2W7wALjaFztVtElpy2
	h0E0datxRaXDlGAqPMWGEhGg9m+6sDknuYUA72ZBv+aSd8uhHjmnZBnS2HQIm+cIS7rYOZo637f
	JQ9pkP4NfyzlNYWp/0wjGpog/CTX4zqbWsmA=
X-Received: by 2002:a05:620a:280e:b0:936:a8a0:cdf0 with SMTP id af79cd13be357-9370662ee48mr557157185a.15.1787050792143;
        Tue, 18 Aug 2026 03:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:280e:b0:936:a8a0:cdf0 with SMTP id af79cd13be357-9370662ee48mr557152885a.15.1787050791724;
        Tue, 18 Aug 2026 03:59:51 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783basm11499220f8f.30.2026.08.18.03.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:59:50 -0700 (PDT)
Date: Tue, 18 Aug 2026 12:59:49 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
        atish.patra@linux.dev, skhawaja@google.com, jgg@nvidia.com,
        guoren@kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Zong Li <zong.li@sifive.com>
Subject: Re: [RFC PATCH v2 05/10] iommu/riscv: support GSCID and GVMA
 invalidation command
Message-ID: <4mcwrlk7yc4kozsqbrumf5gbknydquzwdb4g7lv6bgjk7m6ob2@alld2yusipnq>
References: <20260507113706.11400-1-fangyu.yu@linux.alibaba.com>
 <20260507113706.11400-6-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507113706.11400-6-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4MCBTYWx0ZWRfXyH94T0Qq/GuY
 rmwc+zJda/+5mfv5wwvxJ1lsQVhvqlF2kZTCBLtNKLoJiRRtGOhydwAzQB5jkNcAEpuV1ULQRLC
 1JnXZHb5A6zhMm9XOtZfGu16Sokr0pnbodR7LfNjUgEpS9pG8chIbvhqwW0OC/w6I5U4T3hucNK
 HMGikkZyl6YFH6ZDljDGDF76YEq/f8LwvSaBIF9uw4yNsmSkEHVD9qO8fFrGMAP3G3xTmOUcWX2
 QAWT45mxZupr6TmorAVM5kZL86X+4NHaQaRuYBbPYakcBoWIqkXaSrbuSHlwoAJq4xgug29BWSM
 UjiQy89lHYQ+oCEpfUsA+pUhf/a74LpG2ytwAyCkERRTZ+LfXDioeEyKRIqIv2Pz7Vl60Ztp0gC
 fy77BRIDxFPLgLrq8PoqGd3y0IyTXsAmvj0BXvWa4p8G6YsPTdefAGVeznrjf9waaB1bRZDVExT
 AqVb0PK78Hlvhakb24w==
X-Proofpoint-GUID: 15CXYM1uKaEOYwFV0LGEbDuEn7KQ9Dt8
X-Proofpoint-ORIG-GUID: 15CXYM1uKaEOYwFV0LGEbDuEn7KQ9Dt8
X-Authority-Analysis: v=2.4 cv=GtlyPE1C c=1 sm=1 tr=0 ts=6a843b29 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=SRrdq9N9AAAA:8 a=VdMlnMEb94GnahmMsAwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4MCBTYWx0ZWRfX9e0mxY7NYXGd
 w/SDMPsUKb+HWt3L+0/C4yCvldTLcKkcyvK8BfE8vwMouxnJkAL7HmOiSRn00VssB1bWxsohq5U
 kqu9biPwKp7Ky7v8o+oEo+epbHyn6OY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_035953_737774_31EDDB2C 
X-CRM114-Status: GOOD (  17.08  )
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

On Thu, May 07, 2026 at 07:37:01PM +0800, fangyu.yu@linux.alibaba.com wrote:
> @@ -1212,8 +1225,15 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
>  		return -ENODEV;

This needs something like the below diff squashed in.

Thanks,
drew

>  
> -	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
> -	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
> +	if (domain->gscid) {
> +		dc.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
> +			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
> +			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
> +	} else {
> +		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
> +		      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
> +	}
> +
>  	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>  	     RISCV_IOMMU_PC_TA_V;
>

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 307baf33c646..434d2d4f26f5 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1262,9 +1262,9 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 	kfree(domain);
 }
 
-static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_mode)
+static bool riscv_iommu_fsc_supported(struct riscv_iommu_device *iommu, int mode)
 {
-	switch (pgd_mode) {
+	switch (mode) {
 	case RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39:
 		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39;
 
@@ -1277,6 +1277,21 @@ static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_m
 	return false;
 }
 
+static bool riscv_iommu_iohgatp_supported(struct riscv_iommu_device *iommu, int mode)
+{
+	switch (mode) {
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV39X4:
+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39X4;
+
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV48X4:
+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48X4;
+
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV57X4:
+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57X4;
+	}
+	return false;
+}
+
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 					    struct device *dev,
 					    struct iommu_domain *old)
@@ -1294,14 +1309,17 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
 
-	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
-		return -ENODEV;
-
 	if (domain->gscid) {
+		if (!riscv_iommu_iohgatp_supported(iommu, pt_info.iohgatp_mode))
+			return -ENODEV;
+
 		dc.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
 			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
 			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
 	} else {
+		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
+			return -ENODEV;
+
 		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
 			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
 	}

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

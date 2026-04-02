Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB696D6AAF4
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 18:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhaZOaRDa73avnphVEtWKH4wubZhCohLtlhoj6kpnm0=; b=QMJR/4angSW0nK
	jKF8xPFcwKRZRvtc36J9EFFQcOfwIoXlyFqKay3gQnzDT75Sl6OfWZUJoPK3gCaG0Mi2eYAsLRjCY
	OXAC6PdszpbMdsaH8D5QwF2Qbl5D1b1M8cgaiobevoG3tB8nzqgkrNVShkMfm2arCqY2jEWMP1TYn
	8szEDwniyZtcNHXVH/Cxvk/T8IRotWC7u7M4YxLmq1vs0f7+yV0SgufSncBsFu60oX6GVRecbyqAS
	5QmNwuH59mATWbW0XnfStlGjio9eVev8bZpzRcc1V7DAmA0DCCbfQIb5+9U5AZBY4JBKDDVMOVLae
	4e6CWKKcGo9Zc5FlKcvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Me3-00000000eB8-2Wy0;
	Thu, 02 Apr 2026 18:19:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Me0-00000000eAJ-2qrU
	for kvm-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 18:19:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4TJZ462633
	for <kvm-riscv@lists.infradead.org>; Thu, 2 Apr 2026 18:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wiDkn4M6EeOZO6HfXfs1fLrNAiZ96hbYdrTrvNXFkyM=; b=dYc0L+M/7pKMzfsJ
	Xxh2RKcWwrM1NMLt7U9a1q/qJ8EUI4G1em6m584wOhh2e5MRjqxDvWnj2rSW4YWA
	pWMx3EtqUW7MWn+AlPactqXGo8LxbLsmeD4m5hpdoFqmZtKB5TvpfYyHHot7ABsK
	y8pKqzeWw9pnnF8teo5Lfc+ltfck6i0+fN9YQJqbCrBFxGComSp9JzdU3G02GR01
	zJ2Ff4dVxsGLydLlF78ZyMnLobclfcZf6NUCGL8k+nMkqP8gTPN0b5uOo5tuNfoU
	GlBardYOabKU5XtR+g0ZF4G33Yji6oyFNaFovSOQYfnzFPXwYhYxAuHATSOD03k9
	QtEboA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h4hrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 18:19:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso16906681cf.2
        for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775153991; x=1775758791; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiDkn4M6EeOZO6HfXfs1fLrNAiZ96hbYdrTrvNXFkyM=;
        b=BVSqRHDHyoUlTONJaMaGTHRhTgOLXmibibkHlvgd0cHsQSFa59nfc7TTI1s7njHpjY
         F/XjmE260G/VP0/xPA9Nw5Yyen0XOMgIuWyK0/1NFTeg43wy27yPge40RJREENcCPesQ
         wd/bLR7pGnyFun6aNRhbRUE6clsD88s2opBInXmIAC+fId/q34o26lOtIwRtv8YKigqO
         q1eu1MjKGPEmPq3f1le15/naD6BLB40yQfbawMWXDVrCU+/3qRdoTx7mVn0Rkf808Jv8
         ASIFYjuQoXpMnVRIXPV/pB3tDi+SkkImAqpqcIdqF//Dm+rOV4kbYDpYTQH8id/kACwD
         WxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775153991; x=1775758791;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wiDkn4M6EeOZO6HfXfs1fLrNAiZ96hbYdrTrvNXFkyM=;
        b=b/+pkKz6e0Xvcbo4F66MIU7RgOxJXNK2icqKQ+3xvtrA9gF+X2TofbTg9Wfes4z1CE
         EtW195CMCyzM/GigBVEJ5Bg1DlKPf5aN1FC1AbNgbVsRdp9Tp+3q5ni4a86zGcdm7Xz7
         Qei3PXk56aMwHkGd1eOSNxenlCdE0IfJS6+Wb3HilOk17ZZWcIUyAE3GNdoF2ofWJ5S/
         D80zO1rrBNiLVGn5GpGB2n5aiuclB0VpLvYxnjyBkrsEy/UCxBOAUjSnXv9Vgdx/iQD1
         gQfBNvIECUqcjVztrS7Wdn5xJXKBg3v/yqVE+/+s5F3sKDm8hC+vzbeL8clrzWdtDN+H
         sc7A==
X-Forwarded-Encrypted: i=1; AJvYcCXlsOnAZIh6vPrDxGW0N7zLansmSlurvEO9kEOzfw/6eSEOuKq+DVlJd4F/LcAoJIF/DVhRfbz3t/k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2zNRJqUnSDp4VsiRf3MUsXrd8YMH1tBM+CxH3Pkpt2hfiPipO
	BBXIbXoNJRPzVeF2josgtNsa9IjYwvGqeAU287oCM0X9Mb1T+LosHaJxzYNQf+BMQwfOIGBxHTU
	A7BOtqZmxNmj3O/PpHvOtvK8vpXjENNA8Ut+gcsOOrYmHHi+1cxnVH8/mpuuvhZWMxLg2MtOCnz
	El
X-Gm-Gg: ATEYQzyo3Db/gqfGbmNrgq8NDZ4NrlmnZRPWx39tkkghxnQHVD0bP4+VWvWe3z0/BGm
	UqCmWUDR49BBor9boXyX7W06sxo5DBP3ZY2f+q2K4yVXyWlNhtNAKxYDaXIlxvYaJSCQ2RUql4w
	iAfgjUQhbPq+iPOsJJl/6jjvH0FzeCxpaNt8nfcFB4kshgOIjaz7+SxgM1TyknY0DiQu+aaOW4u
	IYPnDevO0i4x9NxtNssYcm7UCIhu0l3gSoXhUSXyozeqw5IbWsNmcQ6cliaZ0IUxKkMYWT/qdKx
	TnocaDGSysaEaysAULf+PeiCbo566T5xUX8g5mTor9f0Is1qJT6ziva+BEPFLqaoapwxlCNDIsK
	LlajwLEHFh19Dzwqele1tCfUPtLwQYj1rORhCcyhYSQRAygBKpGPRdt4abkbQ
X-Received: by 2002:a05:622a:aa12:20b0:50d:4199:8c88 with SMTP id d75a77b69052e-50d62772bddmr5001891cf.1.1775153990873;
        Thu, 02 Apr 2026 11:19:50 -0700 (PDT)
X-Received: by 2002:a05:622a:aa12:20b0:50d:4199:8c88 with SMTP id d75a77b69052e-50d62772bddmr5001461cf.1.1775153990314;
        Thu, 02 Apr 2026 11:19:50 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c971f03sm114386766b.7.2026.04.02.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:19:49 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 20:19:48 +0200
Message-Id: <DHIVKK81LLM2.3VTYW1UXM6USQ@oss.qualcomm.com>
Cc: <guoren@kernel.org>, <andrew.jones@oss.qualcomm.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <skhan@linuxfoundation.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
 <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ceb348 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qHmfJlKEtTjsIq712WoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: OPXNLbOlTf82X_O_RxDvsC7ugXyhvDRU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NCBTYWx0ZWRfX2DAR00bLmu2b
 IqotQHu295f3CDnlJE3aBwdnwDlTewgnWrusErS+izEh5j2b/5P7V8Q21afoCjxrz4M6FOHgzna
 l+U2Eq7qNOPJ7i/W5grrgrKflaueED3ftxvvKb7pPCJlMmdGFFsQNRZRLyzTvZylc8clvAhb5Ir
 1/TKSK1AEQeVL+1fL1fuH7uA104d//rlmzu9O3A8iZeh5b/bY0+9rV00etzWprkIzi0yjvxilRl
 41JOUKJRUl9kDvXDMTayva9yY5XJmUzJrMCPqix7GGJFZxwUvCMVeXIkpeSVUfK4nvNngDL26zp
 bOzhHlpKYL8Z/PcR+6uBqJ8pCNxU7isYXhlkZG0RYoRWzb9SdxsSgVIBmT4vq8R2xr7T4vwkb2b
 CS9Yjdbol0+9NK3EjWizyjlc+1o1Jqfi7NhTKLXtOVqYSXPz383625tZzq8FQSlyWsrqZr2bJEA
 FQ8zPiAI1ApYg+ejRrg==
X-Proofpoint-GUID: OPXNLbOlTf82X_O_RxDvsC7ugXyhvDRU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_111952_749583_234CF9F1 
X-CRM114-Status: GOOD (  10.93  )
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

2026-04-02T21:23:02+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Extend kvm_riscv_gstage_mode_detect() to record HGATP.MODE values in a
> bitmask. Keep tracking the maximum supported G-stage page table level
> for existing internal users.
>
> Also provide lightweight helpers to retrieve the supported-mode bitmask
> and validate a requested HGATP.MODE against it.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> @@ -102,4 +103,14 @@ static inline void kvm_riscv_gstage_init(struct kvm_gstage *gstage, struct kvm *
> +static inline bool kvm_riscv_hgatp_mode_is_valid(unsigned long mode)
> +{
> +	return kvm_riscv_gstage_supported_mode_mask & BIT(mode);

Shifting by more than the bit width is undefined behavior in C.
RV64 effectively translates BIT(mode) to 1UL << (mode & 0x3f), so this
could allow values larger than the mask.

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

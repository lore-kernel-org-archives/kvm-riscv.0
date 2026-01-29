Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7CCD6B06C
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2R4vys3zoQSVkQKMfqC4+YY5CR60+izDDzb6c8axpw=; b=SO5S+xWlHPvksh
	+GkZdQRUR7NFDATz1fkSC2xwhbZzvH63rjEO3T3dB6jOxDVLNBGUKoVUT8NgedK5mRjZHbIxa0uEh
	ojeDbjnL0ae814wwFq3v912g+cyDwgpjD/nv7VCCUl/FxRYmngBuP2n5SJzLzZ/+XzHwGcbHWshZg
	LHswS4bmfXw3DNJ/AIvJd3gQeavB3duDOBuwtrqrjoJAiIbXG67kjw19LLbQLR2e8AyKWhcTNDp/f
	PA/J8SM64Jw3Gh2JVp11/UMJigsijz840Bx8RqBZZIdaPle4uZfDhzyJsHXVUjBR3czA3j3LZi2uG
	QrNaD+tLSU8Cm2Y4GjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTvq-00000000HTL-3UKT;
	Thu, 29 Jan 2026 15:27:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTvo-00000000HS5-1L4n
	for kvm-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 15:27:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAHD9W2033220
	for <kvm-riscv@lists.infradead.org>; Thu, 29 Jan 2026 15:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ScOC4GuemLF+vD6HqYRKrExatm0/7pF+N+hUpuGlD6w=; b=lm+Pl4lwNanlF8MG
	x05/DQHvA9ngneLxFBxDmTgdaEi2lEc9+nA+8s9bmWNXByRIYIVPCErqeYr5CYxD
	EhuAN+7e5w20mADS3ka/V9dwiShZl6g//O1JD4+t1D1q3dBCOBeIPst1Sltynwf5
	plcXSMY0k1wG1E8KiAEoa2SoeuInJ0n2JJoqfdXZi1mZmFmhgjhob6nteDNrdwtl
	m+XeoiHKr5pjeWJewDgTtjuGc9ro4f01UwfaKq7UZDFRLs4zjS5EmvpwfdCkbWdY
	ppUmw3mo+W01rOKceE7Zf0mUu2mvzK7SDZZG/VIpp19mvArQMm1PMQHkE8PSbnd8
	Js1agQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy30p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 29 Jan 2026 15:27:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a87029b6so313923185a.1
        for <kvm-riscv@lists.infradead.org>; Thu, 29 Jan 2026 07:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769700458; x=1770305258; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScOC4GuemLF+vD6HqYRKrExatm0/7pF+N+hUpuGlD6w=;
        b=Hl47+DG+V5rbK9JFv5ZcBKBIQEHnsoxUIL4cGN2rsRCHT+BIZIk0PA3tUVjnzyPLyJ
         a9Ie5RZDRxdKKPeSiHnY35lB3lp9dhJxLRSw6U1cMH8XpKbLGr0zEx1qG6jSNKrM1luF
         lfxrE2xAc9pXML8xHMqTrCYfI/rCd7f6vOJmI3PDqubho66LW78gJe3ap1ELcuxs/HG9
         0/yvn/zWgpZ5cgppTdQdwoplx/fCosrxwOlvBRvAmQet6e4kAPYH98E1JNuVL4GDoThe
         HGXIAX987AwJlS5qVq41fdD7VBCgsLao81k92DajLaZWvtZGmq3UEtsA8YICo8SBRe3j
         I7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769700458; x=1770305258;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ScOC4GuemLF+vD6HqYRKrExatm0/7pF+N+hUpuGlD6w=;
        b=dIFBBhsqpUgRlj7q3KpevvXejBtTxeZkU9PW8H1Y7z4johr/MakYunkb66H3el5MY7
         KDcZTedc3zoSVRcwEqDGZlPWsUJhoH9iA4wc/Ha/4pQ7+dsUcVveFIjRoNf16Hb+VfEV
         0Cx3c6WXiPTC5pEC8jfuGm8PshOcG3+Ql/9cXYPuf8BeTU6KLRCv8AWeAQ0kHfgh6zfH
         I5d0NikT7Rv96NctGIi9mHCsX6uOe58dmEdYfTxiumIKYcjdsUzniml1dl2mdxFXhKKB
         +VmWnwrWRggEH+iR3biEdJHJxsAuKGc6xTJhLDUqOTEMQU3ItohjiNqRDzlyW5Av8Ghr
         ItHg==
X-Forwarded-Encrypted: i=1; AJvYcCUX+fzHQZhjyvPUTCmXy9dQD9QvvXJrEGJIAhu33xMsNrekdWKj+zV3Eky9QIdWcBpcJRu/+hicx8o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJijWCPtE1WdWcu7aAGysqN7kcim2+sdRCzj4Wav7KNawzMarE
	ZEd4WEhb2B43t4HWAIvOuuWmaM3N7V+FGDWwmfAwThRYZGraRJJN37Ximk/1ihmnWttcexqxZVj
	vA4glnmECgmMRNeeG2FLOgh8HaHQ13fEb1PYAb989hvhhiRQ6Oj54Fx04e3yXLrA+LdML
X-Gm-Gg: AZuq6aLMz7UwD9bdFk2xcOZlGwRio5HnITRaI3WWoMVylgrCUtgMfcKGRPyhBXXh2Hg
	gpzdcpsNXEmQRuYPwLGUBoO9LgZDNfNWPQwHnfPRd/sApu63iSyiORz+DfpUf3mTTbHdOKKNoNd
	pNgfJ2CtsMhWLkfnFaZyw99Zap58PnjJmXy3pjsYpwZHMM9m3IUVEA+iRBDdU2kaLTrl/ikYk3X
	5uxZb4CtETrkqEBq4h3vJVTk2z9RHbDxRcLLLDfkY71cp7i/ZykyIJ91MFkBgcOjCo7AN9gD4SH
	NT8NbmZrXAnFaTl0g1qhKNCoia2RFqvwHOB4OV/5xT15hs0QJaHh/Zyu9vwn7SwQpA7gUQeCTcd
	7IIYjGv3eE+q5gbD+fcsIjZ7BtsAV0mkirLH86MqF8jIp9xO8
X-Received: by 2002:a05:620a:bc8:b0:8b2:eefb:c8a6 with SMTP id af79cd13be357-8c70b92cc4emr1250377485a.88.1769700457725;
        Thu, 29 Jan 2026 07:27:37 -0800 (PST)
X-Received: by 2002:a05:620a:bc8:b0:8b2:eefb:c8a6 with SMTP id af79cd13be357-8c70b92cc4emr1250369285a.88.1769700456838;
        Thu, 29 Jan 2026 07:27:36 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cefdsm15219531f8f.23.2026.01.29.07.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:27:36 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 29 Jan 2026 15:27:35 +0000
Message-Id: <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <andrew.jones@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Support runtime configuration for
 per-VM's HGATP mode
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20260125150450.27068-1-fangyu.yu@linux.alibaba.com>
 <20260125150450.27068-2-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260125150450.27068-2-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEwNiBTYWx0ZWRfX9dHAIgjx5i+A
 9lvD+i64xtl7XoLrQGrnIuAqVSRky2L9kfH+p2qY3v3qXmLY9ui45CvL4Jmd5yBabDfMc5qrL9P
 qLBbzlMpfAHOr0k3dGCWx3nZzv/dzYV90arEdV6l77jhgLuulvtkv7ft+d/Gljt78wwI9i4s7Fw
 1+O6eVJKDh6D2UMtdv6i2tCrn8xeZGfweylyhDb65opmgVW1CZcKAJC0XojB2hMOZ/sWImprVef
 Z+h2KImj8dUQpUMZK8Zg3Ca8B/of+JmEl5yQ5A2EBPaHJvER1iG60O7SZEnYSqvhOSfW8MDFLwe
 RZX4JGEXF7oaRStCCzy3Bndrk71NDg4QjG3kMOz72AZJ1/Y9aFsdsHnNiMh8JOOwV9IjJ83pjCY
 TwKU8NjaHGbZbinBA9QMGgF1Jf46xlD2AII/zcoQE8K9Z5Pzo4l1Wp2/2TVZAcVxGlx/x/NIggb
 y93du1D2Z+/wYGyBQ4w==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697b7c6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=f4C2yWSDeSD6iuI_DtIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: fA0lEiwgYF9OuVv1yLFUzIdzCr3ipiAo
X-Proofpoint-GUID: fA0lEiwgYF9OuVv1yLFUzIdzCr3ipiAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_072740_466741_4009DF8F 
X-CRM114-Status: GOOD (  21.06  )
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

2026-01-25T23:04:49+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Introduces one per-VM architecture-specific fields to support runtime
> configuration of the G-stage page table format:
>
> - kvm->arch.kvm_riscv_gstage_pgd_levels: the corresponding number of page
>   table levels for the selected mode.
>
> These fields replace the previous global variables
> kvm_riscv_gstage_mode and kvm_riscv_gstage_pgd_levels, enabling different
> virtual machines to independently select their G-stage page table format
> instead of being forced to share the maximum mode detected by the kernel
> at boot time.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> @@ -87,6 +87,22 @@ struct kvm_vcpu_stat {
>  struct kvm_arch_memory_slot {
>  };
>  
> +static inline unsigned long kvm_riscv_gstage_mode(unsigned long pgd_levels)
> +{
> +	switch (pgd_levels) {
> +	case 2:
> +		return HGATP_MODE_SV32X4;
> +	case 3:
> +		return HGATP_MODE_SV39X4;
> +	case 4:
> +		return HGATP_MODE_SV48X4;
> +	case 5:
> +		return HGATP_MODE_SV57X4;
> +	default:
> +		return HGATP_MODE_OFF;

I think default should be an internal error.
We can do "case 0: return HGATP_MODE_OFF;", or just error it too since
KVM shouldn't ever ask for mode without protection anyway.

> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> @@ -319,41 +321,48 @@ void __init kvm_riscv_gstage_mode_detect(void)
> +unsigned long kvm_riscv_gstage_gpa_bits(struct kvm_arch *ka)
> +{
> +	return (HGATP_PAGE_SHIFT +
> +		ka->kvm_riscv_gstage_pgd_levels * kvm_riscv_gstage_index_bits +
> +		kvm_riscv_gstage_pgd_xbits);
> +}
> +
> +gpa_t kvm_riscv_gstage_gpa_size(struct kvm_arch *ka)
> +{
> +	return BIT_ULL(kvm_riscv_gstage_gpa_bits(ka));
> +}

Please define these two functions as static inline in the header files.
They used to be just macros there, so it'd be safer not put LTO into the
equation.

> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> @@ -105,17 +105,17 @@ static int __init riscv_kvm_init(void)
>  		return rc;
>  
>  	kvm_riscv_gstage_mode_detect();
> -	switch (kvm_riscv_gstage_mode) {
> -	case HGATP_MODE_SV32X4:
> +	switch (kvm_riscv_gstage_max_pgd_levels) {
> +	case 2:
>  		str = "Sv32x4";
>  		break;
> -	case HGATP_MODE_SV39X4:
> +	case 3:
>  		str = "Sv39x4";
>  		break;
> -	case HGATP_MODE_SV48X4:
> +	case 4:
>  		str = "Sv48x4";
>  		break;
> -	case HGATP_MODE_SV57X4:
> +	case 5:
>  		str = "Sv57x4";
>  		break;
>  	default:
> @@ -164,7 +164,7 @@ static int __init riscv_kvm_init(void)
>  			 (rc) ? slist : "no features");
>  	}
>  
> -	kvm_info("using %s G-stage page table format\n", str);
> +	kvm_info("Max G-stage page table format %s\n", str);

Fun fact: the ISA doesn't define the same hierarchy for hgatp modes as
it does for satp modes, so we could have just Sv57x4 and nothing below.

We could do just with a code comment that we're assuming vendors will do
better, but I'd rather not introduce more assumptions...
I think the easiest would be to kvm_riscv_gstage_mode_detect() levels in
reverse and stop on the first one that is not supported.
(I'll reply with a patch later.)

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBAAFCC061
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csxf2Ms/mBBtqGbJmQLDSVIk+ZOlQ/hPHJ/DQKSjP9A=; b=scYuc3l4Kt5bnV
	MugEFciCrnDxXq2wriekhV509KC9Ykf3HvwOYI4QcYM3OiRM+nm18F17rsSwTY5dCuEFKwOoaEQpW
	2j6ltnKDFSCsG/5beYUTQw5kvgvsJGm/vgMB18f2LocJ1Qvb8JY5gS09H2C5uxKqw9HL0GrVQFo0I
	GdwSVfjtfDmv0dh11cXNJ7BdpXSoU9X+Vs6RgLCT1kNzKG4vCHR+OFWA+3ntR1uUft6Q0cxgVSw7W
	rL8HnupHS9n1cUvfNuB3ZApxLVERwJfbQ0ys/SCOK4yiU1Zk9IBnGU+7rDTtffopulM0p5G8kgFmM
	h+gja0qPIyrz8/EacqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaIV-00000004MEb-2sip;
	Fri, 06 Mar 2026 18:53:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaIT-00000004MDp-24XY
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 18:53:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1dtG1343510
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Mar 2026 18:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbp1ttRZMGjxaHz3QpJiubYE
	eCxSAMpCj2BS/Tc8NRU=; b=Z1ANarkkgcNTCYsGCtI6BQ07sr77CJ5gvLjPNzHy
	Ck+e7fNdPA8bbKm556RRejS510orYKj4IRNF2gjGmYADjALjRz/oU9SvUVrOm50m
	6AyJNHyKU41dt5feCUOVgxYTG0/JORX+Mw5Qdioj7Q63KKOn5VO89q4Eg/f5XmUV
	WZI0DuEa0qOr9ogVIYlASFNTFLyFtfkxJ1CqTiAgBpTVt2eTctv0qdzyl0QfuRRW
	jNWHN1I+27K96f8ItaVaHFyptjBwVzRqnZ8q5TIkpyBBriSjESvWl+vzNlLxVCrm
	WOaLVLlXHkRXjUMCpxDST6M7xRv8INtbEZgisvm6sYZTvw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2uqreq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 18:53:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be47ac98f5so747586eec.1
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 10:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772823192; x=1773427992; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbp1ttRZMGjxaHz3QpJiubYEeCxSAMpCj2BS/Tc8NRU=;
        b=cq9MBIqVHXT1ea8MwScNylLvHU9lqH6g6CJhpPedkO5WDMikNa92aBbYVCnAdjptVA
         munKve5Nl7JZ08lDV7uWPcwh2PZKXchJpyvfAN7G7V53easPVoTvICUo2sbMB1pD9U7R
         2Y+Demh4bRUGk4eZBh17XXXsibzmtMsvdfdpbEzB67v8cxrfYUqfwPbXdYRAPKccSEfe
         HANsDed2mXxgX/UZT4O54q72H/mKB5Jr8S84OvLNTxDcg9Wv9hKb/H7HvEW0iEJv/JzG
         32DYgsR9vFDrYXq4EF+zPdCkMzsz21fowsqTpq0bnzU4O6588NEgQp/vSVQWghhfj7zL
         tbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772823192; x=1773427992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbp1ttRZMGjxaHz3QpJiubYEeCxSAMpCj2BS/Tc8NRU=;
        b=l1EJvtV/PTaYRoUmOKcLb2rcCmK1AY3LuIXWvfGEfd+yTMe4xAL+jw6nAEDfBsAuYT
         fvaW5xHFHgLkPzLjyl3eLjqmw452pR6S7G5CO99/uJe7B3bhcdrceAYK5VLCKd5tjxbW
         LRWRohNqXNxk/maOGSJMJoS29TBsZ02JP36pYchJW+XmFHcN1t1GOa2+78aZImPFvZSZ
         SYTUJJr0u5/07enfGQqztdYZtatsVSC5fH7kBVW6iVKt2arWf56ck9WOJD9mKFjaWbUl
         kuvma2DKqe0GrwM8Q0kQ6TZ5vwxjlSUn0uTKzizQfH/mSpW4fcrxUvwXclgMyRQct7gB
         b0uw==
X-Forwarded-Encrypted: i=1; AJvYcCV/3owgif3b62HwxBODiQJg7+tHlFQHpFj41c5USXtumPZDXFKMaIOlC/oCSgTT1z7wqmHxffb0pHc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6+xlNp0V2WIDrEBRSyjQMBV3IF26hPoNtf0Qr/cSXTeWgUhRl
	UP/OK6bZZUtujUMYJZa5lcLBzQTlafYAMtPKltcX0/LTa7zQjeBd/P//LMTMNiuSI7TFEgAsolP
	MoVtsbakHcc8W6duwJALpzH/1QtikF1DTCz6g3/aUpkPBybdmJCPip+cWhEUG5TodllwE
X-Gm-Gg: ATEYQzxkFra/iYchTw7alGJzHEe021aDk6giuRhqR4xZgmn01vbjcRXjyVwKg25D/b2
	2iHBJNsIk5krAz8UmkcBhv3rI3NJjBq7n49TgWbW7HOXaVAqv8cj4X7z4L4cIbHdD25SyEG/uTy
	8cRYl47F5gpcaqGY+UVQKCOJSWouiKwRjs7aXuTUfkWJMOEF/jS/zfXiYHYDBPJTLIDhAFl5bSg
	Tm7rOXwW+NSC00kRZxKTgufdUNr8JTRemXXNwy22moAlU1dWI0zUwGEfeSxmdmJwz9PWOacedy5
	mP+7pSmDoc4TMlp51QvdIt9upOR1eulWcKeVV21YECuGtXj1Hl53jD55uZd+YL6LWz5jGgws8s4
	z0YwFq7njGq/7vll/ylY3wbJ1f8KGtso=
X-Received: by 2002:a05:7022:e13:b0:127:fa:7758 with SMTP id a92af1059eb24-128bbf83c4amr2989625c88.9.1772823192093;
        Fri, 06 Mar 2026 10:53:12 -0800 (PST)
X-Received: by 2002:a05:7022:e13:b0:127:fa:7758 with SMTP id a92af1059eb24-128bbf83c4amr2989614c88.9.1772823191558;
        Fri, 06 Mar 2026 10:53:11 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f58d24sm1934819c88.12.2026.03.06.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:53:11 -0800 (PST)
Date: Fri, 6 Mar 2026 12:53:10 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        Andrew Jones <ajones@ventanamicro.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: KVM: Fix array out-of-bounds in
 pmu_fw_ctr_read_hi()
Message-ID: <cvy2kbbkihlcza5njphjrivm7s3i4fksp3qolocff5ktzuuoad@hji3ioyoxe67>
References: <20260306073739.3441292-1-xujiakai2025@iscas.ac.cn>
 <20260306073739.3441292-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306073739.3441292-3-xujiakai2025@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3OCBTYWx0ZWRfXxeK7QY5VKueR
 8jQlcOmFizy4sQ+OqLYG7uMolSC/cb7y1+8Tvx2x+QaLvP+GUUaAOIwpO/bUeGNxHWHZOEkB1zV
 jeUKS+Q0mr0A1wafloXBUJBF52QVgGJ0J3UHi7ZwFJT+yrZMFFHYl8K1wTftSG0inelO03V3In3
 GYCslhEHML6XsDBkTl+H5N6vZKkjq3YvcrVCppKnl/sWxEjQyGcXnuaZUdjRcdqefX0aBqL+3Hh
 2Xm3XJASvR8SRE65vUXOcoeI1fYUcCOJj80CWMEKjaf4R00Jbb50xTK567uJ+IP4Dl0Oj79ktFy
 R30KTmLdMLO/f6uWrnwUniGtz/UjGDR4dy1yXHIwNZ2u/JvjGIjWUCWbybhHvM2hmmVaIgKDw0u
 E0Oi3PtOE7PWu9ZvRK4iBTt5wBbGLI5jdw4z1i0EshmnqpjX/zfEp2wIZYzOmGqVaYvR1V70QiM
 woqsTmbJyntjG3Vd/zA==
X-Proofpoint-GUID: SthzJFKWeT1SdVUMvT6Wkb58lvscNwBb
X-Proofpoint-ORIG-GUID: SthzJFKWeT1SdVUMvT6Wkb58lvscNwBb
X-Authority-Analysis: v=2.4 cv=Q+HfIo2a c=1 sm=1 tr=0 ts=69ab2298 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=GYm9Nfl5zRQZIgYA3ZMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_105313_560235_8049722A 
X-CRM114-Status: GOOD (  22.36  )
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

On Fri, Mar 06, 2026 at 07:37:39AM +0000, Jiakai Xu wrote:
> pmu_fw_ctr_read_hi() has the same issue as pmu_ctr_read(): when a guest
> reads a firmware counter that has not been configured, pmc->event_idx is
> SBI_PMU_EVENT_IDX_INVALID and get_event_code() returns 0xFFFF, causing
> an out-of-bounds access on kvpmu->fw_event[].

This paragraph won't make sense when it's looked at independently in the
commit history. Either don't reference pmu_ctr_read() or just fix both
with the same commit (I don't see any reason to fix them separately -
the fact the two locations getting fixed were merged separately doesn't
matter as a commit can have more than one Fixes tag)

> 
> Add the same bounds check on fevent_code before accessing the fw_event
> array.
> 
> Fixes: 08fb07d6dcf71 ("RISC-V: KVM: Support 64 bit firmware counters on RV32")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index c6d42459c2a1..b7ceda1643ec 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -227,6 +227,10 @@ static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
>  		return -EINVAL;
>  
>  	fevent_code = get_event_code(pmc->event_idx);
> +	if (fevent_code >= SBI_PMU_FW_MAX) {
> +		pr_warn("Invalid firmware event code [%d] for counter [%ld]\n", fevent_code, cidx);

Same comment about the pr_warn.

Thanks,
drew

> +		return -EINVAL;
> +	}
>  	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  
>  	*out_val = pmc->counter_val >> 32;
> -- 
> 2.34.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

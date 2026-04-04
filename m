Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB56E63FEA
	for <kvm-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGuVjS5aodVBoDcsoJlWRoazDMI8Nu+pkVIwIg11SG0=; b=F9luBtq9NCzzwV
	63MNKr8thJ9wcjBi2gTcOYJ8Ju/5HKfW2Lw/nM+/yS+HAMPLefzGKI/yyu1KOuaBe9jR7sANu9r3I
	PW4l7t1tS4BW2WOaJ7F61FK/K+HA7FTTt7k7AX/mmemrx1oD9a/HzseYOO6cfbDkol+u1+rx5w0pT
	RExdcE+i22/LXIfuBxn9tTtqL8Nbu2USlQhIGEwWdEtNKIPg63XyEgKMj3F8y4ocFYlJTm8IJsujo
	n2DSiMf72Qu+WSthULAC1BOVFZIusw0JHW2B8ERh2BHZF9p5wvqFdiRjswfj5eSQuvwsGEyiTtbw7
	q84FvAAjJszUiWBMO5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w95lF-00000003fN2-27Zo;
	Sat, 04 Apr 2026 18:30:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w95lC-00000003fMK-3mpf
	for kvm-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 18:30:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344mNja920759
	for <kvm-riscv@lists.infradead.org>; Sat, 4 Apr 2026 18:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZAhnUMRLmcuKZOyI5wbt1Fs
	LKvLY6ymjIDrFpm94Vo=; b=AaTvDD/AaECxzOw+j83T3cVf42tZqXUnRXqztmtq
	wJaY6vJ2KBjBvOfLbJHaF1Ae24UmRJ1iSIqm+WJioy+YNJEJqlE9AXJRHCw5GjmL
	bfaOSkfQscEj3GtG2r/PZt6iLu5PymAMA1ip4zTDuQKxqHNSq/sxFXrMLIWghFLf
	daEtT1D8GYSiezX/btwQaUC6nzgB2CtEpTH3CthxUWZ+34YFUomghvBQVdO7bM7C
	+GhSvcl4n3uX4w0W/hBLE6W0aCzSEZSgi+Y7Yq/MpbOl1qujcZckGAzynKsDC1jy
	C/UkMC4375wTZLDfOrzqyGJG15avBFTt6U8m50jaA0ZUsg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux896m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Sat, 04 Apr 2026 18:30:17 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7dbb5fbf183so5255788a34.1
        for <kvm-riscv@lists.infradead.org>; Sat, 04 Apr 2026 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775327416; x=1775932216; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZAhnUMRLmcuKZOyI5wbt1FsLKvLY6ymjIDrFpm94Vo=;
        b=QIeyc7NnOWNlTLpFH3ZpTCsGgMaL2Hzai4j0uKWFJUICwYXSnXt3O8b59Z/4ku18tM
         YncnsxkveQm0w7Ags5iXnl3wCXQgBOho7QvN7wcvRrGVOvBJTj57RVj1+Js0L79COAVC
         emzyikpGQzuJoyv2ZBUxtrbKdAv/+6AGQLTSc6Nqbr8Z4Vre7jSzWzXvnSPWYKM4LKnD
         ZZfhfAZzPJLFz7B5IvZa8tUu/tLyGI+g9vaTZGs4HF+YQADIwWuVz4oUoSucslWHjZts
         09MOk+3LSyjHdwqpSp5NUdKyo4/4xwjsDvPda/ZmItTNrxGO7D9LZNq1EVWwWNc85/ZP
         CuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775327416; x=1775932216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZAhnUMRLmcuKZOyI5wbt1FsLKvLY6ymjIDrFpm94Vo=;
        b=jwb+fjkOj8atJqB5dHrFIg1gMeCUzkwKrPUlIFyXZysKfww7/d7i0cF6E04yTWhcw8
         9KYbtrkVDDXbHIq9LkkpFI0k6niQBzfIKIqXknbTzi+7EuzijCXer1ojZoTpmlTJN+1Z
         BgDNwJ+qp+mlaYuSJnFdsySS1fqCYe+iOfRtvCjNz/3uQ3PtTOuRUKbvSZKGeHaJL6fN
         btWGprPX6eugd3OI/qK7T4nIjkKMLf69FibYDcYLuXK1G0t2jVYpy8/E9C+ifbf42wvo
         taMMy4mgTKtxVhM81LP6NYevd08TvVyg19zJCYo8mxmo2nJIXVfu1Z0ce/pkHUN0CjL3
         P1dw==
X-Gm-Message-State: AOJu0YwIzgzWSRJn8PLhK77MnnVaUjWNOQECpWvcFpZEFTdoZemvbWt0
	yKAZJg8I/CTO7PbkiYK1mgoKXHocjPF2PEOCEcTn5SfrzkBN8YKiClkv3G198Ci7gpO5NdsRFxU
	SJrYpN122d8ZOA0It3rFatDjOk2xNQX3v1VR/IpHUYTkn5ZDT3jvqYzHjm0G/cg+kDvps
X-Gm-Gg: AeBDiete0suy8WcfR4IPsuavKS8vLypHFXkqbDoxm/MYQp9L7ETjHYFOzYnjbKPR0IQ
	2enPYQRgkzIaB6Xky9jWedkTfBCWF+aa8SKnMPhbE8KN5o3U5Ca1PXtBOXWFlqtUgVAew1v1BPn
	1CENX1/jcbFnCXf8+vU07ZcEvtkZmWEKfIMm5KbwRnJqG7ADiMAFBnCshgu4FarYG50TbWlWWdq
	vdeP7LWPjqvnc7biV0B2binxIpCRillAj5fQ71VUIiQ4a42Ww3bbZk6CNXDvYZ7+jjLxOPEIPha
	NH8FswgYK7C6xtpK2JEijlFP7K38Qe187UK6ctAIdeOuGrxUGq5+Kz+KmBZ1vyAi+lmhOeoBK3u
	4H/BbOk3ZT6DzVEsXoeEFZqZi+8RPrNM=
X-Received: by 2002:a05:6830:34a3:b0:7d7:fba1:f950 with SMTP id 46e09a7af769-7dbb7177bd4mr4168300a34.26.1775327416482;
        Sat, 04 Apr 2026 11:30:16 -0700 (PDT)
X-Received: by 2002:a05:6830:34a3:b0:7d7:fba1:f950 with SMTP id 46e09a7af769-7dbb7177bd4mr4168287a34.26.1775327416085;
        Sat, 04 Apr 2026 11:30:16 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dbd663a4a5sm420968a34.25.2026.04.04.11.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 11:30:15 -0700 (PDT)
Date: Sat, 4 Apr 2026 13:30:15 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix shift-out-of-bounds in
 make_xfence_request()
Message-ID: <uqj5bh45tsakyjwswvjb6mv3esvui4eq5tic65o3b7ljoev45e@s5rlgtdi5dlf>
References: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: 7kkiISGtJnyxo-hUtyL5vEfMqP5L-HVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE3NiBTYWx0ZWRfX5oQx1YfBLFNV
 zrN/uNb/8/WGspDFrCRM1YBtsKlsHZvi+rULyZO3O4KR/CRuYp9iWBmR6jkPz2IhRBYgXP3Q0nM
 NYgUx/dneayjGcqj55gLl8RNzBCGHryOHWQE7IlkQaTZkMph6DsjpOKKChaC1yHNefIQPV/mJh1
 BU5BRFaJFnUqb5O0NmHYzLNexauaXUylLkpluS16L5iMbfWHFtZePBLyxGGEj5eCTpWT6oMd7Wy
 cULUe3HoJ8Z8kcr+7u8IOOQg0PqCe1//pAPFnAKJiS5ztllWKPL0FR/0dirMaAc7/+wigjVWxgV
 j1sSaHC8dpcXEqGRGBF4b0YWDrK2x22hMesrV3mvZO41SRkttzQ3ju9ZOxvgX2RP0jJY4Rv0Rxq
 ICiK+qhlCOq9/hm3BlJvFvhRURHfI8zdGn9y+QkXtEsW907QXBA3S2dD6al+0cOS56jEBi/FXBA
 hKHaOTZue4+7a5TF/0Q==
X-Proofpoint-GUID: 7kkiISGtJnyxo-hUtyL5vEfMqP5L-HVm
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d158b9 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xswxI8Vr1sjf9FmkDDsA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_113019_021265_7EE889BF 
X-CRM114-Status: GOOD (  21.57  )
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

On Fri, Apr 03, 2026 at 11:20:11PM +0000, Jiakai Xu wrote:
> The make_xfence_request() function uses a shift operation to check if a
> vCPU is in the hart mask:
> 
>   if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> 
> However, when the difference between vcpu_id and hbase
> is >= BITS_PER_LONG, the shift operation causes undefined behavior.
> 
> This was detected by UBSAN:
>   UBSAN: shift-out-of-bounds in arch/riscv/kvm/tlb.c:343:23
>   shift exponent 256 is too large for 64-bit type 'long unsigned int'
> 
> Fix this by adding a bounds check before the shift operation.
> 
> This bug was found by fuzzing the KVM RISC-V interface.
> 
> Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> ---
> V1 -> V2:
> - Dropped 'idx' variable and compared vcpu_id against hbase directly,
>   as suggested by Andrew Jones.
> ---
>  arch/riscv/kvm/tlb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index ff1aeac4eb8eb..439c20c2775ab 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -338,7 +338,8 @@ static void make_xfence_request(struct kvm *kvm,
>  	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		if (hbase != -1UL) {
> -			if (vcpu->vcpu_id < hbase)
> +			if (vcpu->vcpu_id < hbase ||
> +				vcpu->vcpu_id >= hbase + BITS_PER_LONG)
>  				continue;
>  			if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
>  				continue;
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

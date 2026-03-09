Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2583FCA18A
	for <kvm-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 21:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbD36FdysSs0D1TBHQivQyA78TtJ7xUZ1sDO8PDNxDc=; b=qLbf3EkJGyQhGX
	mb1/bd3Oy/FaKnkiACiyNWMcuPesd4WGS0nbJivQmrpF1nkcrcN+mPvKryJ2TrYtRGMFbchgT2GhF
	iaK5ZBXEnUnFsHYpjCtr9/mWgWQIjLmJx9m7BOTZpd8zTu0nGwO9bI1ygYRICUFZqLVk5kYIw19kt
	cQdgRlI3U5kzzReyqlCP9gqneAWNrI7YgCFuAHayh1zZMYEZWygWT4hIDRXtk/Cdwy5n+sdIFBwdI
	v+NRHtLSoG/vbrrvMxPQlF74QedSO8arEOS+fD0eRYXQz4n3ReQThl/mwD1JNRC509bAfTje222kE
	vdbBkfNR5/WRZ+oJrBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhuE-00000008A3U-2QlA;
	Mon, 09 Mar 2026 21:12:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhuB-00000008A2n-1Z6R
	for kvm-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 21:12:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HDMOR1214071
	for <kvm-riscv@lists.infradead.org>; Mon, 9 Mar 2026 21:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hIRGX75FqhGaD3BMA10Fm2iv
	i9uf9Iqa56+NA2iQds4=; b=iwctoPmuglmq0Tf+ez67wQOU7T44KIlV1E5lOjbX
	bcNC4aXZ4D6Gzwyp3ADUzKFH6lmeJwdOSjiXKTvKwvcMdEtmiZYFyeUzUuiuFp40
	VAbZ/7znO6OIghtb5LL6ebpNHstAtdHXaBxA2FJRHnkD2T0+WCOl/9wbu4uJ4eqD
	mM2ZEaGJ018xRi7699eftmMw1bcfPEGSpTXEwgOPHOFl+8FsH4CMBvh7RyEEyCs3
	tqQ+mU7KJbPRZiY8MrtuIczgqdvj/zKiMWC7r9GdIJXYELL+wfepJMQMi4ggbypU
	qR/ZOUhCgrwm/aFcvBctADV4jotTPmIJvjEdnF4+4E7JlQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkhqrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 09 Mar 2026 21:12:45 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679a47a1febso58562035eaf.3
        for <kvm-riscv@lists.infradead.org>; Mon, 09 Mar 2026 14:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773090764; x=1773695564; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hIRGX75FqhGaD3BMA10Fm2ivi9uf9Iqa56+NA2iQds4=;
        b=TCqi+CMKjqOJR5T+oOo98yLDBjRawoDo9v+mwrMwkGZr5Fym8v6kacFQY9EgFGrWqW
         KtQJNJZfG4EtWjWfobIp6HhkENjQ+nfl9+6edoSCzSUMWL6Exv7SgcedIxklXlt6wuQ7
         9G9jiD7pFW3Rii6AypHlOZ/hHqXidlxNjkZpDl0e1C8+GJgR17xJT2Si+UVNzWoqlim+
         pqSLI9nqRb9zpIdE32+eEwi4/gYpd37IqcIyhrjpcIYacBufCcBSSAWSF5iDVtpdUlUZ
         jK+j7oS88EtRMD2upiu4YrRfgO3AtQsvdKpyfOROWYMfKhCdC2jNU0phRc2wRwnmOn9K
         X3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090764; x=1773695564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIRGX75FqhGaD3BMA10Fm2ivi9uf9Iqa56+NA2iQds4=;
        b=QitDe9eQcuI+Rdd+E4VEeIdQsakJp0CrBYqkDnIzKuMASJrsyJUVCph5+QmO//K8X2
         LgSrwdwvQb+OnrjP7APUjbDBTitc8E3uUuIrsrukpnT+vlGx91wUJqA1pxGOhrQuq7BE
         zarRi9WFz1t4KTPl0LrKdbE2VTgVrQcIjId0sq1y9Vv+7QgsKqnf34zVcEJAWnZGBtMo
         qO2kw+3wsims2ZrcDzitrEBG9tqMiU1hZ2ugytsDjaQCajAOecd5ijC5/sFbnOaNsXE4
         rXIT+kgWhPcC/ZWfsvSuE6xVWzXlKM3sRUND/gH1jhQZcUOiX5SGxs4hXrbqBfPPPPUN
         qA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyw2RMKqWFZNPUd1S6IcPWuERw2rnbwp/EwBkcmiMKkTD1TckmZDE6MwW2pj8yfauvMN9mC6Kfm+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBIISzKJeJkpqJz7i0B2v//NMiPnTfAWlXqlDNnuyDmzGXhtrf
	cW5g+Kc2JTx/TR9UPE2ns9xOLiaE2GUYp0Mk0xJeaSLNR0DjAuTCxS81JA4y1XZ4W/dxkGZlz8c
	Yp+A7pnkjXSpNNp74GvGWcyRa4+pnoS/G9ube1634F6EF0ECgkUCdOvYEGEnm0k616EoV
X-Gm-Gg: ATEYQzyNtKNv+Z1vtSNxPqrsSiYFRfrHJO1jSbVgC/KOPlGrznNltre9nklTvyZ+BWm
	kYZ+hNBZQqWJSxuRTgd/ka5xvb0v8ntLHPJC8ObLkdO1fy3JB6WrzHx5yzHf/kZfKthum8PQScK
	5xqU4DsOFp3w7WT41eQlU4GIuZygsDD/okSFtvk8xrVbmDna7+aIamb6KzJdekleY7uK9KJLyP4
	FP4avwtbCeiIu/ol5zvy20JKKktg58Mwa/PkACQ+lwq5WXgRk/nSoqKy0Gg8CTCKYonf+lGyTUw
	Vbj1oDGtAu5dwDZuZCoSpRLMA0D+9xLHS0u931kPUiPjMVJ0cTAwjlJB4n3yrmlwUS/aBR1TyNa
	ao+avDS51kRgYIEUK2IjLiZbBL2inWUQ=
X-Received: by 2002:a05:6820:1991:b0:67a:1d88:46d5 with SMTP id 006d021491bc7-67b9bcd3839mr7601100eaf.31.1773090764539;
        Mon, 09 Mar 2026 14:12:44 -0700 (PDT)
X-Received: by 2002:a05:6820:1991:b0:67a:1d88:46d5 with SMTP id 006d021491bc7-67b9bcd3839mr7601074eaf.31.1773090764040;
        Mon, 09 Mar 2026 14:12:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bacd85dd6sm3996753eaf.11.2026.03.09.14.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:12:43 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:12:43 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
Message-ID: <guxeojlqqz6cfjdilxnuaeyft4cn4lwdrbplat7xgd5w5hod44@uxqymidomd55>
References: <20260307234355.69831-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260307234355.69831-1-osama.abdelkader@gmail.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af37cd cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tWgbADMcUQFZQAcJDasA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: p_v-wfJAV19Bh_1jw_Pq3T5JADnT1rWy
X-Proofpoint-GUID: p_v-wfJAV19Bh_1jw_Pq3T5JADnT1rWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4OCBTYWx0ZWRfX+fqJyltWM8m9
 zwF+ypXO4IXw/pXyBvyc+TQrR/wUQxmGtwDRlPUJivtZDgX9ih+r1Ja+wB1R+wau8e/+WVFuNlO
 7DxCtSIAkDCwtDZAuG08JCaf/j9P+5HAJhrHhp77v71RNiyBaPklw3YvN7xhlxC4AswIOCk6Reb
 Da/+Hv4K3XN3mYja8v1h5WVz/Pqob8CxSOeql1XvGce9jTiXjxsTSGadjYj7dc1hU1AppjtJ1EI
 sfBDlH124aov+Yj4sSA8fS8V54+bLZX1Bf0d9RRKNDJt+RnDsPYf7B5xKECNcXjbsXwfdfHcGvH
 5ZowQy4SmHwflo9r7E9U+yTFqMtZBB5Y4KSpa7I1+OTKvLGOXMCpyop3FLtdGorglzxSth094Fx
 rSBTLcz8g1CuHIeazQWW2xNCn8DNzSIjzD4seXD6Ig9wYieO5l/bG8Q/5UFpR9xPcvDX7yypSUz
 LvH+hgtlbiN/CBGqefQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_141247_535619_0200E0F0 
X-CRM114-Status: GOOD (  20.07  )
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

On Sun, Mar 08, 2026 at 12:43:54AM +0100, Osama Abdelkader wrote:
> When saddr_high != 0 on RV32, the goto out was unconditional, causing
> valid 64-bit addresses to be rejected. Only goto out when the address
> is invalid (64-bit host with saddr_high != 0).
> 
> Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 4d8d5e9aa53d..045099ca904b 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -425,9 +425,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
>  	if (saddr_high != 0) {
>  		if (IS_ENABLED(CONFIG_32BIT))
>  			saddr |= ((gpa_t)saddr_high << 32);
> -		else
> +		else {
>  			sbiret = SBI_ERR_INVALID_ADDRESS;
> -		goto out;
> +			goto out;
> +		}

nit: Could add the {} to the if-arm too in order to keep things balanced.
Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

Thanks,
drew

>  	}
>  
>  	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
> -- 
> 2.43.0
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

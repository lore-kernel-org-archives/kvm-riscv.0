Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D102C5DF7E
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 11:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1QGmY/CvVLl1dvPWFV4tRyL9Km7ZnL+F9Q4bLfChEM=; b=QExR3kg/WqRlOp
	DuwSPYmd3jjMIYfmFwqDI11wKvz5o2ojKzpexDfLTfPYDNpwMah3vx5LIGX9OwBl3sty2fxFHzTm1
	KAusAhf9ASHIMobOvfNBCgZcSJuHzhEiEZGwkikXilxMZJVj15cBUdWl9Dm5S91l9vwicNsDgg1nW
	RWDNDxwvG/ew/Ia+ffTqgWRQ8QUI9VCawGC3yyP6hYkga2vHLaZB1viTMsy5y8JgoXRPCG1x465m5
	Yb5v3H0aa2u8xjbFksyWuQwpWnr8UXLcyZPMISQWK2lxr75mGI0VHQu+T9xEUqDFwmgxfIwSigRgI
	YNdDp0XrlTk4hChB5CPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHdg-00000007oLz-0cGN;
	Tue, 18 Aug 2026 11:05:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHdd-00000007oKx-41Os
	for kvm-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 11:05:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABMrD515012
	for <kvm-riscv@lists.infradead.org>; Tue, 18 Aug 2026 11:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iYqV4IQW3pyNtGAkKKYZInsR
	EnU2tfnaz0FUufmmAqY=; b=fuVFn2HYd5cvh6McPla5E0KEh6NytzbOskTlJmKJ
	cQFPK1mnHrPH3aD6GpkTdObfr/C4Iu4uvHNkCR33iV+h8ut2OphptvfV2A3jYZJp
	keyH0rkdZ1yaLDo3iOlOOVgAW5JkgsQ+YTlx0j+wTeZ5aNopFFoYq9TXtxZo8Vm2
	DaZmQd3zOCbGuJ+Y8+DJhaPB4OruvAjBn78VtaSpOoi6bMMsfYr0LWIW3w4H1Gtc
	NPZtC4wk0HfInj7Q9z+qnUY0Ggba5jgTpG2aB9cP5df90phRcVSChQ0xs/etrlna
	LolEpM096LHuRu7tFZJoOJ8GEIzscp54F8qSFvQ0qIOqvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2j4u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 18 Aug 2026 11:05:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so520971385a.3
        for <kvm-riscv@lists.infradead.org>; Tue, 18 Aug 2026 04:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787051148; x=1787655948; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iYqV4IQW3pyNtGAkKKYZInsREnU2tfnaz0FUufmmAqY=;
        b=OfJchYHG41R60xpwGtyHPMeNaBeih7sHRejXTpev19L7i3i5cXN+mKFPI00AvcrmRI
         vIsBqvh3R1eRx9Y0rQJ3/RbDGRHFxn3rRwWZi+xETOEAiSCsXE7FEcaIugcJ9BsF8i5L
         f/n1TmpuqBLqvU9Ss9ZJvrqpC9JyQn7fgVGs8WkGmCUaw81FTMRxpH0jktFmjatN8ucl
         TkB2xQ+VxuYqhxiffnbN41OqleNtE/PG7Iv7HnrBKks10FjJP+uGPlSNnW0c3P08smax
         7H4mkFwRGgJ9Cn/Z+qVEbgBZSRXt3B7chP25K7OokNjfe4bQM7/bVQ++Y15KSeMvdI2z
         J+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787051148; x=1787655948;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYqV4IQW3pyNtGAkKKYZInsREnU2tfnaz0FUufmmAqY=;
        b=I0pr6yWfmSquQyFS8UjiTryke6B5Mcfo5HKUH+iGVr3YvPeLr4UGcg7IwtM7BFWMKt
         d0NI9LRzhDsCSrJeHOi3+wFjMddieMmpMwcEWgXvrX4Ti7VpQZ8PVCtAhZPrecTeA61o
         mfRPEzMwY170TLbsTJRiQ65hKZ4DVdRJ79zRkgtNgMhadUxRO2CgHHusaxTDEpXnoz3B
         rjQSK2q7g/jiechi5qHO1BI2tZFdDSeE7YP4CRWl39q/CQeTXGCpPhpz1jRUingqrVoM
         sNFcMjoxKdLM/A4CU5YnBSCZKAQfCs5jd0y8tjNv5L+d26Kcl8aVvApLugQS1+HhzZWz
         Y/LA==
X-Forwarded-Encrypted: i=1; AHgh+Rrg8J1B0xa5y+u/cAy3eLlUB/tI4flI9BZvw3cxN5YI5N7LqkwItzGgv1VeVoptS/7O9rb3fROQme4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNeOaqQMV31ZYzNnKig9iBIeGK8rIz0buh+mcnk2+FSgAsgMBM
	6IWB/PCq+pqEV68/dU54Dxp+ooHX75r7nbLrSa7nQhXwhkuGEHhsj1k94P1O0t1/B5S6663gwPX
	GkFCVI+WUsvzedJ9XjN3t8l43C3p1ykQ+uuuXqyDNl+ViIGCi+2xOiOSuAQuvxIG965Xi
X-Gm-Gg: AR+sD10EKjxITpyoB8dIuDT0vENUXhedD9pk0W/1J24xl6C3BrSIJ3dFxHQTl9NhfLZ
	+QFL3n8M3Ce8pHVVGCX3qF9QR5OI71rUtoHGspEaBZfdM5dWsR3l/oiZ8rkh7hwMQyrRe7x9/QF
	kJh9eeHHoxPHbWF5Oz2Je51BXK4M4oGopnPyRtaCefy716LsRu7lTqmuPcOBmD7qYZ7QxVRqp1C
	w7nEzbT0XgVrvFGC25oaohSUyew4PfwTxHkf9gw1onLGDPXYizUMUNXQH4y1Yas2+WZu0EARsiJ
	9C98P5wokSoB7hBxHu98SoL+HmFLJtaQxBU+QVzLekwZNiXi6MpeHfQq/gOZszWMYbgH4lYUWyE
	MHP5eNuCeVp59fFrATg0+xVJzxOV6XN5HNGE=
X-Received: by 2002:a05:620a:319a:b0:92e:f41d:4730 with SMTP id af79cd13be357-93704acbe5cmr619385285a.5.1787051148472;
        Tue, 18 Aug 2026 04:05:48 -0700 (PDT)
X-Received: by 2002:a05:620a:319a:b0:92e:f41d:4730 with SMTP id af79cd13be357-93704acbe5cmr619378185a.5.1787051148018;
        Tue, 18 Aug 2026 04:05:48 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b816f7sm10484724f8f.34.2026.08.18.04.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:05:46 -0700 (PDT)
Date: Tue, 18 Aug 2026 13:05:45 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
        atish.patra@linux.dev, skhawaja@google.com, jgg@nvidia.com,
        guoren@kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 07/10] iommu/riscv: Add domain_alloc_paging_flags
 for second-stage domain
Message-ID: <rzvdgmjkk5rzn4qehsoajmbak7jpssqancyn3mfvpnzf6wyvsc@alyg5a4c2scx>
References: <20260507113706.11400-1-fangyu.yu@linux.alibaba.com>
 <20260507113706.11400-8-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507113706.11400-8-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4MSBTYWx0ZWRfX6a4xwfqvMX9F
 ehRp+ZQSAovvjdh2BM6o9ztLindz/7JKawCsR5jZYz5HB+QA6AdVbuTACaqyuhj+tpNRMNHB+Cw
 AW9uJTqk871govKlqvm711Bq14lWH61ZV+Njh6QXGTcPuzrT+amEvIO3+zNyBQPnSKiiHRkjtwv
 kXVXGhOY1YSEgRRudoM1V0Uz49bAxAyHUv+PiqGSPusIzHno7M70foxgNftuxZh8i9/0c0RhvIN
 89iBy6tL4k2gtfwkH9RSlJ3IxJVWQRzIE38JnPCyNrvGXlEbkYcrpVvgtbo1a8jIqUJSanyTJKh
 z9H52ehe03KSoy7+Ft2AM4ZZcP3JL2pcWYvw6B6WaOFof2eQiS5lzquBEhHJg+L55sxhD2SA5WW
 s9U1MkgKYjxVSZEgVv3OH/JNjGr/zT4Kef32ZeIhG1nM12MzpZ8okD3p+cm9dGJFvTJpY1sAQko
 2oWc2FzwWUQwz0KTWWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4MSBTYWx0ZWRfXy34RBNqoJpnj
 KxLp1s2MhWD3JdHUieVTuCeFRqn1fZ8M3VvSd4UYFIq0Gk5WRQwPPaM6Oxbva+8VGb9BgegZWWQ
 YZVt2Nfb2isQW4xHjjf28W53VuCBAgY=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a843c8d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=SRrdq9N9AAAA:8 a=GzsiVtujlViO_AMaDHUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: VmiwQKxuYLi1c8VreXzJbLh9hCBZtI41
X-Proofpoint-GUID: VmiwQKxuYLi1c8VreXzJbLh9hCBZtI41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_040550_008240_094A2858 
X-CRM114-Status: GOOD (  17.34  )
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

On Thu, May 07, 2026 at 07:37:03PM +0800, fangyu.yu@linux.alibaba.com wrote:
...
> +	case IOMMU_HWPT_ALLOC_NEST_PARENT:
> +	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING:
> +	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING | IOMMU_HWPT_ALLOC_NEST_PARENT:
> +		/*
> +		 * Second-stage (iohgatp) page table for KVM VFIO device
> +		 * pass-through and dirty tracking. The GPA space is 2 bits
> +		 * wider than the corresponding first-stage VA space (x4 root
> +		 * page table), so hw_max_vasz_lg2 values are 41/50/59.
> +		 */
> +		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57X4) {
> +			cfg.common.hw_max_vasz_lg2 = 59;
> +		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48X4) {
> +			cfg.common.hw_max_vasz_lg2 = 50;
> +		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39X4) {
> +			cfg.common.hw_max_vasz_lg2 = 41;
> +		} else {
> +			ret = -ENODEV;
> +			goto err_free;
> +		}
> +		domain->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
> +						RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
> +		if (domain->gscid < 0) {
> +			ret = -ENOMEM;
> +			goto err_free;
> +		}
> +		cfg.common.features |= BIT(PT_FEAT_RISCV_S2);

cfg.common.features currently has PT_FEAT_SIGN_EXTEND which isn't correct
for the second stage. So it needs to removed and then added back in for
the first stage. riscv_64_kunit_fmt_cfgs[] in the kunit test will then
need to also be updated.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

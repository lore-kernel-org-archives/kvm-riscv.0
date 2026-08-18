Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B18C5DF7D
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1Z71Agt8AtlPpBGegolpiA9/2K+usofA+qDmdSd9cg=; b=16tziznDZOyP2o
	FnM7fuD+0l/5/DCLxAl7DU8mT+PpAne9GXE+ltCMf9M3gSGEWHtlwAKn8bskEbrYh+HcYg5kCQFLv
	QUXSARtN62WhfqPv0T+rsT8G0lSRn8LA42yYyegW++v3kbiJVvHddx6KsPjR0VjTge0wJbbyHOX6f
	sUpQ9wDpgIdq1QsBeMRa9S9lmj65RYNCqflnQJSppIHf0pIDVyhCYXs723NhRhTaczRs0hYx1LdTS
	GSNWZLWavX5iOO8tqkCGCPrf6Ki2tuyno/9BHoeakkdJy4eo17t9eFtF+RkRK+Dg33oo/Tc2pjC3g
	eE8yfClRhruSXgSAeM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG9K-00000007d44-33Us;
	Tue, 18 Aug 2026 09:30:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG9H-00000007d34-1m9w
	for kvm-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 09:30:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BJM1325457
	for <kvm-riscv@lists.infradead.org>; Tue, 18 Aug 2026 09:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LXlibvlGY1oX1qWEiKzlvaaM
	w4T84Ny5R2TwrL3n5og=; b=kEKyJXPV3vXHQfI0ndkDEhzsaBksjjyfmzKyk3wL
	E8vb35VTADnpVtdXr8Vo3IZer8gSLJkSmAVhLXbraQg+HR5San5dk73bGJTnGvsK
	PPx1LaAteWqeAT0oawvIOP/ILSJz5x2I1ymMx3XuYvSzCBG1umUc+glh6jB34P0e
	W+O5AV0Hk0aiW4InxYLzEXR8nE2qAWH/xHwfY1yp39R/pRJ80S0mbWA7iznXXjEq
	a7zOpkKuSo6UeLLt34Bpeme7dEhsBeLMAkQ+6doQao6FhzhZn0NLjJy1Vd/PhUlB
	S04PbAFmmRsf27AjOkA14kaRoNSiYZ7YATJrHwuBH1VFSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtsmee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 18 Aug 2026 09:30:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e9a2b95b5so761749385a.2
        for <kvm-riscv@lists.infradead.org>; Tue, 18 Aug 2026 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787045422; x=1787650222; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LXlibvlGY1oX1qWEiKzlvaaMw4T84Ny5R2TwrL3n5og=;
        b=eY6jAhhZPhbzj0CVEOvJThtBiGj2kFmZaBvxoDUbqYOUdaOxWVO4B42n/Nv9Qchoo8
         fGlKqxTaIwr+lB76K31YpuQs3UUjQ1BejrX1ebgusWozRoNbggfzcouzQbosFWWgllUk
         B7Otr7xl4h0ynByQsGi774fkrq2KkyQL6bNGiJ2q6yZ6MbL8YTyZfhB5xD/h+8bb8Mcx
         5Jdc54M416dUonGSSWzjl9f7wpUumGfq/ShN36zbsh5eJuTTG3v01NxBzTGLNFqkVaxD
         CIGpLcK+3c3tHcp0p4CcmFB28izzwFWjafFHGJHvpHeolh/Ku/fZPsMdBUd9eDIkesJv
         Dq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045422; x=1787650222;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LXlibvlGY1oX1qWEiKzlvaaMw4T84Ny5R2TwrL3n5og=;
        b=VhnrUNyssCXKeDQpgxr+trc+3Mv5GXDx2dlHsnfkLTskLGa2IsCrOIAhdt/hZY4i3P
         +kwaRYOH0aTcGVNCdNWVNKZYLaohtDnwsjN09qFnBGr+l55eoPnXF0Yxgs9ZvZbC0XFL
         bPm1FgMwuKWk2vJ1iWH7WfP3lxFGT6ymRw959KrEFXOysEnew4BRnaRCzzu6H5EQmgiU
         JiakM6uTWG7YzfheS7VRXIb38ryQ5/qEV4mgP2nCqOTfohFusje2ibiesfLriXHij7nY
         /WwL0qVdWX3bMxlz+dr8hCcRIBCsyAa5CWZpIo7qIKU+DM6dT0ZV8yXwXc43pYwkwsrX
         SecA==
X-Forwarded-Encrypted: i=1; AHgh+RpakO3ODgQ26VN/lvI8dKKcw4NIU09LAdYPITTtMXNOd9dRmHRJFdm2Q4C86eVmVq7GbWRKRKVrdMU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXNdgIr55DCly2PhgTDi965h3oO3xENq0RSIRoOhFAmBq7Xlnp
	21/FVJCdkjzNNVgWZhKw+FPbcLFYiWY4EJ3bU31CA4Ie4OINcMaDf2B+DgcOxtOGUiJzbKSPIpC
	mzQvQj33suzeV91daQd6hcQxduK41AIgh63m+34ITC7NoSB/W1WD5y2IQ6CE3eKzEakxCLBTZnk
	qp
X-Gm-Gg: AR+sD11z/IE5n/2NoTkb/YGXzHOXvxTaeHJDlhIGu3zW+l5lPTLbRIkr0R0IB6Dakte
	lFbdGm5SrIE+HOq6pMFTzbX0regnG1uUpwlRxYeY2kcQnU78ApL/vWRy/vazujNM9ZEgwGabWCZ
	BRySyyvW6bN0bJlZxDq72BLCQaL0hvkH9/NJwUQon+U+j/SYUg6J4sbOKmmxYbgFZeJ3i+CLIsu
	tJVk3l6wz/p419Z35pjYzEeDZ10WGYGKAbEn8pK/H9fBbBWqYDsZ+t2PXKOtoRJ4RiELFxclZtt
	W7XOQzvV5Vo9Jbzr0g0eS8Yz3xUvC2orS0k8R1S2fGQAdZmiW9n/8wpqzzV/HGX22BMN+NXPKE4
	lMq4fUulq7LSBnvXBoqVHtZcyhvN2UpEK2n0=
X-Received: by 2002:a05:620a:5cc1:b0:914:afc1:c66d with SMTP id af79cd13be357-936d201c77cmr2678125085a.11.1787045421758;
        Tue, 18 Aug 2026 02:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:5cc1:b0:914:afc1:c66d with SMTP id af79cd13be357-936d201c77cmr2678119885a.11.1787045421397;
        Tue, 18 Aug 2026 02:30:21 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499961098cdsm260422965e9.6.2026.08.18.02.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:30:20 -0700 (PDT)
Date: Tue, 18 Aug 2026 11:30:19 +0200
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
Subject: Re: [RFC PATCH v2 01/10] iommupt: Add RISC-V Second-stage (iohgatp)
 page table support
Message-ID: <lpnxdqyekcczbyxo3n7zxpbj7243gixdzutvngpvr24ozmc4jt@nsoblujgprhe>
References: <20260507113706.11400-1-fangyu.yu@linux.alibaba.com>
 <20260507113706.11400-2-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507113706.11400-2-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX1n2Jj7pPyI6h
 sVhG7iiECmqXeCJ6IrQqXADdUhza6kKPczlFIVCf95rE6YFqU6QCV+CNFHwffuZIeTGyBdVsCkg
 /gwzbw+5dY29M0OojvIk61oFcZv8jbQ=
X-Proofpoint-ORIG-GUID: YsaYTkU6FrwtzT9iyh7dG58-GLUY_Ctd
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a84262e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8 a=0xFToDSQ33sWTIcn7J8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YsaYTkU6FrwtzT9iyh7dG58-GLUY_Ctd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX9B/0edA/Q8Eg
 +s6SoygAXxQHlWMC1xryMY8NjBNtjhsSht0EY4TnxwlM8ZmOVsxdHSn8WBZPtfxPKMpkPtsQm9K
 du3OYaIRAcpfPV9Tcr4W576G/0k+Oqi15hy/o1R48kTCXQopeXkoxPkbpM4kKhhyJWce/XE2KzF
 WhgbVffNWw61etH1ZVa6H2TJw4ePHJZXMFXj/4IlGjA/NxhvVg28azXeOg7MRdBL2FAbsimQ3NT
 NM2sZ6ZVwjxruJG+j8ELIc2Oe2eDTFyWBjAsG1/YnS5p/qhGgDkEBPi1zpdSkQ7/RtXk3t++SrV
 rc/GNsdNsVS3pJGEWoyvfaAzX/z3/kbMGugiAnGHvcqqGMGDoA1GbUDdGuA9Gye7HDX5/8M27/D
 bHnvmHdoUuMAQnV/0VPQYFmt1FhmdvrcV0iJ6R9W81ecQBIwGgNeYJLecZkxkW4VV0xZ+f1XY1U
 cPeHR9mFPG4xWVeFwhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_023023_578243_1F41831D 
X-CRM114-Status: GOOD (  16.67  )
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

On Thu, May 07, 2026 at 07:36:57PM +0800, fangyu.yu@linux.alibaba.com wrote:
...
> diff --git a/include/linux/generic_pt/common.h b/include/linux/generic_pt/common.h
> index fc5d0b5edadc..59448125159e 100644
> --- a/include/linux/generic_pt/common.h
> +++ b/include/linux/generic_pt/common.h
> @@ -188,7 +188,10 @@ enum {
>  	 * Support the 64k contiguous page size following the Svnapot extension.
>  	 */
>  	PT_FEAT_RISCV_SVNAPOT_64K = PT_FEAT_FMT_START,
> -
> +	/*
> +	 * Using second-stage / iohgatp address translation.
> +	 */
> +	PT_FEAT_RISCV_S2,

Hi Fangyu,

I just sent [1], but I actually discovered that issue when testing this
patch and finding PT_FEAT_RISCV_S2 was missing from PT_SUPPORTED_FEATURES.
So this patch needs the same fix as [1] as well.

Thanks,
drew

[1] https://lore.kernel.org/all/20260818092444.42755-1-andrew.jones@oss.qualcomm.com/

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

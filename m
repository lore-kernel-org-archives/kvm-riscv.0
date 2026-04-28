Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B42FF885D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/w8dWlVHT7Al6CT9zADslM8jB4W/ng5h+NDrdjFHMRU=; b=cK9rEuAkWuKzHT
	RCZhsyKEZesfBEDqiJKw9WYT5hldSI8seipVkfJCdqJBKxwxIurDg3bfUiom9rQzsNWiCrGXrS+Bs
	Wmo8YoyDVpO8sh5nQVLBkpM/mtgPUxM/qC7XogL5RnA2//UpJ0aqAUjFgKRDutKmKjsxC9g/72tti
	g/bXXHGY01rjf0FroJJcz8UcYcA0SxmsxyufOxlA98cq4uGC3Wi83VXbM51XQF+qdJhOiJoa9c7Bs
	qT6bDxULjmPPqdpG51swjWZTMQFB7UZzOCn266OhYNlb/p7kyUPUVHbz8bu/aoDemW0DDJt8v0hv1
	FBB9ZtwHUZYDTxG35+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHial-00000001YfU-2shl;
	Tue, 28 Apr 2026 13:35:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiak-00000001Yex-2rv5
	for kvm-riscv@bombadil.infradead.org;
	Tue, 28 Apr 2026 13:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j/TU/HoOrpr0P9zaYPr2HqTTv+c29GatSHy85DT1kBg=; b=oyUn5tdsktN83Ckk6cVfuTycmS
	qpsRglIyCHOmllfmy6E0+z7knK0d4zv4U+bDTFBTu7qXo2hJj7L1mWh3j53BlBSNRs3Wbn7UTFEGm
	rzRTSE+xjBl6161oUxGczl6vIy8rYHRcja2ZNc6QwZDVANjaPc/fzcZfwqfHzVl3vHG/AkaOezsXq
	rG+ucvq9HKCBeVtsCyO1W1io/7iepBbHNovMT1oCDAbDlkWj5OVFZ3YcjWJBAbGMCON78MgmFDl6j
	ECHyt1m5l5Y+Gyk+bavef13IvunCVQkQAEpDtWUGiArg3+4T+/h3racGd3G5K0t4RT0yLd/fFgJMB
	sjswF9Pg==;
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiah-00000003BUh-0U2R
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:35:09 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50e97863425so87387161cf.0
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383304; x=1777988104; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j/TU/HoOrpr0P9zaYPr2HqTTv+c29GatSHy85DT1kBg=;
        b=DiU2nRqZMwqm6fwJJ2+F5yZ0Pj0TAyp4xq6UawbmxJVdzdjwi2odHI8OWHuYeRAjfl
         m/yIQIE8QZv6CXt96ZGQbI+Wt9Jpuxk9kZ2nK8dK8ki0l4uF+80O0Z+aW+qDd0tlr3fZ
         y8GOuESua2h34MaYrgZybFxnT0lTIGaZkdLLtW1/Vnx94Eax52eeALRGq6U2BDabzCYc
         m+8u35KI6iaARDH48/RWAXpS7QHMeNdNtVZ89lxf/yYKvAmpqHMzjhQb8yIMP1b6K6S3
         ffYVQEf8eLzjESGQ62aRxuR3fxU9R7DLks0M4+Ahd/tFhUy3sCnNr1wCtWNEq+Q11wgC
         xM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383304; x=1777988104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/TU/HoOrpr0P9zaYPr2HqTTv+c29GatSHy85DT1kBg=;
        b=ZGu8K/483OkIpOMrhoZABHYyIIZLM7sHABGzDkXwYpaBhjdbGhNzYS/uYXxl2Q4Ba8
         5hfogSKzkzYco02Nu3zzkOZV2NZnXGRfUcJ1wA6ENI3RdJ1NCAb9c2+yi5TbnXTjjYh6
         w0FHA4MSkyKZYJCOBtXVKJTee5o71OfqnpT90zqVB4rIWWSIE/s/0GVZq9ZSIQRjorSP
         0MSacllW92QkEPPQj3H78UmB+0xZJuCwLcNzZsxhjhksz4zpoo0HziT/AaNfRKWtPN+2
         URu565qlQcEP1h7PsRuOI/rNcTKJwWey2IX+24c6/LTTxfZRONiOKEN8X8fkKb2V3e+x
         qCBg==
X-Forwarded-Encrypted: i=1; AFNElJ/1jz5b4qX8IaBRzrpC4mQgX1thr3zHIpjU6TjYH6J63647gSPJa/zSylrNlZPSQsJ9NDjow/0+I+U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4zaXDdNhpktbtQiY2VrbANK7qEEB2j+G8BGXiI9sPZPPJw81+
	SrPgjwQqyNhZfG5sdIXoVB4AgO9bgt12BKraZOE+TOMNdMeVrAyHxtPzGvvbH51Czic=
X-Gm-Gg: AeBDietZUpwkGq7+Q7DwsOAbqL4yp8mkPuCw2KTSWhLzn/n40TB0cTF6COKqHpMQhnV
	YtjompVt+tG2KFJs7CGvtcRSxv2hfmOfZ44VcaHglZYUJyP6fAvK96amvw9PNE1xNripqQ1nnIW
	f/ZleMJmmE8t19MjkqC83B+tfDOm4kL9Hm56DRU4ITp8sH5U6raZu9HqvR1UQjgmhUUOiTtwZp0
	+rSXrcD9zv+pZTX45n2Obah79dki1XhHGQFUqFzM2paQ7qXFRG9drrdL4rF7JHCjRj+NaU185CY
	LP6isv3KulypU4E5AC1ZR7KQc2VHcivfANT8Eo1RoqQXf3SVvv6OwhG6Vj9JOncsSP9F6cTipH6
	6LuQEivr3+NhazD5K5PXBNKK/jkPdpOJXcMLr5rVJfukhnuSMG00f/8JOGWVgEHpqXGJ7RFL8sy
	yMja8tdYvQ7NrxEwed0vTsKYACUyVOJsHi6YGj0v7+idGxljgeLMCyISnpZhjJRDXzMy2+dXfC8
	TTYx9m3mfD6uFUU
X-Received: by 2002:a05:622a:311:b0:50f:bd79:2643 with SMTP id d75a77b69052e-5100e1b5b9cmr36699661cf.34.1777383304257;
        Tue, 28 Apr 2026 06:35:04 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100da647d9sm18237481cf.9.2026.04.28.06.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:35:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHiab-0000000AiFH-3nWV;
	Tue, 28 Apr 2026 10:35:01 -0300
Date: Tue, 28 Apr 2026 10:35:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
	atish.patra@linux.dev, skhawaja@google.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 06/11] iommu/riscv: Add domain_alloc_paging_flags for
 second-stage domain
Message-ID: <20260428133501.GE849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-7-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-7-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_143507_255856_7B1C2B90 
X-CRM114-Status: GOOD (  21.83  )
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

On Tue, Apr 28, 2026 at 09:13:54PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Replace .domain_alloc_paging with .domain_alloc_paging_flags so callers
> can pass allocation flags to select the appropriate page-table type.
> 
> When IOMMU_HWPT_ALLOC_NEST_PARENT or IOMMU_HWPT_ALLOC_DIRTY_TRACKING is
> set in @flags, allocate a second-stage (iohgatp) domain.
> 
> When @flags is 0 the behaviour is identical to the previous
> domain_alloc_paging: first-stage (iosatp) domain.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/riscv/iommu.c | 66 ++++++++++++++++++++++++++++---------
>  1 file changed, 51 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 5dadf6d09139..0c13430ecc7f 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1255,23 +1255,50 @@ static const struct iommu_domain_ops riscv_iommu_paging_domain_ops = {
>  	.flush_iotlb_all = riscv_iommu_iotlb_flush_all,
>  };
>  
> -static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
> +static struct iommu_domain *riscv_iommu_domain_alloc_paging_flags(
> +		struct device *dev, u32 flags,
> +		const struct iommu_user_data *user_data)
>  {
> +	const bool second_stage = flags &
> +		(IOMMU_HWPT_ALLOC_NEST_PARENT | IOMMU_HWPT_ALLOC_DIRTY_TRACKING);

This isn't the right logic, you should follow the switch/case design
from other drivers.

>  	struct pt_iommu_riscv_64_cfg cfg = {};
>  	struct riscv_iommu_domain *domain;
>  	struct riscv_iommu_device *iommu;
>  	int ret;
>  
> +	if (user_data)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
>  	iommu = dev_to_iommu(dev);
> -	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
> -		cfg.common.hw_max_vasz_lg2 = 57;
> -	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
> -		cfg.common.hw_max_vasz_lg2 = 48;
> -	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
> -		cfg.common.hw_max_vasz_lg2 = 39;
> +
> +	if (second_stage) {
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
> +			dev_err(dev, "cannot find supported second-stage page table mode\n");
> +			return ERR_PTR(-ENODEV);

Do not make log messages for failing system calls.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

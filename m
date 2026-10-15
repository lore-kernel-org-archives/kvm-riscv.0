Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C2FCCA462
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 23:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBqQ7ghCuooVG9o3eRuCaR0n/wsxAVlivPgrOcQJv54=; b=OWZ9iBB4oKRkfY
	RPpnq4BSKCF9Et72m2ONYIIMiuhSXb6ic2dINRm944hmPLjqJgF7eEtRxJt6e2O/rlqW0XqGyPEPM
	9FpmYCGm9LreCHlA5I596WFGONHnUqtFuSUEN5jlRKClv2CgF96KZoKxItUa5XnVSjdaELmvXIK/B
	Ke0Syo31cg/BTy0oniaJTCCQZej6jRxtdsXoBAxMWmMQGVrdV9T0D2v+ZirVd9c4fEVastegopJnY
	wHotCT4BNa3AryStjVJnGBkClBlw1b0q6ytkG+JWHIs23ZHG5fwk6rJ90uRTKGgqlnfJejV9oxhU6
	OkEOJ2JDF4c0It2mS2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVIQ-00000001aJa-3k0d;
	Thu, 15 Oct 2026 23:55:38 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVIP-00000001aIv-0iN4
	for kvm-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 23:55:38 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-53606d2351aso20868901cf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 15 Oct 2026 16:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792108536; x=1792713336; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9upklymhAO5QkQciFGrhvMFEHYA5CmaaRGixe6VBms=;
        b=GVedO2+kVvGVxz9rokzYgbowi+WZ7rv+JxXFw8cc8AXb8IwqsUjL7ISEEMqNfYIfNq
         WVU47ggnBZ44df+q4AstlVnd2et+S+guir+e1/e0GW+pOVtfXplF0cZ7QRhzdIrfAvkX
         9xa0wu0I/wm1Q2xsCF7GWdtHgcM2xmvr2sZ1FHDQ816+SHHPc9/v6RgK4w/p0eyxXGEk
         Hkvnasc/RAeGdLE1Ca8LBN+qOzofyEUb6d9hNyqUEZlB/CJqHQMD8HEhu/B4MGJ3jEDL
         w8R1BoCR3N7CysIEjj3niozFngTmTewlzrS7Xb3da1/zZVoUq8GDjbhxUACHwJFxno36
         mKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108536; x=1792713336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9upklymhAO5QkQciFGrhvMFEHYA5CmaaRGixe6VBms=;
        b=cdwJgmH6etq0GNON4wxmHOG5QkzQEVEuoxFYjHbrWvHYrenc5x90zgN/L4AJbm7uwx
         +wVop7lwIE+qmmvffvGS4/pr4QRmwWbpcTLDxCHezYBOYi4SJ/+SkppmlM+F+c/dshlI
         9lLztejhob04Rr/rf+RJ6soQF69ndW6qWdfjalqQoHpjoh8aUdzsSGoTvQJn5qOCR2cu
         eVewCgqw7N2z1oYbX8D+U0uZF0FgtMjTbKvg0iHxC23jeZXQZNzTCjUiKQR/INOP4uKN
         2nETV3zI7myLp1U5l+DSbvYsztuX+4Pq86sGtc1241lYMd9vCdInoL6ufr4AaMgDnuDK
         /NYw==
X-Forwarded-Encrypted: i=1; AKwUvBwuC7ynI5Bq61UFWRsioThcY4KV6Bwtf7OizK5Dp0nwtVpw65hzN2/5J+jLHo1W4vzqiGxamUAxf4U=@lists.infradead.org
X-Gm-Message-State: AFq9FYJBfpHedyh7TmZ9FeJ/zzcVHTw81aRE5MDZf4i8hv7JniyNEOiq
	hKB3dm128QywA1IezO/ecRhH5OG5ErEb5Sm/GQXY//sYFiXRCnPwyQRS2PC85OG3mOs=
X-Gm-Gg: AYBFou3MeVNCf30oS/Fon76G2TLxQIq2zlMG2lp7OOM0LI0ywXaIUL+HvQW+DmIQ/GH
	nZpdhaxIYz74K996a1o0dU9w5KPwa+/HzZ2vFFCyBAEHQ6cvanGOuit1cd8YT8Tbc4uaZm3eNWh
	1/ybWZeYIvWCFpY85xq8BxD1MzOflVuirWYivKJNRC47HkrPvgSMiE273szYxbLGfQgwhNAXGLF
	t+WuEWyejy0YjbD9fDA+/nDZLKDTOOEWJ96sKIECeQTnbyxdW3Xel2hxnV77Zs6r4oMwVu1tDSd
	RAmJSPo0ltf+QRtTFDLTSA+9D6Bmj+qF2yrmEz4r618pqyRC+mgEe7jjqX1Hcgvcy/AiE43RIe5
	icOYpiDTwWlmBN4DVqM2aTpbqLt9AXXim4MA+WWQfnCin5X8xRpSk+IuP1w3h5oUbgLumcQb1YU
	87V6QUUgzN40Q0F4+p9nTpcFf74dcgH1VVPOlyWNF7jtCFXsj4l0vT4ncSe/m120fa6XCjxNbsF
	Nuw8fl9C6+Hfr6eBW+ylZbi3mZeFL4cMY2jUxFaZR9RRJ1c+9nDWHFi
X-Received: by 2002:a05:622a:251a:b0:532:f124:18dd with SMTP id d75a77b69052e-5359f49891emr329059071cf.11.1792108535894;
        Thu, 15 Oct 2026 16:55:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4db4csm8430526d6.16.2026.10.15.16.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:55:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHVIM-00000000Gew-3ViJ;
	Thu, 15 Oct 2026 20:55:34 -0300
Date: Thu, 15 Oct 2026 20:55:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Wu Fei <wu.fei9@sanechips.com.cn>,
	Zhao Qingye <zhao.qingye@sanechips.com.cn>,
	Gong Shuai <gsh517025@gmail.com>
Subject: Re: [RFC PATCH 07/12] iommufd: Add RISC-V IOMMU hardware info type
Message-ID: <20261015235534.GA14213@ziepe.ca>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
 <20261015065232.604503-8-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015065232.604503-8-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_165537_220280_77D7D8C0 
X-CRM114-Status: GOOD (  13.89  )
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

On Thu, Oct 15, 2026 at 02:52:27PM +0800, Gong Shuai wrote:
> From: Wu Fei <wu.fei9@sanechips.com.cn>
> 
> Add IOMMU_HW_INFO_TYPE_RISCV and struct iommu_hw_info_riscv, which
> reports the RISC-V IOMMU Capabilities register through
> IOMMU_GET_HW_INFO.
> 
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
> ---
>  include/uapi/linux/iommufd.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 36e6187bb34b..acfef0338cd1 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -716,6 +716,14 @@ struct iommu_hw_info_amd {
>  	__aligned_u64 efr2;
>  };
>  
> +/**
> + * struct iommu_hw_info_riscv - RISC-V IOMMU device info
> + * @capabilities: Value of RISC-V IOMMU Capabilities register
> + */
> +struct iommu_hw_info_riscv {
> +	__u64 capabilities;
> +};
> +

Same here, spec reference.

Also be careful to always use __aligned_u64, check all the patches.

JAson

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

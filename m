Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA3CFF8867
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 12:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PF/WjaWJgrhRZYgJLGoofv8WueWDa76Vt6lGVSsFI30=; b=gJvjenQcXEsdZ9
	Clnuj+tjlIr5f6YQ02zXQ4njRF1S/ezItro2SO4sic6mMJqBCJhZS3BdTRhbG7v7qxyhKoSvAdfnr
	iBOa5neGwiADy5lFlkQ/MJlPQSCvnFW4LB6ALU1hlVI6B8a8bGRUzXLX2/YGK1mHlvyns66hO0g+k
	M4dUM+9+Oqt9jNtawOpxD0GXbiwtUARUjxwISfWldk4hSsHyXl37dNX8utsBqD0tePQg3fiSGB/CU
	kkdnPiEGv29ceaYVMV80FD/1S3JuK9J8/CcNcav1RUUChnH8SCT0xkWY4n9fXKk06uMTABkY16SaH
	5I7FQOD8XOOMYDa942Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3s3-00000003Z70-04Il;
	Wed, 29 Apr 2026 12:18:27 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3rz-00000003Z5f-1rpM
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 12:18:24 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8f15e900586so301416085a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Apr 2026 05:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777465102; x=1778069902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MPHSzoCIyDIC9QP5+spsNloO0c/6uT0t+rTHSV9tUV0=;
        b=PEwS3tC+sQ/PWU9mQr5kSjCjb2w6c6TwEPcLKovS7zzzF6wp4aYCJJlbt/DXBfi/ZT
         8KhOVbwZqK0m+DHpeDhq1mH5Xlp0DwqyB/eFYCe8lDJ89aNuktz3fIs2q8kU7f9LlnIL
         dRPNCowlnr4KLRApitSc2QQGQ5bv3R2Y/uyUN0KMqNXW55CzU8eiyhGDgxi1eyNjtCQh
         GhiZ9/IWH493Q6yBdPVB7boAhZqOp6kXkEKCdDKRCplGJfYuooMhxNMQf/vRomgh4i9o
         m+AAC7kVXpCPCyjO+lZcPCOctgQOq1ZVniu3aBusa1S1PpI2YJSSxvVzjbiS6/M1qg0I
         1gEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777465102; x=1778069902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPHSzoCIyDIC9QP5+spsNloO0c/6uT0t+rTHSV9tUV0=;
        b=sIOpwDX1kFyqgGv/yjHyU2C7+jcVN10oryTXCneQARo9TMQQkm090UF+ruSryRLU3I
         gHHyWb1DL6DC74cAZ96DCDuUfUtnuODzakMVOeIx43fRhjt3fHkt3CTb8VeVXin2sPkw
         42W1tPzMcXvpcAQADDUTmPF+1iqwC8JX1UAnUtoN69MIIFDRhpRdrAOsSLOks7TvMojf
         WbnqsMVX71B4//Nw7n1B1D2rn/epvff6qw1hdrzEFBWKSt4XiXTYM1OgRJA+ivHx907g
         XYyb03S6qq4ACpGHNOYvLSRhmo98AvElUvInMLI0AjENT9oYCH5xvO0SApClxkojB6VJ
         j1Ig==
X-Forwarded-Encrypted: i=1; AFNElJ8/NH8UPdrix0JGSRS/wXLauGDjgXavYK77BNhu9QCVfHf7WZeeihC4GnumNNq8rXeUic2y9IRqq2g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZIp7vJ6tkx+8SB9n2lArrkk40+lSfr9wFQZXJfX3oQx/t1cC1
	hvHrYCm9wp7gB3URJuWrZqyqBjpwTOSo0r2DBQ2/K6cdPNoL5SFtCDwsP5jGMmocph0=
X-Gm-Gg: AeBDievrvzv7MWu/XjXFMAFTcqif18JtOSyH3kRi8xKrDGWWutj8fA/qPWZi9w2bV93
	i9CnL0Eza1XHiDQf6h/ufAFNDq4yRvEdyG6YimH7Uyol1VdOzjxN77RuoGMJfpYLDRRSn1eJ6/U
	ZfOSheFGZbCKf7CWMFI91g0PGY4Xe/Ca0OSFIL7ADXiflWVKoymcqB77HE4K77zTRNkjksjKNDd
	dmotWwzmEtKkE/b92HzFXPUCGi07MVpGJ0sA5nzMMciFBSOQnYOw116W0p4lqNHvomVgSXSUHLl
	ehEpry964QeZXrXRf4sGtGbZb0tWaUNd8GY7IZp7PYtULyR8hwd4FRDcfs60SE/cNzinWUub/Fp
	2vJHfXeLM8RKs/bHC7CBWh8EadyoNEmuekwwEnqaBuE1nycb6IWuEeg7i5LLFmS5pG0bljRKouk
	PzqEz08Se3pMwYCn56BZHXXHusVwaQWGtyJh8jkPT9UqkNZkprMeJtkq9hdeiyw+7xAaHNuNk+0
	dR1pvAk8RRV/rom
X-Received: by 2002:a05:620a:4481:b0:8cf:df8b:1e5e with SMTP id af79cd13be357-8f8f3534220mr552478185a.5.1777465101412;
        Wed, 29 Apr 2026 05:18:21 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f940051f0bsm152785185a.40.2026.04.29.05.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:18:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wI3rw-0000000HF8A-18yU;
	Wed, 29 Apr 2026 09:18:20 -0300
Date: Wed, 29 Apr 2026 09:18:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, anup@brainfault.org, aou@eecs.berkeley.edu,
	atish.patra@linux.dev, baolu.lu@linux.intel.com, guoren@kernel.org,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
	skhawaja@google.com, tjeznach@rivosinc.com, vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: Re: [RFC PATCH 01/11] iommupt: Add RISC-V Second-stage (iohgatp)
 page table support
Message-ID: <20260429121820.GL849557@ziepe.ca>
References: <20260428133239.GC849557@ziepe.ca>
 <20260429010650.61646-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429010650.61646-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_051823_612992_473A53CE 
X-CRM114-Status: GOOD (  10.48  )
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

On Wed, Apr 29, 2026 at 09:06:50AM +0800, fangyu.yu@linux.alibaba.com wrote:
> >> @@ -263,6 +281,22 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
> >>  	case 57:
> >>  		pt_top_set_level(&table->common, 4);
> >>  		break;
> >> +	/*
> >> +	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
> >> +	 * The top level is the same as for the first-stage counterpart.
> >> +	 */
> >> +	case 41:
> >> +		pt_top_set_level(&table->common, 2);
> >> +		table->second_stage = true;
> >> +		break;
> >
> >Second stage needs to be an explicit PT_FEAT not implicitly deduced
> >based on the vasz.
> 
> Agreed. I will add an explicit PT_FEAT_RISCV_SECOND_STAGE flag and
> stop deriving second-stage semantics from vasz.

PT_FEAT_RISCV_S2 would match what I have for ARM

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

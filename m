Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48354F34C4B
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yk4U7/rmpYdTKLOCvoabAstc8UL7At9WS36l4oj7UM0=; b=PLp4rXSc0CUyQu
	ftwPv0+sRjiGm4xEeJ38yapQFFFhrQnrLkOsUv+CkLhijLVq6bxuSryns2+srilFDmtBeGGO7eT2A
	xpP/Cs+yRUf94injLFQeGp2P2XUp0PUF41MzQke4Djv4GgbYyzNTSHIhLbCzrhpyX4soLtOj4foLo
	mFoZjMBNCmQ7dKUITZyqwnyz+TbTPtHXWoZPVxV+pHIutVDcPuXBhDOtPqTKzfU6yhSp+ZCd5NFmS
	516iq8KfgHh2lKpvN23wLZZfBixTJVdSsUjeIaTLFNgnn5VBKh4/159F6bGn8hgj+SVEzp4L5X/aJ
	ZqgGhEzUnNq0AXDqpAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGU0-0000000FeVE-3gC6;
	Mon, 13 Apr 2026 12:33:40 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGTz-0000000FeSF-073F
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 12:33:40 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8d428da4300so468738285a.3
        for <kvm-riscv@lists.infradead.org>; Mon, 13 Apr 2026 05:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776083617; x=1776688417; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G3PbZPnXvhTGMf08wp4zGUyWkrOGmA6vnbkCFh7iCiM=;
        b=GGCEBe42kDN/OF6fx7oSufCIM0jtSqW0uTLbFrlLEhVwj4UM8WgZGIk6TdDX5G35PA
         yvEuKIyzSeLeJAiKYHwEjl6goo0Xhs+qRbaZZ+cvr27NHCd2v8EsS7AJpdvbxtqVknKv
         KjdixMRaTWHhMFT9FOZ9MU+FPmsr1iNJ547fU9q5oTfg7Zpz2j+Va3zYFcLnWACSHzsV
         6luqfXwc6bFT5MjRkTfyCjaWrYRvckMxTS7RVfRc/RUQrd5S8sYIKi9lAgnx2+UVGFiy
         JWlfIB+lHP/IqcO6i0MGT92QK1CBvl6y/yaiPsFRbSZOubZtM7EzIaRsSfCHeYIOjmcN
         Qo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776083617; x=1776688417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3PbZPnXvhTGMf08wp4zGUyWkrOGmA6vnbkCFh7iCiM=;
        b=dPCWtMxMj+7N54114FpMdFlSja7iSsUisFUJDrbzPPHRci59HqX/TLSpUuwJck4fAP
         OeO3LNBue9YkxfFkOaD1qwf8vRbcQFchNg8BPTdhS+VXloiYYu5PjZaQkoA0iIZMbl7N
         jXIapwxzxRpxSIIIfuPiPM56i2OOqhMOP0leNIH43o+yNtwPgDqteuWCMwMYG/GTXze4
         dmKEvdOQ15KV3rOsXpCrcDufjGCiCnBtCiFyRASd72v5wmc0Z/MC2J4XuBZ6JBZg7q3a
         b9/of2jAgGY1lHLgjPrmepYNn4yEFacZenmGopv51gu10Sa9mYb+a1O3s1+aW9AhjcJq
         cizA==
X-Forwarded-Encrypted: i=1; AFNElJ/CoxUBRIe+nicTlH7qnl5/RTIPxNTltqA7un2PwIuiH/lSm7+rSVzoWZg9s3DANXjsg+0O6UKXew8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRcOZuI9qXCGXzBLVweGdrUyGt1+K+09cKJeGZjf/DMfni5C4s
	FdkOF9/nLLkTOo+bT/ZBuG1sWQtahntKU9duKE2B6iFy+KCl6R+2buxDUoAiCuhXX3Q=
X-Gm-Gg: AeBDiett11nv53AZDn07mQERHMiV8S7hdJ/dn/ARJNRth3kAU+0ullIpeVLgnxhY6/z
	zLjVqualWw18BPKgefN35cdQnwEEa4N637fBnLURKwKn7C7d3mRkOcEoYkU4p2eoK+fCe7JJyBJ
	ZmfdEbW8NxufGFbA+IL+SbH4YT/06mJBrtI9c6O/6TU6gm3JyAdLw2HEI4jn0v9uqSKWAQj9G4r
	LqDzJfSON3+5RdahCibe7QopwEF9qIp/cjFqeJOKaYlRYbvNQvc3PiixhKpQxBlQQ97VsCOoOy8
	7Exnt3I/ZtekWqpZjrRUH9ocVeCOB707sE2T7aFsR6Yh6hilIUbgKzc/V7U7VGKe1gsAOtt8JU5
	FFukTToR6K03/P9unMC45wEJt1CCN5gaP3Guwh9R4Ft91A81RxYgE+rM0foEUBLfOGxobx164Va
	vfUXv1TIrQnUNQYamRCyDb4bqWFVSFsPla2t/2JsVG1y9C9+/kUJ218gdgf6srctaRQypMjGMx2
	WKXVA==
X-Received: by 2002:a05:620a:3729:b0:8d7:cf69:3bf3 with SMTP id af79cd13be357-8ddcfea032emr2045008085a.54.1776083617086;
        Mon, 13 Apr 2026 05:33:37 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb9637c5esm840380785a.38.2026.04.13.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:33:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wCGTv-00000005Acj-2B2K;
	Mon, 13 Apr 2026 09:33:35 -0300
Date: Mon, 13 Apr 2026 09:33:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "fangyu.yu@linux.alibaba.com" <fangyu.yu@linux.alibaba.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"tjeznach@rivosinc.com" <tjeznach@rivosinc.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"vasant.hegde@amd.com" <vasant.hegde@amd.com>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] iommu/riscv: Advertise Svpbmt support to generic
 page table
Message-ID: <20260413123335.GH3694781@ziepe.ca>
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com>
 <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
 <BN9PR11MB527696935354C345259C39E18C242@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527696935354C345259C39E18C242@BN9PR11MB5276.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_053339_228444_6D500BCE 
X-CRM114-Status: GOOD (  12.03  )
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

On Mon, Apr 13, 2026 at 06:45:07AM +0000, Tian, Kevin wrote:
> > From: fangyu.yu@linux.alibaba.com <fangyu.yu@linux.alibaba.com>
> > Sent: Saturday, April 11, 2026 10:22 AM
> > 
> > diff --git a/include/linux/generic_pt/common.h
> > b/include/linux/generic_pt/common.h
> > index fc5d0b5edadc..dfadf8a5752a 100644
> > --- a/include/linux/generic_pt/common.h
> > +++ b/include/linux/generic_pt/common.h
> > @@ -188,6 +188,7 @@ enum {
> >  	 * Support the 64k contiguous page size following the Svnapot
> > extension.
> >  	 */
> >  	PT_FEAT_RISCV_SVNAPOT_64K = PT_FEAT_FMT_START,
> > +	PT_FEAT_RISCV_SVPBMT,
> > 
> 
> nit - every feature has a comment.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Oh that's right, please add a good comment!

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

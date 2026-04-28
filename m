Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5A6FF885D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfR0V5kj5ENo28pBvdn0RXi7NCSDKS1SnLXya+hNfxY=; b=xSd9QzcfykN0jt
	BEbNybrQRR/yzz0F0xFUTYvKMSxtjmqyC2rLy6CHRmEwu+qZMlQvJRcsU0cC7b6IuggbctKCyD4nP
	cGJLBlqEaz/JQvMxmGB+5DJmaoVA48DZvw5K7XQ/32liGwJ7hB6aJ/+rkQrR2LpczxlUeGXh7cSBo
	14URZjaAQKDtGgQxkVqFFWvPOv3OtgsWhqD1ntxEFpR3rReC7wM5FOKhULa1z97YE1/Du9pPubCbS
	17k0RRnLT0thXQ0RuG8bBZxji2hsLkG7t7sNP9frw6KXyQHKp50pJJxAKQnWEYZ4jTGsNa0OKQ2VU
	IHE9osqsgTGzML85fg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiYP-00000001YBk-42Nd;
	Tue, 28 Apr 2026 13:32:45 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiYN-00000001YAn-1Ty2
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:32:44 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-68470763896so5998749eaf.1
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383162; x=1777987962; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPdjCZsKcHNqWuo5+pnokV+zhe1DyX7GyGi+9Un3LHM=;
        b=QVpx67lEKEgq8z/C5pCV8Hz6KmKYidockP7kPtSnXQTkBEi5YMWyvJVNjrG7yBarmS
         5/4bCvtoW74WP7ZnV1nVCzCSftbBzH0duLf3p9CPheGqFuwIReieVR3deuePs9Ah6R9W
         Gpv7HN2vWxlmt1vINS4NV0omeEVtHrufZ1dkQwAUxfCgp1IYUPwWg9ZOWIZtIOXNDRgU
         bI/qy0/WX8P+pho1t/hN7h2URWzmhaML4qyp7lezkZcklVfN8DGXK+SXiSsiZxyyy7Uj
         F02zwyuM8ElJLr/h0EMoflm0DatWQ1esH2x6FjvzmIH2RjQS6tuCHx8OL5IY6R9J8pwX
         qbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383162; x=1777987962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPdjCZsKcHNqWuo5+pnokV+zhe1DyX7GyGi+9Un3LHM=;
        b=XUQ+jsjTNljTei8ILrhkxZB9vW088BV50DQliEmRdvqOrSY27BVxXmUCbk58ULoyHW
         31bkMpNo8j6ZDwIAHXGqftDS8fUZko8r++MP0Q/c0GjwjRb7A9Jz0MXl0rtMj0CB/wPs
         cPfS280cBRQ6ubC+krAmfo/0DDVCfxZCmzxQnAehsnrD6LCNJtUCcRR+jKbk9vAxcLdL
         GS/5PynRgfrj55NCz9rhMShcug5gM4riqTZ3UqIxVtsmWVBX9SIkX2+HGFUWz7MJBXOo
         r0Br4Eu0P97H9dSkfAqiUJtx7uqggEchYq4JeQ6i9bnwOmZTNKcy++tM9epLvr+lVkRR
         ltjg==
X-Forwarded-Encrypted: i=1; AFNElJ/gtvVwinND2ykrXVwXqX1YLVtab1mUzKcW15sSFWqzuhrypcWWlSiGe6r3/2Sqbvch33mov7cItus=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvjOPU3HhBbTfgwuDEUZpyD8JrgrE2DhewFbp3UxGYxi53RFTL
	PGo7l+rS1s/cVLMs1femEMum14oZaXX7SUs/YM5zGlx6eykWuVnCaxf4oaj4rNaO2l8=
X-Gm-Gg: AeBDiesVgk/vw8kZfFjZQR0EUxnIh4ttg+VM7lIpYUqJNw1hguogTZ1TbYQ9A64j9JN
	24iIYamZcsaVrSTudgTPHLN3lh0wF+4YLSGqgn1x8xggmlq0GCnlKIYO7sxdnMEYUi1HOWfNHP/
	uYrn0Lt/KluzrUkGBidHDk59MeRVlFOGlPIcVhUw3DyfjQDpp1ewxQiVGpCkKu7NqXNNPa6vVGh
	z6OYXwMSImhWlaw9H4Bp3AihH1DsgTktNknl/q4z2LP1NZ9kTG4DyBiKgE5lirZNHaj7LRig9r3
	WqMyX1m30AzSRmZ3p2YitN9E/G9wn5k8LiWVFGmRZiRI4WbGseo3pGOR/FYlwFvYwnskseJ89bC
	5R+pVsiklLcxce3+hv1Z6yJ0S5n5DK3RgbAgdzb5HNam0C/7Gxg3YwLd3XoP5VAaT1KOvd8jwdg
	mihVU2DDATmRKaIUh1hJCntmj3Ap4ru6OcHdVSjJj9MmFXduWjmvFcrvIsEKp6iuCgvfZaOTQRP
	rLXvMqV8K5Fk+iq
X-Received: by 2002:a05:6820:f008:b0:694:8683:3867 with SMTP id 006d021491bc7-6965cbbc6e8mr1334311eaf.46.1777383161926;
        Tue, 28 Apr 2026 06:32:41 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c48c71f3sm197040285a.7.2026.04.28.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:32:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHiYJ-0000000AhcL-1zNy;
	Tue, 28 Apr 2026 10:32:39 -0300
Date: Tue, 28 Apr 2026 10:32:39 -0300
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
Subject: Re: [RFC PATCH 01/11] iommupt: Add RISC-V Second-stage (iohgatp)
 page table support
Message-ID: <20260428133239.GC849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-2-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-2-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_063243_391020_DDDFAC19 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 28, 2026 at 09:13:49PM +0800, fangyu.yu@linux.alibaba.com wrote:
> @@ -263,6 +281,22 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
>  	case 57:
>  		pt_top_set_level(&table->common, 4);
>  		break;
> +	/*
> +	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
> +	 * The top level is the same as for the first-stage counterpart.
> +	 */
> +	case 41:
> +		pt_top_set_level(&table->common, 2);
> +		table->second_stage = true;
> +		break;

Second stage needs to be an explicit PT_FEAT not implicitly deduced
based on the vasz.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

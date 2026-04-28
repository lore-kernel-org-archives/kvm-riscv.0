Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88341FF885D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRIK7xAgNseFGdmeJxvZV6jDF5e84DyOBO/4ZttZ+pU=; b=JjGs5O3ZIYS0vi
	JQrexim7w59yh60H3i+71L+2kA4PIJhkDR91d7VN09+sfT+7h2yZyhgWSxUp/yKtb8XkOvKuPVKGW
	J4WwSdMGWOgqCSEF9gKJ+K/bvd0sgP+D7YzNTyYlsYZpR+Y2Wx0gAnwEXNHBQUgPmFrRekOZ1iD+9
	lVMeSoXN34Xu2DsD75CwMQX2jiDW87TLmlfP//lSfYkHrESrLsdYfbZssu57ybuaeE3Yk/8eC1d0f
	bZPSwuAInPV+PlBNq9D3GhQfD3tWjzBze86CRzosiK4NFoEmZkkxJA359fNDP6Q7j/QioobBPfzMW
	SGklbZuvOC5M1OlP7W3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHida-00000001Z4I-16BI;
	Tue, 28 Apr 2026 13:38:06 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHidX-00000001Z3V-0rTe
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:38:04 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8dbbc6c16b2so1442440985a.0
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383482; x=1777988282; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WHmUngA0Beg9PMjrunFUFdxSHW2GXtc2kWTAdD0BnF4=;
        b=c67/nAhJ4rAiEy3+eJOfYsj9qKRc1To/ifvCFMGdAa7ul+K/FXUtlg/M4EkdGkCZgY
         22AmWe4JS/CxK4Ta9K4mEVhrM91yOrcXW9BUVFiyLvZOnz6bx5PrkOoePWI7nZmFGSPZ
         6mSqx31+P8ediM4AZBqnAVeumiiDOt56whOn4uhs3CzFtB4BVWJCAyL/vg0ec6vVHDmE
         rg6Oed+SLZxZjeBJ8V3VKXNcX5H+0tfewNpaMXL/60gsLTXX/+Xi4mOAvDoQ9XbjUcAs
         WBN85/CS4rsGSlni9iC/U9rG3P2EJmHtJxrHOrU40Uj2SEezNQqs5X0FXlHoZREIvdZo
         ovzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383482; x=1777988282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHmUngA0Beg9PMjrunFUFdxSHW2GXtc2kWTAdD0BnF4=;
        b=C+r4aD9xIfZE2LSTQxv/HJ4gbvcVI/vW8vfv0nJCHkmpSF2PO7Zruiyyj/v5+bDVix
         3F/Bf79KrLCjoQKBAeh372PzBmayfWyy/U1GYwtSY9UcnIY+2qjdSWOqL2q2hnHU8Tq+
         yxvk2wdCOwfEtCwn4rIb+9/iFOGv8vzrCE9VhGAaCSGKvArMwdasn9AcPDWQQyRr1bBc
         jMdfGnx/lium5yIfkP+JyZny1I63y8KkclSEQGaxYaTs7EAdJFPj8HKi4eLHCwAg1JxO
         4/DcRsfNXEEQrBUaQ5bVfD96df0wAGXBrxSJ1VJjfV9uuAlbh2HqCjfdsx+DVYhV3auj
         IjBA==
X-Forwarded-Encrypted: i=1; AFNElJ/YFABOqZBNNVbyudDkOax34OtU+3b+nEhiVG3hM4L4u06bEbJHd6nnMDaT9bfZUbingnNJABHQHI8=@lists.infradead.org
X-Gm-Message-State: AOJu0YytaT8sphq4tkzGmuNx4SD1cogoS8g1gVY8DGxqpZAJ+51c1oXz
	QPuSUOxli6LCmAfkimJ8n/4TNdtAdAcDYhpIrx7cC3ToNG4/SCqwmd7UYmdmjmFDMkw=
X-Gm-Gg: AeBDievnC1HG4d/rnQSAhmic7IcPN7E+PsVf/x6mOL+fhZWhggnefJA/AwYJXm+P9Qs
	xBUj4IYMRE27O5K7LAIl0Neo+pcTjR4FG1tqwtD9PUMKefxWRM6gfsEy11v24sWMbi4yjP29KZT
	4CMUD1LsMGvmSX6q0jZZJOEssFZLhH6g0ww+I/mGCMM3qdF9qa3YGZbrwlWxdW9NewlaNba6zvx
	qyEGcPukKFbz5uYARh1PlWRfrJ3+whZixxDRs98/PIoxkgPxrwq+rujLY6gO61ZJFkbpgLfcbmE
	j0AZrb+KvA3DcFr097jbkC1anT8NZPBu0k+XsZURvCTvRewaXB4Qy/uilm2pjungk8ns2wGNiJS
	+tNkvm2XjuSIinLz9bbC0PvYBi8i9eEglOHFf9str8V8wpSdLqBrlSX9kDfxMeU7PkcMlR5rpbk
	3sfpk1IfMlgrDXAI0qJYBbyS66VqjjcberW1DsRb0Zrku7KpTpqc7LLOcxZ55bAwd7Oe1wpnmAC
	nGYWZgFaVVXmzGh
X-Received: by 2002:a05:620a:178c:b0:8cd:aa61:ad8f with SMTP id af79cd13be357-8f7d5d6dc38mr357079385a.14.1777383481817;
        Tue, 28 Apr 2026 06:38:01 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c4dbcfbdsm203538685a.12.2026.04.28.06.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:38:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHidU-0000000Aj1L-1JSZ;
	Tue, 28 Apr 2026 10:38:00 -0300
Date: Tue, 28 Apr 2026 10:38:00 -0300
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
Subject: Re: [RFC PATCH 08/11] iommu/riscv: Add dirty tracking support for
 second-stage domains
Message-ID: <20260428133800.GG849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-9-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-9-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_063803_254468_6F374342 
X-CRM114-Status: GOOD (  16.46  )
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

On Tue, Apr 28, 2026 at 09:13:56PM +0800, fangyu.yu@linux.alibaba.com wrote:

> @@ -1247,6 +1247,84 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  	return 0;
>  }
>  
> +/*
> + * Enable or disable hardware A/D bit updates (GADE) in the device context for
> + * all devices attached to a second-stage domain. When dirty tracking is
> + * enabled the IOMMU hardware will set the dirty bit in PTEs on write access,
> + * making them visible to read_and_clear_dirty().
> + */
> +static int riscv_iommu_set_dirty_tracking(struct iommu_domain *iommu_domain,
> +					  bool enable)
> +{
> +	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> +	struct riscv_iommu_bond *bond;
> +	struct riscv_iommu_device *iommu, *prev;
> +	struct riscv_iommu_dc *dc;
> +	struct iommu_fwspec *fwspec;
> +	struct riscv_iommu_command cmd;
> +	u64 tc;
> +	int i;
> +
> +	rcu_read_lock();
> +
> +	list_for_each_entry_rcu(bond, &domain->bonds, list) {
> +		iommu = dev_to_iommu(bond->dev);
> +		fwspec = dev_iommu_fwspec_get(bond->dev);
> +
> +		for (i = 0; i < fwspec->num_ids; i++) {
> +			dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
> +			tc = READ_ONCE(dc->tc);
> +			if (!(tc & RISCV_IOMMU_DC_TC_V))
> +				continue;
> +
> +			if (enable)
> +				tc |= RISCV_IOMMU_DC_TC_GADE;
> +			else
> +				tc &= ~RISCV_IOMMU_DC_TC_GADE;
> +			WRITE_ONCE(dc->tc, tc);

I'm pretty sure you don't need to do this. Just preset GADE when ever
a S2 domain is attached, rely on the pre-set D to avoid any HW cost
and you are fine. No need to change it dynamically unless something is
reall weird about riscv.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

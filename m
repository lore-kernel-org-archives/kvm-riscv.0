Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5D5CAC5AC
	for <kvm-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 16:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egALi1gvI/B0htnpeD3yzNPy50jJvhwJewSxGIh1Smc=; b=PaDfvzFYQj+0S2
	IgbjEWGhIfk5Pho1rThOK03ly9pBEsEQgwIqCEhqN6Fxv7mm+67kyzZaTrDlUzld3Fi+hrN950yf/
	xeoWcmebgGYSaYMTxndNaXtbjyVMZWFBRPOcmgRBhc3AYf1mwJcS8cEm3BNDGC/NKdELUCvuiH6Aw
	mW2v43YWnLw2M3kQ0abhj/2pV04MlHXmP7gYxhYF1W8NjUhqIr96HTgT/kjgSSsard3m7nJ97poPg
	Wf5ufLODt1cy2STuEhnn6ieSwVB9LmlCZCFgEEBpihqVtyWiYldxpHCxVO03Zsc2lGZJ58BcQxbd2
	5pdYP+SrCYjCG2CHy2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15xc-0000000EHNN-3vsc;
	Tue, 23 Sep 2025 16:33:48 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15xa-0000000EHMI-1ViJ
	for kvm-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 16:33:47 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-74f6974175dso24175757b3.3
        for <kvm-riscv@lists.infradead.org>; Tue, 23 Sep 2025 09:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758645225; x=1759250025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HuFofpSTnN4OjG4be97xyIzqOCkiDml5pbTJvbN5Wpk=;
        b=b514rOYXFZiOBGGNh6qh65xwo/Cihf94VaJzuidmuXiHGQ+L27r2vLinhIJbonHmAP
         OmO8szhnkkxsu18lAXvDCHucR+1Q8qoTzBdxP6nZc0ZZ41borKqyKkDnTmU8VNoe/704
         H2ZnGduTvDX1ZPmeeB/k8YYCiw4DVuyHg1UncngVPCIrUkD1rJGWP3pl11TZJ7Ie8KLf
         IVI4tmakHzUvbttMw4i1VCECqAXXDvVikZPtPwEQZz9tNwaFvZevMJ6uMcd3KYiS+4Sm
         yIY5pSh6/PbeFWIR6oek3BVLbdYVsCqTfhrGxGzB0lprlLv+SRrmeqkAkqfx4Dk9EGKx
         mpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758645225; x=1759250025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuFofpSTnN4OjG4be97xyIzqOCkiDml5pbTJvbN5Wpk=;
        b=TsQaN2N3h0f/tS0wL8gzDZnAyRSxjWJZwcvMCEGIP6WgH2LzSpXeIj+Wgu3BK/WvWq
         0iFGXVNuxuRbNWIeuT49cPuDl7BAtqVqvcUC/k7RX9VLX6shMc2xhXJmVD9TvuwVZJP0
         NQ9ypXdVanlx/CnMD/tpwfj9T5/OEymcbjg2lv2IqZvBVYWDdMtl/sGS23aDRN0CwqVE
         PnWukzJ1rSclgRkDScsPpgr34QnWOj3c/+nwb1Yi+ejRMMeunrOE8iNIOWDJ0EOiTNVg
         zi+Rg3i0aE/lnhjb4S9cEZAVXJXJDMDcDhQxqsqmH8lDNKgX9H6E0hXadExTQLEX3xUi
         zjZg==
X-Forwarded-Encrypted: i=1; AJvYcCW/IjaRN9ReGA0vtVtM3KvCfCZ6ja6jQdcIOyRvsMCGxNV3dPztJlJ7T57ZRm+h8Q2SSC1qoeFm62w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAEVcsJy6AZ13UdEe6j4ep0CAYlN9uvODjnwQz1/GXuGV088cy
	0FsFjFXO+EDsgiWVna3vbwe2A1g/XVUgY8iO/n7SQBe11lpRZwNeQhhYKIrwC01ha24=
X-Gm-Gg: ASbGncvj9NncEOxNht7YTKfpIXqgSX9diJ3HK1lOKry5DXUvfoyjbTznOBe3dMbz2L8
	5ZT6ABf9EOA2EsS4YI+sjS+Xr+5mpLjjaiqMOSi5TSFSwJa6guaRCvyb+siZUk4N1jj2DgOwqEJ
	zdYHPOWEj+/DJchVl7P5xQ6bwZ03sqOJMKBpQFmGjiwAMvUVh2XoiEXWqYGkhjCBZiySvmu7efg
	GSe+GK9cD8ZybAXY56NI+BmTI/0IjclWmOJaCL++UjxA2IpkdFZTVxCyyB+XvK4hHMgOsx0+8aD
	QwrXHtP3XWBP6AY4a7N9q6RXtwOOuS3F9a95AMUD55SeRp3O8PyGk6gQfp4KlZoPVXzjvgpDEqG
	5nb30tahnaKoqZqfjiKa4X0uQ
X-Google-Smtp-Source: AGHT+IGyFJgN6kHMNR99pNNeUGyYQV7NjbzXwXp+jyWzlg7CQqiV9MLuyd92oRaiCpm+ej3PcaWTng==
X-Received: by 2002:a05:690e:42d7:b0:633:b25a:f02f with SMTP id 956f58d0204a3-636045dd18cmr2177609d50.20.1758645224864;
        Tue, 23 Sep 2025 09:33:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-eb366bbfb29sm501295276.25.2025.09.23.09.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 09:33:44 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:33:43 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC
 access
Message-ID: <20250923-b2caf55f4f87f05aaa619e0b@orel>
References: <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com>
 <20250922-50372a07397db3155fec49c9@orel>
 <20250922235651.GG1391379@nvidia.com>
 <87ecrx4guz.ffs@tglx>
 <20250923140646.GM1391379@nvidia.com>
 <20250923-b85e3309c54eaff1cdfddcf9@orel>
 <20250923152702.GB2608121@nvidia.com>
 <20250923-e459316700c55d661c060b08@orel>
 <20250923162302.GC2608121@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923162302.GC2608121@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_093346_398914_A078B3A3 
X-CRM114-Status: GOOD (  22.40  )
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

On Tue, Sep 23, 2025 at 01:23:02PM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 23, 2025 at 10:50:56AM -0500, Andrew Jones wrote:
> > Yes, this is the part that I'd like to lean on you for, since I understand
> > we want to avoid too much KVM/virt special casing for VFIO/IOMMUFD. I was
> > thinking that if I bit the bullet and implemented nested support than when
> > nesting was selected it would be apparent we're in virt context. However,
> > I was hoping to pull together a solution that works with current QEMU and
> > VFIO too.
> 
> You probably do have to make nested part of this, but I don't have a
> clear picture how you'd tie all the parts together through the nested
> API..
> 
> Somehow you have to load a msiptp that is effectively linked to the
> KVM reliably into the DC for the iommufd controlled devices that are
> linked to that KVM. Then synchronize with VFIO that this is done and
> it can setup KVM only interrupts somehow. This kvm entanglement is the
> "virt" you have mentioned many times.

Yes, the VFIO+KVM irqbypass framework currently provides much of this
support (which patches 10-17 of this series leverage). But, if using
nested is necessary in order to "signal" to the relevant subsystems that
the device's irqs will truly be isolated, then I'll need to start figuring
out how iommufd can fit into the mix (or if we'll need an iommufd-specific
implementation for a new mix).

> 
> The direct injection interrupt path is already quite a confusing
> thing..

No argument there :-)

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

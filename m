Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29C6CA100F
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 21:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OfMeEDy5g6Jp2qGfN3dxXRVuDlHCdX0ADA4p3YCszCQ=; b=zeh+X824yAzFEc
	eKbXba0We4898e2fyMPljxLXrx5QhiIItgFrPt3pwhvRJ08V0ZA3GuFiWg4ay0HMILNrdwNV8v18a
	tq0X2Yl9gvNq7mC2Cyhe9xxm0f8godoOI/lBlyvViYq2g+lAmHqeVeOjGWvwRQi2TictFyY6Qe088
	UcG3fsBUvF1Dl3c31iO4rZxkqLWMfQgN/TWyIrvRzcVFjqCMVlr3aXxNSM6BmoolWrm5SiGSmxVsQ
	0n2dfb27IlPYu9kwk184tbB20d6+jGJbhjkBkAe/urvQjanZchVYl8MvP1yp2uru3wrEqWmUmsJSo
	GbbCAwej4HfsIddVcGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nxp-0000000BYKX-0KMg;
	Mon, 22 Sep 2025 21:20:49 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nxm-0000000BYJK-3ERU
	for kvm-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 21:20:48 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-73b4e3d0756so38250567b3.3
        for <kvm-riscv@lists.infradead.org>; Mon, 22 Sep 2025 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758576045; x=1759180845; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=onj4yFqllMzEveOUk9DfiKAf4L6zZPOcmFKF8e4Prmo=;
        b=nQ9ZXxX+m7iwWblj5R2iI64fN/b6iPF1jsLQPcEP6TifL3BXKfqDkVrX4aTSFJb1ey
         47yDP9sNIRJcO5W6JsJY+Zuyf5NBtGXl8SPt1F3K9FtBqyDkMRYkJs/2U0wX4jd08JeE
         CIn2eznjfNFJFCpPvNzEnB5FdMcZMgzM9826ATaNvNYHiEYmTtnLHDtvrXMb9UZ6mvAH
         aMnFQ3Tj5QyC+9/4A3VO6HTx2MUFl3Mfit0wBmtfoIXAhXZRL6aCmJVT7RtXBuQAGv4b
         S0p83HjbNZfRvpwzMw7a9AlQ89Pvw1Okt5sdOLg43wrs8t2+b3qRhXpPia+yD0on3IYz
         b47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758576045; x=1759180845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onj4yFqllMzEveOUk9DfiKAf4L6zZPOcmFKF8e4Prmo=;
        b=q203Ruxj3iO5TyOQGfNqcESz0iv9+L2v3xk0d1KgI6gMEBUIsJRVQ/ruINyMLeUi1s
         W24rcSlAKpm2aF4YJI3Vv9w1W4Tlu3Fb58LwFW+1xtSarLpL1dgiiQKKd6MUXYx+blXw
         /COOIheJj88uPBA9I3DXxnoaxp2pHD+/wQ39Ac2E1dmUJr3z4s25f2dqc/gQPLUxwRwf
         S52X7x6yWp+Jp6XtfSpWLF+7zGlaAecFCXC8rkotD85L6w4eoDOkjzZ/j9K7gUEjxABA
         0Ex7oypjgDT394nWvVrCduhtmcHi/trgOX1GHeSZKJDhkbdXUREpD/JvIX6Hnls09S3a
         RbgA==
X-Forwarded-Encrypted: i=1; AJvYcCUVjuDMgN6O5ApajSb34+d0ZX4FjNo8sVmcHBrDz+9eACfv4zS91P3MpK48bGBwJxQYc81zkD1g2Eo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yygy8sLq8BGf0ESDjNge2vbIH8lDTsFcbnQe5XbeYVNRcAeFSwS
	F9LAdNlfAs4lWmVj9P9DRR/9uIgXJENGx8VCwgsbNdS8VATI3uHbGZLgHZpvXZYPqZo=
X-Gm-Gg: ASbGncuS+0uHp9x2Ogw5PAmRXHeVff+d3UUJo8qGfUEgeIbQZWCI/KrhChBt08x1971
	+H0jwnFYrqVGOiGXmqI++dYT3idsh44dTacC0hhbMtjIIdiZ2nBtvLOUlKtp6aTyfNDdaX/CsIK
	5ZJNLOP9B+pibiFpbnmE/cxdpmc7GoLNQBA7hGJa++NOXBHGBwhWV8kGOocWqYBVHNR1UxOdFHF
	lmlqEUohWhTwGXHfzQlBDkZmptOeKJfKN4xv4Jzro5XQ7bpw73bw1o2ENxfhACPfEcqDTpEr80m
	0xqgKWV91bxTbEFXjZNw+TfoWM0Hb4mND4/ALkJ7ez73Yh87+3Hr5AFk46xGF259FvRSa5nhLja
	OMx5FhXTdW/zoznK5l+kNt5pT
X-Google-Smtp-Source: AGHT+IEkvQZ5SylVDHV/m2S+NTAyd5wvsiLsp5Pptg5UwT2UN0VbvwmLcskjGP4MQTxbjIrmiAtKRQ==
X-Received: by 2002:a05:690c:4b03:b0:722:6f24:6293 with SMTP id 00721157ae682-758a2d07fd7mr1394647b3.32.1758576045119;
        Mon, 22 Sep 2025 14:20:45 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-633bcce7089sm4581523d50.5.2025.09.22.14.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 14:20:44 -0700 (PDT)
Date: Mon, 22 Sep 2025 16:20:43 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, tglx@linutronix.de, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC
 access
Message-ID: <20250922-50372a07397db3155fec49c9@orel>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250922184336.GD1391379@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_142046_815731_269D79C9 
X-CRM114-Status: GOOD (  48.03  )
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

On Mon, Sep 22, 2025 at 03:43:36PM -0300, Jason Gunthorpe wrote:
> On Sat, Sep 20, 2025 at 03:38:58PM -0500, Andrew Jones wrote:
> > When setting irq affinity extract the IMSIC address the device
> > needs to access and add it to the MSI table. If the device no
> > longer needs access to an IMSIC then remove it from the table
> > to prohibit access. This allows isolating device MSIs to a set
> > of harts so we can now add the IRQ_DOMAIN_FLAG_ISOLATED_MSI IRQ
> > domain flag.
> 
> IRQ_DOMAIN_FLAG_ISOLATED_MSI has nothing to do with HARTs.
> 
>  * Isolated MSI means that HW modeled by an irq_domain on the path from the
>  * initiating device to the CPU will validate that the MSI message specifies an
>  * interrupt number that the device is authorized to trigger. This must block
>  * devices from triggering interrupts they are not authorized to trigger.
>  * Currently authorization means the MSI vector is one assigned to the device.

Unfortunately the RISC-V IOMMU doesn't have support for this. I've raised
the lack of MSI data validation to the spec writers and I'll try to raise
it again, but I was hoping we could still get IRQ_DOMAIN_FLAG_ISOLATED_MSI
by simply ensuring the MSI addresses only include the affined harts (and
also with the NOTE comment I've put in this patch to point out the
deficiency).

> 
> It has to do with each PCI BDF having a unique set of
> validation/mapping tables for MSIs that are granular to the interrupt
> number.

Interrupt numbers (MSI data) aren't used by the RISC-V IOMMU in any way.

> 
> As I understand the spec this is is only possible with msiptp? As
> discussed previously this has to be a static property and the SW stack
> doesn't expect it to change. So if the IR driver sets
> IRQ_DOMAIN_FLAG_ISOLATED_MSI it has to always use misptp?

Yes, the patch only sets IRQ_DOMAIN_FLAG_ISOLATED_MSI when the IOMMU
has RISCV_IOMMU_CAPABILITIES_MSI_FLAT and it will remain set for the
lifetime of the irqdomain, no matter how the IOMMU is being applied.

> 
> Further, since the interrupt tables have to be per BDF they cannot be
> linked to an iommu_domain! Storing the msiptp in an iommu_domain is
> totally wrong?? It needs to somehow be stored in the interrupt layer
> per-struct device, check how AMD and Intel have stored their IR tables
> programmed into their versions of DC.

The RISC-V IOMMU MSI table is simply a flat address remapping table,
which also has support for MRIFs. The table indices come from an
address matching mechanism used to filter out invalid addresses and
to convert valid addresses into MSI table indices. IOW, the RISC-V
MSI table is a simple translation table, and even needs to be tied to
a particular DMA table in order to work. Here's some examples

1. stage1 not BARE
------------------

      stage1     MSI table
 IOVA ------> A  ---------> host-MSI-address

2. stage1 is BARE, for example if only stage2 is in use
-------------------------------------------------------

           MSI table
 IOVA == A ---------> host-MSI-address

When used by the host A == host-MSI-address, but at least we can block
the write when an IRQ has been affined to a set of harts that doesn't
include what it's targeting. When used for irqbypass A == guest-MSI-
address and the host-MSI-address will be that of a guest interrupt file.
This ensures a device assigned to a guest can only reach its own vcpus
when sending MSIs.

In the first example, where stage1 is not BARE, the stage1 page tables
must have some IOVA->A mapping, otherwise the MSI table will not get
a chance to do a translation, as the stage1 DMA will fault. This
series ensures stage1 gets an identity mapping for all possible MSI
targets and then leaves it be, using the MSI tables instead for the
isolation.

I don't think we can apply a lot of AMD's and Intel's model to RISC-V.

> 
> It looks like there is something in here to support HW that doesn't
> have msiptp? That's different, and also looks very confused.

The only support is to ensure all the host IMSICs are mapped, otherwise
we can't turn on IOMMU_DMA since all MSI writes will cause faults. We
don't set IRQ_DOMAIN_FLAG_ISOLATED_MSI in this case, though, since we
don't bother unmapping MSI addresses of harts that IRQs have be un-
affined from.

> The IR
> driver should never be touching the iommu domain or calling iommu_map!

As pointed out above, the RISC-V IR is quite a different beast than AMD
and Intel. Whether or not the IOMMU has MSI table support, the IMSICs
must be mapped in stage1, when stage1 is not BARE. So, in both cases we
roll that mapping into the IR code since there isn't really any better
place for it for the host case and it's necessary for the IR code to
manage it for the virt case. Since IR (or MSI delivery in general) is
dependent upon the stage1 page tables, then it's necessary to be tied to
the same IOMMU domain that those page tables are tied to. Patch4's changes
to riscv_iommu_attach_paging_domain() and riscv_iommu_iodir_update() show
how they're tied together.

> Instead it probably has to use the SW_MSI mechanism to request mapping
> the interrupt controller aperture. You don't get
> IRQ_DOMAIN_FLAG_ISOLATED_MSI with something like this though. Look at
> how ARM GIC works for this mechanism.

I'm not seeing how SW_MSI will help here, but so far I've just done some
quick grepping and code skimming.

> 
> Finally, please split this series up, if ther are two different ways
> to manage the MSI aperture then please split it into two series with a
> clear description how the HW actually works.
> 
> Maybe start with the simpler case of no msiptp??

The first five patches plus the "enable IOMMU_DMA" will allow paging
domains to be used by default, while paving the way for patches 6-8 to
allow host IRQs to be isolated to the best of our ability (only able to
access IMSICs to which they are affined). So we could have

series1: irqdomain + map all imsics + enable IOMMU_DMA
series2: actually apply irqdomain in order to implement map/unmap of MSI
         ptes based on IRQ affinity - set IRQ_DOMAIN_FLAG_ISOLATED_MSI,
         because that's the best we've got...
series3: the rest of the patches of this series which introduce irqbypass
         support for the virt use case

Would that be better? Or do you see some need for some patch splits as
well?

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

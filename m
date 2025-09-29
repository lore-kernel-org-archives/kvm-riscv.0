Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2A0CAC5B9
	for <kvm-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rYXatEQgDnvXgluG4icyNAGpNs67UwCvZ2ketHOD4s=; b=BpUuMMBa3iSu8r
	XGTOl4vf0wu83l+qWZKubDNE5BxZGNElLgsKfSuGWQLAMjj/rjz2hTA65Exom/QPAyF+pzvlXrEMj
	U+Gay9l5sgCCYIObAL8OSLfnDNKRoF78F/ic/MA4dNR9svgHFWVpHIWQYQj6bgsQ/4Ks3xLv31/Ob
	Z6cG7LYFGz6/Fs7Y41p0khsLWZJt+gmw8nluccLbpfhqXazD0fl8JT1uZjsJMLUxMVNJFitlP6ARy
	UyISSRj4Nf+ZO4Tmy9nql/Et3Csb199QpxNpx3d7YjidRSp2JTpBqIJwIuw0U6xa8DhDRRZ3UuG6w
	7O0gHm1df0TKHlu1qsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G9M-00000002pwq-1HBR;
	Mon, 29 Sep 2025 15:50:52 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G9I-00000002puM-2EPO
	for kvm-riscv@lists.infradead.org;
	Mon, 29 Sep 2025 15:50:51 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-92aee734585so36335439f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 29 Sep 2025 08:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759161047; x=1759765847; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=thl1botW/6JnUO3NJgzLyWhXcvMbSjUKSouz8HBMgL8=;
        b=JvcUa06hKPS1eIKw/vqQEIgK7mfgDVAH6s98zvwqcEQ4r590IPlxyEXcE0jlRjmTJ/
         qODcHg484U5gFrYJvYHc2c3+3D2ku1Jtj8KE/lO3NpVV2xrJxHCKMPjCUfp1isJderBj
         4sIajUd+8PTs/GmStFtHXTX8DPrWoidCHYzAjtJoolOEy9l3q9AmzX3FuWcXZK3AJKWO
         zfgc+8qZce+scc98vQ7fsvYI6jcwow/U0v7IOfqCHVQXUTy+0JFVzmtnMTcyNbLxCivm
         I9/6FxBaSoPbiPuvrZGxeXPn4yTNhhGDfTitlbjhlwqSC//DPKZouy6H4MTivFDCah8v
         W72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759161047; x=1759765847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thl1botW/6JnUO3NJgzLyWhXcvMbSjUKSouz8HBMgL8=;
        b=l9BINYU+gJZzPgSfAGWk4R3Ax9RwYIVBsa2EffcgGIRo3v0I7yswYL6ydAkDP6hdHf
         NDic/XX6rLyy2v4oFURIcrA5vlRKtf1+grM+C6w6QfK4FKug2ngAJSVAr5rHwpkZrjH/
         5L5vdgsJRvsRCIz237xng6gGmNE5+6Yzt89psMqiIals2Q5rVJ+6iKMhnh5T0d9BVzRP
         ltxqPoQHfxOJlgkfIVbRD9Un3oPEb3nxQ4phVuuCSMfOFvsjNBHuikw94coshpqrxQw8
         IHTJLLjiX/LCffpf6a2VOYpr7jdcdTvh3tjzoe96kq2M4Y+0vhQNxBFKxQyrS4AObovb
         lSwg==
X-Forwarded-Encrypted: i=1; AJvYcCUUHaFBCTN+2VBtBCFeeKTDpCJxrFI8zdKUMgmwzPfvK6FK8fxo/98INcdVLIf/baPgDKSHisYnjVo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSYrFrbcZl/rFN15FNGfZcU3OmwuPwIAXorYDeTNLzHXPGiIDp
	zFH8NZ7a2OX+rmlgQi5T1FZNibpnoypz6IQFGSKKUQ8F92b5PLDkCkrgPcBfsv4K1CE=
X-Gm-Gg: ASbGncsoHHvQoaeD0aX1aICl1Eaq0PbBEjUW9Q00v8y2pNaF1xRFznMxprSlMaWtPOC
	XOlxiXDu+obAL2ApblJ5aUKjS4E49SFtUVCRNh0o8KunICEpZOmURyCoWhVzm4856nVLXUfRNta
	Z2VwLqhVePblM2brYrGmRMHh4pW9KMMjPCfpqQCVxcIxPEJ9gozHp1aw3STmR6OIvvkMiRGg677
	1wFBBM3Vag1d2e5dqp5g8MMBRYkzTeWcI2zkZ93Rd9pQJ/TnK2iwFoRiBBFBaC1gwgIOYH9D79/
	3t6MLnpZ9PCSVbzi2PJO7ZPhRbS1KJlpndNjqBcgDCBY8ltls09O0u+MWM81F5Lg+oiH7VKHER5
	ddYjbjSkRkyyuhoMYmLupUh24
X-Google-Smtp-Source: AGHT+IH7gk327UmY6C6eScZpxHXRC9XJhlTFKO90VrWRwUWHG19VAOUZaRB2R9AE7aS+Xnm+h8Ln6w==
X-Received: by 2002:a05:6602:341e:b0:928:c6cc:3b1a with SMTP id ca18e2360f4ac-928c6cc3cbfmr562321039f.18.1759161047242;
        Mon, 29 Sep 2025 08:50:47 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6a5ae2c1sm4845167173.63.2025.09.29.08.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 08:50:46 -0700 (PDT)
Date: Mon, 29 Sep 2025 10:50:45 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: "Nutty.Liu" <nutty.liu@hotmail.com>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jgg@nvidia.com, zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	tglx@linutronix.de, alex.williamson@redhat.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 04/18] iommu/riscv: Add IRQ domain for interrupt
 remapping
Message-ID: <20250929-816b2ab17977ffa1b9687fe2@orel>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-24-ajones@ventanamicro.com>
 <TY1PPFCDFFFA68A1C49C083357FF49575AEF318A@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY1PPFCDFFFA68A1C49C083357FF49575AEF318A@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085048_577887_A43ADE1C 
X-CRM114-Status: GOOD (  31.32  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Sep 28, 2025 at 05:30:26PM +0800, Nutty.Liu wrote:
> =

> On 9/21/2025 4:38 AM, Andrew Jones wrote:
> > This is just a skeleton. Until irq-set-affinity functions are
> > implemented the IRQ domain doesn't serve any purpose.
> > =

> > Signed-off-by: Andrew Jones<ajones@ventanamicro.com>
> > ---
> >   drivers/iommu/riscv/Makefile   |   2 +-
> >   drivers/iommu/riscv/iommu-ir.c | 114 +++++++++++++++++++++++++++++++++
> >   drivers/iommu/riscv/iommu.c    |  36 +++++++++++
> >   drivers/iommu/riscv/iommu.h    |  12 ++++
> >   4 files changed, 163 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/iommu/riscv/iommu-ir.c
> > =

> > diff --git a/drivers/iommu/riscv/Makefile b/drivers/iommu/riscv/Makefile
> > index b5929f9f23e6..9c83f877d50f 100644
> > --- a/drivers/iommu/riscv/Makefile
> > +++ b/drivers/iommu/riscv/Makefile
> > @@ -1,3 +1,3 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> > -obj-y +=3D iommu.o iommu-platform.o
> > +obj-y +=3D iommu.o iommu-ir.o iommu-platform.o
> >   obj-$(CONFIG_RISCV_IOMMU_PCI) +=3D iommu-pci.o
> > diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu=
-ir.c
> > new file mode 100644
> > index 000000000000..08cf159b587d
> > --- /dev/null
> > +++ b/drivers/iommu/riscv/iommu-ir.c
> > @@ -0,0 +1,114 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * IOMMU Interrupt Remapping
> > + *
> > + * Copyright =A9 2025 Ventana Micro Systems Inc.
> > + */
> > +#include <linux/irqdomain.h>
> > +#include <linux/msi.h>
> > +
> > +#include "iommu.h"
> > +
> > +static struct irq_chip riscv_iommu_ir_irq_chip =3D {
> > +	.name			=3D "IOMMU-IR",
> > +	.irq_ack		=3D irq_chip_ack_parent,
> > +	.irq_mask		=3D irq_chip_mask_parent,
> > +	.irq_unmask		=3D irq_chip_unmask_parent,
> > +	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
> > +};
> > +
> > +static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irq=
domain,
> > +						unsigned int irq_base, unsigned int nr_irqs,
> > +						void *arg)
> > +{
> > +	struct irq_data *data;
> > +	int i, ret;
> > +
> > +	ret =3D irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, ar=
g);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (i =3D 0; i < nr_irqs; i++) {
> > +		data =3D irq_domain_get_irq_data(irqdomain, irq_base + i);
> Nitpick:=A0 Would it be better to check if 'data' is NULL ?

A null irq-data here would imply a bug in the irq domain hierarchy
implementation and warrant a BUG_ON for the response. But, a null
dereference should give us the same backtrace, so I think we're OK
to leave things as they are.

> =

> > +		data->chip =3D &riscv_iommu_ir_irq_chip;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct irq_domain_ops riscv_iommu_ir_irq_domain_ops =3D {
> > +	.alloc =3D riscv_iommu_ir_irq_domain_alloc_irqs,
> > +	.free =3D irq_domain_free_irqs_parent,
> > +};
> > +
> > +static const struct msi_parent_ops riscv_iommu_ir_msi_parent_ops =3D {
> > +	.prefix			=3D "IR-",
> > +	.supported_flags	=3D MSI_GENERIC_FLAGS_MASK |
> > +				  MSI_FLAG_PCI_MSIX,
> > +	.required_flags		=3D MSI_FLAG_USE_DEF_DOM_OPS |
> > +				  MSI_FLAG_USE_DEF_CHIP_OPS |
> > +				  MSI_FLAG_PCI_MSI_MASK_PARENT,
> > +	.chip_flags		=3D MSI_CHIP_FLAG_SET_ACK,
> > +	.init_dev_msi_info	=3D msi_parent_init_dev_msi_info,
> > +};
> > +
> > +struct irq_domain *riscv_iommu_ir_irq_domain_create(struct riscv_iommu=
_device *iommu,
> > +						    struct device *dev,
> > +						    struct riscv_iommu_info *info)
> > +{
> > +	struct irq_domain *irqparent =3D dev_get_msi_domain(dev);
> > +	struct irq_domain *irqdomain;
> > +	struct fwnode_handle *fn;
> > +	char *fwname;
> > +
> > +	fwname =3D kasprintf(GFP_KERNEL, "IOMMU-IR-%s", dev_name(dev));
> > +	if (!fwname)
> > +		return NULL;
> > +
> > +	fn =3D irq_domain_alloc_named_fwnode(fwname);
> > +	kfree(fwname);
> > +	if (!fn) {
> > +		dev_err(iommu->dev, "Couldn't allocate fwnode\n");
> > +		return NULL;
> > +	}
> > +
> > +	irqdomain =3D irq_domain_create_hierarchy(irqparent, 0, 0, fn,
> > +						&riscv_iommu_ir_irq_domain_ops,
> > +						info);
> > +	if (!irqdomain) {
> > +		dev_err(iommu->dev, "Failed to create IOMMU irq domain\n");
> > +		irq_domain_free_fwnode(fn);
> > +		return NULL;
> > +	}
> > +
> > +	irqdomain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
> > +	irqdomain->msi_parent_ops =3D &riscv_iommu_ir_msi_parent_ops;
> > +	irq_domain_update_bus_token(irqdomain, DOMAIN_BUS_MSI_REMAP);
> > +
> > +	dev_set_msi_domain(dev, irqdomain);
> > +
> > +	return irqdomain;
> > +}
> > +
> > +void riscv_iommu_ir_irq_domain_remove(struct riscv_iommu_info *info)
> > +{
> > +	struct fwnode_handle *fn;
> > +
> > +	if (!info->irqdomain)
> > +		return;
> > +
> > +	fn =3D info->irqdomain->fwnode;
> > +	irq_domain_remove(info->irqdomain);
> > +	info->irqdomain =3D NULL;
> > +	irq_domain_free_fwnode(fn);
> > +}
> > +
> > +int riscv_iommu_ir_attach_paging_domain(struct riscv_iommu_domain *dom=
ain,
> > +					struct device *dev)
> > +{
> > +	return 0;
> > +}
> > +
> > +void riscv_iommu_ir_free_paging_domain(struct riscv_iommu_domain *doma=
in)
> > +{
> > +}
> > diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> > index a44c67a848fa..db2acd9dc64b 100644
> > --- a/drivers/iommu/riscv/iommu.c
> > +++ b/drivers/iommu/riscv/iommu.c
> > @@ -17,6 +17,8 @@
> >   #include <linux/init.h>
> >   #include <linux/iommu.h>
> >   #include <linux/iopoll.h>
> > +#include <linux/irqchip/riscv-imsic.h>
> > +#include <linux/irqdomain.h>
> >   #include <linux/kernel.h>
> >   #include <linux/pci.h>
> > @@ -1026,6 +1028,9 @@ static void riscv_iommu_iodir_update(struct riscv=
_iommu_device *iommu,
> >   		WRITE_ONCE(dc->fsc, new_dc->fsc);
> >   		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
> > +		WRITE_ONCE(dc->msiptp, new_dc->msiptp);
> > +		WRITE_ONCE(dc->msi_addr_mask, new_dc->msi_addr_mask);
> > +		WRITE_ONCE(dc->msi_addr_pattern, new_dc->msi_addr_pattern);
> Since the MSI page table pointer (msiptp) has been changed,
> should all cache entries from this MSI page table need to be invalidated ?

That's a good question and I need to bang my head against the spec some
more for it. The invalidation guidance for a device context states that
an iotinval.gvma is only needed when dc.iohgatp.mode is not bare (and
currently it's always bare). However, the msi table needs an iotinval.gvma
(whether or not dc.iohgatp.mode is bare). So, as you suggest, I think we
need it and the spec could probably use some clarification.

> =

> Otherwise,
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

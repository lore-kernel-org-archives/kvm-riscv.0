From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 18 Nov 2024 14:43:36 -0400
Subject: [RFC PATCH 08/15] iommu/riscv: Add IRQ domain for interrupt
 remapping
In-Reply-To: <20241114161845.502027-25-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
Message-ID: <20241118184336.GB559636@ziepe.ca>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 14, 2024 at 05:18:53PM +0100, Andrew Jones wrote:
> @@ -1276,10 +1279,30 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>  	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>  	struct riscv_iommu_dc dc = {0};
> +	int ret;
>  
>  	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
>  		return -ENODEV;
>  
> +	if (riscv_iommu_bond_link(domain, dev))
> +		return -ENOMEM;
> +
> +	if (iommu_domain->type == IOMMU_DOMAIN_UNMANAGED) {

Drivers should not be making tests like this.

> +		domain->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
> +						RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
> +		if (domain->gscid < 0) {
> +			riscv_iommu_bond_unlink(domain, dev);
> +			return -ENOMEM;
> +		}
> +
> +		ret = riscv_iommu_irq_domain_create(domain, dev);
> +		if (ret) {
> +			riscv_iommu_bond_unlink(domain, dev);
> +			ida_free(&riscv_iommu_gscids, domain->gscid);
> +			return ret;
> +		}
> +	}

What are you trying to do? Make something behave different for VFIO?
That isn't OK, we are trying to remove all the hacky VFIO special
cases in drivers.

What is the HW issue here? It is very very strange (and probably not
going to work right) that the irq domains change when domain
attachment changes.

The IRQ setup should really be fixed before any device drivers probe
onto the device.

Jason


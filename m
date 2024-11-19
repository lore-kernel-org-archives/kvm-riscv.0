From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 19 Nov 2024 09:28:46 +0100
Subject: [RFC PATCH 04/15] iommu/riscv: report iommu capabilities
In-Reply-To: <ddd40bc3-7f2a-43c2-8918-a10c63bd05ba@arm.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-21-ajones@ventanamicro.com>
 <ddd40bc3-7f2a-43c2-8918-a10c63bd05ba@arm.com>
Message-ID: <20241119-76c9ff71b8834ef886b3ca86@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 15, 2024 at 03:20:36PM +0000, Robin Murphy wrote:
> On 14/11/2024 4:18 pm, Andrew Jones wrote:
> > From: Tomasz Jeznach <tjeznach@rivosinc.com>
> > 
> > Report RISC-V IOMMU capabilities required by VFIO subsystem
> > to enable PCIe device assignment.
> 
> IOMMU_CAP_DEFERRED_FLUSH has nothing at all to do with VFIO. As far as I can
> tell from what's queued, riscv_iommu_unmap_pages() isn't really implementing
> the full optimisation to get the most out of it either.

Thanks, Robin. I'll drop this cap for the next version.

> 
> I guess IOMMU_CAP_CACHE_COHERENCY falls out of the assumption of a coherent
> IOMMU and lack of PBMT support making everything implicitly IOMMU_CACHE all
> the time whether you want it or not, but clarifying that might be nice
> (especially since there's some chance that something will eventually come
> along to break it...)

Yes, riscv selects ARCH_DMA_DEFAULT_COHERENT and the riscv IOMMU hardware
descriptions don't provide any way to say otherwise. I can put a comment
above the IOMMU_CAP_CACHE_COHERENCY case which states "The RISC-V IOMMU is
always DMA cache coherent", or did you have something else in mind?

Thanks,
drew

> 
> Thanks,
> Robin.
> 
> > Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >   drivers/iommu/riscv/iommu.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> > index 8a05def774bd..3fe4ceba8dd3 100644
> > --- a/drivers/iommu/riscv/iommu.c
> > +++ b/drivers/iommu/riscv/iommu.c
> > @@ -1462,6 +1462,17 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
> >   	return generic_device_group(dev);
> >   }
> > +static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
> > +{
> > +	switch (cap) {
> > +	case IOMMU_CAP_CACHE_COHERENCY:
> > +	case IOMMU_CAP_DEFERRED_FLUSH:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> >   static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
> >   {
> >   	return iommu_fwspec_add_ids(dev, args->args, 1);
> > @@ -1526,6 +1537,7 @@ static void riscv_iommu_release_device(struct device *dev)
> >   static const struct iommu_ops riscv_iommu_ops = {
> >   	.pgsize_bitmap = SZ_4K,
> >   	.of_xlate = riscv_iommu_of_xlate,
> > +	.capable = riscv_iommu_capable,
> >   	.identity_domain = &riscv_iommu_identity_domain,
> >   	.blocked_domain = &riscv_iommu_blocking_domain,
> >   	.release_domain = &riscv_iommu_blocking_domain,


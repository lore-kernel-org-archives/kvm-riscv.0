From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 19 Nov 2024 16:03:05 +0100
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_08/15=5D_iommu/riscv=3A_A?=
 =?US-ASCII?Q?dd_IRQ_domain_for_interrupt_remapping?=
In-Reply-To: <20241119140047.GC559636@ziepe.ca>
References: <20241114161845.502027-17-ajones@ventanamicro.com> <20241114161845.502027-25-ajones@ventanamicro.com> <20241118184336.GB559636@ziepe.ca> <20241119-62ff49fc1eedba051838dba2@orel> <20241119140047.GC559636@ziepe.ca>
Message-ID: <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On November 19, 2024 3:00:47 PM GMT+01:00, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>On Tue, Nov 19, 2024 at 08:49:37AM +0100, Andrew Jones wrote:
>> On Mon, Nov 18, 2024 at 02:43:36PM -0400, Jason Gunthorpe wrote:
>> > On Thu, Nov 14, 2024 at 05:18:53PM +0100, Andrew Jones wrote:
>> > > @@ -1276,10 +1279,30 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>> > >  	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>> > >  	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>> > >  	struct riscv_iommu_dc dc = {0};
>> > > +	int ret;
>> > >  
>> > >  	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
>> > >  		return -ENODEV;
>> > >  
>> > > +	if (riscv_iommu_bond_link(domain, dev))
>> > > +		return -ENOMEM;
>> > > +
>> > > +	if (iommu_domain->type == IOMMU_DOMAIN_UNMANAGED) {
>> > 
>> > Drivers should not be making tests like this.
>> > 
>> > > +		domain->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
>> > > +						RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
>> > > +		if (domain->gscid < 0) {
>> > > +			riscv_iommu_bond_unlink(domain, dev);
>> > > +			return -ENOMEM;
>> > > +		}
>> > > +
>> > > +		ret = riscv_iommu_irq_domain_create(domain, dev);
>> > > +		if (ret) {
>> > > +			riscv_iommu_bond_unlink(domain, dev);
>> > > +			ida_free(&riscv_iommu_gscids, domain->gscid);
>> > > +			return ret;
>> > > +		}
>> > > +	}
>> > 
>> > What are you trying to do? Make something behave different for VFIO?
>> > That isn't OK, we are trying to remove all the hacky VFIO special
>> > cases in drivers.
>> > 
>> > What is the HW issue here? It is very very strange (and probably not
>> > going to work right) that the irq domains change when domain
>> > attachment changes.
>> > 
>> > The IRQ setup should really be fixed before any device drivers probe
>> > onto the device.
>> 
>> I can't disagree with the statement that this looks hacky, but considering
>> a VFIO domain needs to use the g-stage for its single-stage translation
>> and a paging domain for the host would use s-stage, then it seems we need
>> to identify the VFIO domains for their special treatment.
>
>This is the wrong thinking entirely. There is no such thing as a "VFIO
>domain".
>
>Default VFIO created domains should act excatly the same as a DMA API
>domain.
>
>If you want your system to have irq remapping, then it should be on by
>default and DMA API gets remapping too. There would need to be a very
>strong reason not to do that in order to make something special for
>riscv. If so you'd need to add some kind of flag to select it.
>
>Until you reach nested translation there is no "need" for VFIO to use
>any particular stage. The design is that default VFIO uses the same
>stage as the DMA API because it is doing the same basic default
>translation function.

The RISC-V IOMMU needs to use g-stage for device assignment, if we also want to enable irqbypass, because the IOMMU is specified to only look at the MSI table when g-stage is in use. This is actually another reason the irq domain only makes sense for device assignment.

>
>Nested translation has a control to select the stage, and you can
>then force the g-stage for VFIO users at that point.

We could force riscv device assignment to always be nested, and when not providing an iommu to the guest, it will still be single-stage, but g-stage, but I don't think that's currently possible with VFIO, is it?

>
>Regardless, you must not use UNMANAGED as some indication of VFIO,
>that is not what it means, that is not what it is for.
>
>> Is there an example of converting VFIO special casing in other
>> drivers to something cleaner that you can point me at?
>
>Nobody has had an issue where they want interrupt remapping on/off
>depending on VFIO. I think that is inherently wrong.
>
>> The IRQ domain will only be useful for device assignment, as that's when
>> an MSI translation will be needed. I can't think of any problems that
>> could arise from only creating the IRQ domain when probing assigned
>> devices, but I could certainly be missing something. Do you have some
>> potential problems in mind?
>
>I'm not an expert in the interrupt subsystem, but my understanding was
>we expect the interrupt domains/etc to be static once a device driver
>is probed. Changing things during iommu domain attach is after drivers
>are probed. I don't really expect it to work correctly in all corner
>cases.

With VFIO the iommu domain attach comes after an unbind/bind, so the new driver is probed. I think that's a safe time. However, if there could be cases where the attach does not follow an unbind/bind, then I agree that wouldn't be safe. I'll consider always creating an IRQ domain, even if it won't provide any additional functionality unless the device is assigned.

>
>VFIO is allowed to change the translation as it operates and we expect
>that interrupts are not disturbed.
>

The IRQ domain stays the same during operation, the only changes are the mappings from what the guest believes are its s-mode interrupt files to the hypervisor selected guest interrupt files, and these changes are made possible by the IRQ domain's vcpu-affinity support.

Thanks,
drew


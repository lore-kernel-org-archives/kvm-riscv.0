From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 22 Nov 2024 18:07:59 +0100
Subject: [RFC PATCH 08/15] iommu/riscv: Add IRQ domain for interrupt
 remapping
In-Reply-To: <20241122153340.GC773835@ziepe.ca>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
 <20241118184336.GB559636@ziepe.ca>
 <20241119-62ff49fc1eedba051838dba2@orel>
 <20241119140047.GC559636@ziepe.ca>
 <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
 <20241119153622.GD559636@ziepe.ca>
 <20241121-4e637c492d554280dec3b077@orel>
 <20241122153340.GC773835@ziepe.ca>
Message-ID: <20241122-8c00551e2383787346c5249f@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 22, 2024 at 11:33:40AM -0400, Jason Gunthorpe wrote:
> On Fri, Nov 22, 2024 at 04:11:36PM +0100, Andrew Jones wrote:
> 
> > The reason is that the RISC-V IOMMU only checks the MSI table, i.e.
> > enables its support for MSI remapping, when the g-stage (second-stage)
> > page table is in use. However, the expected virtual memory scheme for an
> > OS to use for DMA would be to have s-stage (first-stage) in use and the
> > g-stage set to 'Bare' (not in use). 
> 
> That isn't really a technical reason.
> 
> > OIOW, it doesn't appear the spec authors expected MSI remapping to
> > be enabled for the host DMA use case.  That does make some sense,
> > since it's actually not necessary. For the host DMA use case,
> > providing mappings for each s-mode interrupt file which the device
> > is allowed to write to in the s-stage page table sufficiently
> > enables MSIs to be delivered.
> 
> Well, that seems to be the main problem here. You are grappling with a
> spec design that doesn't match the SW expecations. Since it has
> deviated from what everyone else has done you now have extra
> challenges to resolve in some way.
> 
> Just always using interrupt remapping if the HW is capable of
> interrupt remapping and ignoring the spec "expectation" is a nice a
> simple way to make things work with existing Linux.
> 
> > If "default VFIO" means VFIO without irqbypass, then it would work the
> > same as the DMA API, assuming all mappings for all necessary s-mode
> > interrupt files are created (something the DMA API needs as well).
> > However, VFIO would also need 'vfio_iommu_type1.allow_unsafe_interrupts=1'
> > to be set for this no-irqbypass configuration.
> 
> Which isn't what anyone wants, you need to make the DMA API domain be
> fully functional so that VFIO works.
> 
> > > That isn't ideal, the translation under the IRQs shouldn't really be
> > > changing as the translation under the IOMMU changes.
> > 
> > Unless the device is assigned to a guest, then the IRQ domain wouldn't
> > do anything at all (it'd just sit between the device and the device's
> > old MSI parent domain), but it also wouldn't come and go, risking issues
> > with anything sensitive to changes in the IRQ domain hierarchy.
> 
> VFIO isn't restricted to such a simple use model. You have to support
> all the generality, which includes fully supporting changing the iommu
> translation on the fly.
> 
> > > Further, VFIO assumes iommu_group_has_isolated_msi(), ie
> > > IRQ_DOMAIN_FLAG_ISOLATED_MSI, is fixed while it is is bound. Will that
> > > be true if the iommu is flapping all about? What will you do when VFIO
> > > has it attached to a blocked domain?
> > > 
> > > It just doesn't make sense to change something so fundamental as the
> > > interrupt path on an iommu domain attachement. :\
> > 
> > Yes, it does appear I should be doing this at iommu device probe time
> > instead. It won't provide any additional functionality to use cases which
> > aren't assigning devices to guests, but it also won't hurt, and it should
> > avoid the risks you point out.
> 
> Even if you statically create the domain you can't change the value of
> IRQ_DOMAIN_FLAG_ISOLATED_MSI depending on what is currently attached
> to the IOMMU.
> 
> What you are trying to do is not supported by the software stack right
> now. You need to make much bigger, more intrusive changes, if you
> really want to make interrupt remapping dynamic.
>

Let the fun begin. I'll look into this more. It also looks like I need to
collect some test cases to ensure I can support all use cases with
whatever I propose next. Pointers for those would be welcome.

Thanks,
drew


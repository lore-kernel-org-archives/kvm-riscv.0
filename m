From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 19 Nov 2024 11:36:22 -0400
Subject: [RFC PATCH 08/15] iommu/riscv: Add IRQ domain for interrupt
 remapping
In-Reply-To: <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
 <20241118184336.GB559636@ziepe.ca>
 <20241119-62ff49fc1eedba051838dba2@orel>
 <20241119140047.GC559636@ziepe.ca>
 <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
Message-ID: <20241119153622.GD559636@ziepe.ca>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 19, 2024 at 04:03:05PM +0100, Andrew Jones wrote:

> >This is the wrong thinking entirely. There is no such thing as a "VFIO
> >domain".
> >
> >Default VFIO created domains should act excatly the same as a DMA API
> >domain.
> >
> >If you want your system to have irq remapping, then it should be on by
> >default and DMA API gets remapping too. There would need to be a very
> >strong reason not to do that in order to make something special for
> >riscv. If so you'd need to add some kind of flag to select it.
> >
> >Until you reach nested translation there is no "need" for VFIO to use
> >any particular stage. The design is that default VFIO uses the same
> >stage as the DMA API because it is doing the same basic default
> >translation function.
> 
> The RISC-V IOMMU needs to use g-stage for device assignment, if we
> also want to enable irqbypass, because the IOMMU is specified to
> only look at the MSI table when g-stage is in use. This is actually
> another reason the irq domain only makes sense for device
> assignment.

Most HW has enablable interrupt remapping and typically Linux just
turns it always on.

Is there a reason the DMA API shouldn't use this translation mode too?
That seems to be the main issue here, you are trying to avoid
interrupt remapping for DMA API and use it only for VFIO, and haven't
explained why we need such complexity. Just use it always?

> >Nested translation has a control to select the stage, and you can
> >then force the g-stage for VFIO users at that point.
> 
> We could force riscv device assignment to always be nested, and when
> not providing an iommu to the guest, it will still be single-stage,
> but g-stage, but I don't think that's currently possible with VFIO,
> is it?

That isn't what I mean, I mean you should not be forcing the kind of
domain being created until you get to special cases like nested.

Default VFIO should work the same as the DMA API.

> >> The IRQ domain will only be useful for device assignment, as that's when
> >> an MSI translation will be needed. I can't think of any problems that
> >> could arise from only creating the IRQ domain when probing assigned
> >> devices, but I could certainly be missing something. Do you have some
> >> potential problems in mind?
> >
> >I'm not an expert in the interrupt subsystem, but my understanding was
> >we expect the interrupt domains/etc to be static once a device driver
> >is probed. Changing things during iommu domain attach is after drivers
> >are probed. I don't really expect it to work correctly in all corner
> >cases.
> 
> With VFIO the iommu domain attach comes after an unbind/bind, so the
> new driver is probed.

That's the opposite of what I mean. The irq domain should be setup
*before* VFIO binds to the driver.

Changing the active irq_domain while VFIO is already probed to the
device is highly unlikely to work right in all cases.

> I think that's a safe time. However, if there
> could be cases where the attach does not follow an unbind/bind, then
> I agree that wouldn't be safe.

These cases exist.

> I'll consider always creating an IRQ
> domain, even if it won't provide any additional functionality unless
> the device is assigned.

That isn't ideal, the translation under the IRQs shouldn't really be
changing as the translation under the IOMMU changes.

Further, VFIO assumes iommu_group_has_isolated_msi(), ie
IRQ_DOMAIN_FLAG_ISOLATED_MSI, is fixed while it is is bound. Will that
be true if the iommu is flapping all about? What will you do when VFIO
has it attached to a blocked domain?

It just doesn't make sense to change something so fundamental as the
interrupt path on an iommu domain attachement. :\

> >VFIO is allowed to change the translation as it operates and we expect
> >that interrupts are not disturbed.
> 
> The IRQ domain stays the same during operation, the only changes are
> the mappings from what the guest believes are its s-mode interrupt
> files to the hypervisor selected guest interrupt files, and these
> changes are made possible by the IRQ domain's vcpu-affinity support.

That is only the case when talking about kvm, this all still has to
work fully for non-kvm VFIO uses cases too.

Jason


From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 25 Nov 2024 11:07:27 -0400
Subject: [RFC PATCH 08/15] iommu/riscv: Add IRQ domain for interrupt
 remapping
In-Reply-To: <20241122-8c00551e2383787346c5249f@orel>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
 <20241118184336.GB559636@ziepe.ca>
 <20241119-62ff49fc1eedba051838dba2@orel>
 <20241119140047.GC559636@ziepe.ca>
 <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
 <20241119153622.GD559636@ziepe.ca>
 <20241121-4e637c492d554280dec3b077@orel>
 <20241122153340.GC773835@ziepe.ca>
 <20241122-8c00551e2383787346c5249f@orel>
Message-ID: <20241125150727.GD773835@ziepe.ca>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 22, 2024 at 06:07:59PM +0100, Andrew Jones wrote:

> > What you are trying to do is not supported by the software stack right
> > now. You need to make much bigger, more intrusive changes, if you
> > really want to make interrupt remapping dynamic.
> >
> 
> Let the fun begin. I'll look into this more. It also looks like I need to
> collect some test cases to ensure I can support all use cases with
> whatever I propose next. Pointers for those would be welcome.

Sorry, I don't really have anything.. But iommufd allows changing the
translation at will and we expect this to happen in normal VMM
scenarios. So blocking, paging, nesting are all expected to be
dynamically selectable and non-disruptive to interrupts.

So, you can't decide if remapping is enabled or not for a device based
only on the domain attachment.

I think you'd need to create a way for VFIO to request dynamic
interrupt remapping be enabled for the device very, very early in it's
process and that would remain fixed while VFIO is using the device.

The dynamic state of interrupt remapping would constrain what iommu
attachment configurations are permitted.

Jason


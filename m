From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 18 Sep 2023 13:17:50 -0300
Subject: [PATCH 06/26] KVM: Drop CONFIG_KVM_VFIO and just look at KVM+VFIO
In-Reply-To: <ZQhySMjmuyW2Czas@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-7-seanjc@google.com>
 <20230918152946.GJ13795@ziepe.ca>
 <ZQhySMjmuyW2Czas@google.com>
Message-ID: <20230918161750.GM13795@ziepe.ca>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 18, 2023 at 08:52:40AM -0700, Sean Christopherson wrote:

> > I wonder if we should be making the VFIO drivers that need the kvm to
> > ask for it? 'select CONFIG_NEED_VFIO_KVM' or something?
> 
> I wondered the same thing, if only to make it easier to track which
> drivers actually end up interacting directly with KVM.

There are two usages I've seen..

GVT's uage is just totally broken:

https://lore.kernel.org/kvm/661447fd-b041-c08d-cedc-341b31c405f8 at intel.com/

It is trying to use KVM to write protect IOVA DMA memory, and it just
doesn't work. If we want to do something like this the core vfio code
should provide this service and it should be wired into KVM
properly.

power and s390 have actual architectural "virtual machines" and they
need actual arch operations to install VFIO devices into those
things. In this regard having the arch opt into the integration would
make some sense. I expect this will get worse in our CC future where
VFIO devices will need to be passed into arch specific CC code
somehow.

This arch stuff isn't cleanly done, the code is sprinkled all over the
place. Some in mdevs, some in PCI arch code, some in #ifdefs..

Maybe the CC people will clean it up instead of making the mess bigger :)

Jason


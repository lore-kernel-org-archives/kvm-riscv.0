From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 18 Sep 2023 12:21:10 -0300
Subject: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
In-Reply-To: <20230916003118.2540661-6-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-6-seanjc@google.com>
Message-ID: <20230918152110.GI13795@ziepe.ca>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 15, 2023 at 05:30:57PM -0700, Sean Christopherson wrote:
> Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> KVM and VFIO do symbol lookups increases the overall complexity and places
> an unnecessary dependency on KVM (from VFIO) without adding any value.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio.h      |  2 ++
>  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
>  include/linux/vfio.h     |  4 ++-
>  virt/kvm/vfio.c          |  9 +++--
>  4 files changed, 47 insertions(+), 42 deletions(-)

I don't mind this, but Christoph had disliked my prior attempt to do
this with function pointers..

The get can be inlined, IIRC, what about putting a pointer to the put
inside the kvm struct?

The the normal kvm get/put don't have to exported symbols at all?

Jason


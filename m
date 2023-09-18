From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 18 Sep 2023 12:17:10 -0300
Subject: [PATCH 02/26] vfio: Move KVM get/put helpers to colocate it with
 other KVM related code
In-Reply-To: <20230916003118.2540661-3-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-3-seanjc@google.com>
Message-ID: <20230918151710.GG13795@ziepe.ca>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 15, 2023 at 05:30:54PM -0700, Sean Christopherson wrote:
> Move the definitions of vfio_device_get_kvm_safe() and vfio_device_put_kvm()
> down in vfio_main.c to colocate them with other KVM-specific functions,
> e.g. to allow wrapping them all with a single CONFIG_KVM check.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio_main.c | 104 +++++++++++++++++++--------------------
>  1 file changed, 52 insertions(+), 52 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason


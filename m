From: Sean Christopherson <seanjc@google.com>
Date: Fri, 1 Dec 2023 16:51:55 -0800
Subject: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
In-Reply-To: <20230918160258.GL13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca> <ZQhxpesyXeG+qbS6@google.com> <20230918160258.GL13795@ziepe.ca>
Message-ID: <ZWp_q1w01NCZi8KX@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> On Mon, Sep 18, 2023 at 08:49:57AM -0700, Sean Christopherson wrote:
> > On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> > > On Fri, Sep 15, 2023 at 05:30:57PM -0700, Sean Christopherson wrote:
> > > > Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> > > > VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> > > > KVM and VFIO do symbol lookups increases the overall complexity and places
> > > > an unnecessary dependency on KVM (from VFIO) without adding any value.
> > > > 
> > > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > > ---
> > > >  drivers/vfio/vfio.h      |  2 ++
> > > >  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
> > > >  include/linux/vfio.h     |  4 ++-
> > > >  virt/kvm/vfio.c          |  9 +++--
> > > >  4 files changed, 47 insertions(+), 42 deletions(-)
> > > 
> > > I don't mind this, but Christoph had disliked my prior attempt to do
> > > this with function pointers..
> > > 
> > > The get can be inlined, IIRC, what about putting a pointer to the put
> > > inside the kvm struct?
> > 
> > That wouldn't allow us to achieve our goal, which is to hide the details of
> > "struct kvm" from VFIO (and the rest of the kernel).
> 
> > What's the objection to handing VFIO a function pointer?
> 
> Hmm, looks like it was this thread:
> 
>  https://lore.kernel.org/r/0-v1-33906a626da1+16b0-vfio_kvm_no_group_jgg at nvidia.com
> 
> Your rational looks a little better to me.
> 
> > > The the normal kvm get/put don't have to exported symbols at all?
> > 
> > The export of kvm_get_kvm_safe() can go away (I forgot to do that in this series),
> > but kvm_get_kvm() will hang around as it's needed by KVM sub-modules (PPC and x86),
> > KVMGT (x86), and drivers/s390/crypto/vfio_ap_ops.c (no idea what to call that beast).
> 
> My thought would be to keep it as an inline, there should be some way
> to do that without breaking your desire to hide the bulk of the kvm
> struct content. Like put the refcount as the first element in the
> struct and just don't ifdef it away?.

That doesn't work because of the need to invoke kvm_destroy_vm() when the last
reference is put, i.e. all of kvm_destroy_vm() would need to be inlined (LOL) or
VFIO would need to do a symbol lookup on kvm_destroy_vm(), which puts back us at
square one.

There's one more wrinkle: this patch is buggy in that it doesn't ensure the liveliness
of KVM-the-module, i.e. nothing prevents userspace from unloading kvm.ko while VFIO
still holds a reference to a kvm structure, and so invoking ->put_kvm() could jump
into freed code.  To fix that, KVM would also need to pass along a module pointer :-(

One thought would be to have vac.ko (tentative name), which is the "base" module
that will hold the KVM/virtualization bits that need to be singletons, i.e. can't
be per-KVM, provide the symbols needed for VFIO to manage references.  But that
just ends up moving the module reference trickiness into VAC+KVM, e.g. vac.ko would
still need to be handed a function pointer in order to call back into the correct
kvm.ko code.

Hrm, but I suspect the vac.ko <=> kvm.ko interactions will need to deal with
module shenanigans anyways, and the shenanigans would only affect crazy people
like us that actually want multiple KVM modules.

I'll plan on going that route.  The very worst case scenario is that it just punts
this conversation down to a possibile future.  Dropping this patch and the previous
prep patch won't meaningful affect the goals of this series, as only kvm_get_kvm_safe()
and kvm_get_kvm() would need to be exposed outside of #ifdef __KVM__.  Then we can
figure out what to do with them if/when the whole multi-KVM thing comes along.


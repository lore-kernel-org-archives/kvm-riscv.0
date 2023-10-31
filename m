From: Sean Christopherson <seanjc@google.com>
Date: Tue, 31 Oct 2023 07:04:51 -0700
Subject: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <2edd908a-9699-4d8e-9063-c655f1fc9712@intel.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-9-seanjc@google.com>
 <2edd908a-9699-4d8e-9063-c655f1fc9712@intel.com>
Message-ID: <ZUEJg_rBf35NyCG3@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 31, 2023, Xiaoyao Li wrote:
> On 10/28/2023 2:21 AM, Sean Christopherson wrote:
> > Introduce a "version 2" of KVM_SET_USER_MEMORY_REGION so that additional
> > information can be supplied without setting userspace up to fail.  The
> > padding in the new kvm_userspace_memory_region2 structure will be used to
> > pass a file descriptor in addition to the userspace_addr, i.e. allow
> > userspace to point at a file descriptor and map memory into a guest that
> > is NOT mapped into host userspace.
> > 
> > Alternatively, KVM could simply add "struct kvm_userspace_memory_region2"
> > without a new ioctl(), but as Paolo pointed out, adding a new ioctl()
> > makes detection of bad flags a bit more robust, e.g. if the new fd field
> > is guarded only by a flag and not a new ioctl(), then a userspace bug
> > (setting a "bad" flag) would generate out-of-bounds access instead of an
> > -EINVAL error.
> > 
> > Cc: Jarkko Sakkinen <jarkko@kernel.org>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   Documentation/virt/kvm/api.rst | 21 +++++++++++++++++++
> >   arch/x86/kvm/x86.c             |  2 +-
> >   include/linux/kvm_host.h       |  4 ++--
> >   include/uapi/linux/kvm.h       | 13 ++++++++++++
> >   virt/kvm/kvm_main.c            | 38 +++++++++++++++++++++++++++-------
> >   5 files changed, 67 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 21a7578142a1..ace984acc125 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6070,6 +6070,27 @@ writes to the CNTVCT_EL0 and CNTPCT_EL0 registers using the SET_ONE_REG
> >   interface. No error will be returned, but the resulting offset will not be
> >   applied.
> > +4.139 KVM_SET_USER_MEMORY_REGION2
> > +---------------------------------
> > +
> > +:Capability: KVM_CAP_USER_MEMORY2
> > +:Architectures: all
> > +:Type: vm ioctl
> > +:Parameters: struct kvm_userspace_memory_region2 (in)
> > +:Returns: 0 on success, -1 on error
> > +
> > +::
> > +
> > +  struct kvm_userspace_memory_region2 {
> > +	__u32 slot;
> > +	__u32 flags;
> > +	__u64 guest_phys_addr;
> > +	__u64 memory_size; /* bytes */
> > +	__u64 userspace_addr; /* start of the userspace allocated memory */
> 
> missing
> 
> 	__u64 pad[16];

I can't even copy+paste correctly :-(


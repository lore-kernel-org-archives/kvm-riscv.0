From: Oliver Upton <oliver.upton@linux.dev>
Date: Wed, 14 Jun 2023 12:23:32 +0000
Subject: [PATCH RESEND v2] KVM: move KVM_CAP_DEVICE_CTRL to the generic
 check
In-Reply-To: <ZIjcoOaexz5YAyWT@google.com>
References: <20230315101606.10636-1-wei.w.wang@intel.com>
 <ZIjcoOaexz5YAyWT@google.com>
Message-ID: <ZImxRC3QlLbPhwsC@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 13, 2023 at 02:16:16PM -0700, Sean Christopherson wrote:
> +<everyone else>
> 
> Please use scripts/get_maintainer.pl to generate the To/Cc lists.  This may be
> trivial, but it still needs eyeballs from the relevant maintainers.

+1000. I'd buy someone a beer if they made a bot that just ran
get_maintainer on patches that hit the list :)

> On Wed, Mar 15, 2023, Wei Wang wrote:
> > KVM_CAP_DEVICE_CTRL allows userspace to check if the kvm_device
> > framework (e.g. KVM_CREATE_DEVICE) is supported by KVM. Move
> > KVM_CAP_DEVICE_CTRL to the generic check for the two reasons:
> > 1) it already supports arch agnostic usages (i.e. KVM_DEV_TYPE_VFIO).
> > For example, userspace VFIO implementation may needs to create
> > KVM_DEV_TYPE_VFIO on x86, riscv, or arm etc. It is simpler to have it
> > checked at the generic code than at each arch's code.
> > 2) KVM_CREATE_DEVICE has been added to the generic code.
> > 
> > Link: https://lore.kernel.org/all/20221215115207.14784-1-wei.w.wang at intel.com
> > Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> > Reviewed-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/arm.c       | 1 -
> >  arch/powerpc/kvm/powerpc.c | 1 -
> >  arch/riscv/kvm/vm.c        | 1 -
> >  arch/s390/kvm/kvm-s390.c   | 1 -
> >  virt/kvm/kvm_main.c        | 1 +
> >  5 files changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 3bd732eaf087..96329e675771 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -202,7 +202,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >  		r = vgic_present;
> >  		break;
> >  	case KVM_CAP_IOEVENTFD:
> > -	case KVM_CAP_DEVICE_CTRL:
> >  	case KVM_CAP_USER_MEMORY:
> >  	case KVM_CAP_SYNC_MMU:
> >  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:

for arm64:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver


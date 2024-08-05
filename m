From: Sean Christopherson <seanjc@google.com>
Date: Mon, 5 Aug 2024 15:09:21 -0700
Subject: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
In-Reply-To: <yq5a5xsftna9.fsf@kernel.org>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-3-seanjc@google.com>
 <yq5aikwku25o.fsf@kernel.org> <ZqvNekQAjs-SN-se@google.com> <yq5a5xsftna9.fsf@kernel.org>
Message-ID: <ZrFNkSU4-0Hli7JC@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 05, 2024, Aneesh Kumar K.V wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Thu, Aug 01, 2024, Aneesh Kumar K.V wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> 
> >> > Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> >> > writing guest memory without marking the gfn as dirty in the memslot could
> >> > result in userspace failing to migrate the updated page.  Ideally (maybe?),
> >> > KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> >> > and presumably the only use case for copy MTE tags _to_ the guest is when
> >> > restoring state on the target.
> >> >
> >> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> >> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> >> > ---
> >> >  arch/arm64/kvm/guest.c | 5 +++++
> >> >  1 file changed, 5 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> >> > index e1f0ff08836a..962f985977c2 100644
> >> > --- a/arch/arm64/kvm/guest.c
> >> > +++ b/arch/arm64/kvm/guest.c
> >> > @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >> >  
> >> >  	mutex_lock(&kvm->slots_lock);
> >> >  
> >> > +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
> >> > +		ret = -EBUSY;
> >> > +		goto out;
> >> > +	}
> >> > +
> >> >
> >> 
> >> is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ?
> >
> > No, gfn_to_pfn_prot() == FOLL_GET, kfp->pin == FOLL_PIN.  But that's not really
> > relevant.
> 
> What I meant was, should we consider mte_copy_tags_from_user() as one
> that update the page contents (even though it is updating tags) and
> use kvm_follow_pfn() with kfp->pin = 1 instead?

Yes, that's my understanding as well.  However, this series is already ludicruosly
long, and I don't have the ability to test the affected code, so rather than blindly
churn more arch code, I opted to add a FIXME in patch 76 instead.

https://lore.kernel.org/all/20240726235234.228822-76-seanjc at google.com


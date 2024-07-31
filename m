From: Sean Christopherson <seanjc@google.com>
Date: Wed, 31 Jul 2024 13:36:25 -0700
Subject: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if
 copying MTE tags hits ZONE_DEVICE
In-Reply-To: <87a5hxfs3d.fsf@draig.linaro.org>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-2-seanjc@google.com>
 <87a5hxfs3d.fsf@draig.linaro.org>
Message-ID: <ZqqgSW1Z07aBGwQh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 31, 2024, Alex Benn?e wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Put the page reference acquired by gfn_to_pfn_prot() if
> > kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
> > than-stellar heuristics for dealing with pfn-mapped memory means that KVM
> > can get a page reference to ZONE_DEVICE memory.
> >
> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/guest.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > index 11098eb7eb44..e1f0ff08836a 100644
> > --- a/arch/arm64/kvm/guest.c
> > +++ b/arch/arm64/kvm/guest.c
> > @@ -1059,6 +1059,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >  		page = pfn_to_online_page(pfn);
> >  		if (!page) {
> >  			/* Reject ZONE_DEVICE memory */
> > +			kvm_release_pfn_clean(pfn);
> 
> I guess this gets renamed later in the series.
> 
> However my main comment is does lack of page always mean a ZONE_DEVICE?

Nope.

> Looking at pfn_to_online_page() I see a bunch of other checks first. Why
> isn't it that functions responsibility to clean up after itself if its
> returning NULLs?

pfn_to_online_page() is more strict than gfn_to_pfn_prot().  At least in theory,
gfn_to_pfn_prot() could return a pfn that has an associated "struct page", with
a reference held to said page.  But for that same pfn, pfn_to_online_page() could
return NULL, in which case KVM needs to put the reference it acquired via
gfn_to_pfn_prot().


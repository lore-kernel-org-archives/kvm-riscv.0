From: Sean Christopherson <seanjc@google.com>
Date: Mon, 16 May 2022 17:53:23 +0000
Subject: [PATCH v5 20/21] KVM: Allow for different capacities in
 kvm_mmu_memory_cache structs
In-Reply-To: <CALzav=d-O5KWDC356cdpoJAUvKSSNOMtn_n7G6Yc342-VQFJNQ@mail.gmail.com>
References: <20220513202819.829591-1-dmatlack@google.com>
 <20220513202819.829591-21-dmatlack@google.com>
 <YoJkb7oMEz0v1dnp@google.com>
 <CALzav=d-O5KWDC356cdpoJAUvKSSNOMtn_n7G6Yc342-VQFJNQ@mail.gmail.com>
Message-ID: <YoKPk0HBl/7rXmNS@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
> On Mon, May 16, 2022 at 7:49 AM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Fri, May 13, 2022, David Matlack wrote:
> > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > index 53ae2c0640bc..2f2ef6b60ff4 100644
> > > --- a/arch/arm64/kvm/mmu.c
> > > +++ b/arch/arm64/kvm/mmu.c
> > > @@ -764,7 +764,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
> > >  {
> > >       phys_addr_t addr;
> > >       int ret = 0;
> > > -     struct kvm_mmu_memory_cache cache = { 0, __GFP_ZERO, NULL, };
> > > +     struct kvm_mmu_memory_cache cache = {
> > > +             .capacity = KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE,
> > > +             .gfp_zero = __GFP_ZERO,
> >
> > I dislike requiring all users to specificy the capacity.  It largely defeats the
> > purpose of KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, and bleeds details into code that
> > really doesn't care all that much about the details.
> >
> > Rather than force the capacity to be set before topup, what about adding a custom
> > capacity topup helper?  That allows keeping a default capacity, better documents
> > the caches that are special, and provides an opportunity to sanity check that the
> > capacity isn't incorrectly changed by the user.
> 
> Even simpler: If mc->capacity is 0 in topup, set it to
> KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE.

I slightly prefer the explicit "custom" approach as it guards against topup being
called before the capacity is initialized, and against the capacity being changed
after the first topup call.  It's a somewhat contrived reason since we obviously
rely on gfp_zero to be initialized before topup, but I like being more explicit
nonetheless.


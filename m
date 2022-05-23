From: Sean Christopherson <seanjc@google.com>
Date: Mon, 23 May 2022 17:37:20 +0000
Subject: [PATCH v6 21/22] KVM: Allow for different capacities in
 kvm_mmu_memory_cache structs
In-Reply-To: <CAL715WJ5DVM-A8EFND0iQ-MH9nAhE3rvWdYWaEgRTCJEVeegRg@mail.gmail.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-22-dmatlack@google.com>
 <CAL715WJ5DVM-A8EFND0iQ-MH9nAhE3rvWdYWaEgRTCJEVeegRg@mail.gmail.com>
Message-ID: <YovGUDrYZMZ7PXeY@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 20, 2022, Mingwei Zhang wrote:
> On Mon, May 16, 2022 at 4:24 PM David Matlack <dmatlack@google.com> wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index e089db822c12..5e2e75014256 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -369,14 +369,31 @@ static inline void *mmu_memory_cache_alloc_obj(struct kvm_mmu_memory_cache *mc,
> >                 return (void *)__get_free_page(gfp_flags);
> >  }
> >
> > -int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
> > +static int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min)
> >  {
> > +       gfp_t gfp = GFP_KERNEL_ACCOUNT;
> >         void *obj;
> >
> >         if (mc->nobjs >= min)
> >                 return 0;
> > -       while (mc->nobjs < ARRAY_SIZE(mc->objects)) {
> > -               obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
> > +
> > +       if (unlikely(!mc->objects)) {
> > +               if (WARN_ON_ONCE(!capacity))
> > +                       return -EIO;
> > +
> > +               mc->objects = kvmalloc_array(sizeof(void *), capacity, gfp);
> > +               if (!mc->objects)
> > +                       return -ENOMEM;
> > +
> > +               mc->capacity = capacity;
> 
> Do we want to ensure the minimum value of the capacity? I think
> otherwise, we may more likely start using memory from GFP_ATOMIC if
> the capacity is less than, say 5? But the minimum value seems related
> to each cache type.

Eh, if we specify a minimum, just make the arch default the minimum.  That way we
avoid adding even more magic/arbitrary numbers.  E.g. for whatever reason, MIPS's
default is '4'.


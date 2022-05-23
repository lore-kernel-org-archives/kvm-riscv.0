From: David Matlack <dmatlack@google.com>
Date: Mon, 23 May 2022 16:53:14 -0700
Subject: [PATCH v6 21/22] KVM: Allow for different capacities in
 kvm_mmu_memory_cache structs
In-Reply-To: <CALzav=dcFmkZsEBUWGECUQVzrE4TiF=eOxhRXW-XQ-_q4cXchA@mail.gmail.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-22-dmatlack@google.com>
 <CAL715WJ5DVM-A8EFND0iQ-MH9nAhE3rvWdYWaEgRTCJEVeegRg@mail.gmail.com>
 <YovGUDrYZMZ7PXeY@google.com>
 <CALzav=fUTYGjDuWQxJusH4CzkEwGja-4xAmpqEOZdUfBftYwYw@mail.gmail.com>
 <CAL715WL8g4y=agnMCM7uX6dhBp1JdFKHOCcYsh-=HT0wF=sQUA@mail.gmail.com>
 <CALzav=dcFmkZsEBUWGECUQVzrE4TiF=eOxhRXW-XQ-_q4cXchA@mail.gmail.com>
Message-ID: <CALzav=fVvYtOz5Bfrn=hkaegkKEpwuP1+GB+RvNxc7OJ7i2sGw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 23, 2022 at 11:22 AM David Matlack <dmatlack@google.com> wrote:
>
> On Mon, May 23, 2022 at 11:13 AM Mingwei Zhang <mizhang@google.com> wrote:
> >
> > On Mon, May 23, 2022 at 10:44 AM David Matlack <dmatlack@google.com> wrote:
> > >
> > > On Mon, May 23, 2022 at 10:37 AM Sean Christopherson <seanjc@google.com> wrote:
> > > >
> > > > On Fri, May 20, 2022, Mingwei Zhang wrote:
> > > > > On Mon, May 16, 2022 at 4:24 PM David Matlack <dmatlack@google.com> wrote:
> > > > > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > > > > index e089db822c12..5e2e75014256 100644
> > > > > > --- a/virt/kvm/kvm_main.c
> > > > > > +++ b/virt/kvm/kvm_main.c
> > > > > > @@ -369,14 +369,31 @@ static inline void *mmu_memory_cache_alloc_obj(struct kvm_mmu_memory_cache *mc,
> > > > > >                 return (void *)__get_free_page(gfp_flags);
> > > > > >  }
> > > > > >
> > > > > > -int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
> > > > > > +static int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min)
> > > > > >  {
> > > > > > +       gfp_t gfp = GFP_KERNEL_ACCOUNT;
> > > > > >         void *obj;
> > > > > >
> > > > > >         if (mc->nobjs >= min)
> > > > > >                 return 0;
> > > > > > -       while (mc->nobjs < ARRAY_SIZE(mc->objects)) {
> > > > > > -               obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
> > > > > > +
> > > > > > +       if (unlikely(!mc->objects)) {
> > > > > > +               if (WARN_ON_ONCE(!capacity))
> > > > > > +                       return -EIO;
> > > > > > +
> > > > > > +               mc->objects = kvmalloc_array(sizeof(void *), capacity, gfp);
> > > > > > +               if (!mc->objects)
> > > > > > +                       return -ENOMEM;
> > > > > > +
> > > > > > +               mc->capacity = capacity;
> > > > >
> > > > > Do we want to ensure the minimum value of the capacity? I think
> > > > > otherwise, we may more likely start using memory from GFP_ATOMIC if
> > > > > the capacity is less than, say 5? But the minimum value seems related
> > > > > to each cache type.
> > > >
> > > > Eh, if we specify a minimum, just make the arch default the minimum.  That way we
> > > > avoid adding even more magic/arbitrary numbers.  E.g. for whatever reason, MIPS's
> > > > default is '4'.
> > >
> > > I'm not exactly sure what you had in mind Mingwei. But there is a bug
> > > in this code if min > capacity. This function will happily return 0
> > > after filling up the cache, even though it did not allocate min
> > > objects. The same bug existed before this patch if min >
> > > ARRAY_SIZE(mc->objects). I can include a separate patch to fix this
> > > bug (e.g. WARN and return -ENOMEM if min > capacity).
> >
> > oh, what I am saying is this one:
> > https://elixir.bootlin.com/linux/latest/source/virt/kvm/kvm_main.c#L417
> >
> > If we are running out of kmem cache, then we start to use
> > __GFP_ATOMIC, which should be avoided as much as we can? Since this
> > patch parameterized the 'capacity', then to avoid the future usage
> > where caller provides a too small value, maybe we could add a warning
> > if the 'capacity' is too small, say, smaller than 40 (the default
> > value)?
>
> I'm not too worried about that. Callers of
> kvm_mmu_topup_memory_cache() are responsible for passing in a min
> value. It doesn't matter if capacity is a number lower than 40, as
> long as kvm_mmu_topup_memory_cache() is able to allocate min objects,
> the call is a success (and the GFP_ATOMIC fallback should never
> trigger, and if it does, we'll get a WARN splat).

Ah and I forgot to add: In this situation, the bug is that *min* is
too small, not capacity. So adding a restriction on capacity would not
help.

>
> The only actual loophole I can spot is if capacity is less than min.
> In that case topup will return 0 despite allocating less than min
> objects. Again we'll still hit the GFP_ATOMIC and get a WARN splat,
> but we can detect the problem in kvm_mmu_topup_memory_cache() which
> will include the buggy callsite in the backtrace.
>
> >
> > The case of  'capacity' < min would be a more serious issue, that
> > situation probably should never be allowed.


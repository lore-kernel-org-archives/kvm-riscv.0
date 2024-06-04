From: Oliver Upton <oliver.upton@linux.dev>
Date: Tue, 4 Jun 2024 23:00:28 +0000
Subject: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
In-Reply-To: <CADrL8HV4SZ9BEQg1j3ojG-v5umL_d3sa4e1k2vMQCMmBEgeFpQ@mail.gmail.com>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-7-jthoughton@google.com>
 <Zlog5Yk_Pjq0jQhC@linux.dev>
 <Zloicw4IU8_-V5Ns@linux.dev>
 <CADrL8HV4SZ9BEQg1j3ojG-v5umL_d3sa4e1k2vMQCMmBEgeFpQ@mail.gmail.com>
Message-ID: <Zl-cjHVKaQ0iQE5d@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 04, 2024 at 03:20:20PM -0700, James Houghton wrote:
> On Fri, May 31, 2024 at 12:18?PM Oliver Upton <oliver.upton@linux.dev> wrote:
> >
> > On Fri, May 31, 2024 at 12:11:33PM -0700, Oliver Upton wrote:
> > > On Wed, May 29, 2024 at 06:05:09PM +0000, James Houghton wrote:
> > >
> > > [...]
> > >
> > > > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > > > index 9e2bbee77491..eabb07c66a07 100644
> > > > --- a/arch/arm64/kvm/hyp/pgtable.c
> > > > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > > > @@ -1319,10 +1319,8 @@ static int stage2_age_walker(const struct kvm_pgtable_visit_ctx *ctx,
> > > >     data->young = true;
> > > >
> > > >     /*
> > > > -    * stage2_age_walker() is always called while holding the MMU lock for
> > > > -    * write, so this will always succeed. Nonetheless, this deliberately
> > > > -    * follows the race detection pattern of the other stage-2 walkers in
> > > > -    * case the locking mechanics of the MMU notifiers is ever changed.
> > > > +    * This walk may not be exclusive; the PTE is permitted to change
> > > > +    * from under us.
> > > >      */
> > > >     if (data->mkold && !stage2_try_set_pte(ctx, new))
> > > >             return -EAGAIN;
> > >
> > > It is probably worth mentioning that if there was a race to update the
> > > PTE then the GFN is most likely young, so failing to clear AF probably
> > > isn't even consequential.
> 
> Thanks Oliver.
> 
> >
> > Oh, and the WARN_ON() in kvm_pgtable_stage2_test_clear_young() is bogus
> > now. Maybe demote it to:
> >
> >   r = kvm_pgtable_walk(...);
> >   WARN_ON_ONCE(r && r != -EAGAIN);
> 
> Oh, indeed, thank you. Just to make sure -- does it make sense to
> retry the cmpxchg if it fails? For example, the way I have it now for
> x86[1], we retry the cmpxchg if the spte is still a leaf, otherwise we
> move on to the next one having done nothing. Does something like that
> make sense for arm64?

At least for arm64 I do not see a need for retry. The only possible
races are:

 - A stage-2 fault handler establishing / adjusting the mapping for the
   GFN. If the guest is directly accessing the GFN in question, what's
   the point of wiping out AF?

   Even when returning -EAGAIN we've already primed stage2_age_data::young,
   so we report the correct state back to the primary MMU.

 - Another kvm_age_gfn() trying to age the same GFN. I haven't even
   looked to see if this is possible from the primary MMU POV, but in
   theory one of the calls will win the race and clear AF.

Given Yu's concerns about making pending writers wait, we should take
every opportunity to bail on the walk.

-- 
Thanks,
Oliver


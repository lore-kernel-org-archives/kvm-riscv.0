From: Oliver Upton <oliver.upton@linux.dev>
Date: Fri, 31 May 2024 12:18:11 -0700
Subject: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
In-Reply-To: <Zlog5Yk_Pjq0jQhC@linux.dev>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-7-jthoughton@google.com>
 <Zlog5Yk_Pjq0jQhC@linux.dev>
Message-ID: <Zloicw4IU8_-V5Ns@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 31, 2024 at 12:11:33PM -0700, Oliver Upton wrote:
> On Wed, May 29, 2024 at 06:05:09PM +0000, James Houghton wrote:
> 
> [...]
> 
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 9e2bbee77491..eabb07c66a07 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -1319,10 +1319,8 @@ static int stage2_age_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >  	data->young = true;
> >  
> >  	/*
> > -	 * stage2_age_walker() is always called while holding the MMU lock for
> > -	 * write, so this will always succeed. Nonetheless, this deliberately
> > -	 * follows the race detection pattern of the other stage-2 walkers in
> > -	 * case the locking mechanics of the MMU notifiers is ever changed.
> > +	 * This walk may not be exclusive; the PTE is permitted to change
> > +	 * from under us.
> >  	 */
> >  	if (data->mkold && !stage2_try_set_pte(ctx, new))
> >  		return -EAGAIN;
> 
> It is probably worth mentioning that if there was a race to update the
> PTE then the GFN is most likely young, so failing to clear AF probably
> isn't even consequential.

Oh, and the WARN_ON() in kvm_pgtable_stage2_test_clear_young() is bogus
now. Maybe demote it to:

  r = kvm_pgtable_walk(...);
  WARN_ON_ONCE(r && r != -EAGAIN);

-- 
Thanks,
Oliver


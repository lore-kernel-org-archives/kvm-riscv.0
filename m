From: Heiko Stübner <heiko@sntech.de>
Date: Mon, 05 Dec 2022 19:49:01 +0100
Subject: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
In-Reply-To: <Y446PdlUPGw5iB71@spud>
References: <20221204174632.3677-1-jszhang@kernel.org> <Y44Q/B6THtP38eyL@xhacker> <Y446PdlUPGw5iB71@spud>
Message-ID: <10190559.nUPlyArG6x@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Montag, 5. Dezember 2022, 19:36:45 CET schrieb Conor Dooley:
> Heiko, Jisheng,
> 
> On Mon, Dec 05, 2022 at 11:40:44PM +0800, Jisheng Zhang wrote:
> > On Mon, Dec 05, 2022 at 04:31:08PM +0100, Heiko St?bner wrote:
> > > Am Sonntag, 4. Dezember 2022, 18:46:20 CET schrieb Jisheng Zhang:
> > > > Alternatives live in a different section, so offsets used by jal
> > > > instruction will point to wrong locations after the patch got applied.
> > > > 
> > > > Similar to arm64, adjust the location to consider that offset.
> > > > 
> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > ---
> > > >  arch/riscv/include/asm/alternative.h |  2 ++
> > > >  arch/riscv/kernel/alternative.c      | 38 ++++++++++++++++++++++++++++
> > > >  arch/riscv/kernel/cpufeature.c       |  3 +++
> > > >  3 files changed, 43 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > > > index c58ec3cc4bc3..33eae9541684 100644
> > > > --- a/arch/riscv/include/asm/alternative.h
> > > > +++ b/arch/riscv/include/asm/alternative.h
> > > > @@ -29,6 +29,8 @@ void apply_module_alternatives(void *start, size_t length);
> > > >  
> > > >  void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
> > > >  				      int patch_offset);
> > > > +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> > > > +			       int patch_offset);
> > > >  
> > > >  struct alt_entry {
> > > >  	void *old_ptr;		 /* address of original instruciton or data  */
> > > > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> > > > index 292cc42dc3be..9d88375624b5 100644
> > > > --- a/arch/riscv/kernel/alternative.c
> > > > +++ b/arch/riscv/kernel/alternative.c
> > > > @@ -125,6 +125,44 @@ void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
> > > >  	}
> > > >  }
> > > >  
> > > > +#define to_jal_imm(value)						\
> > > > +	(((value & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_IMM_11_0_OPOFF) | \
> > > > +	 ((value & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) | \
> > > > +	 ((value & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) | \
> > > > +	 ((value & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF))
> > > > +
> > > > +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> > > > +			       int patch_offset)
> > > > +{
> > > 
> > > I think we might want to unfiy this into a common function like
> > > 
> > > 	riscv_alternative_fix_offsets(...)
> > > 
> > > so that we only run through the code block once
> > > 
> > > 	for (i = 0; i < num_instr; i++) {
> > > 		if (riscv_insn_is_auipc_jalr(inst1, inst2)) {
> > > 			riscv_alternative_fix_auipc_jalr(...)
> > > 			continue;
> > > 		}
> > > 
> > > 		if (riscv_insn_is_jal(inst)) {
> > > 			riscv_alternative_fix_jal(...)
> > > 			continue;
> > > 		}
> > > 	}
> > > 
> > > This would also remove the need from calling multiple functions
> > > after patching alternatives.
> > 
> > Yesterday, I also wanted to unify the two instruction fix into
> > one. But that would need to roll back the
> > riscv_alternative_fix_auipc_jalr() to your v1 version. And IMHO,
> > it's better if you can split the Zbb string optimizations series
> > into two: one for alternative improvements, another for Zbb. Then
> > we may get the alternative improvements and this inst extension
> > series merged in v6.2-rc1.
> 
> Heiko, perhaps you can correct me here:
> 
> Last Wednesday you & Palmer agreed that it was too late in the cycle to
> apply any of the stuff touching alternatives?
> If I do recall correctly, gives plenty of time to sort out any
> interdependent changes here.
> 
> Could easily be misremembering, wouldn't be the first time!

You slightly misremembered, but are still correct with the above ;-) .

I.e. what we talked about was stuff for fixes for 6.1-rc, were Palmers
wisely wanted to limit additions to really easy fixes for the remaining
last rc, to not upset any existing boards.

But you are still correct that we also shouldn't target the 6.2 merge window
anymore :-) .

We're after -rc8 now (which is in itself uncommon) and in his -rc7
announcement [0], Linus stated

"[...] the usual rule is that things that I get sent for the
merge window should have been all ready _before_ the merge window
opened. But with the merge window happening largely during the holiday
season, I'll just be enforcing that pretty strictly."

That means new stuff should be reviewed and in linux-next _way before_ the
merge window opens next weekend. Taking into account that people need
to review stuff (and maybe the series needing another round), I really don't
see this happening this week and everything else will get us shouted at
from atop a christmas tree ;-) .

That's the reason most maintainer-trees stop accepting stuff after -rc7


Heiko


[0] https://lkml.org/lkml/2022/11/27/278






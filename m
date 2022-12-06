From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 6 Dec 2022 06:50:07 +0100
Subject: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
In-Reply-To: <Y44hL3l8Uqg+JgWI@xhacker>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-2-jszhang@kernel.org>
 <20221205145710.xzb4prrc44gv7mwm@kamzik>
 <Y44fY5tCC1hHDfcw@xhacker>
 <Y44hL3l8Uqg+JgWI@xhacker>
Message-ID: <20221206055007.cvc4zfworla3fwwr@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 06, 2022 at 12:49:51AM +0800, Jisheng Zhang wrote:
> On Tue, Dec 06, 2022 at 12:42:16AM +0800, Jisheng Zhang wrote:
> > On Mon, Dec 05, 2022 at 03:57:10PM +0100, Andrew Jones wrote:
> > > On Mon, Dec 05, 2022 at 01:46:20AM +0800, Jisheng Zhang wrote:
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
> > >                                                                  ^ RV_J_IMM_10_1_OPOFF
> > > 
> > > > +	 ((value & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) | \
> > > > +	 ((value & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) | \
> > > > +	 ((value & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF))
> > 
> > Hi all,
> > 
> > I believe there's bug in the to_jal_imm() macro implementation, the
> > correct one should be like this:
> > 
> > #define to_jal_imm(value)                                               \
> >         ((RV_X(value, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) | \
> >         (RV_X(value, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) | \
> >         (RV_X(value, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) | \
> >         (RV_X(value, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF))
> 
> And I just tested to_jal_imm() vs RV_EXTRACT_JTYPE_IMM(), they match perfectly.
> E.g:
> RV_EXTRACT_JTYPE_IMM(to_jal_imm(imm)) == imm is alway true when imm is a jal
> valid offset.

I think we should define deposit() functions for each type, as well as the
extract() functions, (and I'd prefer we use static inlines to macros to
get some type checking). See [1] for my proposal.

[1] https://lore.kernel.org/all/20221205145323.l2dro6dt7muumqpn at kamzik/

Thanks,
drew

> 
> > 
> > Will fix it in next version.
> > 
> > Thanks
> > > 
> > > Should put () around value
> > > 
> > > > +
> > > > +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> > > > +			       int patch_offset)
> > > > +{
> > > > +	int num_instr = len / sizeof(u32);
> > > > +	unsigned int call;
> > > > +	int i;
> > > > +	int imm;
> > > > +
> > > > +	for (i = 0; i < num_instr; i++) {
> > > > +		u32 inst = riscv_instruction_at(alt_ptr, i);
> > > > +
> > > > +		if (!riscv_insn_is_jal(inst))
> > > > +			continue;
> > > > +
> > > > +		/* get and adjust new target address */
> > > > +		imm = RV_EXTRACT_JTYPE_IMM(inst);
> > > > +		imm -= patch_offset;
> > > > +
> > > > +		/* pick the original jal */
> > > > +		call = inst;
> > > > +
> > > > +		/* drop the old IMMs, all jal imm bits sit at 31:12 */
> > > > +		call &= ~GENMASK(31, 12);
> > > 
> > > It'd be nice if this had a define.
> > > 
> > > > +
> > > > +		/* add the adapted IMMs */
> > > > +		call |= to_jal_imm(imm);
> > > > +
> > > > +		/* patch the call place again */
> > > > +		patch_text_nosync(alt_ptr + i * sizeof(u32), &call, 4);
> > > > +	}
> > > > +}
> > > > +
> > > >  /*
> > > >   * This is called very early in the boot process (directly after we run
> > > >   * a feature detect on the boot CPU). No need to worry about other CPUs
> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > > index ba62a4ff5ccd..c743f0adc794 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -324,6 +324,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > > >  			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> > > >  							 alt->alt_len,
> > > >  							 alt->old_ptr - alt->alt_ptr);
> > > > +			riscv_alternative_fix_jal(alt->old_ptr,
> > > > +						  alt->alt_len,
> > > > +						  alt->old_ptr - alt->alt_ptr);
> > > >  		}
> > > >  	}
> > > >  }
> > > > -- 
> > > > 2.37.2
> > > >
> > > 
> > > Thanks,
> > > drew


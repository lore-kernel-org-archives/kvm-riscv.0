From: Andrew Jones <ajones@ventanamicro.com>
Date: Sat, 16 Mar 2024 18:17:29 +0100
Subject: [PATCH 1/5] riscv: Add Zawrs support for spinlocks
In-Reply-To: <ZfWEN2PXxDC4waE/@andrea>
References: <20240315134009.580167-7-ajones@ventanamicro.com>
 <20240315134009.580167-8-ajones@ventanamicro.com>
 <ZfWEN2PXxDC4waE/@andrea>
Message-ID: <20240316-f4304327a56993561a4721f1@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Andrea,

I actually just forgot to re-review the thread and make changes... I
grabbed the patch and then focused on experimenting and testing it's
impact on guests. I guess I should have started with applying the thread
comments, because I ended up forgetting to return to them before
posting...

On Sat, Mar 16, 2024 at 12:36:23PM +0100, Andrea Parri wrote:
> > +config RISCV_ISA_ZAWRS
> > +	bool "Zawrs extension support for more efficient busy waiting"
> > +	depends on RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Enable the use of the Zawrs (wait for reservation set) extension
> > +	   when available.
> > +
> > +	   The Zawrs extension instructions (wrs.nto and wrs.sto) are used for
> > +	   more efficient busy waiting.
> 
> Maybe mention that this is about _power_-efficiency?  In the discussion
> of the previous iteration, I suggested [1]:
> 
>   The Zawrs extension defines a pair of instructions to be used in
>   polling loops that allows a core to enter a low-power state and
>   wait on a store to a memory location.
> 
> (from the Zawrs spec  -- I remain open to review other suggestiongs).

Sounds good to me. I'll make a change like that for v2.

> 
> 
> > +#define ZAWRS_WRS_NTO	".long 0x00d00073"
> > +#define ZAWRS_WRS_STO	".long 0x01d00073"
> 
> In the discussion of the previous iteration, you observed [2]:
> 
>   I'd prefer we use insn-def.h to define instructions, rather than
>   scatter .long's around, but since this instruction doesn't have
>   any inputs, then I guess it's not so important to use insn-def.h.
> 
> So that "preference" doesn't apply to the instructions at stake?  Or is
> not "important"?  No real objections to barrier.h, trying to understand
> the rationale.

Besides having simply forgotten to address my own comment, in this case I
can live with the .long since we're at least not hard coding an operand
register. However, since I prefer '.4byte', I'll change to that.

> 
> 
> > +#define ALT_WRS_NTO()							\
> > +	__asm__ __volatile__ (ALTERNATIVE(				\
> > +		"nop\n", ZAWRS_WRS_NTO "\n",				\
> > +		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
> > +#define ALT_WRS_STO()							\
> > +	__asm__ __volatile__ (ALTERNATIVE(				\
> > +		"nop\n", ZAWRS_WRS_STO "\n",				\
> > +		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
> > +
> >  #define RISCV_FENCE(p, s) \
> >  	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
> 
> FYI, this hunk/patch conflicts with Eric's changes [3].

Thanks, I had mentally noted that series as a possible conflict, but
then forgot to try basing on it to see if it would be a problem.

> 
> 
> > +#define ___smp_load_reservedN(attr, ptr)				\
> > +({									\
> > +	typeof(*ptr) ___p1;						\
> > +									\
> > +	__asm__ __volatile__ ("lr." attr "       %[p], %[c]\n"		\
> > +			      : [p]"=&r" (___p1), [c]"+A"(*ptr));	\
> > +	___p1;								\
> > +})
> > +
> > +#define __smp_load_reserved_relaxed(ptr)				\
> > +({									\
> > +	typeof(*ptr) ___p1;						\
> > +									\
> > +	if (sizeof(*ptr) == sizeof(int))				\
> > +		___p1 = ___smp_load_reservedN("w", ptr);		\
> > +	else if (sizeof(*ptr) == sizeof(long))				\
> > +		___p1 = ___smp_load_reservedN("d", ptr);		\
> > +	else								\
> > +		compiletime_assert(0,					\
> > +		"Need type compatible with LR/SC instructions for "	\
> > +		__stringify(ptr));					\
> > +	___p1;								\
> > +})
> 
> In the discussion of the previous iteration, you observed [2]:
> 
>   It's more common to use a switch for these things, [...] something
>   like the macros in arch/riscv/include/asm/cmpxchg.h.  Can we stick
>   with that pattern?
> 
> Along the same lines (#codingstyle), notice that ___smp_load_reservedN()
> would become one of the first uses of the asmSymbolicName syntax in the
> arch/riscv/ directory.
> 
> So again, why not stick to the common style? something's wrong with it?

For v2, I'll switch to the style that I recommended :-)

> 
> 
> > +#define smp_cond_load_relaxed(ptr, cond_expr)				\
> > +({									\
> > +	typeof(ptr) __PTR = (ptr);					\
> > +	__unqual_scalar_typeof(*ptr) VAL;				\
> > +									\
> > +	VAL = READ_ONCE(*__PTR);					\
> > +	if (!cond_expr) {						\
> > +		for (;;) {						\
> > +			VAL = __smp_load_reserved_relaxed(__PTR);	\
> > +			if (cond_expr)					\
> > +				break;					\
> > +			ALT_WRS_STO();					\
> > +		}							\
> > +	}								\
> > +	(typeof(*ptr))VAL;						\
> > +})
> > +
> > +#define smp_cond_load_acquire(ptr, cond_expr)				\
> > +({									\
> > +	typeof(ptr) __PTR = (ptr);					\
> > +	__unqual_scalar_typeof(*ptr) VAL;				\
> > +									\
> > +	VAL = smp_load_acquire(__PTR);					\
> > +	if (!cond_expr) {						\
> > +		for (;;) {						\
> > +			VAL = __smp_load_reserved_acquire(__PTR);	\
> > +			if (cond_expr)					\
> > +				break;					\
> > +			ALT_WRS_STO();					\
> > +		}							\
> > +	}								\
> > +	(typeof(*ptr))VAL;						\
> > +})
> 
> In the discussion of the previous iteration, you observed [2]:
> 
>   I guess this peeling off of the first iteration is because it's
>   expected that the load generated by READ_ONCE() is more efficient
>   than lr.w/d?  If we're worried about unnecessary use of lr.w/d,
>   then shouldn't we look for a solution that doesn't issue those
>   instructions when we don't have the Zawrs extension?
> 
> To which Palmer replied (apparently, agreeing with your remarks) [4]:
> 
>   I haven't looked at the patch, but I'd expect we NOP out the
>   whole LR/WRS sequence?  I don't remember any reason to have the
>   load reservation without the WRS,  [...]

For v2, I'll look closer at this to decide what to do.

> 
> Unfortunately, this submission makes no mention to those comments and,
> more importantly, to the considerations/tradeoffs which have led you
> to submit different changes.  In submitting-patches.rst's words,
> 
>   Review comments or questions that do not lead to a code change
>   should almost certainly bring about a comment or changelog entry
>   so that the next reviewer better understands what is going on.

Eh, there's nothing mysterious going on here. It was just me being
forgetful... And, I even forgot to write a changelog entry explaining
that I forgot :-)

> 
>   Andrea
> 
> P.S. BTW, not too far from the previous recommendation/paragraph is:
> 
>   When sending a next version, [...]  Notify people that commented
>   on your patch about new versions by adding them to the patches CC
>   list.

Yeah, had I returned to the old thread for the re-review, I would have
seen your comments again and then remembered to CC you.

Thanks,
drew

> 
> [1] https://lore.kernel.org/lkml/ZTE7eUyrb8+J+ORB at andrea
> [2] https://lore.kernel.org/lkml/20230524-35efcabbbfd6a1ef83865fb4 at orel
> [3] https://lore.kernel.org/lkml/20240217131206.3667544-1-ericchancf at google.com
> [4] https://lore.kernel.org/lkml/mhng-d92f84d8-03db-4fb1-93c3-0d5bfbe7a796 at palmer-ri-x1c9a


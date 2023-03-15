From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 15 Mar 2023 12:00:00 +0800
Subject: [PATCH -next v14 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
In-Reply-To: <Y/6HmORLbsFWsEbu@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com> <20230224170118.16766-9-andy.chiu@sifive.com>
 <Y/6HmORLbsFWsEbu@spud>
Message-ID: <CABgGipWBGgs-enRr=_HToW4wxTVGeUnJ4imLagdwThFiQ4xG2w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 1, 2023 at 7:00?AM Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Feb 24, 2023 at 05:01:07PM +0000, Andy Chiu wrote:
> > From: Greentime Hu <greentime.hu@sifive.com>
> >
> > Add vector state context struct to be added later in thread_struct. And
> > prepare low-level helper functions to save/restore vector contexts.
> >
> > This include Vector Regfile and CSRs holding dynamic configuration state
> > (vstart, vl, vtype, vcsr). The Vec Register width could be implementation
> > defined, but same for all processes, so that is saved separately.
> >
> > This is not yet wired into final thread_struct - will be done when
> > __switch_to actually starts doing this in later patches.
> >
> > Given the variable (and potentially large) size of regfile, they are
> > saved in dynamically allocated memory, pointed to by datap pointer in
> > __riscv_v_ext_state.
> >
> > Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> > [vineetg: merged bits from 2 different patches]
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > [andy.chiu: use inline asm to save/restore context, remove asm vaiant]
> > ---
> >  arch/riscv/include/asm/vector.h      | 84 ++++++++++++++++++++++++++++
> >  arch/riscv/include/uapi/asm/ptrace.h | 17 ++++++
> >  2 files changed, 101 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> > index 692d3ee2d2d3..9c025f2efdc3 100644
> > --- a/arch/riscv/include/asm/vector.h
> > +++ b/arch/riscv/include/asm/vector.h
> > @@ -12,6 +12,9 @@
> >
> >  #include <asm/hwcap.h>
> >  #include <asm/csr.h>
> > +#include <asm/asm.h>
> > +
> > +#define CSR_STR(x) __ASM_STR(x)
>
> TBH, I'm not really sure what this definition adds.
>

Agree, I'm going to drop this #define and use __ASM_STR directly.
However, we should not replace the inline asm to csr_read because
csr_read clobbers memory and we don't.

> >  extern unsigned long riscv_v_vsize;
> >  void riscv_v_setup_vsize(void);
> > @@ -21,6 +24,26 @@ static __always_inline bool has_vector(void)
> >       return riscv_has_extension_likely(RISCV_ISA_EXT_v);
> >  }
> >
> > +static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
> > +{
> > +     regs->status = (regs->status & ~(SR_VS)) | SR_VS_CLEAN;
> > +}
> > +
> > +static inline void riscv_v_vstate_off(struct pt_regs *regs)
> > +{
> > +     regs->status = (regs->status & ~SR_VS) | SR_VS_OFF;
>
> Inconsistent use of brackets here compared to the other items.
> They're not actually needed anywhere here, are they?
>

Yes, there is no need for brackets at SR_VS because it expands to one
constant value.




> > +}
> > +
> > +static inline void riscv_v_vstate_on(struct pt_regs *regs)
> > +{
> > +     regs->status = (regs->status & ~(SR_VS)) | SR_VS_INITIAL;
> > +}
>
> Other than that, this seems fine? I only really had a quick check of the
> asm though, so with the brackets thing fixed up:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>


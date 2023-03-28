From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 28 Mar 2023 14:46:24 +0800
Subject: [PATCH -next v17 11/20] riscv: Add ptrace vector support
In-Reply-To: <5660672.DvuYhMxLoT@devpool47.emlix.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com> <20230327164941.20491-12-andy.chiu@sifive.com>
 <5660672.DvuYhMxLoT@devpool47.emlix.com>
Message-ID: <CABgGipWcK6kAARBMCT8JGxV-9_yav_p0HME9+28vcv195R6_ww@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 28, 2023 at 1:53?PM Rolf Eike Beer <eb@emlix.com> wrote:
>
> On Montag, 27. M?rz 2023 18:49:31 CEST Andy Chiu wrote:
> > From: Greentime Hu <greentime.hu@sifive.com>
> >
> > This patch adds ptrace support for riscv vector. The vector registers will
> > be saved in datap pointer of __riscv_v_ext_state. This pointer will be set
> > right after the __riscv_v_ext_state data structure then it will be put in
> > ubuf for ptrace system call to get or set. It will check if the datap got
> > from ubuf is set to the correct address or not when the ptrace system call
> > is trying to set the vector registers.
> >
> > Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/include/uapi/asm/ptrace.h |  7 +++
> >  arch/riscv/kernel/ptrace.c           | 70 ++++++++++++++++++++++++++++
> >  include/uapi/linux/elf.h             |  1 +
> >  3 files changed, 78 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> > index 23c48b14a0e7..75e66c040b64 100644
> > --- a/arch/riscv/kernel/ptrace.c
> > +++ b/arch/riscv/kernel/ptrace.c
> > @@ -80,6 +84,61 @@ static int riscv_fpr_set(struct task_struct *target,
> >  }
> >  #endif
> >
> > +#ifdef CONFIG_RISCV_ISA_V
> > +static int riscv_vr_get(struct task_struct *target,
> > +                     const struct user_regset *regset,
> > +                     struct membuf to)
> > +{
> > +     struct __riscv_v_ext_state *vstate = &target->thread.vstate;
> > +
> > +     if (!riscv_v_vstate_query(task_pt_regs(target)))
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Ensure the vector registers have been saved to the memory before
> > +      * copying them to membuf.
> > +      */
> > +     if (target == current)
> > +             riscv_v_vstate_save(current, task_pt_regs(current));
> > +
> > +     /* Copy vector header from vstate. */
> > +     membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state,
> datap));
> > +     membuf_zero(&to, sizeof(void *));
>
> No idea why I have not seen it in any previous version, but this "sizeof(void
> *)" just made me thing "what is going on here?". I personally would have
> written something like "sizeof(to.var)" or "offsetof(to.buf)" or something like
> that. That makes it easier for me to understand what is skipped/zeroed here,
> let alone making it a bit more fool proof when someone changes one of the
> struct layouts. YMMV.
>

Thanks for the finding. Fixing it now

> Regards,
>
> Eike
> --
> Rolf Eike Beer, emlix GmbH, http://www.emlix.com
> Fon +49 551 30664-0, Fax +49 551 30664-11
> Gothaer Platz 3, 37083 G?ttingen, Germany
> Sitz der Gesellschaft: G?ttingen, Amtsgericht G?ttingen HR B 3160
> Gesch?ftsf?hrung: Heike Jordan, Dr. Uwe Kracke ? Ust-IdNr.: DE 205 198 055
>
> emlix - smart embedded open source

Cheers,
Andy


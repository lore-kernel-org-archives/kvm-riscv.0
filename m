From: Conor Dooley <conor@kernel.org>
Date: Tue, 14 Mar 2023 10:44:25 +0000
Subject: [PATCH -next v14 11/19] riscv: Add ptrace vector support
In-Reply-To: <CABgGipU9LjvT6RQ6OfTXm6==pV0KXUjvyTR-FCNC05sfDec+9g@mail.gmail.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-12-andy.chiu@sifive.com>
 <87mt4v4clq.fsf@all.your.base.are.belong.to.us>
 <CABgGipU9LjvT6RQ6OfTXm6==pV0KXUjvyTR-FCNC05sfDec+9g@mail.gmail.com>
Message-ID: <61c440cd-bae9-4984-9d26-d78e9fad2f16@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 14, 2023 at 06:39:19PM +0800, Andy Chiu wrote:
> On Thu, Mar 2, 2023 at 7:27?PM Bj?rn T?pel <bjorn@kernel.org> wrote:
> >
> > Andy Chiu <andy.chiu@sifive.com> writes:
> >
> > > diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> > > index 2ae8280ae475..3c0e01d7f8fb 100644
> > > --- a/arch/riscv/kernel/ptrace.c
> > > +++ b/arch/riscv/kernel/ptrace.c
> > > @@ -83,6 +87,62 @@ static int riscv_fpr_set(struct task_struct *target,
> > >  }
> > >  #endif
> > >
> > > +#ifdef CONFIG_RISCV_ISA_V
> > > +static int riscv_vr_get(struct task_struct *target,
> > > +                     const struct user_regset *regset,
> > > +                     struct membuf to)
> > > +{
> > > +     struct __riscv_v_ext_state *vstate = &target->thread.vstate;
> > > +
> > > +     if (!riscv_v_vstate_query(task_pt_regs(target)))
> > > +             return -EINVAL;
> > > +     /*
> > > +      * Ensure the vector registers have been saved to the memory before
> > > +      * copying them to membuf.
> > > +      */
> > > +     if (target == current)
> > > +             riscv_v_vstate_save(current, task_pt_regs(current));
> > > +
> > > +     /* Copy vector header from vstate. */
> > > +     membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state, datap));
> > > +     membuf_zero(&to, sizeof(void *));
> > > +#if __riscv_xlen == 32
> > > +     membuf_zero(&to, sizeof(__u32));
> > > +#endif
> >
> > Remind me why the extra care is needed for 32b?
> >
> 
> That is from the old version of the code and I agree we should remove
> that.

> Hey Conor, does your Rb still hold after removing this #if,
> #endif section?

Sure.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230314/b6771807/attachment.sig>

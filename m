From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon, 5 Sep 2022 20:58:03 +0800
Subject: [PATCH v2 4/5] riscv: add lazy preempt support
In-Reply-To: <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <20220831175920.2806-5-jszhang@kernel.org>
 <CAJF2gTQMM50TZZ95XOY+Rgvm2hZ3nLxkYfaSW_2MvPiJeqTtJw@mail.gmail.com>
 <YxWYh5C5swlyobi2@linutronix.de>
 <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
Message-ID: <YxXyW18HtN6alf1E@xhacker>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 05, 2022 at 04:33:54PM +0800, Guo Ren wrote:
> On Mon, Sep 5, 2022 at 2:34 PM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> >
> > On 2022-09-04 23:16:12 [+0800], Guo Ren wrote:
> > > > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > > > index b9eda3fcbd6d..595100a4c2c7 100644
> > > > --- a/arch/riscv/kernel/entry.S
> > > > +++ b/arch/riscv/kernel/entry.S
> > > > @@ -361,9 +361,14 @@ restore_all:
> > > >  resume_kernel:
> > > >         REG_L s0, TASK_TI_PREEMPT_COUNT(tp)
> > > >         bnez s0, restore_all
> > > > -       REG_L s0, TASK_TI_FLAGS(tp)
> > > > -       andi s0, s0, _TIF_NEED_RESCHED
> > > > +       REG_L s1, TASK_TI_FLAGS(tp)
> > > > +       andi s0, s1, _TIF_NEED_RESCHED
> > > > +       bnez s0, 1f
> > > > +       REG_L s0, TASK_TI_PREEMPT_LAZY_COUNT(tp)
> > > > +       bnez s0, restore_all
> > > > +       andi s0, s1, _TIF_NEED_RESCHED_LAZY
> > > Can you tell me, who increased/decreased the PREEMPT_LAZY_COUNT? And
> > > who set NEED_RESCHED_LAZY?
> >
> > There is "generic" code in the PREEMPT_RT patch doing that. The counter
> > is incremented/ decremented via preempt_lazy_enable()/disable() and one
> > of the user is migrate_disable()/enable().
> > Basically if a task is task_is_realtime() then NEED_RESCHED is set for
> > the wakeup. For the remaining states (SCHED_OTHER, ?) NEED_RESCHED_LAZY
> > is set for the wakeup. This can be delayed if the task is in a "preempt
> > disable lazy" section (similar to a preempt_disable() section) but a
> > task_is_realtime() can still be scheduled if needed.
> Okay, It should be [PATCH RT]. RISC-V would also move to GENERIC_ENTRY

As said in the cover letter, this patch is expected to reviewed and
maintained in RT tree. If your GENERIC_ENTRY patches are merged, I will
send an updated patch.

> [1], so above assembly code would be replaced by generic one, right?
> 
> [1]: https://lore.kernel.org/linux-riscv/20220904072637.8619-3-guoren at kernel.org/T/#u
> 
> 
> > See details at
> >         https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/plain/patches/sched__Add_support_for_lazy_preemption.patch?h=linux-6.0.y-rt-patches
> 
> 
> >
> > Sebastian
> 
> 
> 
> -- 
> Best Regards
>  Guo Ren


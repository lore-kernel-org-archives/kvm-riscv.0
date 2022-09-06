From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Sep 2022 09:46:05 +0800
Subject: [PATCH v2 4/5] riscv: add lazy preempt support
In-Reply-To: <YxW3cZEhEideZon2@linutronix.de>
References: <20220831175920.2806-1-jszhang@kernel.org> <20220831175920.2806-5-jszhang@kernel.org>
 <CAJF2gTQMM50TZZ95XOY+Rgvm2hZ3nLxkYfaSW_2MvPiJeqTtJw@mail.gmail.com>
 <YxWYh5C5swlyobi2@linutronix.de> <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
 <YxW3cZEhEideZon2@linutronix.de>
Message-ID: <CAJF2gTSuLNxUD=Kdn+3o6Jj_bv+X4pntvUHCsXXD5AgcVjj0pQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 5, 2022 at 4:46 PM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2022-09-05 16:33:54 [+0800], Guo Ren wrote:
> > > There is "generic" code in the PREEMPT_RT patch doing that. The counter
> > > is incremented/ decremented via preempt_lazy_enable()/disable() and one
> > > of the user is migrate_disable()/enable().
> > > Basically if a task is task_is_realtime() then NEED_RESCHED is set for
> > > the wakeup. For the remaining states (SCHED_OTHER, ?) NEED_RESCHED_LAZY
> > > is set for the wakeup. This can be delayed if the task is in a "preempt
> > > disable lazy" section (similar to a preempt_disable() section) but a
> > > task_is_realtime() can still be scheduled if needed.
> > Okay, It should be [PATCH RT]. RISC-V would also move to GENERIC_ENTRY
> > [1], so above assembly code would be replaced by generic one, right?
>
> correct.
Maybe TIF_XXX_RESCHED also could be merged into GENERIC_ENTRY, just
like what you've done in syscall.

struct thread_info {
          unsigned long           flags;
          unsigned long           syscall_work;   /* SYSCALL_WORK_ flags */
+        unsigned long           resched_work;   /* RESCHED flags */

Or merge them into one:
struct thread_info {
          unsigned long           flags;
-         unsigned long           syscall_work;   /* SYSCALL_WORK_ flags */
+         unsigned long           ge_flags; /* GENERIC_ENTRY flags */

>
> Sebastian



-- 
Best Regards
 Guo Ren


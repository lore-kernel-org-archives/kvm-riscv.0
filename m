From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Mon, 5 Sep 2022 10:46:41 +0200
Subject: [PATCH v2 4/5] riscv: add lazy preempt support
In-Reply-To: <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <20220831175920.2806-5-jszhang@kernel.org>
 <CAJF2gTQMM50TZZ95XOY+Rgvm2hZ3nLxkYfaSW_2MvPiJeqTtJw@mail.gmail.com>
 <YxWYh5C5swlyobi2@linutronix.de>
 <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
Message-ID: <YxW3cZEhEideZon2@linutronix.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-09-05 16:33:54 [+0800], Guo Ren wrote:
> > There is "generic" code in the PREEMPT_RT patch doing that. The counter
> > is incremented/ decremented via preempt_lazy_enable()/disable() and one
> > of the user is migrate_disable()/enable().
> > Basically if a task is task_is_realtime() then NEED_RESCHED is set for
> > the wakeup. For the remaining states (SCHED_OTHER, ?) NEED_RESCHED_LAZY
> > is set for the wakeup. This can be delayed if the task is in a "preempt
> > disable lazy" section (similar to a preempt_disable() section) but a
> > task_is_realtime() can still be scheduled if needed.
> Okay, It should be [PATCH RT]. RISC-V would also move to GENERIC_ENTRY
> [1], so above assembly code would be replaced by generic one, right?

correct.

Sebastian


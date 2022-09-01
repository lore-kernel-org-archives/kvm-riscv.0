From: Jisheng Zhang <jszhang@kernel.org>
Date: Thu, 1 Sep 2022 21:44:37 +0800
Subject: [PATCH v2 0/5] riscv: add PREEMPT_RT support
In-Reply-To: <YxBZZWopVftK/WBk@linutronix.de>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <YxBZZWopVftK/WBk@linutronix.de>
Message-ID: <YxC3Ra5iZDdYX7sW@xhacker>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 01, 2022 at 09:04:05AM +0200, Sebastian Andrzej Siewior wrote:
> On 2022-09-01 01:59:15 [+0800], Jisheng Zhang wrote:
> > I assume patch1, patch2 and patch3 can be reviewed and merged for
> > riscv-next, patch4 and patch5 can be reviewed and maintained in rt tree,
> > and finally merged once the remaining patches in rt tree are all
> > mainlined.
> 
> I would say so, yes.
> 
> What about JUMP_LABEL support? Do you halt all CPUs while patching the
> code?
> 

FWICT, riscv JUMP_LABEL implementation doesn't rely on stop all cpus while
patching text.

Thanks


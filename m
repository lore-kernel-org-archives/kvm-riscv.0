From: Jisheng Zhang <jszhang@kernel.org>
Date: Fri, 2 Sep 2022 21:09:45 +0800
Subject: [PATCH v2 0/5] riscv: add PREEMPT_RT support
In-Reply-To: <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
Message-ID: <YxIAmT2X9TU1CZhC@xhacker>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 01, 2022 at 04:41:52PM +0000, Conor.Dooley at microchip.com wrote:
> On 31/08/2022 18:59, Jisheng Zhang wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > This series is to add PREEMPT_RT support to riscv:
> > patch1 adds the missing number of signal exits in vCPU stat
> > patch2 switches to the generic guest entry infrastructure
> > patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
> > RT
> > patch4 adds lazy preempt support
> > patch5 allows to enable PREEMPT_RT
> > 
> 
> What version of the preempt_rt patch did you test this with?

v6.0-rc1 + v6.0-rc1-rt patch

> 
> Maybe I am missing something, but I gave this a whirl with
> v6.0-rc3 + v6.0-rc3-rt5 & was meant by a bunch of complaints.
> I am not familiar with the preempt_rt patch, so I am not sure what
> level of BUG()s or WARNING()s are to be expected, but I saw a fair
> few...

Could you please provide corresponding log? Usually, this means there's
a bug in related drivers, so it's better to fix them now rather than
wait for RT patches mainlined.

PS: which HW are you using?

Thanks


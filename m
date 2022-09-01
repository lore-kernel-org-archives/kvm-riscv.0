From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
Date: Thu, 1 Sep 2022 16:41:52 +0000
Subject: [PATCH v2 0/5] riscv: add PREEMPT_RT support
In-Reply-To: <20220831175920.2806-1-jszhang@kernel.org>
References: <20220831175920.2806-1-jszhang@kernel.org>
Message-ID: <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 31/08/2022 18:59, Jisheng Zhang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This series is to add PREEMPT_RT support to riscv:
> patch1 adds the missing number of signal exits in vCPU stat
> patch2 switches to the generic guest entry infrastructure
> patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
> RT
> patch4 adds lazy preempt support
> patch5 allows to enable PREEMPT_RT
> 

What version of the preempt_rt patch did you test this with?

Maybe I am missing something, but I gave this a whirl with
v6.0-rc3 + v6.0-rc3-rt5 & was meant by a bunch of complaints.
I am not familiar with the preempt_rt patch, so I am not sure what
level of BUG()s or WARNING()s are to be expected, but I saw a fair
few...

Thanks,
Conor.



> I assume patch1, patch2 and patch3 can be reviewed and merged for
> riscv-next, patch4 and patch5 can be reviewed and maintained in rt tree,
> and finally merged once the remaining patches in rt tree are all
> mainlined.
> 
> Since v1:
>   - send to related maillist, I press ENTER too quickly when sending v1
>   - remove the signal_pending() handling because that's covered by
>     generic guest entry infrastructure
> 
> Jisheng Zhang (5):
>   RISC-V: KVM: Record number of signal exits as a vCPU stat
>   RISC-V: KVM: Use generic guest entry infrastructure
>   riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
>   riscv: add lazy preempt support
>   riscv: Allow to enable RT
> 
>  arch/riscv/Kconfig                   |  3 +++
>  arch/riscv/include/asm/kvm_host.h    |  1 +
>  arch/riscv/include/asm/thread_info.h |  7 +++++--
>  arch/riscv/kernel/asm-offsets.c      |  1 +
>  arch/riscv/kernel/entry.S            |  9 +++++++--
>  arch/riscv/kvm/Kconfig               |  1 +
>  arch/riscv/kvm/vcpu.c                | 18 +++++++-----------
>  7 files changed, 25 insertions(+), 15 deletions(-)
> 
> --
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


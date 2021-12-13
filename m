From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 13 Dec 2021 13:12:06 -0800
Subject: [RFC 3/6] RISC-V: Use __cpu_up_stack/task_pointer only for
 spinwait method
In-Reply-To: <48012a35c4f66340547ff50525792a29@kernel.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-4-atishp@atishpatra.org>
 <48012a35c4f66340547ff50525792a29@kernel.org>
Message-ID: <CAOnJCUJQrOqEX94Zcv_rfZj3ja0mrM-3NSWwgxj_sn_Q+aHTmQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 13, 2021 at 4:59 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2021-12-04 00:20, Atish Patra wrote:
> > From: Atish Patra <atishp@rivosinc.com>
> >
> > The __cpu_up_stack/task_pointer array is only used for spinwait method
> > now. The per cpu array based lookup is also fragile for platforms with
> > discontiguous/sparse hartids. The spinwait method is only used for
> > M-mode Linux or older firmwares without SBI HSM extension. For general
> > Linux systems, ordered booting method is preferred anyways to support
> > cpu hotplug and kexec.
> >
> > Make sure that __cpu_up_stack/task_pointer is only used for spinwait
> > method. Take this opportunity to rename it to
> > __cpu_spinwait_stack/task_pointer to emphasize the purpose as well.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cpu_ops.h     |  2 --
> >  arch/riscv/kernel/cpu_ops.c          | 16 ----------------
> >  arch/riscv/kernel/cpu_ops_spinwait.c | 27 ++++++++++++++++++++++++++-
> >  arch/riscv/kernel/head.S             |  4 ++--
> >  arch/riscv/kernel/head.h             |  4 ++--
> >  5 files changed, 30 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/cpu_ops.h
> > b/arch/riscv/include/asm/cpu_ops.h
> > index a8ec3c5c1bd2..134590f1b843 100644
> > --- a/arch/riscv/include/asm/cpu_ops.h
> > +++ b/arch/riscv/include/asm/cpu_ops.h
> > @@ -40,7 +40,5 @@ struct cpu_operations {
> >
> >  extern const struct cpu_operations *cpu_ops[NR_CPUS];
> >  void __init cpu_set_ops(int cpu);
> > -void cpu_update_secondary_bootdata(unsigned int cpuid,
> > -                                struct task_struct *tidle);
> >
> >  #endif /* ifndef __ASM_CPU_OPS_H */
> > diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> > index 3f5a38b03044..c1e30f403c3b 100644
> > --- a/arch/riscv/kernel/cpu_ops.c
> > +++ b/arch/riscv/kernel/cpu_ops.c
> > @@ -8,31 +8,15 @@
> >  #include <linux/of.h>
> >  #include <linux/string.h>
> >  #include <linux/sched.h>
> > -#include <linux/sched/task_stack.h>
> >  #include <asm/cpu_ops.h>
> >  #include <asm/sbi.h>
> >  #include <asm/smp.h>
> >
> >  const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
> >
> > -void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
> > -void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
> > -
> >  extern const struct cpu_operations cpu_ops_sbi;
> >  extern const struct cpu_operations cpu_ops_spinwait;
> >
> > -void cpu_update_secondary_bootdata(unsigned int cpuid,
> > -                                struct task_struct *tidle)
> > -{
> > -     int hartid = cpuid_to_hartid_map(cpuid);
> > -
> > -     /* Make sure tidle is updated */
> > -     smp_mb();
> > -     WRITE_ONCE(__cpu_up_stack_pointer[hartid],
> > -                task_stack_page(tidle) + THREAD_SIZE);
> > -     WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
> > -}
> > -
> >  void __init cpu_set_ops(int cpuid)
> >  {
> >  #if IS_ENABLED(CONFIG_RISCV_SBI)
> > diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c
> > b/arch/riscv/kernel/cpu_ops_spinwait.c
> > index b2c957bb68c1..9f398eb94f7a 100644
> > --- a/arch/riscv/kernel/cpu_ops_spinwait.c
> > +++ b/arch/riscv/kernel/cpu_ops_spinwait.c
> > @@ -6,11 +6,36 @@
> >  #include <linux/errno.h>
> >  #include <linux/of.h>
> >  #include <linux/string.h>
> > +#include <linux/sched/task_stack.h>
> >  #include <asm/cpu_ops.h>
> >  #include <asm/sbi.h>
> >  #include <asm/smp.h>
> >
> >  const struct cpu_operations cpu_ops_spinwait;
> > +void *__cpu_spinwait_stack_pointer[NR_CPUS] __section(".data");
> > +void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
> > +
> > +static void cpu_update_secondary_bootdata(unsigned int cpuid,
> > +                                struct task_struct *tidle)
> > +{
> > +     int hartid = cpuid_to_hartid_map(cpuid);
> > +
> > +     /*
> > +      * The hartid must be less than NR_CPUS to avoid out-of-bound access
> > +      * errors for __cpu_spinwait_stack/task_pointer. That is not always
> > possible
> > +      * for platforms with discontiguous hartid numbering scheme. That's
> > why
> > +      * spinwait booting is not the recommended approach for any platforms
> > +      * and will be removed in future.
>
> How can you do that? Yes, spinning schemes are terrible.
> However, once you started supporting them, you are stuck.
>

This was a typo. It is supposed to say "disabled" in the future based
on other configs.
For now, it is enabled by default. Any platform with sparse hartid
needs to disable it in their own config.

In the future, we may be able to make it only available to M-mode
Linux if we can ensure that nobody is running
older firmware without SBI HSM extension.

> Best case, you can have an allow-list and only allow some
> older platforms to use them. You can also make some features
> dependent on non-spin schemes (kexec being one).
>
> But dropping support isn't a valid option, I'm afraid.
>
> Thanks,
>
>           M.
> --
> Jazz is not dead. It just smells funny...



-- 
Regards,
Atish


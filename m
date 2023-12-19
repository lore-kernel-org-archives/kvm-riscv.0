From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 19 Dec 2023 15:29:57 +0100
Subject: [PATCH v3 01/13] RISC-V: paravirt: Add skeleton for pv-time
 support
In-Reply-To: <CAOnJCULYeMz63LA-MR-Y9HqCU+dhBQdXf7Shwhu1FXFuck5gWA@mail.gmail.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
 <20231217204019.36492-16-ajones@ventanamicro.com>
 <CAOnJCULYeMz63LA-MR-Y9HqCU+dhBQdXf7Shwhu1FXFuck5gWA@mail.gmail.com>
Message-ID: <20231219-3ed5ceb6bcb61fcfebc4a342@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 18, 2023 at 04:48:04PM -0800, Atish Patra wrote:
> On Sun, Dec 17, 2023 at 12:40?PM Andrew Jones <ajones@ventanamicro.com> wrote:
...
> > +int __init pv_time_init(void)
> > +{
> > +       int ret;
> > +
> > +       if (!has_pv_steal_clock())
> > +               return 0;
> > +
> > +       ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > +                               "riscv/pv_time:online",
> > +                               pv_time_cpu_online,
> > +                               pv_time_cpu_down_prepare);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       static_call_update(pv_steal_clock, pv_time_steal_clock);
> > +
> > +       static_key_slow_inc(&paravirt_steal_enabled);
> > +       if (steal_acc)
> > +               static_key_slow_inc(&paravirt_steal_rq_enabled);
> > +
> > +       pr_info("using paravirt steal-time\n");
> > +
> 
> Nit comment:
> If the scheduler doesn't take stolen time into consideration (when If
> no-steal-acc is specified in the command line),
> the above log is a bit misleading ? ARM64 also seems to be doing the
> same thing.
> 
> Maybe the intention of the log is to steal time extension presence
> rather than actual usage in place ?

You're right that the word "using" isn't great. "Computing" would be
better as, even with no-steal-acc, steal time gets computed and shows
up in /proc/stat.

> 
> > +       return 0;
> > +}
> > diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> > index 23641e82a9df..ba3477197789 100644
> > --- a/arch/riscv/kernel/time.c
> > +++ b/arch/riscv/kernel/time.c
> > @@ -12,6 +12,7 @@
> >  #include <asm/sbi.h>
> >  #include <asm/processor.h>
> >  #include <asm/timex.h>
> > +#include <asm/paravirt.h>
> >
> >  unsigned long riscv_timebase __ro_after_init;
> >  EXPORT_SYMBOL_GPL(riscv_timebase);
> > @@ -45,4 +46,6 @@ void __init time_init(void)
> >         timer_probe();
> >
> >         tick_setup_hrtimer_broadcast();
> > +
> > +       pv_time_init();
> >  }
> > --
> > 2.43.0
> >
> 
> Other than that, lgtm.
> 
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Thanks,
drew


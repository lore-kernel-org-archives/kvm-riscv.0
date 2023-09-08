From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 8 Sep 2023 10:36:09 +0800
Subject: [PATCH v2 8/8] KVM: riscv: selftests: Add sstc timer test
In-Reply-To: <CAJve8om1VibbkHBuG4B+KbKY2eug42wGk9wiYtCYeF-WDY8EgQ@mail.gmail.com>
References: <cover.1693659382.git.haibo1.xu@intel.com> <d2b3c53537fef3f0a2d27d8be663a64123d4bc3c.1693659382.git.haibo1.xu@intel.com>
 <20230904-a69c6a228bf4553cc58bca17@orel> <CAJve8ok03P-t7pTA9mH=5vvkUy4NtxHac_Z_NM88cs55YQZATg@mail.gmail.com>
 <20230907-5d3da2b6dca23bedb31b33a0@orel> <CAJve8om1VibbkHBuG4B+KbKY2eug42wGk9wiYtCYeF-WDY8EgQ@mail.gmail.com>
Message-ID: <CAJve8o=_09khYSEapJfb2xiqzCLdM6FbR=Q9gAawZ6nhHDUZCQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 8, 2023 at 9:19?AM Haibo Xu <xiaobo55x@gmail.com> wrote:
>
> On Fri, Sep 8, 2023 at 3:01?AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Sep 07, 2023 at 12:20:29PM +0800, Haibo Xu wrote:
> > > On Mon, Sep 4, 2023 at 10:58?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > >
> > > > On Sat, Sep 02, 2023 at 08:59:30PM +0800, Haibo Xu wrote:
> > > > > Add a KVM selftest to validate the Sstc timer functionality.
> > > > > The test was ported from arm64 arch timer test.
> > > > >
> > > > > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > > > > ---
> > >
> > > > > diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
> > > > > new file mode 100644
> > > > > index 000000000000..c50a33c1e4f9
> > > > > --- /dev/null
> > > > > +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> > > > > @@ -0,0 +1,130 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +/*
> > > > > + * arch_timer.c - Tests the riscv64 sstc timer IRQ functionality
> > > > > + *
> > > > > + * The test validates the sstc timer IRQs using vstimecmp registers.
> > > > > + * It's ported from the aarch64 arch_timer test.

> > >
> > > > > +
> > > > > +static void guest_code(void)
> > > > > +{
> > > > > +     uint32_t cpu = guest_get_vcpuid();
> > > > > +     struct test_vcpu_shared_data *shared_data = &vcpu_shared_data[cpu];
> > > > > +
> > > > > +     local_irq_disable();
> > > > > +     timer_irq_disable();
> > > > > +     local_irq_enable();
> > > >
> > > > I don't think we need to disable all interrupts when disabling the timer
> > > > interrupt.
> > > >
> > >
> > > There is no local_irq_disable() protection during the initial debug
> > > phase, but the test always
> > > fail with below error messages:
> > >
> > > Guest assert failed,  vcpu 0; stage; 0; iter: 0
> > > ==== Test Assertion Failure ====
> > >   riscv/arch_timer.c:78: config_iter + 1 == irq_iter
> > >   pid=585 tid=586 errno=4 - Interrupted system call
> > >   (stack trace empty)
> > >   0x1 != 0x0 (config_iter + 1 != irq_iter)
> > >
> > > To be frank, I am not quite sure why the local_irq_disable/enable() matters.
> > > One possible reason may be some timer irq was triggered before we set up the
> > > timecmp register.
> >
> > We should ensure we know the exact, expected state of the vcpu before,
> > during, and after the test. If a state doesn't match expectations,
> > then the test should assert and we should go investigate the test code
> > to see if setup/checking is correct. If it is, then we've found a bug
> > in KVM that we need to go investigate.
> >
> > For Sstc, a pending timer interrupt completely depends on stimecmp, so
> > we need to watch that closely. Take a look at the attached simple timer
> > test I pulled together to illustrate how stimecmp, timer interrupt enable,
> > and all interrupt enable interact. You may want to use it to help port
> > the arch_timer.
> >
>
> Thanks for sharing the test codes. Will have an investigation on it.
>

Hi Andrew,

You are right. The local_irq_disable() was not needed here.
It's my fault that I also removed the local_irq_enable() when trying
your suggestion.

Thanks for your review and help on this patch set!

Regards,
Haibo

> > Thanks,
> > drew


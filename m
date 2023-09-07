From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 7 Sep 2023 12:20:29 +0800
Subject: [PATCH v2 8/8] KVM: riscv: selftests: Add sstc timer test
In-Reply-To: <20230904-a69c6a228bf4553cc58bca17@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com> <d2b3c53537fef3f0a2d27d8be663a64123d4bc3c.1693659382.git.haibo1.xu@intel.com>
 <20230904-a69c6a228bf4553cc58bca17@orel>
Message-ID: <CAJve8ok03P-t7pTA9mH=5vvkUy4NtxHac_Z_NM88cs55YQZATg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 4, 2023 at 10:58?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Sat, Sep 02, 2023 at 08:59:30PM +0800, Haibo Xu wrote:
> > Add a KVM selftest to validate the Sstc timer functionality.
> > The test was ported from arm64 arch timer test.
> >
> > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > ---

> > diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
> > new file mode 100644
> > index 000000000000..c50a33c1e4f9
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> > @@ -0,0 +1,130 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * arch_timer.c - Tests the riscv64 sstc timer IRQ functionality
> > + *
> > + * The test validates the sstc timer IRQs using vstimecmp registers.
> > + * It's ported from the aarch64 arch_timer test.
> > + *

> guest_run[_stage]() can be shared with aarch64, we just have a single
> stage=0 for riscv.
>

Yes, we can. But if we share the guest_run[_stage]() by moving it to
kvm/arch_timer.c
or kvm/include/timer_test.h, we need to declare extra sub-functions
somewhere in a
header file(etc. guest_configure_timer_action()).

> > +
> > +static void guest_code(void)
> > +{
> > +     uint32_t cpu = guest_get_vcpuid();
> > +     struct test_vcpu_shared_data *shared_data = &vcpu_shared_data[cpu];
> > +
> > +     local_irq_disable();
> > +     timer_irq_disable();
> > +     local_irq_enable();
>
> I don't think we need to disable all interrupts when disabling the timer
> interrupt.
>

There is no local_irq_disable() protection during the initial debug
phase, but the test always
fail with below error messages:

Guest assert failed,  vcpu 0; stage; 0; iter: 0
==== Test Assertion Failure ====
  riscv/arch_timer.c:78: config_iter + 1 == irq_iter
  pid=585 tid=586 errno=4 - Interrupted system call
  (stack trace empty)
  0x1 != 0x0 (config_iter + 1 != irq_iter)

To be frank, I am not quite sure why the local_irq_disable/enable() matters.
One possible reason may be some timer irq was triggered before we set up the
timecmp register.

> > +
> > +     guest_run(shared_data);
> > +
> > +     GUEST_DONE();
> > +}
> > +
> > +void test_vm_cleanup(struct kvm_vm *vm)
> > +{
> > +     kvm_vm_free(vm);
> > +}
> > --
> > 2.34.1
> >
>
> Thanks,
> drew


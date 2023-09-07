From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 7 Sep 2023 21:01:10 +0200
Subject: [PATCH v2 8/8] KVM: riscv: selftests: Add sstc timer test
In-Reply-To: <CAJve8ok03P-t7pTA9mH=5vvkUy4NtxHac_Z_NM88cs55YQZATg@mail.gmail.com>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <d2b3c53537fef3f0a2d27d8be663a64123d4bc3c.1693659382.git.haibo1.xu@intel.com>
 <20230904-a69c6a228bf4553cc58bca17@orel>
 <CAJve8ok03P-t7pTA9mH=5vvkUy4NtxHac_Z_NM88cs55YQZATg@mail.gmail.com>
Message-ID: <20230907-5d3da2b6dca23bedb31b33a0@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 07, 2023 at 12:20:29PM +0800, Haibo Xu wrote:
> On Mon, Sep 4, 2023 at 10:58?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Sat, Sep 02, 2023 at 08:59:30PM +0800, Haibo Xu wrote:
> > > Add a KVM selftest to validate the Sstc timer functionality.
> > > The test was ported from arm64 arch timer test.
> > >
> > > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > > ---
> 
> > > diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
> > > new file mode 100644
> > > index 000000000000..c50a33c1e4f9
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> > > @@ -0,0 +1,130 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * arch_timer.c - Tests the riscv64 sstc timer IRQ functionality
> > > + *
> > > + * The test validates the sstc timer IRQs using vstimecmp registers.
> > > + * It's ported from the aarch64 arch_timer test.
> > > + *
> 
> > guest_run[_stage]() can be shared with aarch64, we just have a single
> > stage=0 for riscv.
> >
> 
> Yes, we can. But if we share the guest_run[_stage]() by moving it to
> kvm/arch_timer.c
> or kvm/include/timer_test.h, we need to declare extra sub-functions
> somewhere in a
> header file(etc. guest_configure_timer_action()).

OK, whatever balances the reduction of duplicate code and avoidance of
exporting helper functions. BTW, riscv may not need/want all the same
helper functions as aarch64. Anyway, I guess I'll see how the next version
turns out.

> 
> > > +
> > > +static void guest_code(void)
> > > +{
> > > +     uint32_t cpu = guest_get_vcpuid();
> > > +     struct test_vcpu_shared_data *shared_data = &vcpu_shared_data[cpu];
> > > +
> > > +     local_irq_disable();
> > > +     timer_irq_disable();
> > > +     local_irq_enable();
> >
> > I don't think we need to disable all interrupts when disabling the timer
> > interrupt.
> >
> 
> There is no local_irq_disable() protection during the initial debug
> phase, but the test always
> fail with below error messages:
> 
> Guest assert failed,  vcpu 0; stage; 0; iter: 0
> ==== Test Assertion Failure ====
>   riscv/arch_timer.c:78: config_iter + 1 == irq_iter
>   pid=585 tid=586 errno=4 - Interrupted system call
>   (stack trace empty)
>   0x1 != 0x0 (config_iter + 1 != irq_iter)
> 
> To be frank, I am not quite sure why the local_irq_disable/enable() matters.
> One possible reason may be some timer irq was triggered before we set up the
> timecmp register.

We should ensure we know the exact, expected state of the vcpu before,
during, and after the test. If a state doesn't match expectations,
then the test should assert and we should go investigate the test code
to see if setup/checking is correct. If it is, then we've found a bug
in KVM that we need to go investigate.

For Sstc, a pending timer interrupt completely depends on stimecmp, so
we need to watch that closely. Take a look at the attached simple timer
test I pulled together to illustrate how stimecmp, timer interrupt enable,
and all interrupt enable interact. You may want to use it to help port
the arch_timer.

Thanks,
drew
-------------- next part --------------
#include <stdio.h>

#define CONFIG_64BIT
#include "kvm_util.h"
#include "riscv/arch_timer.h"

static unsigned long timer_freq;
static unsigned int irq_fired;

void mdelay(unsigned long msecs)
{
	while (msecs--)
		udelay(1000);
}

static void guest_irq_handler(struct ex_regs *regs)
{
	GUEST_PRINTF("%s\n", __func__);

	GUEST_ASSERT_EQ(regs->cause & ~CAUSE_IRQ_FLAG, IRQ_S_TIMER);

	irq_fired = 1;

	csr_write(CSR_STIMECMP, -1);
	while (csr_read(CSR_SIP) & IE_TIE)
		cpu_relax();
}

static void guest_code(void)
{
	GUEST_PRINTF("stage 1\n");
	mdelay(1000);

	GUEST_ASSERT_EQ(irq_fired, 0);

	GUEST_PRINTF("stage 2\n");
	timer_set_next_cval_ms(500);
	mdelay(1000);

	GUEST_ASSERT_EQ(irq_fired, 1);
	irq_fired = 0;

	GUEST_PRINTF("stage 3\n");
	csr_clear(CSR_SIE, IE_TIE);
	timer_set_next_cval_ms(500);
	mdelay(1000);

	GUEST_ASSERT_EQ(irq_fired, 0);

	GUEST_PRINTF("stage 4\n");
	csr_set(CSR_SIE, IE_TIE);
	mdelay(1);

	GUEST_ASSERT_EQ(irq_fired, 1);
	irq_fired = 0;

	GUEST_PRINTF("stage 5\n");
	csr_clear(CSR_SSTATUS, SR_IE);
	timer_set_next_cval_ms(500);
	mdelay(1000);

	GUEST_ASSERT_EQ(irq_fired, 0);

	GUEST_PRINTF("stage 6\n");
	csr_set(CSR_SSTATUS, SR_IE);
	mdelay(1);

	GUEST_ASSERT_EQ(irq_fired, 1);
	irq_fired = 0;

	GUEST_PRINTF("guest done\n");
	GUEST_DONE();
}

int main(void)
{
	struct kvm_vcpu *vcpu;
	struct kvm_vm *vm;
	struct ucall uc;
	uint64_t val;
	int done = 0;

	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
	vm_init_vector_tables(vm);
	vm_install_interrupt_handler(vm, guest_irq_handler);
	vcpu_init_vector_tables(vcpu);
	vcpu_set_reg(vcpu, RISCV_CSR_REG(sstatus), SR_IE);
	vcpu_set_reg(vcpu, RISCV_CSR_REG(sie), IE_TIE);

	vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency), &timer_freq);
	sync_global_to_guest(vm, timer_freq);

	vcpu_get_reg(vcpu, RISCV_TIMER_REG(compare), &val);
	assert(val == -1);

	while (!done) {
		vcpu_run(vcpu);

		switch (get_ucall(vcpu, &uc)) {
		case UCALL_PRINTF:
			printf("%s", uc.buffer);
			break;
		case UCALL_DONE:
			printf("Done.\n");
			done = 1;
			break;
		}
	}
}

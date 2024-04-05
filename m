From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 5 Apr 2024 14:48:15 +0200
Subject: [PATCH v4 13/15] KVM: riscv: selftests: Add SBI PMU selftest
In-Reply-To: <CAOnJCUK2D6-zP4=DiXRMeFQsMc9iG5nWY-yYHMhg83h_q+OtnQ@mail.gmail.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-14-atishp@rivosinc.com>
 <20240302-ed6c516829dc0ed616f39a45@orel>
 <CAOnJCUK2D6-zP4=DiXRMeFQsMc9iG5nWY-yYHMhg83h_q+OtnQ@mail.gmail.com>
Message-ID: <20240405-3242460b23ce1daf905242df@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 02, 2024 at 01:34:54AM -0700, Atish Patra wrote:
...
> > > +static void guest_illegal_exception_handler(struct ex_regs *regs)
> > > +{
> > > +     __GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
> > > +                    "Unexpected exception handler %lx\n", regs->cause);
> >
> > Shouldn't we be reporting somehow that we were here? We seem to be using
> > this handler to skip instructions which don't work, which is fine, if
> > we have some knowledge we skipped them and then do something else.
> > Otherwise I don't understand.
> >
> 
> This is only used in test_vm_basic_test to validate that the guest
> will get an illegal
> exception if they try to access without configuring first.

Yeah, that's good. I just don't see how we know we were ever here. We
either got the exception and then stepped over the CSR read or we did
the CSR read. Either way, the test progresses the same. Shouldn't this
induce a test skip or something instead?

> > > +
> > > +     counter_value_post = read_counter(counter, ctrinfo_arr[counter]);
> > > +     __GUEST_ASSERT(counter_value_post > counter_value_pre,
> > > +                    "counter_value_post %lx counter_value_pre %lx\n",
> > > +                    counter_value_post, counter_value_pre);
> > > +
> > > +     /* Now set the initial value and compare */
> > > +     start_counter(counter, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_init_value);
> >
> > We should try to confirm that we reset the counter, otherwise the check
> > below only proves that the value we read is greater than 100, which it
> > is possible even if the reset doesn't work.
> >
> 
> Hmm. There is no way to just update the counter value without starting
> it. Reading it without stopping is not reliable.
> Maybe we can do this.
> 
> 1. Reset it to 100. Stop it immediately after and read it. Let's say
> the value is X
> 2. Now reset it to counter  X + 1000.
> 3. Do the validation with the above reset value in #2.
> 
> Wdyt ?

OK

Thanks,
drew


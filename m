From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 4 Dec 2023 12:32:24 +0100
Subject: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
In-Reply-To: <CAJve8omitHDpijJaLV_wHk+5LXpsBUWF8_eTD4MeWKM-807Siw@mail.gmail.com>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
 <20230914-d2e594e7d84503ad14036e2d@orel>
 <CAJve8onhY534T=Hyncjfi4GfdZ+0D2xM+jRSaYCAWCdaKxPUcQ@mail.gmail.com>
 <CAJve8omitHDpijJaLV_wHk+5LXpsBUWF8_eTD4MeWKM-807Siw@mail.gmail.com>
Message-ID: <20231204-980c95cca344f718ac6a48b6@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 04, 2023 at 10:42:24AM +0800, Haibo Xu wrote:
> On Fri, Sep 15, 2023 at 2:21?PM Haibo Xu <xiaobo55x@gmail.com> wrote:
> >
> > On Thu, Sep 14, 2023 at 5:52?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Thu, Sep 14, 2023 at 09:37:03AM +0800, Haibo Xu wrote:
> > > > Add a KVM selftests to validate the Sstc timer functionality.
> > > > The test was ported from arm64 arch timer test.
> > >
> > > I just tried this test out. Running it over and over again on QEMU I see
> > > it works sometimes, but it frequently fails with the
> > > GUEST_ASSERT_EQ(config_iter + 1, irq_iter) assert and at least once I
> > > also saw the __GUEST_ASSERT(xcnt >= cmp) assert.
> > >
> >
> > Good catch!
> >
> > I can also reproduce this issue and it is a common problem for both
> > arm64 and riscv because it also happens in a arm64 Qemu VM.
> >
> > It seems like a synchronization issue between host and guest shared
> > variables. Will double check the test code.
> >
> > > Thanks,
> > > drew
> 
> Hi Andrew,
> 
> After several rounds of regression testing, some findings:
> 1. The intermittent failure also happened on ARM64 Qemu VM, and even
> in the initial arch_timer commit(4959d8650e9f4).
> 2. it didn't happen on a ARM64 HW(but a different failure occured
> during stress test)
> 3. The failure have a close relationship with
> TIMER_TEST_ERR_MARGIN_US(default 100), and after increasing
>      the macro to 300, the failure couldn't reproduced in 1000 loops
> stress test in RISC-V Qemu VM
> 
> So my suggestion is we can expose the TIMER_TEST_ERR_MARGIN_US
> parameter as an arch_timer test arg parameter
> and tune it based on a specific test environment.
> 
> What's your opinion?

The concept of "timeout for an interrupt to arrive" is always going to
leave us exposed to random failures. Your suggestion of making the
timeout user configurable is probably the best we can do. I would
suggest also adding more descriptive failure text and a hint about
trying to adjust the timeout.

Or, one thing we do in kvm-unit-tests, is to reduce typical delays while
allowing expected delays to be longer by looping over a shorter delay and
a non-fatal check, i.e.

 pass = false;
 for (i = 0; i < 10; i++) {
   udelay(100);
   if (check(...)) {
      pass = true;
      break;
   }
 }
 assert(pass);

We could try that approach here too.

Thanks,
drew


From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 14:58:39 +0800
Subject: [PATCH v2 2/8] KVM: arm64: selftest: Split arch_timer test code
In-Reply-To: <20230906-6996fca9840e6de7b75692ec@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com> <c87337cfd7fb135e2efed589360a78c26a402eac.1693659382.git.haibo1.xu@intel.com>
 <20230904-11e853ffe3d8e9cf9ec6079d@orel> <CAJve8onwjBQcbVy75qyOF3A51-T0WyBkmeCV_wOZvzaPcrBVFg@mail.gmail.com>
 <20230906-6996fca9840e6de7b75692ec@orel>
Message-ID: <CAJve8okKAMp5dG-=rwmP+8ndk_jzOvAz5s8uhU8JdMer5WbEng@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 6, 2023 at 2:41?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Sep 06, 2023 at 10:14:52AM +0800, Haibo Xu wrote:
> > On Mon, Sep 4, 2023 at 9:24?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Sat, Sep 02, 2023 at 08:59:24PM +0800, Haibo Xu wrote:
> ...
> > > > +
> > > > +#include "kvm_util.h"
> > > > +
> > > > +#define NR_VCPUS_DEF            4
> > > > +#define NR_TEST_ITERS_DEF       5
> > > > +#define TIMER_TEST_PERIOD_MS_DEF    10
> > > > +#define TIMER_TEST_ERR_MARGIN_US    100
> > > > +#define TIMER_TEST_MIGRATION_FREQ_MS    2
> > > > +
> > > > +#define msecs_to_usecs(msec)    ((msec) * 1000LL)
> > >
> > > I'd move the above to include/test_util.h
> > >
> >
> > Yes, msecs_to_usecs() macro should be a common API for all the tests.
> >
> > > > +
> > > > +#define GICD_BASE_GPA    0x8000000ULL
> > > > +#define GICR_BASE_GPA    0x80A0000ULL
> > >
> > > These defines belong in aarch64/arch_timer.c
> > >
> >
> > These 2 defines were also defined in other test cases, shall we move them
> > to an aarch64 specific header file? Maybe
> > tools/testing/selftests/kvm/include/aarch64/gic.h?
>
> Even though currently all the aarch64 tests that use the gic are using
> these defines for the base addresses, each test is free to choose whatever
> base addresses it likes. I'd just move them back to aarch64/arch_timer.c
> for now. Consolidating them into shared, default base addresses, if done
> at all, is work for another series.
>

Ok, will move them to aarch64/arch_timer.c for this test.

> Thanks,
> drew


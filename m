From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sun, 7 Apr 2024 14:08:47 +0800
Subject: [PATCH] KVM: riscv: selftests: Add SBI base extension test
In-Reply-To: <CAK9=C2WZB1hB-1d=16gsfWB3y=xCq5=PtfDGXc-W4ERwvWjRUg@mail.gmail.com>
References: <20240401082019.2318193-1-haibo1.xu@intel.com> <20240402-7bd2b9ed00094befa6927b60@orel>
 <CAJve8onPGb_ZqXaU7t50893PKS=9mrbzqvthc8dYMHDFKJdUAg@mail.gmail.com> <CAK9=C2WZB1hB-1d=16gsfWB3y=xCq5=PtfDGXc-W4ERwvWjRUg@mail.gmail.com>
Message-ID: <CAJve8ok1NtEf7=eDKkvZ-wv4Qb2UqzFQ-mWqkP1RNQKZRwnSKA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 7, 2024 at 12:45?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Sun, Apr 7, 2024 at 8:11?AM Haibo Xu <xiaobo55x@gmail.com> wrote:
> >
> > On Tue, Apr 2, 2024 at 10:12?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Mon, Apr 01, 2024 at 04:20:18PM +0800, Haibo Xu wrote:
> > > > This is the first patch to enable the base extension selftest
> > > > for the SBI implementation in KVM. Test for other extensions
> > > > will be added later.
> > >
> > > I'm not sure we want SBI tests in KVM selftests since we already
> > > plan to add them to kvm-unit-tests, where they can be used to
> > > test both KVM's SBI implementation and M-mode firmware implementations.
> > > If we also have them here, then we'll end up duplicating that effort.
> > >
> >
> > Thanks for the information, Andrew!
> >
> > The SBI KVM selftest was planned last year when I talked with Anup about
> > KVM selftest support on RISC-V. Since the kvm-unit-tests has already covered
> > it, I'm fine to drop the support in KVM selftest.
>
> Initially we did plan to have all SBI tests under KVM selftests but later
> we decided to have SBI tests at a common place which will benefit all
> hypervisors and M-mode firmwares implementing SBI spec.
>
> Instead of this, I suggest we should have more selfttests targeting
> AIA (CSRs, IMSIC, and APLIC) virtualization.
>

Sure.

> Regards,
> Anup
>
> >
> > Regards,
> > Haibo
> >
> > > I do like the approach of only checking for an error, rather than
> > > also for a value, for these ID getters. In kvm-unit-tests we're
> > > currently requiring that the expected value be passed in, otherwise
> > > the whole test is skipped. We could fallback to only checking for
> > > an error instead, as is done here.
> > >
> > > Thanks,
> > > drew
> > >
> > > >
> > > > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > > > ---
> > > >  tools/testing/selftests/kvm/Makefile          |  1 +
> > > >  .../selftests/kvm/include/riscv/processor.h   |  8 +-
> > > >  tools/testing/selftests/kvm/riscv/sbi_test.c  | 95 +++++++++++++++++++
> > > >  3 files changed, 103 insertions(+), 1 deletion(-)
> > > >  create mode 100644 tools/testing/selftests/kvm/riscv/sbi_test.c
> > > >
> > > > diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> > > > index 741c7dc16afc..a6acbbcad757 100644
> > > > --- a/tools/testing/selftests/kvm/Makefile
> > > > +++ b/tools/testing/selftests/kvm/Makefile
> > > > @@ -189,6 +189,7 @@ TEST_GEN_PROGS_s390x += rseq_test
> > > >  TEST_GEN_PROGS_s390x += set_memory_region_test
> > > >  TEST_GEN_PROGS_s390x += kvm_binary_stats_test
> > > >
> > > > +TEST_GEN_PROGS_riscv += riscv/sbi_test
> > > >  TEST_GEN_PROGS_riscv += arch_timer
> > > >  TEST_GEN_PROGS_riscv += demand_paging_test
> > > >  TEST_GEN_PROGS_riscv += dirty_log_test
> > > > diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> > > > index ce473fe251dd..df530ac751c4 100644
> > > > --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> > > > +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> > > > @@ -178,7 +178,13 @@ enum sbi_ext_id {
> > > >  };
> > > >
> > > >  enum sbi_ext_base_fid {
> > > > -     SBI_EXT_BASE_PROBE_EXT = 3,
> > > > +     SBI_EXT_BASE_GET_SPEC_VERSION = 0,
> > > > +     SBI_EXT_BASE_GET_IMP_ID,
> > > > +     SBI_EXT_BASE_GET_IMP_VERSION,
> > > > +     SBI_EXT_BASE_PROBE_EXT,
> > > > +     SBI_EXT_BASE_GET_MVENDORID,
> > > > +     SBI_EXT_BASE_GET_MARCHID,
> > > > +     SBI_EXT_BASE_GET_MIMPID,
> > > >  };
> > > >
> > > >  struct sbiret {
> > > > diff --git a/tools/testing/selftests/kvm/riscv/sbi_test.c b/tools/testing/selftests/kvm/riscv/sbi_test.c
> > > > new file mode 100644
> > > > index 000000000000..b9378546e3b6
> > > > --- /dev/null
> > > > +++ b/tools/testing/selftests/kvm/riscv/sbi_test.c
> > > > @@ -0,0 +1,95 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * sbi_test - SBI API test for KVM's SBI implementation.
> > > > + *
> > > > + * Copyright (c) 2024 Intel Corporation
> > > > + *
> > > > + * Test cover the following SBI extentions:
> > > > + *  - Base: All functions in this extension should be supported
> > > > + */
> > > > +
> > > > +#include "kvm_util.h"
> > > > +#include "processor.h"
> > > > +#include "test_util.h"
> > > > +
> > > > +/*
> > > > + * Test that all functions in the base extension must be supported
> > > > + */
> > > > +static void base_ext_guest_code(void)
> > > > +{
> > > > +     struct sbiret ret;
> > > > +
> > > > +     /*
> > > > +      * Since the base extension was introduced in SBI Spec v0.2,
> > > > +      * assert if the implemented SBI version is below 0.2.
> > > > +      */
> > > > +     ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0,
> > > > +                     0, 0, 0, 0, 0);
> > > > +     __GUEST_ASSERT(!ret.error && ret.value >= 2, "Get Spec Version Error: ret.error=%ld, "
> > > > +                     "ret.value=%ld\n", ret.error, ret.value);
> > > > +
> > > > +     ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID, 0,
> > > > +                     0, 0, 0, 0, 0);
> > > > +     __GUEST_ASSERT(!ret.error && ret.value == 3, "Get Imp ID Error: ret.error=%ld, "
> > > > +                     "ret.value=%ld\n",
> > > > +                     ret.error, ret.value);
> > > > +
> > > > +     ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_VERSION, 0,
> > > > +                     0, 0, 0, 0, 0);
> > > > +     __GUEST_ASSERT(!ret.error, "Get Imp Version Error: ret.error=%ld\n", ret.error);
> > > > +
> > > > +     ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE,
> > > > +                     0, 0, 0, 0, 0);
> > > > +     __GUEST_ASSERT(!ret.error && ret.value == 1, "Probe ext Error: ret.error=%ld, "
> > > > +                     "ret.value=%ld\n",
> > > > +                     ret.error, ret.value);
> > > > +
> > > > +     ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0,
> > > > +                     0, 0, 0, 0, 0);
> > > > +     __GUEST_ASSERT(!ret.error, "Get Machine Vendor ID Error: ret.error=%ld\n", ret.error);
> > > > +
> > > > +     ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MARCHID, 0,
> > > > +                     0, 0, 0, 0, 0);
> > > > +     __GUEST_ASSERT(!ret.error, "Get Machine Arch ID Error: ret.error=%ld\n", ret.error);
> > > > +
> > > > +     ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MIMPID, 0,
> > > > +                     0, 0, 0, 0, 0);
> > > > +     __GUEST_ASSERT(!ret.error, "Get Machine Imp ID Error: ret.error=%ld\n", ret.error);
> > > > +
> > > > +     GUEST_DONE();
> > > > +}
> > > > +
> > > > +static void sbi_base_ext_test(void)
> > > > +{
> > > > +     struct kvm_vm *vm;
> > > > +     struct kvm_vcpu *vcpu;
> > > > +     struct ucall uc;
> > > > +
> > > > +     vm = vm_create_with_one_vcpu(&vcpu, base_ext_guest_code);
> > > > +     while (1) {
> > > > +             vcpu_run(vcpu);
> > > > +             TEST_ASSERT(vcpu->run->exit_reason == UCALL_EXIT_REASON,
> > > > +                         "Unexpected exit reason: %u (%s),",
> > > > +                         vcpu->run->exit_reason, exit_reason_str(vcpu->run->exit_reason));
> > > > +
> > > > +             switch (get_ucall(vcpu, &uc)) {
> > > > +             case UCALL_DONE:
> > > > +                     goto done;
> > > > +             case UCALL_ABORT:
> > > > +                     fprintf(stderr, "Guest assert failed!\n");
> > > > +                     REPORT_GUEST_ASSERT(uc);
> > > > +             default:
> > > > +                     TEST_FAIL("Unexpected ucall %lu", uc.cmd);
> > > > +             }
> > > > +     }
> > > > +
> > > > +done:
> > > > +     kvm_vm_free(vm);
> > > > +}
> > > > +
> > > > +int main(void)
> > > > +{
> > > > +     sbi_base_ext_test();
> > > > +
> > > > +     return 0;
> > > > +}
> > > > --
> > > > 2.34.1
> > > >
> >


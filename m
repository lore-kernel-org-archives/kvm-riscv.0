From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sun, 18 Feb 2024 14:41:00 +0800
Subject: [PATCH v5 00/12] RISCV: Add kvm Sstc timer selftests
In-Reply-To: <CAAhSdy2wFzk0h5MiM5y9Fij0HyWake=7vNuV1MExUxkEtMWShw@mail.gmail.com>
References: <cover.1705916069.git.haibo1.xu@intel.com> <CAAhSdy2wFzk0h5MiM5y9Fij0HyWake=7vNuV1MExUxkEtMWShw@mail.gmail.com>
Message-ID: <CAJve8okkfvdRtvh8onQYL7_bmv9ntrViP54u805fQMq3apWFcQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 12, 2024 at 8:24?PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jan 22, 2024 at 3:15?PM Haibo Xu <haibo1.xu@intel.com> wrote:
> >
> > The RISC-V arch_timer selftests is used to validate Sstc timer
> > functionality in a guest, which sets up periodic timer interrupts
> > and check the basic interrupt status upon its receipt.
> >
> > This KVM selftests was ported from aarch64 arch_timer and tested
> > with Linux v6.7-rc8 on a Qemu riscv64 virt machine.
> >
> > ---
> > Changed since v4:
> >   * Rebased to Linux 6.7-rc8
> >   * Added new patch(2/12) to clean up the data type in struct test_args
> >   * Re-ordered patch(11/11) in v4 to patch(3/12)
> >   * Changed the timer_err_margin_us type from int to uint32_t
> >
> > Haibo Xu (11):
> >   KVM: arm64: selftests: Data type cleanup for arch_timer test
> >   KVM: arm64: selftests: Enable tuning of error margin in arch_timer
> >     test
> >   KVM: arm64: selftests: Split arch_timer test code
> >   KVM: selftests: Add CONFIG_64BIT definition for the build
> >   tools: riscv: Add header file csr.h
> >   tools: riscv: Add header file vdso/processor.h
> >   KVM: riscv: selftests: Switch to use macro from csr.h
> >   KVM: riscv: selftests: Add exception handling support
> >   KVM: riscv: selftests: Add guest helper to get vcpu id
> >   KVM: riscv: selftests: Change vcpu_has_ext to a common function
> >   KVM: riscv: selftests: Add sstc timer test
> >
> > Paolo Bonzini (1):
> >   selftests/kvm: Fix issues with $(SPLIT_TESTS)
>
> Rebased on Linux-6.8-rc4 and queued this series for Linux-6.9
>

Thanks!

> Thanks,
> Anup
>
> >
> >  tools/arch/riscv/include/asm/csr.h            | 541 ++++++++++++++++++
> >  tools/arch/riscv/include/asm/vdso/processor.h |  32 ++
> >  tools/testing/selftests/kvm/Makefile          |  27 +-
> >  .../selftests/kvm/aarch64/arch_timer.c        | 295 +---------
> >  tools/testing/selftests/kvm/arch_timer.c      | 259 +++++++++
> >  .../selftests/kvm/include/aarch64/processor.h |   4 -
> >  .../selftests/kvm/include/kvm_util_base.h     |   9 +
> >  .../selftests/kvm/include/riscv/arch_timer.h  |  71 +++
> >  .../selftests/kvm/include/riscv/processor.h   |  65 ++-
> >  .../testing/selftests/kvm/include/test_util.h |   2 +
> >  .../selftests/kvm/include/timer_test.h        |  45 ++
> >  .../selftests/kvm/lib/riscv/handlers.S        | 101 ++++
> >  .../selftests/kvm/lib/riscv/processor.c       |  87 +++
> >  .../testing/selftests/kvm/riscv/arch_timer.c  | 111 ++++
> >  .../selftests/kvm/riscv/get-reg-list.c        |  11 +-
> >  15 files changed, 1353 insertions(+), 307 deletions(-)
> >  create mode 100644 tools/arch/riscv/include/asm/csr.h
> >  create mode 100644 tools/arch/riscv/include/asm/vdso/processor.h
> >  create mode 100644 tools/testing/selftests/kvm/arch_timer.c
> >  create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
> >  create mode 100644 tools/testing/selftests/kvm/include/timer_test.h
> >  create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
> >  create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c
> >
> > --
> > 2.34.1
> >


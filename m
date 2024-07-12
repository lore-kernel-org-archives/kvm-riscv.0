From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 12 Jul 2024 17:22:18 +0200
Subject: [GIT PULL] KVM/riscv changes for 6.11
In-Reply-To: <CAAhSdy0jae8TYcbChockXDJ9qL+HnA1p3YJQi32NHQsLUtCGDA@mail.gmail.com>
References: <CAAhSdy0jae8TYcbChockXDJ9qL+HnA1p3YJQi32NHQsLUtCGDA@mail.gmail.com>
Message-ID: <CABgObfZJJHg41KH8=a9Sw7F8A8vthKTmx+w-hH-JP-+8BU3Wug@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Pulled, thanks.

Paolo

On Fri, Jul 12, 2024 at 2:11?PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have the following KVM RISC-V changes for 6.11:
> 1) Redirect AMO load/store access fault traps to guest
> 2) Perf kvm stat support for RISC-V
> 3) Use HW IMSIC guest files when available
>
> In addition to above, ONE_REG support for Zimop,
> Zcmop, Zca, Zcf, Zcd, Zcb and Zawrs ISA extensions
> is going through the RISC-V tree.
>
> Please pull.
>
> Regards,
> Anup
>
> The following changes since commit 0fc670d07d5de36a54f061f457743c9cde1d8b46:
>
>   KVM: selftests: Fix RISC-V compilation (2024-06-06 15:53:16 +0530)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.11-1
>
> for you to fetch changes up to e325618349cdc1fbbe63574080249730e7cff9ea:
>
>   RISC-V: KVM: Redirect AMO load/store access fault traps to guest
> (2024-06-26 18:37:41 +0530)
>
> ----------------------------------------------------------------
> KVM/riscv changes for 6.11
>
> - Redirect AMO load/store access fault traps to guest
> - Perf kvm stat support for RISC-V
> - Use HW IMSIC guest files when available
>
> ----------------------------------------------------------------
> Anup Patel (2):
>       RISC-V: KVM: Share APLIC and IMSIC defines with irqchip drivers
>       RISC-V: KVM: Use IMSIC guest files when available
>
> Shenlin Liang (2):
>       RISCV: KVM: add tracepoints for entry and exit events
>       perf kvm/riscv: Port perf kvm stat to RISC-V
>
> Yu-Wei Hsu (1):
>       RISC-V: KVM: Redirect AMO load/store access fault traps to guest
>
>  arch/riscv/include/asm/kvm_aia_aplic.h             | 58 ----------------
>  arch/riscv/include/asm/kvm_aia_imsic.h             | 38 -----------
>  arch/riscv/kvm/aia.c                               | 35 ++++++----
>  arch/riscv/kvm/aia_aplic.c                         |  2 +-
>  arch/riscv/kvm/aia_device.c                        |  2 +-
>  arch/riscv/kvm/aia_imsic.c                         |  2 +-
>  arch/riscv/kvm/trace.h                             | 67 +++++++++++++++++++
>  arch/riscv/kvm/vcpu.c                              |  7 ++
>  arch/riscv/kvm/vcpu_exit.c                         |  2 +
>  tools/perf/arch/riscv/Makefile                     |  1 +
>  tools/perf/arch/riscv/util/Build                   |  1 +
>  tools/perf/arch/riscv/util/kvm-stat.c              | 78 ++++++++++++++++++++++
>  tools/perf/arch/riscv/util/riscv_exception_types.h | 35 ++++++++++
>  13 files changed, 215 insertions(+), 113 deletions(-)
>  delete mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
>  delete mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h
>  create mode 100644 arch/riscv/kvm/trace.h
>  create mode 100644 tools/perf/arch/riscv/util/kvm-stat.c
>  create mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h
>



From: Sean Christopherson <seanjc@google.com>
Date: Mon, 31 Jul 2023 14:57:21 -0700
Subject: [PATCH v7 00/12] KVM: arm64: Add support for FEAT_TLBIRANGE
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
References: <20230722022251.3446223-1-rananta@google.com>
Message-ID: <ZMguQayWzKU3/8o5@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 22, 2023, Raghavendra Rao Ananta wrote:
>  arch/arm64/include/asm/kvm_asm.h     |   3 +
>  arch/arm64/include/asm/kvm_host.h    |   6 ++
>  arch/arm64/include/asm/kvm_pgtable.h |  10 +++
>  arch/arm64/include/asm/tlbflush.h    | 109 ++++++++++++++-------------
>  arch/arm64/kvm/Kconfig               |   1 -
>  arch/arm64/kvm/arm.c                 |   6 --
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c   |  11 +++
>  arch/arm64/kvm/hyp/nvhe/tlb.c        |  30 ++++++++
>  arch/arm64/kvm/hyp/pgtable.c         |  90 +++++++++++++++++++---
>  arch/arm64/kvm/hyp/vhe/tlb.c         |  27 +++++++
>  arch/arm64/kvm/mmu.c                 |  15 +++-
>  arch/mips/include/asm/kvm_host.h     |   4 +-
>  arch/mips/kvm/mips.c                 |  12 +--
>  arch/riscv/kvm/mmu.c                 |   6 --
>  arch/x86/include/asm/kvm_host.h      |   7 +-
>  arch/x86/kvm/mmu/mmu.c               |  25 ++----
>  arch/x86/kvm/mmu/mmu_internal.h      |   3 -
>  arch/x86/kvm/x86.c                   |   2 +-
>  include/linux/kvm_host.h             |  20 +++--
>  virt/kvm/Kconfig                     |   3 -
>  virt/kvm/kvm_main.c                  |  35 +++++++--
>  21 files changed, 294 insertions(+), 131 deletions(-)

Unless I've missed something, nothing in this series conflicts with anything that's
on the horizon for x86, so feel free to take this through the ARM tree once we've
emerged from behind the bikeshed :-)


From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Jul 2022 15:06:28 +0530
Subject: [PATCH v2 0/3] Improve instruction and CSR emulation in KVM RISC-V
In-Reply-To: <20220615104025.941382-1-apatel@ventanamicro.com>
References: <20220615104025.941382-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy3gmnqB6La125i2hdVh6eNiwqG6saqz4RTTYF=2Gqo6cA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 15, 2022 at 4:10 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, the instruction emulation for MMIO traps and Virtual instruction
> traps co-exist with general VCPU exit handling. The instruction and CSR
> emulation will grow with upcoming SBI PMU, AIA, and Nested virtualization
> in KVM RISC-V. In addition, we also need a mechanism to allow user-space
> emulate certain CSRs under certain situation (example, host has AIA support
> but user-space does not wants to use in-kernel AIA IMSIC and APLIC support).
>
> This series improves instruction and CSR emulation in KVM RISC-V to make
> it extensible based on above.
>
> These patches can also be found in riscv_kvm_csr_v2 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v1:
>  - Added a switch-case in PATCH3 to process MMIO, CSR, and SBI returned
>    from user-space
>  - Removed hard-coding in PATCH3 for determining type of CSR instruction
>
> Anup Patel (3):
>   RISC-V: KVM: Factor-out instruction emulation into separate sources
>   RISC-V: KVM: Add extensible system instruction emulation framework
>   RISC-V: KVM: Add extensible CSR emulation framework

I have queued this series for 5.20

Thanks,
Anup

>
>  arch/riscv/include/asm/kvm_host.h           |  16 +-
>  arch/riscv/include/asm/kvm_vcpu_insn.h      |  48 ++
>  arch/riscv/kvm/Makefile                     |   1 +
>  arch/riscv/kvm/vcpu.c                       |  34 +-
>  arch/riscv/kvm/vcpu_exit.c                  | 490 +----------------
>  arch/riscv/kvm/{vcpu_exit.c => vcpu_insn.c} | 563 +++++++++++---------
>  include/uapi/linux/kvm.h                    |   8 +
>  7 files changed, 392 insertions(+), 768 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_insn.h
>  copy arch/riscv/kvm/{vcpu_exit.c => vcpu_insn.c} (63%)
>
> --
> 2.34.1
>


From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 31 Jan 2023 11:31:19 +0530
Subject: [PATCH v2 0/7] RISC-V KVM virtualize AIA CSRs
In-Reply-To: <20230128072737.2995881-1-apatel@ventanamicro.com>
References: <20230128072737.2995881-1-apatel@ventanamicro.com>
Message-ID: <CAK9=C2W=MPqU8UGBt89HMWW7Mpda8prm3_8WnuTR=8vipynDYQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Palmer,

On Sat, Jan 28, 2023 at 12:57 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The RISC-V AIA specification is now frozen as-per the RISC-V international
> process. The latest frozen specifcation can be found at:
> https://github.com/riscv/riscv-aia/releases/download/1.0-RC1/riscv-interrupts-1.0-RC1.pdf
>
> This series implements first phase of AIA virtualization which targets
> virtualizing AIA CSRs. This also provides a foundation for the second
> phase of AIA virtualization which will target in-kernel AIA irqchip
> (including both IMSIC and APLIC).
>
> The first two patches are shared with the "Linux RISC-V AIA Support"
> series which adds AIA driver support.
>
> To test this series, use AIA drivers from the "Linux RISC-V AIA Support"
> series and use KVMTOOL from the riscv_aia_v1 branch at:
> https://github.com/avpatel/kvmtool.git
>
> These patches can also be found in the riscv_kvm_aia_csr_v2 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v1:
>  - Addressed from Drew and Conor in PATCH1
>  - Use alphabetical ordering for SMAIA and SSAIA enum in PATCH2
>  - Use GENMASK() in PATCH3
>
> Anup Patel (7):
>   RISC-V: Add AIA related CSR defines
>   RISC-V: Detect AIA CSRs from ISA string
>   RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
>   RISC-V: KVM: Initial skeletal support for AIA
>   RISC-V: KVM: Add ONE_REG interface for AIA CSRs
>   RISC-V: KVM: Virtualize per-HART AIA CSRs
>   RISC-V: KVM: Implement guest external interrupt line management

Can you please provide ACK for the first two patches so that I can
take it through the KVM RISC-V tree. ?

Regards,
Anup

>
>  arch/riscv/include/asm/csr.h      | 107 ++++-
>  arch/riscv/include/asm/hwcap.h    |   8 +
>  arch/riscv/include/asm/kvm_aia.h  | 137 +++++++
>  arch/riscv/include/asm/kvm_host.h |  14 +-
>  arch/riscv/include/uapi/asm/kvm.h |  22 +-
>  arch/riscv/kernel/cpu.c           |   2 +
>  arch/riscv/kernel/cpufeature.c    |   2 +
>  arch/riscv/kvm/Makefile           |   1 +
>  arch/riscv/kvm/aia.c              | 624 ++++++++++++++++++++++++++++++
>  arch/riscv/kvm/main.c             |  14 +
>  arch/riscv/kvm/mmu.c              |   3 +-
>  arch/riscv/kvm/vcpu.c             | 185 +++++++--
>  arch/riscv/kvm/vcpu_insn.c        |   4 +-
>  arch/riscv/kvm/vm.c               |   4 +
>  arch/riscv/kvm/vmid.c             |   4 +-
>  15 files changed, 1075 insertions(+), 56 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_aia.h
>  create mode 100644 arch/riscv/kvm/aia.c
>
> --
> 2.34.1
>


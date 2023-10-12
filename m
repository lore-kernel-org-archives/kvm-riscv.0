From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Oct 2023 09:50:29 +0530
Subject: [kvmtool PATCH v2 0/6] RISC-V AIA irqchip and Svnapot support
In-Reply-To: <20230918125730.1371985-1-apatel@ventanamicro.com>
References: <20230918125730.1371985-1-apatel@ventanamicro.com>
Message-ID: <CAK9=C2Vvu=kcR5CtzSFFh4DFvqxMsLrLNAHpMxoxrCf8nUixbw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Will,

On Mon, Sep 18, 2023 at 6:27?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The latest KVM in Linux-6.5 has support for:
> 1) Svnapot ISA extension support
> 2) AIA in-kernel irqchip support
>
> This series adds corresponding changes in KVMTOOL to use the above
> mentioned features for Guest/VM.
>
> These patches can also be found in the riscv_aia_v2 branch at:
> https://github.com/avpatel/kvmtool.git
>
> Changes since v1:
>  - Rebased on commit 9cb1b46cb765972326a46bdba867d441a842af56
>  - Updated PATCH1 to sync header with released Linux-6.5
>
> Anup Patel (6):
>   Sync-up header with Linux-6.5 for KVM RISC-V
>   riscv: Add Svnapot extension support
>   riscv: Make irqchip support pluggable
>   riscv: Add IRQFD support for in-kernel AIA irqchip
>   riscv: Use AIA in-kernel irqchip whenever KVM RISC-V supports
>   riscv: Fix guest/init linkage for multilib toolchain

Friendly ping ?

>
>  Makefile                            |   3 +
>  include/linux/kvm.h                 |   6 +-
>  riscv/aia.c                         | 227 ++++++++++++++++++++++++++++
>  riscv/fdt.c                         |  15 +-
>  riscv/include/asm/kvm.h             |  81 ++++++++++
>  riscv/include/kvm/fdt-arch.h        |   8 +-
>  riscv/include/kvm/kvm-arch.h        |  38 ++++-
>  riscv/include/kvm/kvm-config-arch.h |   3 +
>  riscv/irq.c                         | 138 ++++++++++++++++-
>  riscv/kvm.c                         |   2 +
>  riscv/pci.c                         |  32 ++--
>  riscv/plic.c                        |  61 ++++----
>  12 files changed, 563 insertions(+), 51 deletions(-)
>  create mode 100644 riscv/aia.c
>
> --
> 2.34.1
>

Regards,
Anup


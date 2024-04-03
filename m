From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 3 Apr 2024 16:50:25 +0530
Subject: [kvmtool PATCH v2 00/10] More ISA extensions
In-Reply-To: <20240325153141.6816-1-apatel@ventanamicro.com>
References: <20240325153141.6816-1-apatel@ventanamicro.com>
Message-ID: <CAK9=C2UMLO+ft-j=qfmuv+Xc16z6JbDKcQf9+jJftwR5FdGYAA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Will,

On Mon, Mar 25, 2024 at 9:01?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series adds support more ISA extensions namely: Zbc, scalar crypto,
> vector crypto, Zfh[min], Zihintntl, Zvfh[min], and Zfa. The series also
> adds a command-line option to disable SBI STA extension for Guest/VM.
>
> These patches can also be found in the riscv_more_exts_v2 branch at:
> https://github.com/avpatel/kvmtool.git
>
> Changes since v1:
>  - Rebased on commit 4d2c017f41533b0e51e00f689050c26190a15318
>  - Addressed Drew's comments on PATCH4
>
> Anup Patel (10):
>   Sync-up headers with Linux-6.8 for KVM RISC-V
>   kvmtool: Fix absence of __packed definition
>   riscv: Add Zbc extension support
>   riscv: Add scalar crypto extensions support
>   riscv: Add vector crypto extensions support
>   riscv: Add Zfh[min] extensions support
>   riscv: Add Zihintntl extension support
>   riscv: Add Zvfh[min] extensions support
>   riscv: Add Zfa extensiona support
>   riscv: Allow disabling SBI STA extension for Guest

Friendly ping ?

>
>  include/kvm/compiler.h              |   2 +
>  include/linux/kvm.h                 | 140 ++++++++++------------------
>  include/linux/virtio_config.h       |   8 +-
>  include/linux/virtio_pci.h          |  68 ++++++++++++++
>  riscv/fdt.c                         |  27 ++++++
>  riscv/include/asm/kvm.h             |  40 ++++++++
>  riscv/include/kvm/csr.h             |  16 ++++
>  riscv/include/kvm/kvm-config-arch.h |  86 ++++++++++++++++-
>  riscv/kvm-cpu.c                     |  32 +++++++
>  x86/include/asm/kvm.h               |   3 +
>  10 files changed, 330 insertions(+), 92 deletions(-)
>  create mode 100644 riscv/include/kvm/csr.h
>
> --
> 2.34.1
>

Regards,
Anup


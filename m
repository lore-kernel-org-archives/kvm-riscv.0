From: Anup Patel <anup@brainfault.org>
Date: Wed, 31 Aug 2022 15:29:42 +0530
Subject: [PATCH kvmtool 0/5] KVMTOOL RISC-V Svpbmt and Sstc Support
In-Reply-To: <20220815101325.477694-1-apatel@ventanamicro.com>
References: <20220815101325.477694-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy3XF79M1juW7T_A2YvrZS+rcywDih2xi02=6uius33-0g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Will,

On Mon, Aug 15, 2022 at 3:43 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The latest Linux-6.0-rc1 has support for Svpbmt and Sstc extensions
> in KVM RISC-V. This series adds corresponding changes in KVMTOOL to
> allow Guest/VM use these new RISC-V extensions.
>
> The PATCH5 is an unrelated fix which was discovered while developing
> this series.
>
> These patches can also be found in the riscv_svpbmt_sstc_v1 branch
> at: https://github.com/avpatel/kvmtool.git
>
> Anup Patel (3):
>   Update UAPI headers based on Linux-6.0-rc1
>   riscv: Add Svpbmt extension support
>   riscv: Fix serial0 alias path
>
> Atish Patra (2):
>   riscv: Append ISA extensions to the device tree
>   riscv: Add Sstc extension support
>
>  arm/aarch64/include/asm/kvm.h    |  36 ++++++
>  include/linux/kvm.h              | 181 +++++++++++++++++++++++++++++--
>  include/linux/virtio_9p.h        |   2 +-
>  include/linux/virtio_config.h    |   7 +-
>  include/linux/virtio_ids.h       |  14 +--
>  include/linux/virtio_net.h       |  34 +++++-
>  include/linux/virtio_pci.h       |   2 +
>  riscv/fdt.c                      |  44 +++++++-
>  riscv/include/asm/kvm.h          |  22 ++++
>  riscv/include/kvm/kvm-cpu-arch.h |  11 ++
>  riscv/kvm-cpu.c                  |  11 --
>  x86/include/asm/kvm.h            |  33 +++---
>  12 files changed, 352 insertions(+), 45 deletions(-)
>
> --
> 2.34.1
>

Ping ?
Does this series look fine to you ?

Regards,
Anup


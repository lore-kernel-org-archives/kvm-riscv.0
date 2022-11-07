From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Nov 2022 17:50:16 +0530
Subject: [PATCH kvmtool 0/6] RISC-V Svinval, Zihintpause, anad Zicbom support
In-Reply-To: <20221018140854.69846-1-apatel@ventanamicro.com>
References: <20221018140854.69846-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy0KcB9_0zh9eHECW1PLN+zAAEpyL5zPWT4VB_8fQ5+4Yw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Will,

On Tue, Oct 18, 2022 at 7:39 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The latest Linux-6.1-rc1 has support for Svinval, Zihintpause and Zicbom
> extensions in KVM RISC-V. This series adds corresponding changes in KVMTOOL
> to allow Guest/VM use these new RISC-V extensions.
>
> These patches can also be found in the riscv_svinval_zihintpause_zicbom_v1
> branch at: https://github.com/avpatel/kvmtool.git
>
> Andrew Jones (2):
>   riscv: Move reg encoding helpers to kvm-cpu-arch.h
>   riscv: Add Zicbom extension support
>
> Anup Patel (3):
>   Update UAPI headers based on Linux-6.1-rc1
>   riscv: Add Svinval extension support
>   riscv: Add --disable-<xyz> options to allow user disable extensions
>
> Mayuresh Chitale (1):
>   riscv: Add zihintpause extension support
>
>  arm/aarch64/include/asm/kvm.h       |  6 ++++--
>  include/linux/kvm.h                 |  1 +
>  include/linux/virtio_blk.h          | 19 +++++++++++++++++++
>  include/linux/virtio_net.h          | 14 +++++++-------
>  include/linux/virtio_ring.h         | 16 +++++++++++-----
>  riscv/fdt.c                         | 23 +++++++++++++++++++++--
>  riscv/include/asm/kvm.h             |  4 ++++
>  riscv/include/kvm/kvm-config-arch.h | 18 +++++++++++++++++-
>  riscv/include/kvm/kvm-cpu-arch.h    | 19 +++++++++++++++++++
>  riscv/kvm-cpu.c                     | 16 ----------------
>  10 files changed, 103 insertions(+), 33 deletions(-)
>
> --
> 2.34.1
>

Friendly ping ?

Please check this series.

Regards,
Anup


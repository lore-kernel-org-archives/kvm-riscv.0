From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jan 2022 10:27:48 +1000
Subject: [PATCH v4 06/12] target/riscv: Support start kernel directly by
 KVM
In-Reply-To: <20220110013831.1594-7-jiangyifei@huawei.com>
References: <20220110013831.1594-1-jiangyifei@huawei.com>
 <20220110013831.1594-7-jiangyifei@huawei.com>
Message-ID: <CAKmqyKPNLSiLP_FGgod=1fa=kUnnkagYBOQD0Bx5O=96AAkhmQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 10, 2022 at 11:52 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> Get kernel and fdt start address in virt.c, and pass them to KVM
> when cpu reset. Add kvm_riscv.h to place riscv specific interface.
>
> In addition, PLIC is created without M-mode PLIC contexts when KVM
> is enabled.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c    | 21 +++++++---
>  hw/riscv/boot.c          | 16 +++++++-
>  hw/riscv/virt.c          | 83 ++++++++++++++++++++++++++++------------
>  include/hw/riscv/boot.h  |  1 +
>  target/riscv/cpu.c       |  8 ++++
>  target/riscv/cpu.h       |  3 ++
>  target/riscv/kvm-stub.c  | 25 ++++++++++++
>  target/riscv/kvm.c       | 14 +++++++
>  target/riscv/kvm_riscv.h | 24 ++++++++++++
>  target/riscv/meson.build |  2 +-
>  10 files changed, 164 insertions(+), 33 deletions(-)
>  create mode 100644 target/riscv/kvm-stub.c
>  create mode 100644 target/riscv/kvm_riscv.h
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 877e76877c..58c16881cb 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -30,6 +30,7 @@
>  #include "target/riscv/cpu.h"
>  #include "migration/vmstate.h"
>  #include "hw/irq.h"
> +#include "sysemu/kvm.h"
>
>  #define RISCV_DEBUG_PLIC 0
>
> @@ -533,6 +534,8 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>  {
>      DeviceState *dev = qdev_new(TYPE_SIFIVE_PLIC);
>      int i;
> +    SiFivePLICState *plic;
> +    int s_count = 0, m_count = 0;
>
>      assert(enable_stride == (enable_stride & -enable_stride));
>      assert(context_stride == (context_stride & -context_stride));
> @@ -550,13 +553,19 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>
> -    for (i = 0; i < num_harts; i++) {
> -        CPUState *cpu = qemu_get_cpu(hartid_base + i);
> +    plic = SIFIVE_PLIC(dev);
> +    for (i = 0; i < plic->num_addrs; i++) {
> +        CPUState *cpu = qemu_get_cpu(plic->addr_config[i].hartid);
>
> -        qdev_connect_gpio_out(dev, i,
> -                              qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
> -        qdev_connect_gpio_out(dev, num_harts + i,
> -                              qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
> +        if (plic->addr_config[i].mode == PLICMode_S) {
> +            qdev_connect_gpio_out(dev, s_count++,
> +                                  qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
> +        }
> +
> +        if (plic->addr_config[i].mode == PLICMode_M) {
> +            qdev_connect_gpio_out(dev, num_harts + m_count++,
> +                                  qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
> +        }
>      }

This PLIC change breaks my 5.11.0 buildroot test case on the SiFive U board

The boot process just hangs at:

[    0.542798] usbcore: registered new interface driver usbhid
[    0.543021] usbhid: USB HID core driver
[    0.544584] NET: Registered protocol family 10
[    4.054768] Segment Routing with IPv6
[    4.055325] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    4.057956] NET: Registered protocol family 17
[    4.059327] 9pnet: Installing 9P2000 support
[    4.059787] Key type dns_resolver registered
[    4.060515] debug_vm_pgtable: [debug_vm_pgtable         ]:
Validating architecture page table helpers
[    4.078710] macb 10090000.ethernet eth0: PHY
[10090000.ethernet-ffffffff:00] driver [Generic PHY] (irq=POLL)
[    4.079454] macb 10090000.ethernet eth0: configuring for phy/gmii link mode
[    4.087031] macb 10090000.ethernet eth0: Link is Up - 1Gbps/Full -
flow control tx
[    4.094634] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

Alistair


From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 8 Feb 2022 18:55:28 +0530
Subject: [PATCH v10 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for
 QEMU virt machine
In-Reply-To: <CAJF2gTSLmBcgUUE3VGsEq0JCWV74Yy-pkduS66rk=VPVwxk59g@mail.gmail.com>
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-9-apatel@ventanamicro.com>
 <CAJF2gTQsSn1KBgX2bg2LiSUbCmbGD3oF5KcmK5gq2Dd49BWDBQ@mail.gmail.com>
 <CAAhSdy3Dkv6ga0ZMp5rMFa8nV9EDHgOMBwuJ4z4-w52T8EaUag@mail.gmail.com>
 <CAJF2gTSLmBcgUUE3VGsEq0JCWV74Yy-pkduS66rk=VPVwxk59g@mail.gmail.com>
Message-ID: <CAK9=C2WqczG=tH1u9zcLt7Em+fPD1ZZwtDhf1yHJ70-o-HL8OQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 8, 2022 at 3:47 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Feb 8, 2022 at 4:54 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Feb 8, 2022 at 12:16 PM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > Another question:
> > >
> > > Have you put "idle-states {" in qemu's DTS? or how do you test your patches?
> >
> > I usually do the following:
> > 1) Dump QEMU virt machine DTB
> > 2) Convert QEMU virt machine DTB into DTS
> > 3) Add "idle-states" in QEMU virt machine DTS
> > 4) Create QEMU virt machine DTB with "idle-states"
> > 5) Use the new QEMU virt machine DTB for testing this series.
> >
> > Here's one of the DTS files which I used for testing on QEMU virt machine:
> >
> > /dts-v1/;
> >
> > / {
> >     #address-cells = <0x02>;
> >     #size-cells = <0x02>;
> >     compatible = "riscv-virtio";
> >     model = "riscv-virtio,qemu";
> >
> >     chosen {
> >         linux,initrd-end = <0x8855d200>;
> >         linux,initrd-start = <0x88200000>;
> >         bootargs = "root=/dev/ram rw console=ttyS0 earlycon";
> >         stdout-path = "/soc/uart at 10000000";
> >     };
> >
> >     memory at 80000000 {
> >         device_type = "memory";
> >         reg = <0x00 0x80000000 0x00 0x10000000>;
> >     };
> >
> >     cpus {
> >         #address-cells = <0x01>;
> >         #size-cells = <0x00>;
> >         timebase-frequency = <0x989680>;
> >
> >         cpu at 0 {
> >             phandle = <0x07>;
> >             device_type = "cpu";
> >             reg = <0x00>;
> >             status = "okay";
> >             compatible = "riscv";
> >             riscv,isa = "rv64imafdcsu";
> >             mmu-type = "riscv,sv48";
> >             cpu-idle-states = <&CPU_NONRET_DEF>;
> >
> >             interrupt-controller {
> >                 #interrupt-cells = <0x01>;
> >                 interrupt-controller;
> >                 compatible = "riscv,cpu-intc";
> >                 phandle = <0x08>;
> >             };
> >         };
> >
> >         cpu at 1 {
> >             phandle = <0x05>;
> >             device_type = "cpu";
> >             reg = <0x01>;
> >             status = "okay";
> >             compatible = "riscv";
> >             riscv,isa = "rv64imafdcsu";
> >             mmu-type = "riscv,sv48";
> >             cpu-idle-states = <&CPU_RET_DEF>;
> >
> >             interrupt-controller {
> >                 #interrupt-cells = <0x01>;
> >                 interrupt-controller;
> >                 compatible = "riscv,cpu-intc";
> >                 phandle = <0x06>;
> >             };
> >         };
> >
> >         cpu at 2 {
> >             phandle = <0x03>;
> >             device_type = "cpu";
> >             reg = <0x02>;
> >             status = "okay";
> >             compatible = "riscv";
> >             riscv,isa = "rv64imafdcsu";
> >             mmu-type = "riscv,sv48";
> >             cpu-idle-states = <&CPU_NONRET_DEF>;
> >
> >             interrupt-controller {
> >                 #interrupt-cells = <0x01>;
> >                 interrupt-controller;
> >                 compatible = "riscv,cpu-intc";
> >                 phandle = <0x04>;
> >             };
> >         };
> >
> >         cpu at 3 {
> >             phandle = <0x01>;
> >             device_type = "cpu";
> >             reg = <0x03>;
> >             status = "okay";
> >             compatible = "riscv";
> >             riscv,isa = "rv64imafdcsu";
> >             mmu-type = "riscv,sv48";
> >             cpu-idle-states = <&CPU_RET_DEF>;
> >
> >             interrupt-controller {
> >                 #interrupt-cells = <0x01>;
> >                 interrupt-controller;
> >                 compatible = "riscv,cpu-intc";
> >                 phandle = <0x02>;
> >             };
> >         };
> >
> >         cpu-map {
> >
> >             cluster0 {
> >
> >                 core0 {
> >                     cpu = <0x07>;
> >                 };
> >
> >                 core1 {
> >                     cpu = <0x05>;
> >                 };
> >
> >                 core2 {
> >                     cpu = <0x03>;
> >                 };
> >
> >                 core3 {
> >                     cpu = <0x01>;
> >                 };
> >             };
> >         };
> >
> >         idle-states {
> >             CPU_RET_DEF: cpu-retentive-default {
> >                 compatible = "riscv,idle-state";
> >                 riscv,sbi-suspend-param = <0x00000000>;
> >                 entry-latency-us = <10>;
> >                 exit-latency-us = <10>;
> >                 min-residency-us = <100>;
> >             };
> >
> >             CPU_NONRET_DEF: cpu-nonretentive-default {
> >                 compatible = "riscv,idle-state";
> >                 riscv,sbi-suspend-param = <0x80000000>;
> >                 entry-latency-us = <100>;
> >                 exit-latency-us = <100>;
> >                 min-residency-us = <1000>;
> >             };
> >         };
> >     };
> >
> >     soc {
> >         #address-cells = <0x02>;
> >         #size-cells = <0x02>;
> >         compatible = "simple-bus";
> >         ranges;
> >
> >         flash at 20000000 {
> >             bank-width = <0x04>;
> >             reg = <0x00 0x20000000 0x00 0x2000000 0x00 0x22000000 0x00
> > 0x2000000>;
> >             compatible = "cfi-flash";
> >         };
> >
> >         rtc at 101000 {
> >             interrupts = <0x0b>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x101000 0x00 0x1000>;
> >             compatible = "google,goldfish-rtc";
> >         };
> >
> >         uart at 10000000 {
> >             interrupts = <0x0a>;
> >             interrupt-parent = <0x09>;
> >             clock-frequency = <0x384000>;
> >             reg = <0x00 0x10000000 0x00 0x100>;
> >             compatible = "ns16550a";
> >         };
> >
> >         poweroff {
> >             value = <0x5555>;
> >             offset = <0x00>;
> >             regmap = <0x0a>;
> >             compatible = "syscon-poweroff";
> >         };
> >
> >         reboot {
> >             value = <0x7777>;
> >             offset = <0x00>;
> >             regmap = <0x0a>;
> >             compatible = "syscon-reboot";
> >         };
> >
> >         test at 100000 {
> >             phandle = <0x0a>;
> >             reg = <0x00 0x100000 0x00 0x1000>;
> >             compatible = "sifive,test1\0sifive,test0\0syscon";
> >         };
> >
> >         pci at 30000000 {
> >             interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
> >             interrupt-map = <0x00 0x00 0x00 0x01 0x09 0x20 0x00 0x00
> > 0x00 0x02 0x09 0x21 0x00 0x00 0x00 0x03 0x09 0x22 0x00 0x00 0x00 0x04
> > 0x09 0x23 0x800 0x00 0x00 0x01 0x09 0x21 0x800 0x00 0x00 0x02 0x09
> > 0x22 0x800 0x00 0x00 0x03 0x09 0x23 0x800 0x00 0x00 0x04 0x09 0x20
> > 0x1000 0x00 0x00 0x01 0x09 0x22 0x1000 0x00 0x00 0x02 0x09 0x23 0x1000
> > 0x00 0x00 0x03 0x09 0x20 0x1000 0x00 0x00 0x04 0x09 0x21 0x1800 0x00
> > 0x00 0x01 0x09 0x23 0x1800 0x00 0x00 0x02 0x09 0x20 0x1800 0x00 0x00
> > 0x03 0x09 0x21 0x1800 0x00 0x00 0x04 0x09 0x22>;
> >             ranges = <0x1000000 0x00 0x00 0x00 0x3000000 0x00 0x10000
> > 0x2000000 0x00 0x40000000 0x00 0x40000000 0x00 0x40000000>;
> >             reg = <0x00 0x30000000 0x00 0x10000000>;
> >             dma-coherent;
> >             bus-range = <0x00 0xff>;
> >             linux,pci-domain = <0x00>;
> >             device_type = "pci";
> >             compatible = "pci-host-ecam-generic";
> >             #size-cells = <0x02>;
> >             #interrupt-cells = <0x01>;
> >             #address-cells = <0x03>;
> >         };
> >
> >         virtio_mmio at 10008000 {
> >             interrupts = <0x08>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10008000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio at 10007000 {
> >             interrupts = <0x07>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10007000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio at 10006000 {
> >             interrupts = <0x06>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10006000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio at 10005000 {
> >             interrupts = <0x05>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10005000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio at 10004000 {
> >             interrupts = <0x04>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10004000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio at 10003000 {
> >             interrupts = <0x03>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10003000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio at 10002000 {
> >             interrupts = <0x02>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10002000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio at 10001000 {
> >             interrupts = <0x01>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10001000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         plic at c000000 {
> >             phandle = <0x09>;
> >             riscv,ndev = <0x35>;
> >             reg = <0x00 0xc000000 0x00 0x210000>;
> >             interrupts-extended = <0x08 0x0b 0x08 0x09 0x06 0x0b 0x06
> > 0x09 0x04 0x0b 0x04 0x09 0x02 0x0b 0x02 0x09>;
> >             interrupt-controller;
> >             compatible = "riscv,plic0";
> >             #interrupt-cells = <0x01>;
> >             #address-cells = <0x00>;
> >         };
> >
> >         clint at 2000000 {
> >             interrupts-extended = <0x08 0x03 0x08 0x07 0x06 0x03 0x06
> > 0x07 0x04 0x03 0x04 0x07 0x02 0x03 0x02 0x07>;
> >             reg = <0x00 0x2000000 0x00 0x10000>;
> >             compatible = "riscv,clint0";
> >         };
> >     };
> > };
>
> Thx Anup, but it still couldn't work for testing suspend.
>
> # echo mem > /sys/power/state
> sh: write error: Function not implemented
>
> Why there is no ARCH_SUSPEND_POSSIBLE in the patch series?

You are referring to system-level suspend to RAM support whereas
this series adds CPU idle power management support.

Adding system-level suspend to RAM will be a separate series
and it will re-use the non-retentive suspend infrastructure added
by this series.

Regards,
Anup

>
> ref arm64's:
> commit 166936bace056dfc11452d794209f39a5e9b0fb4
> Author: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Date:   Thu Nov 7 18:37:14 2013 +0000
>
>     arm64: kernel: add PM build infrastructure
>
>     This patch adds the required makefile and kconfig entries to enable PM
>     for arm64 systems.
>
>     The kernel relies on the cpu_{suspend}/{resume} infrastructure to
>     properly save the context for a CPU and put it to sleep, hence this
>     patch adds the config option required to enable cpu_{suspend}/{resume}
>     API.
>
>     In order to rely on the CPU PM implementation for saving and restoring
>     of CPU subsystems like GIC and PMU, the arch Kconfig must be also
>     augmented to select the CONFIG_CPU_PM option when SUSPEND or CPU_IDLE
>     kernel implementations are selected.
>
> >
> > Regards,
> > Anup
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/


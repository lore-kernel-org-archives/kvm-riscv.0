From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Feb 2021 00:43:51 -0800
Subject: [Announcement] Successful KVM RISC-V bring up on FPGA (Rocket core
 with H extension)
Message-ID: <CAOnJCULY7PTcyZ4d0MiC6YBW3_ZdN3tVC4jg_wAJdJs_YeCnMQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org

Hi,
We are glad to announce that we are able to boot Linux in KVM guest on
a FPGA (Rocket chip + H extension v0.6.1). We now have three
hypervisors working on a Hardware with H extension.

1. KVM [1]
2. Xvisor [2]
3. Bao [3]

KVM bring up was done using Firesim and the detailed instructions will
be available very soon. Here are the software versions used for
bringup. Please find the attached boot log.

OpenSBI: v0.9
Linux kernel: 5.11-rc5 + KVM patches(v16) + few kernel fixes [4].
Kvmtool: Upstream + RISC-V KVMTOOL patches (v6) [5]

We would like to thank Sandro & Jose who implemented the H extension.
The Rocket-H design is available as an AFI image to be used within
Firesim or a stand alone FPGA board.

We would also like to thank Andrew/John/Greg & others for defining such
a clean specification as we did not discover any significant issues
while doing the bring up. As there are no changes proposed to the H
extension in the last year, we believe the current version of the H
extension can be considered as a freeze candidate. Please let us know
if that is not the case.

-- 
Regards,
Atish

[1] https://github.com/kvm-riscv/howto/wiki
[2] https://github.com/xvisor/xvisor
[3] https://github.com/sandro2pinto/bao-rocket-h-firesim
[4] https://github.com/atishp04/linux/commits/rocket_kvm_working
[5] https://github.com/kvm-riscv/kvmtool

--
Regards,
Atish
-------------- next part --------------
Script started on Mon 01 Feb 2021 08:53:48 PM UTC
AFI PCI  Vendor ID: 0x1d0f, Device ID 0xf000
Using xdma write queue: /dev/xdma0_h2c_0
Using xdma read queue: /dev/xdma0_c2h_0
UART0 is here (stdin/stdout).
command line for program 0. argc=56:
+permissive +mm_relaxFunctionalModel_0=0 +mm_openPagePolicy_0=1 +mm_backendLatency_0=2 +mm_schedulerWindowSize_0=8 +mm_transactionQueueDepth_0=8 +mm_dramTimings_tAL_0=0 +mm_dramTimings_tCAS_0=14 +mm_dramTimings_tCMD_0=1 +mm_dramTimings_tCWD_0=10 +mm_dramTimings_tCCD_0=4 +mm_dramTimings_tFAW_0=25 +mm_dramTimings_tRAS_0=33 +mm_dramTimings_tREFI_0=7800 +mm_dramTimings_tRC_0=47 +mm_dramTimings_tRCD_0=14 +mm_dramTimings_tRFC_0=160 +mm_dramTimings_tRRD_0=8 +mm_dramTimings_tRP_0=14 +mm_dramTimings_tRTP_0=8 +mm_dramTimings_tRTRS_0=2 +mm_dramTimings_tWR_0=15 +mm_dramTimings_tWTR_0=8 +mm_rowAddr_offset_0=18 +mm_rowAddr_mask_0=65535 +mm_rankAddr_offset_0=16 +mm_rankAddr_mask_0=3 +mm_bankAddr_offset_0=13 +mm_bankAddr_mask_0=7 +mm_llc_wayBits_0=3 +mm_llc_setBits_0=12 +mm_llc_blockBits_0=7 +mm_llc_activeMSHRs_0=8 +slotid=0 +profile-interval=-1 +macaddr0=00:12:6D:00:00:02 +blkdev0=bao0-dummy.rootfs +niclog0=niclog0 +blkdev-log0=blkdev-log0 +trace-select=1 +trace-start=0 +trace-end=-1 +trace-output-format=0 +dwarf-file-name=bao0-fw_payload.elf-dwarf +autocounter-readrate=0 +autocounter-filename=AUTOCOUNTERFILE +drj_dtb=bao0-fw_payload.elf.dtb +drj_bin=bao0-fw_payload.elf +drj_rom=bao0-fw_payload.elf.rom +print-start=0 +print-end=-1 +linklatency0=6405 +netbw0=200 +shmemportname0=default +permissive-off bao0-fw_payload.elf 
TraceRV 0: Tracing disabled, since +tracefile was not provided.
TraceRV 1: Tracing disabled, since +tracefile was not provided.
TraceRV 2: Tracing disabled, since +tracefile was not provided.
TraceRV 3: Tracing disabled, since +tracefile was not provided.
random min: 0x0, random max: 0xffffffffffffffff
TracerV: Trigger enabled from 0 to 18446744073709551615 cycles
TracerV: Trigger enabled from 0 to 18446744073709551615 cycles
TracerV: Trigger enabled from 0 to 18446744073709551615 cycles
TracerV: Trigger enabled from 0 to 18446744073709551615 cycles
Commencing simulation.

OpenSBI v0.9
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name             : rocket-h-firesim
Platform Features         : timer,mfdeleg
Platform HART Count       : 4
Firmware Base             : 0x80000000
Firmware Size             : 128 KB
Runtime SBI Version       : 0.2

Domain0 Name              : root
Domain0 Boot HART         : 1
Domain0 HARTs             : 0*,1*,2*,3*
Domain0 Region00          : 0x0000000080000000-0x000000008001ffff ()
Domain0 Region01          : 0x0000000000000000-0xffffffffffffffff (R,W,X)
Domain0 Next Address      : 0x0000000080200000
Domain0 Next Arg1         : 0x0000000082200000
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes

Boot HART ID              : 1
Boot HART Domain          : root
Boot HART ISA             : rv64imafdcsuhx
Boot HART Features        : scounteren,mcounteren
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 4
Boot HART PMP Address Bits: 33
Boot HART MHPM Count      : 0
Boot HART MHPM Count      : 0
Boot HART MIDELEG         : 0x0000000000000666
Boot HART MEDELEG         : 0x0000000000f0b509
[    0.000000] Linux version 5.11.0-rc5-00265-g854618bbf71b-dirty (atish at jedi-01) (riscv64-unknown-linux-gnu-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35) #739 SMP Mon Feb 1 12:50:36 PST 2021
[    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
[    0.000000] printk: bootconsole [sbi0] enabled
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000901fffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x00000000901fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x00000000901fffff]
[    0.000000] SBI specification v0.2 detected
[    0.000000] SBI implementation ID=0x1 Version=0x9
[    0.000000] SBI v0.2 TIME extension detected
[    0.000000] SBI v0.2 IPI extension detected
[    0.000000] SBI v0.2 RFENCE extension detected
[    0.000000] software IO TLB: mapped [mem 0x000000008be6c000-0x000000008fe6c000] (64MB)
[    0.000000] SBI v0.2 HSM extension detected
[    0.000000] riscv: ISA extensions acdfhimsu
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: Embedded 17 pages/cpu s32344 r8192 d29096 u69632
[    0.000000] /cpus/cpu-map/cluster0/core0: Can't get CPU for leaf core
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 64640
[    0.000000] Kernel command line: earlycon=sbi root=/dev/ram console=ttySIF0,3686400n8
[    0.000000] Dentry cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.000000] Inode-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 164624K/262144K available (7184K kernel code, 883K rwdata, 2250K rodata, 16630K init, 311K bss, 97520K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller at c000000: mapped 60 interrupts with 4 handlers for 8 contexts.
[    0.000000] random: get_random_bytes called from start_kernel+0x2f8/0x456 with crng_init=0
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [1]
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns
[    0.000000] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns
[    0.000296] Console: colour dummy device 80x25
[    0.000415] Calibrating delay loop (skipped), value calculated using timer frequency.. 2.00 BogoMIPS (lpj=4000)
[    0.000722] pid_max: default: 32768 minimum: 301
[    0.000911] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.001099] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.001869] rcu: Hierarchical SRCU implementation.
[    0.001954] EFI services will not be available.
[    0.002101] smp: Bringing up secondary CPUs ...
[    0.002751] smp: Brought up 1 node, 4 CPUs
[    0.002930] devtmpfs: initialized
[    0.003319] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.003353] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.003538] NET: Registered protocol family 16
[    0.007045] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.007616] vgaarb: loaded
[    0.007720] SCSI subsystem initialized
[    0.007847] usbcore: registered new interface driver usbfs
[    0.007878] usbcore: registered new interface driver hub
[    0.007905] usbcore: registered new device driver usb
[    0.008151] clocksource: Switched to clocksource riscv_clocksource
[    0.010603] NET: Registered protocol family 2
[    0.010795] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.010828] TCP established hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.010865] TCP bind hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.010910] TCP: Hash tables configured (established 2048 bind 2048)
[    0.011091] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.011261] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.011525] NET: Registered protocol family 1
[    0.011817] RPC: Registered named UNIX socket transport module.
[    0.011837] RPC: Registered udp transport module.
[    0.011949] RPC: Registered tcp transport module.
[    0.012098] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.012314] PCI: CLS 0 bytes, default 64
[    0.036706] kvm [1]: hypervisor extension available
[    0.036724] kvm [1]: using Sv39x4 G-stage page table format
[    0.036742] kvm [1]: VMID 0 bits available
[    0.037009] workingset: timestamp_bits=62 max_order=16 bucket_order=0
[    0.039447] NFS: Registering the id_resolver key type
[    0.039470] Key type id_resolver registered
[    0.039484] Key type id_legacy registered
[    0.039527] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.039586] 9p: Installing v9fs 9p2000 file system support
[    0.039698] NET: Registered protocol family 38
[    0.039725] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    0.039939] io scheduler mq-deadline registered
[    0.040083] io scheduler kyber registered
[    0.055681] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
 +fVVVVFfYnYrial: ttySIF0@MMIO 0x54000000 (irq = 1, base_baud = 115200) is a SiFive UART v0
[    0.056023] printk: console [ttySIF0] enabled
[    0.056023] printk: console [ttySIF0] enabled
[    0.056038] printk: bootconsole [sbi0] disabled
[    0.056038] printk: bootconsole [sbi0] disabled
[    0.056390] [drm] radeon kernel modesetting enabled.
[    0.059438] loop: module loaded
[    0.059679] libphy: Fixed MDIO Bus: probed
[    0.059928] e1000e: Intel(R) PRO/1000 Network Driver
[    0.059936] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.059974] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.059986] ehci-pci: EHCI PCI platform driver
[    0.060007] ehci-platform: EHCI generic platform driver
[    0.060108] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.060318] ohci-pci: OHCI PCI platform driver
[    0.060472] ohci-platform: OHCI generic platform driver
[    0.060745] usbcore: registered new interface driver uas
[    0.060839] usbcore: registered new interface driver usb-storage
[    0.061072] mousedev: PS/2 mouse device common for all mice
[    0.061395] usbcore: registered new interface driver usbhid
[    0.061411] usbhid: USB HID core driver
[    0.061785] NET: Registered protocol family 10
[    0.062028] Segment Routing with IPv6
[    0.062057] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.062242] NET: Registered protocol family 17
[    0.062310] 9pnet: Installing 9P2000 support
[    0.062337] Key type dns_resolver registered
[    0.070317] Freeing unused kernel memory: 16624K
[    0.070328] Kernel memory protection not selected by kernel config.
[    0.070342] Run /init as init process
           _  _
          | ||_|
          | | _ ____  _   _  _  _ 
          | || |  _ \| | | |\ \/ /
          | || | | | | |_| |/    \
          |_||_|_| |_|\____|\_/\_/

               Busybox Rootfs

Please press Enter to activate this console. 
/ # [6nsh[J[Jcat sh[J[Jap/ # cat apps/[Jru/ # cat apps/run.sh [J
#!\bin\bash
chmod -R 777 apps
mkdir /dev/hugepages 
echo 128 > /proc/sys/vm/nr_hugepages
mount -t hugetlbfs hugetlbfs /dev/hugepages
./apps/lkvm-static run -m 128 -c2 --console serial -p "console=ttyS0 earlycon=uart8250,mmio,0x3f8" -k ./apps/Image --debug --hugetlbfs /dev/hugepages
/ # [6nsh ap/ # sh apps/[Jru/ # sh apps/run.sh [J
  # lkvm run -k ./apps/Image -m 128 -c 2 --name guest-70
[    2.131381] random: fast init done
  Info: (riscv/kvm.c) kvm__arch_load_kernel_image:115: Loaded kernel to 0x80200000 (10860032 bytes)
  Info: (riscv/kvm.c) kvm__arch_load_kernel_image:126: Placing fdt at 0x81400000 - 0x87ffffff
  Info: (virtio/mmio.c) virtio_mmio_init:325: virtio-mmio.devices=0x200 at 0x10000000:5
  Info: (virtio/mmio.c) virtio_mmio_init:325: virtio-mmio.devices=0x200 at 0x10000200:6
  Info: (virtio/mmio.c) virtio_mmio_init:325: virtio-mmio.devices=0x200 at 0x10000400:7
[    0.000000] Linux version 5.11.0-rc5-00265-g854618bbf71b-dirty (atish at jedi-01) (riscv64-unknown-linux-gnu-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35) #738 SMP Mon Feb 1 12:49:39 PST 2021
[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
[    0.000000] earlycon: uart8250 at MMIO 0x00000000000003f8 (options '')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080200000-0x0000000087ffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x0000000087ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x0000000087ffffff]
[    0.000000] SBI specification v0.1 detected
[    0.000000] software IO TLB: mapped [mem 0x0000000083e3b000-0x0000000087e3b000] (64MB)
[    0.000000] riscv: ISA extensions acdfimsu
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: Embedded 17 pages/cpu s32344 r8192 d29096 u69632
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 31815
[    0.000000] Kernel command line:  console=ttyS0 rw rootflags=trans=virtio,version=9p2000.L,cache=loose rootfstype=9p init=/virt/init  ip=dhcp console=ttyS0 earlycon=uart8250,mmio,0x3f8
[    0.000000] Dentry cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.000000] Inode-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 50036K/129024K available (7184K kernel code, 883K rwdata, 2250K rodata, 278K init, 311K bss, 78988K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=2.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller at 0c000000: mapped 1024 interrupts with 2 handlers for 4 contexts.
[    0.000000] random: get_random_bytes called from start_kernel+0x2f8/0x456 with crng_init=0
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [1]
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns
[    0.000000] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns
[    0.000978] Console: colour dummy device 80x25
[    0.001514] Calibrating delay loop (skipped), value calculated using timer frequency.. 2.00 BogoMIPS (lpj=4000)
[    0.002663] pid_max: default: 32768 minimum: 301
[    0.003225] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.004050] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.005456] rcu: Hierarchical SRCU implementation.
[    0.006074] EFI services will not be available.
[    0.006689] smp: Bringing up secondary CPUs ...
[    0.007452] smp: Brought up 1 node, 2 CPUs
[    0.008092] devtmpfs: initialized
[    0.008875] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.010005] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.010920] NET: Registered protocol family 16
[    0.015664] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.017024] vgaarb: loaded
[    0.017437] SCSI subsystem initialized
[    0.017998] usbcore: registered new interface driver usbfs
[    0.018659] usbcore: registered new interface driver hub
[    0.019273] usbcore: registered new device driver usb
[    0.020100] clocksource: Switched to clocksource riscv_clocksource
[    0.023448] NET: Registered protocol family 2
[    0.024142] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.025107] TCP established hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.025992] TCP bind hash table entries: 1024 (order: 2, 16384 bytes, linear)
[    0.026811] TCP: Hash tables configured (established 1024 bind 1024)
[    0.027570] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.028333] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.029177] NET: Registered protocol family 1
[    0.030742] RPC: Registered named UNIX socket transport module.
[    0.031420] RPC: Registered udp transport module.
[    0.031951] RPC: Registered tcp transport module.
[    0.032504] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.033242] PCI: CLS 0 bytes, default 64
[    0.033809] kvm [1]: hypervisor extension not available
[    0.034568] workingset: timestamp_bits=62 max_order=14 bucket_order=0
[    0.037825] NFS: Registering the id_resolver key type
[    0.038409] Key type id_resolver registered
[    0.038885] Key type id_legacy registered
[    0.039373] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.040200] 9p: Installing v9fs 9p2000 file system support
[    0.040920] NET: Registered protocol family 38
[    0.041447] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    0.042284] io scheduler mq-deadline registered
[    0.042800] io scheduler kyber registered
[    0.043441] pci-host-generic 30000000.pci: host bridge /smb/pci ranges:
[    0.044222] pci-host-generic 30000000.pci:       IO 0x0000000000..0x000000ffff -> 0x0000000000
[    0.045212] pci-host-generic 30000000.pci:      MEM 0x0040000000..0x007fffffff -> 0x0040000000
[    0.046202] pci-host-generic 30000000.pci: ECAM at [mem 0x30000000-0x3fffffff] for [bus 00-01]
[    0.047210] pci-host-generic 30000000.pci: PCI host bridge to bus 0000:00
[    0.047978] pci_bus 0000:00: root bus resource [bus 00-01]
[    0.048617] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    0.049326] pci_bus 0000:00: root bus resource [mem 0x40000000-0x7fffffff]
[    0.069400] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.070597] printk: console [ttyS0] disabled
[    0.0[    3.010215] random: crng init done
71101] 3f8.U6_16550A: ttyS0 at MMIO 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    0.071997] printk: console [ttyS0] enabled
[    0.071997] printk: console [ttyS0] enabled
[    0.072959] printk: bootconsole [uart8250] disabled
[    0.072959] printk: bootconsole [uart8250] disabled
[    0.074280] 2f8.U6_16550A: ttyS1 at MMIO 0x2f8 (irq = 6, base_baud = 115200) is a 16550A
[    0.075391] 3e8.U6_16550A: ttyS2 at MMIO 0x3e8 (irq = 7, base_baud = 115200) is a 16550A
[    0.076525] 2e8.U6_16550A: ttyS3 at MMIO 0x2e8 (irq = 8, base_baud = 115200) is a 16550A
[    0.077647] [drm] radeon kernel modesetting enabled.
[    0.081092] loop: module loaded
[    0.081729] libphy: Fixed MDIO Bus: probed
[    0.084816] e1000e: Intel(R) PRO/1000 Network Driver
[    0.085403] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.086109] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.086853] ehci-pci: EHCI PCI platform driver
[    0.087376] ehci-platform: EHCI generic platform driver
[    0.087993] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.088720] ohci-pci: OHCI PCI platform driver
[    0.089253] ohci-platform: OHCI generic platform driver
[    0.089993] usbcore: registered new interface driver uas
[    0.090617] usbcore: registered new interface driver usb-storage
[    0.091362] mousedev: PS/2 mouse device common for all mice
[    0.092232] usbcore: registered new interface driver usbhid
[    0.092871] usbhid: USB HID core driver
[    0.093589] NET: Registered protocol family 10
[    0.094394] Segment Routing with IPv6
[    0.094839] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.095678] NET: Registered protocol family 17
[    0.096265] 9pnet: Installing 9P2000 support
[    0.097065] Key type dns_resolver registered
[    0.116117] Sending DHCP requests ., OK
[    0.132570] IP-Config: Got DHCP answer from 192.168.33.1, my address is 192.168.33.15
[    0.133468] IP-Config: Complete:
[    0.133839]      device=eth0, hwaddr=02:15:15:15:15:15, ipaddr=192.168.33.15, mask=255.255.255.0, gw=192.168.33.1
[    0.134995]      host=192.168.33.15, domain=, nis-domain=(none)
[    0.135669]      bootserver=192.168.33.1, rootserver=0.0.0.0, rootpath=
[    0.135675]      nameserver0=192.168.33.1
[    0.137526] VFS: Mounted root (9p filesystem) on device 0:15.
[    0.138391] devtmpfs: mounted
[    0.138867] Freeing unused kernel memory: 272K
[    0.139381] Kernel memory protection not selected by kernel config.
[    0.140117] Run /virt/init as init process
Mounting...
/ # [6n

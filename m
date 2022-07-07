From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 7 Jul 2022 10:36:25 +0530
Subject: U-Boot S-mode payload does not boot with a multicore
 configuration in RISC-V QEMU/KVM
In-Reply-To: <CAEUhbmWqMPakKs+nYOHiib=U9O6gZpmsBMqhUgaqkLmNe5jr_w@mail.gmail.com>
References: <CAEUhbmWqMPakKs+nYOHiib=U9O6gZpmsBMqhUgaqkLmNe5jr_w@mail.gmail.com>
Message-ID: <CAK9=C2VEqHfieOVeLPCt66xtp77YgaXk64chuw9Ku0zX4UQABw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 7, 2022 at 10:19 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Anup,
>
> U-Boot S-mode payload does not boot with RISC-V KVM on the QEMU 'virt'
> multicore machine. With QEMU TCG it can boot.
>
> I am using the latest v5.19-rc5 kernel, along with QEMU 7.0.0 and
> U-Boot v2022.04:
>
> Reproduce steps:
>
> U-Boot S-mode payload is built from U-Boot v2022.04:
> $ make qemu-riscv64_smode_defconfig; make
>
> The host 5.19-rc5 kernel is running on top of QEMU 7.0.0 on an x86 machine.
>
> Use QEMU to launch the VM:
> # qemu-system-riscv64 -M virt -accel kvm -m 2G -smp 2 -nographic
> -kernel u-boot -device virtio-net-device,netdev=eth0 -netdev
> user,id=eth0,hostfwd=tcp::8022-:22
>
> U-Boot gets stuck during boot, logs below:
>
> U-Boot 2022.04 (Jul 07 2022 - 11:23:28 +0800)
> CPU: rv64imafdc
> Model: riscv-virtio,qemu
> DRAM: 2 GiB
> Core: 17 devices, 9 uclasses, devicetree: board
> Flash: <========== stuck here, and QEMU is completely unresponsive
> (Ctrl+A, C is ignored)
>
> The kernel reports:
>
> [ 484.351698] INFO: task qemu-system-ris:1765 blocked for more than 120 seconds.
> [ 484.360285] Not tainted 5.19.0-rc5-custom #1
> [ 484.360871] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [ 484.362560] task:qemu-system-ris state:D stack: 0 pid: 1765 ppid:
> 1515 flags:0x00000000
> [ 484.363785] Call Trace:
> [ 484.363930] [] schedule+0x50/0xb2
> [ 484.364758] [] schedule_timeout+0x10c/0x13c
> [ 484.364806] [] __wait_for_common+0x148/0x226
> [ 484.364840] [] wait_for_completion+0x2e/0x36
> [ 484.364871] [] __synchronize_srcu.part.0+0x88/0xe2
> [ 484.364918] [] synchronize_srcu_expedited+0x3a/0x44
> [ 484.364952] [] kvm_swap_active_memslots+0x186/0x1ea
> [ 484.364985] [] kvm_set_memslot+0x1fc/0x39c
> [ 484.365014] [] __kvm_set_memory_region+0x144/0x30c
> [ 484.365043] [] kvm_vm_ioctl+0x20a/0xc82
> [ 484.365075] [] sys_ioctl+0x98/0xb2
> [ 484.365135] [] ret_from_syscall+0x0/0x2
>
> The QEMU vcpu thread backtrace is:
>
> #0 __GI___ioctl (fd=, request=request at entry=1075883590) at
> ../sysdeps/unix/sysv/linux/ioctl.c:35
> #1 0x00aaaaaab8b916ae in kvm_vm_ioctl (s=s at entry=0xaaaaaaf1ec3e00,
> type=type at entry=1075883590) at ../accel/kvm/kvm-all.c:3035
> #2 0x00aaaaaab8b93572 in kvm_set_user_memory_region
> (slot=slot at entry=0xffffffaa5d90a0, new=new at entry=false,
> kml=0xaaaaaaf1ec4eb0, kml=) at ../accel/kvm/kvm-all.c:379
> #3 0x00aaaaaab8b93862 in kvm_set_phys_mem (kml=0xaaaaaaf1ec4eb0,
> section=section at entry=0xffffffaa513b70, add=, add at entry=false) at
> ../accel/kvm/kvm-all.c:1413
> #4 0x00aaaaaab8b93a30 in kvm_region_del (listener=,
> section=0xffffffaa513b70) at ../accel/kvm/kvm-all.c:1511
> #5 0x00aaaaaab8ad780c in address_space_update_topology_pass
> (as=as at entry=0xaaaaaab90b87a0 ,
> old_view=old_view at entry=0xaaaaaaf1f42c40,
> new_view=new_view at entry=0xffffff1c001400, adding=adding at entry=fa
> lse) at ../softmmu/memory.c:948
> #6 0x00aaaaaab8ad7a2a in address_space_set_flatview
> (as=0xaaaaaab90b87a0 ) at ../softmmu/memory.c:1050
> #7 0x00aaaaaab8ada508 in memory_region_transaction_commit () at
> ../softmmu/memory.c:1103
> #8 0x00aaaaaab8adb6ee in memory_region_rom_device_set_romd
> (mr=mr at entry=0xaaaaaaf22d6fe0, romd_mode=romd_mode at entry=false) at
> ../softmmu/memory.c:2289
> #9 0x00aaaaaab8951e1a in pflash_write (be=0, width=1, value=240,
> offset=0, pfl=0xaaaaaaf22d6c30) at ../hw/block/pflash_cfi01.c:451
> #10 pflash_mem_write_with_attrs (opaque=0xaaaaaaf22d6c30, addr=0,
> value=, len=, attrs=...) at ../hw/block/pflash_cfi01.c:682
> #11 0x00aaaaaab8ad5fa2 in access_with_adjusted_size
> (addr=addr at entry=0, value=value at entry=0xffffffaa513dc8,
> size=size at entry=1, access_size_min=, access_size_max=,
> access_fn=0xaaaaaab8ad7d06 <
> memory_region_write_with_attrs_accessor>, mr=0xaaaaaaf22d6fe0,
> attrs=...) at ../softmmu/memory.c:554
> #12 0x00aaaaaab8ad92ba in memory_region_dispatch_write
> (mr=mr at entry=0xaaaaaaf22d6fe0, addr=addr at entry=0, data=,
> data at entry=240, op=, attrs=attrs at entry=...) at
> ../softmmu/memory.c:1521
> #13 0x00aaaaaab8adee88 in flatview_write_continue
> (fv=fv at entry=0xaaaaaaf1f42c40, addr=addr at entry=536870912,
> attrs=attrs at entry=..., ptr=ptr at entry=0xffffffab730028,
> len=len at entry=1, addr1=, l=,
> mr=0xaaaaaaf22d6fe0) at ../softmmu/physmem.c:2814
> #14 0x00aaaaaab8adf0d8 in flatview_write (fv=0xaaaaaaf1f42c40,
> addr=536870912, attrs=..., buf=0xffffffab730028, len=len at entry=1) at
> ../softmmu/physmem.c:2856
> #15 0x00aaaaaab8ae1eca in address_space_write (len=1,
> buf=0xffffffab730028, attrs=..., addr=536870912, as=0xaaaaaab90b87a0 )
> at ../softmmu/physmem.c:2952
> #16 address_space_rw (as=0xaaaaaab90b87a0 , addr=536870912, attrs=...,
> attrs at entry=..., buf=buf at entry=0xffffffab730028, len=1, is_write=) at
> ../softmmu/physmem.c:2962
> #17 0x00aaaaaab8b94a3e in kvm_cpu_exec
> (cpu=cpu at entry=0xaaaaaaf1ec92f0) at ../accel/kvm/kvm-all.c:2929
> #18 0x00aaaaaab8b95572 in kvm_vcpu_thread_fn
> (arg=arg at entry=0xaaaaaaf1ec92f0) at ../accel/kvm/kvm-accel-ops.c:49
> #19 0x00aaaaaab8ca280a in qemu_thread_start (args=) at
> ../util/qemu-thread-posix.c:556
> #20 0x00ffffffab2cf5a6 in start_thread (arg=) at ./nptl/pthread_create.c:442
> #21 0x00ffffffab31ba02 in __thread_start () at
> ../sysdeps/unix/sysv/linux/riscv/clone.S:85
>
> Based on above 2 logs, we can see the QEMU vcpu thread is blocked at KVM ioctl
> KVM_SET_USER_MEMORY_REGION, and on the kernel side the ioctl call is
> blocked at synchronize_srcu_expedited() so that ioctl never returns
> back to the user land.
>
> If I single step the QEMU instance starting from a breakpoint at
> pflash_write(), the ioctl call of KVM_SET_USER_MEMORY_REGION does not
> block, and U-Boot can boot eventually.
>
> If I remove "-smp 2" from the QEMU command line when launching the VM,
> U-Boot boots without any problem. Of course removing "-accel kvm"
> works too.
>
> It looks to me there is a locking timing issue in the RISC-V KVM
> kernel when an SMP guest is launched. Any ideas?

To further isolate the problem, does it work if QEMU does not generate
the pflash DT node ?

Regards,
Anup


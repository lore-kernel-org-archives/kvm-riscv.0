From: Yifei Jiang <jiangyifei@huawei.com>
Date: Wed, 12 Jan 2022 16:13:16 +0800
Subject: [PATCH v5 00/13] Add riscv kvm accel support
Message-ID: <20220112081329.1835-1-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds both riscv32 and riscv64 kvm support, and implements
migration based on riscv.

Because of RISC-V KVM has been merged into the Linux master, so this
series are changed from RFC to patch.

Several steps to use this:
1. Build emulation
$ ./configure --target-list=riscv64-softmmu
$ make -j$(nproc)

2. Build kernel

3. Build QEMU VM
Cross built in riscv toolchain.
$ PKG_CONFIG_LIBDIR=<toolchain pkgconfig path>
$ export PKG_CONFIG_SYSROOT_DIR=<toolchain sysroot path>
$ ./configure --target-list=riscv64-softmmu --enable-kvm \
--cross-prefix=riscv64-linux-gnu- --disable-libiscsi --disable-glusterfs \
--disable-libusb --disable-usb-redir --audio-drv-list= --disable-opengl \
--disable-libxml2
$ make -j$(nproc)

4. Start emulation
$ ./qemu-system-riscv64 -M virt -m 4096M -cpu rv64 -nographic \
        -name guest=riscv-hyp,debug-threads=on \
        -smp 4 \
        -bios ./fw_jump.bin \
        -kernel ./Image \
        -drive file=./hyp.img,format=raw,id=hd0 \
        -device virtio-blk-device,drive=hd0 \
        -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"

5. Start kvm-acceled QEMU VM in emulation
$ ./qemu-system-riscv64 -M virt,accel=kvm -m 1024M -cpu host -nographic \
        -name guest=riscv-guset \
        -smp 2 \
        -bios none \
        -kernel ./Image \
        -drive file=./guest.img,format=raw,id=hd0 \
        -device virtio-blk-device,drive=hd0 \
        -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"

Changes since patch v4
- Commit enable kvm accel as an independent patch.
- Bugfix some checkpatch errors.
- Bugfix lost a interrupt in the sifive_u machine.

Changes since patch v3
- Re-write the for-loop in sifive_plic_create().
- Drop unnecessary change in hw/riscv/virt.c.
- Use serial to handle console sbi call.

Changes since patch v2
- Create a macro for get and put timer csr.
- Remove M-mode PLIC contexts when kvm is enabled.
- Add get timer frequency.
- Move cpu_host_load to vmstate_kvmtimer.

Changes since patch v1
- Rebase on recent commit a216e7cf119c91ffdf5931834a1a030ebea40d70
- Sync-up headers with Linux-5.16-rc4.
- Fixbug in kvm_arch_init_vcpu.
- Create a macro for get and put regs csr.
- Start kernel directly when kvm_enabled.
- Use riscv_cpu_set_irq to inject KVM interrupts.
- Use the Semihosting Console API for RISC-V kvm handle sbi.
- Update vmstate_riscv_cpu version id.
  Placing kvm_timer into a subsection.

Changes since RFC v6
- Rebase on recent commit 8627edfb3f1fca24a96a0954148885c3241c10f8
- Sync-up headers with Linux-5.16-rc1

Changes since RFC v5
- Rebase on QEMU v6.1.0-rc1 and kvm-riscv linux v19.
- Move kvm interrupt setting to riscv_cpu_update_mip().
- Replace __u64 with uint64_t.

Changes since RFC v4
- Rebase on QEMU v6.0.0-rc2 and kvm-riscv linux v17.
- Remove time scaling support as software solution is incomplete.
  Because it will cause unacceptable performance degradation. and
  We will post a better solution.
- Revise according to Alistair's review comments.
  - Remove compile time XLEN checks in kvm_riscv_reg_id
  - Surround TYPE_RISCV_CPU_HOST definition by CONFIG_KVM and share
    it between RV32 and RV64.
  - Add kvm-stub.c for reduce unnecessary compilation checks.
  - Add riscv_setup_direct_kernel() to direct boot kernel for KVM.

Changes since RFC v3
- Rebase on QEMU v5.2.0-rc2 and kvm-riscv linux v15.
- Add time scaling support(New patches 13, 14 and 15).
- Fix the bug that guest vm can't reboot.

Changes since RFC v2
- Fix checkpatch error at target/riscv/sbi_ecall_interface.h.
- Add riscv migration support.

Changes since RFC v1
- Add separate SBI ecall interface header.
- Add riscv32 kvm accel support.

Yifei Jiang (13):
  update-linux-headers: Add asm-riscv/kvm.h
  target/riscv: Add target/riscv/kvm.c to place the public kvm interface
  target/riscv: Implement function kvm_arch_init_vcpu
  target/riscv: Implement kvm_arch_get_registers
  target/riscv: Implement kvm_arch_put_registers
  target/riscv: Support start kernel directly by KVM
  target/riscv: Support setting external interrupt by KVM
  target/riscv: Handle KVM_EXIT_RISCV_SBI exit
  target/riscv: Add host cpu type
  target/riscv: Add kvm_riscv_get/put_regs_timer
  target/riscv: Implement virtual time adjusting with vm state changing
  target/riscv: Support virtual time context synchronization
  target/riscv: enable riscv kvm accel

 hw/intc/sifive_plic.c              |  20 +-
 hw/riscv/boot.c                    |  16 +-
 hw/riscv/virt.c                    |  83 +++--
 include/hw/riscv/boot.h            |   1 +
 linux-headers/asm-riscv/kvm.h      | 128 +++++++
 meson.build                        |   2 +
 target/riscv/cpu.c                 |  29 +-
 target/riscv/cpu.h                 |  11 +
 target/riscv/kvm-stub.c            |  30 ++
 target/riscv/kvm.c                 | 535 +++++++++++++++++++++++++++++
 target/riscv/kvm_riscv.h           |  25 ++
 target/riscv/machine.c             |  30 ++
 target/riscv/meson.build           |   1 +
 target/riscv/sbi_ecall_interface.h |  72 ++++
 14 files changed, 951 insertions(+), 32 deletions(-)
 create mode 100644 linux-headers/asm-riscv/kvm.h
 create mode 100644 target/riscv/kvm-stub.c
 create mode 100644 target/riscv/kvm.c
 create mode 100644 target/riscv/kvm_riscv.h
 create mode 100644 target/riscv/sbi_ecall_interface.h

-- 
2.19.1



From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 27 Aug 2020 17:21:23 +0800
Subject: [PATCH RFC v3 00/14] Add riscv kvm accel support
Message-ID: <20200827092137.479-1-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds both riscv32 and riscv64 kvm support, and implements
migration based on riscv. It is based on temporarily unaccepted kvm:
https://github.com/kvm-riscv/linux

Compared to RFC v2, the migration is supported in this series. The new
added migration feature also requires the following patches:
[1]
[PATCH RFC 0/2] Add log dirty support
https://www.mail-archive.com/linux-kernel at vger.kernel.org/msg2284945.html

[2]
[PATCH] target/riscv: raise exception to HS-mode at get_physical_address
https://patchew.org/QEMU/20200824084158.1769-1-jiangyifei at huawei.com/

Several steps to use this:
1. Build emulation
$ ./configure --target-list=riscv64-softmmu
$ make -j$(nproc)

2. Build kernel
https://github.com/kvm-riscv/linux

3. Build QEMU VM
I cross built in riscv toolchain.
$ PKG_CONFIG_LIBDIR=<toolchain pkgconfig path>
$ export PKG_CONFIG_SYSROOT_DIR=<toolchain sysroot path>
$ ./configure --target-list=riscv64-softmmu --enable-kvm \
--cross-prefix=riscv64-linux-gnu- --disable-libiscsi --disable-glusterfs \
--disable-libusb --disable-usb-redir --audio-drv-list= --disable-opengl \
--disable-libxml2
$ make -j$(nproc)

4. Start emulation
$ ./qemu-system-riscv64 -M virt -m 4096M -cpu rv64,x-h=true -nographic \
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

This following link describes the details about live migration steps:
https://gitee.com/openeuler/qemu/wikis/Live%20migration?sort_id=2767831

Changes since RFC v2
1. Fix checkpatch error at target/riscv/sbi_ecall_interface.h.
2. Add riscv migration support.

Changes since RFC v1
1. Add separate SBI ecall interface header.
2. Add riscv32 kvm accel support.

Yifei Jiang (14):
  linux-header: Update linux/kvm.h
  target/riscv: Add target/riscv/kvm.c to place the public kvm interface
  target/riscv: Implement function kvm_arch_init_vcpu
  target/riscv: Implement kvm_arch_get_registers
  arget/riscv: Implement kvm_arch_put_registers
  target/riscv: Support start kernel directly by KVM
  hw/riscv: PLIC update external interrupt by KVM when kvm enabled
  target/riscv: Handler KVM_EXIT_RISCV_SBI exit
  target/riscv: Add host cpu type
  target/riscv: Add sifive_plic vmstate
  target/riscv: Support riscv cpu vmstate
  target/riscv: Add kvm_riscv_get/put_regs_timer
  target/riscv: Implement virtual time adjusting with vm state changing
  target/riscv: Support virtual time context synchronization

 configure                          |   1 +
 hw/riscv/sifive_plic.c             |  55 ++-
 hw/riscv/virt.c                    |   8 +
 include/hw/riscv/sifive_plic.h     |   1 +
 linux-headers/linux/kvm.h          |   8 +
 target/riscv/cpu.c                 |  41 +-
 target/riscv/cpu.h                 |  10 +
 target/riscv/kvm.c                 | 599 +++++++++++++++++++++++++++++
 target/riscv/kvm_riscv.h           |  25 ++
 target/riscv/meson.build           |   1 +
 target/riscv/sbi_ecall_interface.h |  72 ++++
 11 files changed, 809 insertions(+), 12 deletions(-)
 create mode 100644 target/riscv/kvm.c
 create mode 100644 target/riscv/kvm_riscv.h
 create mode 100644 target/riscv/sbi_ecall_interface.h

-- 
2.19.1




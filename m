From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Jul 2024 21:39:00 +0530
Subject: [PATCH 00/13] Accelerate KVM RISC-V when running as a guest
Message-ID: <20240719160913.342027-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The KVM RISC-V hypervisor might be running as a guest under some other
host hypervisor in which case the complete H-extension functionality will
be trap-n-emulated by the host hypervisor. In this case, the KVM RISC-V
performance can be accelerated using the SBI nested acceleration (NACL)
extension if the host hypervisor provides it.

These series extends KVM RISC-V to use SBI NACL extension whenever
underlying SBI implementation (aka host hypervisor) provides it.

These patches can also be found in the riscv_sbi_nested_v1 branch at:
https://github.com/avpatel/linux.git

To test these patches, run KVM RISC-V as Guest under latest Xvisor
found at: https://github.com/xvisor/xvisor.git

For the steps to test on Xvisor, refer the Xvisor documentation
<xvisor_source>/docs/riscv/riscv64-qemu.txt with two small changes:

1) In step#11, make sure compressed kvm.ko, guest kernel image, and
   kvmtool are present in the rootfs.img
2) In step#14, make sure AIA is available to Xvisor by using
   "virt,aia=aplic-imsic" as the QEMU machine name.

Anup Patel (13):
  RISC-V: KVM: Order the object files alphabetically
  RISC-V: KVM: Save/restore HSTATUS in C source
  RISC-V: KVM: Save/restore SCOUNTEREN in C source
  RISC-V: KVM: Break down the __kvm_riscv_switch_to() into macros
  RISC-V: KVM: Replace aia_set_hvictl() with aia_hvictl_value()
  RISC-V: KVM: Don't setup SGEI for zero guest external interrupts
  RISC-V: Add defines for the SBI nested acceleration extension
  RISC-V: KVM: Add common nested acceleration support
  RISC-V: KVM: Use nacl_csr_xyz() for accessing H-extension CSRs
  RISC-V: KVM: Use nacl_csr_xyz() for accessing AIA CSRs
  RISC-V: KVM: Use SBI sync SRET call when available
  RISC-V: KVM: Save trap CSRs in kvm_riscv_vcpu_enter_exit()
  RISC-V: KVM: Use NACL HFENCEs for KVM request based HFENCEs

 arch/riscv/include/asm/kvm_nacl.h | 237 ++++++++++++++++++++++++++++++
 arch/riscv/include/asm/sbi.h      | 120 +++++++++++++++
 arch/riscv/kvm/Makefile           |  27 ++--
 arch/riscv/kvm/aia.c              | 114 +++++++++-----
 arch/riscv/kvm/main.c             |  53 ++++++-
 arch/riscv/kvm/mmu.c              |   4 +-
 arch/riscv/kvm/nacl.c             | 152 +++++++++++++++++++
 arch/riscv/kvm/tlb.c              |  57 ++++---
 arch/riscv/kvm/vcpu.c             | 184 +++++++++++++++++------
 arch/riscv/kvm/vcpu_switch.S      | 137 ++++++++++-------
 arch/riscv/kvm/vcpu_timer.c       |  28 ++--
 11 files changed, 935 insertions(+), 178 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_nacl.h
 create mode 100644 arch/riscv/kvm/nacl.c

-- 
2.34.1



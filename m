From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 15 Jun 2023 13:03:43 +0530
Subject: [PATCH v3 00/10] RISC-V KVM in-kernel AIA irqchip
Message-ID: <20230615073353.85435-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds in-kernel AIA irqchip to KVM RISC-V which trap-n-emulate
IMSIC and APLIC MSI-mode for Guest. The APLIC MSI-mode trap-n-emulate is
optional so KVM user space can emulate APLIC entirely in user space.

The use of IMSIC HW guest files to accelerate IMSIC virtualization will be
done as separate series since this depends on AIA irqchip drivers to be
upstreamed. This series has no dependency on the AIA irqchip drivers.

There is also a KVM AIA irq-bypass (or device MSI virtualization) series
under development which depends on this series and upcoming IOMMU driver
series.

These patches (or this series) can also be found in the
riscv_kvm_aia_irqchip_v3 branch at: https://github.com/avpatel/linux.git

Changes since v2:
 - Added KVM_CAP_IRQCHIP in PATCH5
 - Fix check for KVM_DEV_RISCV_AIA_CONFIG_IDS write in PATCH6
 - Fix APLIC_IRQ_STATE_ENPEND usage in PATCH7

Changes since v1:
 - Rebased on Linux-6.4-rc6
 - Addressed Atish's comment in PATCH6
 - Added comments in arch/riscv/include/uapi/asm/kvm.h about APLIC and
   IMSIC device attribute type

Anup Patel (10):
  RISC-V: KVM: Implement guest external interrupt line management
  RISC-V: KVM: Add IMSIC related defines
  RISC-V: KVM: Add APLIC related defines
  RISC-V: KVM: Set kvm_riscv_aia_nr_hgei to zero
  RISC-V: KVM: Skeletal in-kernel AIA irqchip support
  RISC-V: KVM: Implement device interface for AIA irqchip
  RISC-V: KVM: Add in-kernel emulation of AIA APLIC
  RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip
  RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC
  RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip

 arch/riscv/include/asm/kvm_aia.h       |  107 ++-
 arch/riscv/include/asm/kvm_aia_aplic.h |   58 ++
 arch/riscv/include/asm/kvm_aia_imsic.h |   38 +
 arch/riscv/include/asm/kvm_host.h      |    4 +
 arch/riscv/include/uapi/asm/kvm.h      |   72 ++
 arch/riscv/kvm/Kconfig                 |    4 +
 arch/riscv/kvm/Makefile                |    3 +
 arch/riscv/kvm/aia.c                   |  274 +++++-
 arch/riscv/kvm/aia_aplic.c             |  619 ++++++++++++++
 arch/riscv/kvm/aia_device.c            |  673 +++++++++++++++
 arch/riscv/kvm/aia_imsic.c             | 1083 ++++++++++++++++++++++++
 arch/riscv/kvm/main.c                  |    3 +-
 arch/riscv/kvm/vcpu.c                  |    2 +
 arch/riscv/kvm/vm.c                    |  118 +++
 include/uapi/linux/kvm.h               |    2 +
 15 files changed, 3027 insertions(+), 33 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
 create mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h
 create mode 100644 arch/riscv/kvm/aia_aplic.c
 create mode 100644 arch/riscv/kvm/aia_device.c
 create mode 100644 arch/riscv/kvm/aia_imsic.c

-- 
2.34.1



From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Nov 2024 17:18:45 +0100
Subject: [RFC PATCH 00/15] iommu/riscv: Add irqbypass support
Message-ID: <20241114161845.502027-17-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Platforms with implementations of the RISC-V IOMMU and AIA support
directly delivering MSIs of devices assigned to guests to the VCPUs.
VFIO and KVM have a framework to enable such support, which is called
irqbypass. This series enables irqbypass for devices assigned to KVM
guests when all VCPUs are allocated guest interrupt files. The RISC-V
IOMMU and AIA also support MRIFs (memory-resident interrupt files),
but support for those will be posted as a follow-on to this series.

The patches are organized as follows:
  1-3:  Prepare to create an MSI remapping irqdomain parented by the IMSIC
  4-6:  Prepare the IOMMU driver for VFIO domains which will use a single
        stage of translation, but G-stage instead of the first stage
  7-8:  Add support to the IOMMU driver for creating irqdomains
  9-10: Prepare KVM to enable irqbypass
 11-13: Add irqbypass support to the IOMMU driver and KVM
 14-15: Enable VFIO by default

This series is also available here [1] and may be tested with QEMU recent
enough to have the IOMMU model.

Based on linux-next commit 28955f4fa282 ("Add linux-next specific files for 20241112")

[1] https://github.com/jones-drew/linux/commits/riscv/iommu-irqbypass-rfc-v1/

Thanks,
drew


Andrew Jones (10):
  irqchip/riscv-imsic: Use hierarchy to reach irq_set_affinity
  genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
  irqchip/riscv-imsic: Add support for DOMAIN_BUS_MSI_REMAP
  iommu/riscv: Move definitions to iommu.h
  iommu/riscv: Add IRQ domain for interrupt remapping
  RISC-V: KVM: Add irqbypass skeleton
  RISC-V: Define irqbypass vcpu_info
  iommu/riscv: Add guest file irqbypass support
  RISC-V: KVM: Add guest file irqbypass support
  RISC-V: defconfig: Add VFIO modules

Tomasz Jeznach (3):
  iommu/riscv: report iommu capabilities
  RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
  vfio: enable IOMMU_TYPE1 for RISC-V

Zong Li (2):
  iommu/riscv: use data structure instead of individual values
  iommu/riscv: support GSCID and GVMA invalidation command

 arch/riscv/configs/defconfig               |   2 +
 arch/riscv/include/asm/irq.h               |   9 +
 arch/riscv/include/asm/kvm_host.h          |   3 +
 arch/riscv/kvm/Kconfig                     |   3 +
 arch/riscv/kvm/aia_imsic.c                 | 136 +++++++-
 arch/riscv/kvm/vm.c                        |  60 ++++
 drivers/iommu/riscv/Makefile               |   2 +-
 drivers/iommu/riscv/iommu-bits.h           |  11 +
 drivers/iommu/riscv/iommu-ir.c             | 360 +++++++++++++++++++++
 drivers/iommu/riscv/iommu.c                | 183 ++++++-----
 drivers/iommu/riscv/iommu.h                |  78 +++++
 drivers/irqchip/irq-riscv-imsic-platform.c |  18 +-
 drivers/vfio/Kconfig                       |   2 +-
 include/linux/irqdomain_defs.h             |   1 +
 14 files changed, 776 insertions(+), 92 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

-- 
2.47.0



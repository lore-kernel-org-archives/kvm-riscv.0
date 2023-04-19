From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:40 -0700
Subject: [RFC kvmtool 00/10] RISC-V CoVE support
Message-ID: <20230419222350.3604274-1-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series is an initial version of the support for running confidential VMs on
riscv architecture. This is to get feedback on the proposed COVH, COVI and COVG
extensions for running Confidential VMs on riscv. The specification is available
here [0]. Make sure to build it to get the latest changes as it gets updated
from time to time.

We have added a new option, `--cove-vm` to the `run` command to mark the VM as
a confidential VM.

The host including the kernel and kvmtool, must not access any memory allocated
to the confidential VM. The TSM is responsible for providing all the required
information to handle faults and emulate devices.

The series adds support to manage CoVE VMs, which includes:
   * Configuration
   * Creation of CoVE VM and VCPUs.
   * Load initial memory images using measurement ioctls.
   * Virtio support for CoVE VMs.

We don't yet support APLIC and thus no line based interrupts. So we use pci
transport for all the virtio devices. As serial and rtc devices are only mmio
based so we don't yet support those as well.

virtio for the CoVE enforces VIRTIO_F_ACCESS_PLATFORM flag to force SWIOTLB
bounce buffers in confidential linux guest. The SWIOTLB buffers are shared
with the host using share/unshare calls in COVG extension. Thus host can
directly write to those buffers without TSM involvement.

This series depends on few RISC-V series which are not yet upstream.

* AIA support[1]
* SBI DBCN extension[2] 

It also reuses the arch specific virtio host flag hook from CCA series[4].

The patches are also available here:

	https://github.com/rivosinc/kvmtool/commits/cove-integration-03072023

The corresponding linux patches are also available here:
https://github.com/rivosinc/linux/tree/cove-integration

Running a CoVE VM
------------------

Extra options needed:
--cove-vm: Launches a confidential VM.
--virtio-transport: We don't yet support MMIO devices so we need to
                    force virtio device to use pci transport.


 $ lkvm run						\
	 --cove-vm					\
	 --virtio-transport=pci                         \
	 <normal-VM options>

The details instructions can be found at [5]

Links
============
[0] CoVE architecture Specification.
    https://github.com/riscv-non-isa/riscv-ap-tee/blob/main/specification/riscv-aptee-spec.pdf
[1] https://github.com/avpatel/kvmtool/tree/riscv_aia_v1
[2] https://github.com/avpatel/kvmtool/tree/riscv_sbi_dbcn_v1
[4] https://lore.kernel.org/lkml/20230127113932.166089-28-suzuki.poulose at arm.com/
[5] https://github.com/rivosinc/cove/wiki/CoVE-KVM-RISCV64-on-QEMU

Atish Patra (7):
riscv: Add a CoVE VM type.
riscv: Define a command line option for CoVE VM
riscv: Define a measure region IOCTL
riscv: Invoke measure region for VM images
riscv: Do not create APLIC for TVMs
riscv: Change initrd alignment to a page size
riscv: Define riscv specific vm_type function

Rajnesh Kanwal (3):
riscv: virtio: Enforce VIRTIO_F_ACCESS_PLATFORM feature flag.
riscv: Don't emit MMIO devices for CoVE VM.
riscv: cove: Don't emit interrupt_map for pci devices in fdt.

include/linux/kvm.h                 |  4 ++
riscv/aia.c                         | 31 +++++++----
riscv/fdt.c                         | 38 +++++++------
riscv/include/asm/kvm.h             |  6 +++
riscv/include/kvm/kvm-arch.h        |  4 +-
riscv/include/kvm/kvm-config-arch.h |  4 +-
riscv/kvm.c                         | 51 +++++++++++++++++-
riscv/pci.c                         | 83 +++++++++++++++--------------
8 files changed, 152 insertions(+), 69 deletions(-)

--
2.25.1



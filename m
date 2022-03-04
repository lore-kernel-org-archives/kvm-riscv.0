From: Atish Patra <atishp@rivosinc.com>
Date: Fri,  4 Mar 2022 02:10:20 -0800
Subject: [RFC PATCH kvmtool 0/3] Add Sstc extension support
Message-ID: <20220304101023.764631-1-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds Sstc extension which was ratified recently.

The first two patches adds the ISA extension framework which allows
to define and update the DT for any multi-letter ISA extensions. 

The last patch just enables Sstc extension specifically if the hardware
supports it.

The series can also be found at
https://github.com/atishp04/kvmtool/tree/sstc_v1

The kvm & Qemu patches can be found at

KVM: https://github.com/atishp04/linux/tree/sstc_v2
OpenSBI: https://github.com/atishp04/opensbi/tree/sstc_v1
Qemu: https://github.com/atishp04/qemu/tree/sstc_v1 

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view

Atish Patra (3):
riscv: Update the uapi header as per Linux kernel
riscv: Append ISA extensions to the device tree
riscv: Add Sstc extension support

riscv/fdt.c                      | 32 ++++++++++++++++++++++++++++++++
riscv/include/asm/kvm.h          | 22 ++++++++++++++++++++++
riscv/include/kvm/kvm-cpu-arch.h |  5 +++++
riscv/kvm-cpu.c                  |  5 -----
4 files changed, 59 insertions(+), 5 deletions(-)

--
2.30.2



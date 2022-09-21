From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 12:46:12 -0700
Subject: [PATCH 00/17] Prctl to enable vector commands, previous vector patches rebased
Message-ID: <20220921194629.1480202-1-stillson@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds a prctl to enable, disable, or query whether vectors are enabled or not.  This is to allow a process to "opt out" of the overhead incurred by using vectors. Because this is build on top of an existing set of patches to work with vectors, they have been rebased to Linux 6.0-rc1.  


Chris Stillson (1):
  riscv: prctl to enable vector commands

Greentime Hu (9):
  riscv: Add new csr defines related to vector extension
  riscv: Add has_vector/riscv_vsize to save vector features.
  riscv: Add vector struct and assembler definitions
  riscv: Add task switch support for vector
  riscv: Add ptrace vector support
  riscv: Add sigcontext save/restore for vector
  riscv: Add support for kernel mode vector
  riscv: Add vector extension XOR implementation
  riscv: Fix a kernel panic issue if $s2 is set to a specific value
    before entering Linux

Guo Ren (4):
  riscv: Rename __switch_to_aux -> fpu
  riscv: Extending cpufeature.c to detect V-extension
  riscv: Add vector feature to compile
  riscv: Reset vector register

Vincent Chen (3):
  riscv: signal: Report signal frame size to userspace via auxv
  riscv: Add V extension to KVM ISA allow list
  riscv: KVM: Add vector lazy save/restore support

 arch/riscv/Kconfig                       |  15 +-
 arch/riscv/Makefile                      |   1 +
 arch/riscv/configs/defconfig             |   6 +
 arch/riscv/include/asm/csr.h             |  16 ++-
 arch/riscv/include/asm/elf.h             |  47 +++---
 arch/riscv/include/asm/hwcap.h           |   1 +
 arch/riscv/include/asm/kvm_host.h        |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h |  65 +++++++++
 arch/riscv/include/asm/processor.h       |   9 ++
 arch/riscv/include/asm/switch_to.h       |  83 ++++++++++-
 arch/riscv/include/asm/vector.h          |  17 +++
 arch/riscv/include/asm/xor.h             |  82 +++++++++++
 arch/riscv/include/uapi/asm/auxvec.h     |   1 +
 arch/riscv/include/uapi/asm/hwcap.h      |   1 +
 arch/riscv/include/uapi/asm/kvm.h        |   7 +
 arch/riscv/include/uapi/asm/ptrace.h     |  23 +++
 arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
 arch/riscv/kernel/Makefile               |   2 +
 arch/riscv/kernel/asm-offsets.c          |  15 ++
 arch/riscv/kernel/cpufeature.c           |  21 +++
 arch/riscv/kernel/entry.S                |   6 +-
 arch/riscv/kernel/head.S                 |  37 ++++-
 arch/riscv/kernel/kernel_mode_vector.c   | 132 +++++++++++++++++
 arch/riscv/kernel/process.c              |  61 ++++++++
 arch/riscv/kernel/ptrace.c               |  71 ++++++++++
 arch/riscv/kernel/riscv_ksyms.c          |   6 +
 arch/riscv/kernel/signal.c               | 173 ++++++++++++++++++++++-
 arch/riscv/kernel/vector.S               | 102 +++++++++++++
 arch/riscv/kvm/Makefile                  |   1 +
 arch/riscv/kvm/vcpu.c                    |  32 +++++
 arch/riscv/kvm/vcpu_switch.S             |  69 +++++++++
 arch/riscv/kvm/vcpu_vector.c             | 173 +++++++++++++++++++++++
 arch/riscv/lib/Makefile                  |   1 +
 arch/riscv/lib/xor.S                     |  81 +++++++++++
 include/uapi/linux/elf.h                 |   1 +
 include/uapi/linux/prctl.h               |   6 +
 kernel/sys.c                             |   7 +
 37 files changed, 1355 insertions(+), 42 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/kernel/vector.S
 create mode 100644 arch/riscv/kvm/vcpu_vector.c
 create mode 100644 arch/riscv/lib/xor.S

-- 
2.25.1



From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:25 -0700
Subject: [PATCH 00/10] RISC-V: Refactor instructions
Message-ID: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are numerous systems in the kernel that rely on directly
modifying, creating, and reading instructions. Many of these systems
have rewritten code to do this. This patch will delegate all instruction
handling into insn.h and reg.h. All of the compressed instructions, RVI,
Zicsr, M, A instructions are included, as well as a subset of the F,D,Q
extensions.

---
This is modifying code that https://lore.kernel.org/lkml/20230731183925.152145-1-namcaov at gmail.com/
is also touching.

---
Testing:

There are a lot of subsystems touched and I have not tested every
individual instruction. I did a lot of copy-pasting from the RISC-V spec
so opcodes and such should be correct, but the construction of every
instruction is not fully tested.

vector: Compiled and booted

jump_label: Ensured static keys function as expected.

kgdb: Attempted to run the provided tests but they failed even without
my changes

module: Loaded and unloaded modules

patch.c: Ensured kernel booted

kprobes: Used a kprobing module to probe jalr, auipc, and branch
instructions

nommu misaligned addresses: Kernel boots

kvm: Ran KVM selftests

bpf: Kernel boots. Most of the instructions are exclusively used by BPF
but I am unsure of the best way of testing BPF.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

---
Charlie Jenkins (10):
      RISC-V: Expand instruction definitions
      RISC-V: vector: Refactor instructions
      RISC-V: Refactor jump label instructions
      RISC-V: KGDB: Refactor instructions
      RISC-V: module: Refactor instructions
      RISC-V: Refactor patch instructions
      RISC-V: nommu: Refactor instructions
      RISC-V: kvm: Refactor instructions
      RISC-V: bpf: Refactor instructions
      RISC-V: Refactor bug and traps instructions

 arch/riscv/include/asm/bug.h             |   18 +-
 arch/riscv/include/asm/insn.h            | 2744 +++++++++++++++++++++++++++---
 arch/riscv/include/asm/reg.h             |   88 +
 arch/riscv/kernel/jump_label.c           |   13 +-
 arch/riscv/kernel/kgdb.c                 |   13 +-
 arch/riscv/kernel/module.c               |   80 +-
 arch/riscv/kernel/patch.c                |    3 +-
 arch/riscv/kernel/probes/kprobes.c       |   13 +-
 arch/riscv/kernel/probes/simulate-insn.c |  100 +-
 arch/riscv/kernel/probes/uprobes.c       |    5 +-
 arch/riscv/kernel/traps.c                |    9 +-
 arch/riscv/kernel/traps_misaligned.c     |  218 +--
 arch/riscv/kernel/vector.c               |    5 +-
 arch/riscv/kvm/vcpu_insn.c               |  281 +--
 arch/riscv/net/bpf_jit.h                 |  707 +-------
 15 files changed, 2825 insertions(+), 1472 deletions(-)
---
base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
change-id: 20230801-master-refactor-instructions-v4-433aa040da03
-- 
- Charlie



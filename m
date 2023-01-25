From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 25 Jan 2023 14:20:37 +0000
Subject: [PATCH -next v13 00/19] riscv: Add vector ISA support
Message-ID: <20230125142056.18356-1-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset is implemented based on vector 1.0 spec to add vector support
in riscv Linux kernel. There are some assumptions for this implementations.

1. We assume all harts has the same ISA in the system.
2. We disable vector in both kernel andy user space [1] by default. Only
   enable an user's vector after an illegal instruction trap where it
   actually starts executing vector (the first-use trap [2]).
3. We detect "riscv,isa" to determine whether vector is support or not.

We defined a new structure __riscv_v_state in struct thread_struct to save
/restore the vector related registers. It is used for both kernel space and
user space.
 - In kernel space, the datap pointer in __riscv_v_state will be allocated
   to save vector registers.
 - In user space,
	- In signal handler of user space, the structure is placed
	  right after __riscv_ctx_hdr, which is embedded in fp reserved
	  aera. This is required to avoid ABI break [2]. And datap points
	  to the end of __riscv_v_state.
	- In ptrace, the data will be put in ubuf in which we use
	  riscv_vr_get()/riscv_vr_set() to get or set the
	  __riscv_v_state data structure from/to it, datap pointer
	  would be zeroed and vector registers will be copied to the
	  address right after the __riscv_v_state structure in ubuf.

This patchset is rebased to v6.2-rc1 and it is tested by running several
vector programs simultaneously. It also can get the correct ucontext_t in
signal handler and restore correct context after sigreturn. It is also
tested with ptrace() syscall to use PTRACE_GETREGSET/PTRACE_SETREGSET to
get/set the vector registers.

Source tree: https://github.com/sifive/riscv-linux/tree/riscv/for-next/vector-v13
Links:
 - [1] https://lore.kernel.org/all/20220921214439.1491510-17-stillson at rivosinc.com/
 - [2] https://lore.kernel.org/all/73c0124c-4794-6e40-460c-b26df407f322 at rivosinc.com/T/#u

---
Changelog V13
 - Rebase to latest risc-v next (v6.2-rc1)
 - Re-organize the series to comply with bisect-ability
 - Improve task switch with inline assembly
 - Re-structure the signal frame to avoid user ABI break.
 - Implemnt first-use trap and drop prctl for per-task V state
   enablement. Also, redirect this trap from hs to vs for kvm setup.
 - Do not expose V context in ptrace/sigframe until the task start using
   V. But still reserve V context for size ofsigframe reported by auxv.
 - Drop the kernel mode vector and leave it to another (future) series.

Changelog V12 (Chris)
 - rebases to some point after v5.18-rc6
 - add prctl to control per-process V state

Chnagelog V10
 - Rebase to v5.18-rc6
 - Merge several patches
 - Refine codes
 - Fix bugs
 - Add kvm vector support

Changelog V9
 - Rebase to v5.15
 - Merge several patches
 - Refine codes
 - Fix a kernel panic issue

Changelog V8
 - Rebase to v5.14
 - Refine struct __riscv_v_state with struct __riscv_ctx_hdr
 - Refine has_vector into a static key
 - Defined __reserved space in struct sigcontext for vector and future extensions

Changelog V7
 - Add support for kernel mode vector
 - Add vector extension XOR implementation
 - Optimize task switch codes of vector
 - Allocate space for vector registers in start_thread()
 - Fix an illegal instruction exception when accessing vlenb
 - Optimize vector registers initialization
 - Initialize vector registers with proper vsetvli then it can work normally
 - Refine ptrace porting due to generic API changed
 - Code clean up

Changelog V6
 - Replace vle.v/vse.v instructions with vle8.v/vse8.v based on 0.9 spec
 - Add comments based on mailinglist feedback
 - Fix rv32 build error

Changelog V5
 - Using regset_size() correctly in generic ptrace
 - Fix the ptrace porting
 - Fix compile warning

Changelog V4
 - Support dynamic vlen
 - Fix bugs: lazy save/resotre, not saving vtype
 - Update VS bit offset based on latest vector spec
 - Add new vector csr based on latest vector spec
 - Code refine and removed unused macros

Changelog V3
 - Rebase linux-5.6-rc3 and tested with qemu
 - Seperate patches with Anup's advice
 - Give out a ABI puzzle with unlimited vlen

Changelog V2
 - Fixup typo "vecotr, fstate_save->vstate_save".
 - Fixup wrong saved registers' length in vector.S.
 - Seperate unrelated patches from this one.

Andy Chiu (6):
  riscv: Clear vector regfile on bootup
  riscv: Disable Vector Instructions for kernel itself
  riscv: Introduce Vector enable/disable helpers
  riscv: Allocate user's vector context in the first-use trap
  riscv: signal: check fp-reserved words unconditionally
  riscv: kvm: redirect illegal instruction traps to guests

Greentime Hu (7):
  riscv: Add new csr defines related to vector extension
  riscv: Introduce riscv_vsize to record size of Vector context
  riscv: Introduce struct/helpers to save/restore per-task Vector state
  riscv: Add task switch support for vector
  riscv: Add ptrace vector support
  riscv: signal: Add sigcontext save/restore for vector
  riscv: Fix a kernel panic issue if $s2 is set to a specific value
    before entering Linux

Guo Ren (3):
  riscv: Rename __switch_to_aux -> fpu
  riscv: Extending cpufeature.c to detect V-extension
  riscv: Enable Vector code to be built

Vincent Chen (3):
  riscv: signal: Report signal frame size to userspace via auxv
  riscv: Add V extension to KVM ISA
  riscv: KVM: Add vector lazy save/restore support

 arch/riscv/Kconfig                       |  10 ++
 arch/riscv/Makefile                      |   7 +
 arch/riscv/include/asm/csr.h             |  18 +-
 arch/riscv/include/asm/elf.h             |   9 +
 arch/riscv/include/asm/hwcap.h           |   4 +
 arch/riscv/include/asm/insn.h            |  24 +++
 arch/riscv/include/asm/kvm_host.h        |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h |  77 +++++++++
 arch/riscv/include/asm/processor.h       |   3 +
 arch/riscv/include/asm/switch_to.h       |  24 ++-
 arch/riscv/include/asm/thread_info.h     |   3 +
 arch/riscv/include/asm/vector.h          | 152 +++++++++++++++++
 arch/riscv/include/uapi/asm/auxvec.h     |   1 +
 arch/riscv/include/uapi/asm/hwcap.h      |   1 +
 arch/riscv/include/uapi/asm/kvm.h        |   8 +
 arch/riscv/include/uapi/asm/ptrace.h     |  39 +++++
 arch/riscv/include/uapi/asm/sigcontext.h |  16 +-
 arch/riscv/kernel/Makefile               |   1 +
 arch/riscv/kernel/cpufeature.c           |  22 +++
 arch/riscv/kernel/entry.S                |   6 +-
 arch/riscv/kernel/head.S                 |  37 ++++-
 arch/riscv/kernel/process.c              |  18 ++
 arch/riscv/kernel/ptrace.c               |  71 ++++++++
 arch/riscv/kernel/setup.c                |   3 +
 arch/riscv/kernel/signal.c               | 202 +++++++++++++++++++----
 arch/riscv/kernel/traps.c                |  14 +-
 arch/riscv/kernel/vector.c               |  89 ++++++++++
 arch/riscv/kvm/Makefile                  |   1 +
 arch/riscv/kvm/vcpu.c                    |  31 ++++
 arch/riscv/kvm/vcpu_exit.c               |  15 ++
 arch/riscv/kvm/vcpu_vector.c             | 177 ++++++++++++++++++++
 include/uapi/linux/elf.h                 |   1 +
 32 files changed, 1041 insertions(+), 45 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/kernel/vector.c
 create mode 100644 arch/riscv/kvm/vcpu_vector.c

-- 
2.17.1



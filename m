From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon,  5 Jun 2023 11:06:57 +0000
Subject: [PATCH -next v21 00/27] riscv: Add vector ISA support
Message-ID: <20230605110724.21391-1-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is the v21 patch series for adding Vector extension support in
Linux. Please refer to [1] for the introduction of the patchset. The
v21 patch series was aimed to solve build issues from v19, provide usage
guideline for the prctl interface, and address review comments on v20.

Thank every one who has been reviewing, suggesting on the topic. Hope
this get a step closer to the final merge.

Here points out where changes are located:

Updated patches: 10, 11, 21, 25
New patches: 20
Unchanged patches: 1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 26, 27

Source tree:
https://github.com/sifive/riscv-linux/tree/riscv/for-next/vector-v21

Links:
 - [1] https://lore.kernel.org/all/20230518161949.11203-1-andy.chiu at sifive.com/

---
Changelog V21
 - Add usage guideline for the prctl interface (R?mi, patch 25)
 - Properly define macros to prevent build fails (Bj?rn, patch 21)
 - expose ELF_HWCAP as a function so we can set bits individually for
   processes. (patch 20)
 - Turn off V in ELF_HWCAP when user is not allowed to use it.
   (R?mi, patch 21)
 - Send SIGBUS to indicate the allocation for V context fails.
   (Darius, patch 11)
 - Refine checks in riscv_v_first_use_handler(). (patch 11, 21)
 - Refine location of callsite to disable Vector when forked (patch 10)

Changelog V20
 - Add .gitignore into hwprobe (patch 26)
 - Implement test for prctl and fix issues (patch 20, 25)
 - Fix compile error with allmodconfig (patch 20).
 - Check elf_hwcap in first-use trap (patch 11).
 - Refine code (patch 11, 20, 21, 23, 24)
 - Properly add V entry into hwprobe (patch 3).
 - Fix typos (patch 3, 24)
 - Use "_unlikely" to detect V since there is no public available hw
   that supports it (patch 2).

Changelog V19
 - Rebase to the latest -next branch (at 6.4-rc1 ac9a786). Solve
   conflicts at patch 14, 15, and 19.
 - Add a sysctl, and prctl intefaces for userspace Vector control, and a
   document for it. (patch 20, 21, 24)
 - Add a Kconfig RISCV_V_DISABLE to set the default value of userspace
   Vector enablement status at compile-time. (patch 23)
 - Allow hwprobe interface to probe Vector. (patch 3)
 - Fix typos and commit msg at patch 6 and 8.

Changelog V18
 - Rebase to the latest -next branch (at 9c2598d)
 - patch 7: Detect inconsistent VLEN setup on an SMP system (Heiko).
 - patch 10: Add blank lines (Heiko)
 - patch 10: Return immediately in insn_is_vector() if an insn matches (Heiko)
 - patch 11: Use sizeof(vstate->datap) instead of sizeof(void*) (Eike)

Changelog V17
 - Rebase to the latest -next branch (at e45d6a5):
   - Solve conflicts at 9 and 13 due to generic entry
   - Use generic entry in do_trap_insn_illegal() trap handler

Changelog V16
 - Rebase to the latest for-next (at 4b74077):
 - Solve conflicts at 7, and 17
 - Use as-instr to detect if assembler supports .option arch directive
   and remove dependency from GAS, for both ZBB and V.
 - Cleanup code in KVM vector
 - Address issue reported by sparse
 - Refine code:
   - Fix a mixed-use of space/tab
   - Remove new lines at the end of file

Changelog V15
 - Rebase to risc-v -next (v6.3-rc1)
 - Make V depend on FD in Kconfig according to the spec and shut off v
   properly.
 - Fix a syntax error for clang build. But mark RISCV_ISA_V GAS only due
   to https://reviews.llvm.org/D123515
 - Use scratch reg in inline asm instead of t4.
 - Refine code.
 - Cleanup per-patch changelogs.

Changelog V14
 - Rebase to risc-v -next (v6.2-rc7)
 - Use TOOLCHAIN_HAS_V to detect if we can enable Vector. And refine
   KBUILD_CFLAGS to remove v from default compile option.
 - Drop illegal instruction handling patch in kvm and leave it to a
   independent series[3]. The series has merged into 6.3-rc1
 - Move KVM_RISCV_ISA_EXT_V to the end of enum to prevent potential ABI
   breaks.
 - Use PT_SIZE_ON_STACK instead of PT_SIZE to fit alignment. Also,
   remove panic log from v13 (15/19) because it is no longer relevant.
 - Rewrite insn_is_vector for better structuring (change if-else chain to
   a switch)
 - Fix compilation error in the middle of the series
 - Validate size of the alternative signal frame if V is enabled
   whenever:
     - The user call sigaltstack to update altstack
     - A signal is being delivered
 - Rename __riscv_v_state to __riscv_v_ext_state.
 - Add riscv_v_ prefix and rename rvv appropriately
 - Organize riscv_v_vsize setup code into vector.c
 - Address the issue mentioned by Heiko on !FPU case
 - Honor orignal authors that got changed accidentally in v13 4,5,6

Changelog V13
 - Rebase to latest risc-v next (v6.2-rc1)
 - vineetg: Re-organize the series to comply with bisect-ability
 - andy.chiu: Improve task switch with inline assembly
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
 - Refine struct __riscv_v_ext_state with struct __riscv_ctx_hdr
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

Andy Chiu (11):
  riscv: hwprobe: Add support for probing V in
    RISCV_HWPROBE_KEY_IMA_EXT_0
  riscv: Allocate user's vector context in the first-use trap
  riscv: signal: check fp-reserved words unconditionally
  riscv: signal: validate altstack to reflect Vector
  riscv: hwcap: change ELF_HWCAP to a function
  riscv: Add prctl controls for userspace vector management
  riscv: Add sysctl to set the default vector rule for new processes
  riscv: detect assembler support for .option arch
  riscv: Add documentation for Vector
  selftests: Test RISC-V Vector prctl interface
  selftests: add .gitignore file for RISC-V hwprobe

Greentime Hu (9):
  riscv: Add new csr defines related to vector extension
  riscv: Clear vector regfile on bootup
  riscv: Introduce Vector enable/disable helpers
  riscv: Introduce riscv_v_vsize to record size of Vector context
  riscv: Introduce struct/helpers to save/restore per-task Vector state
  riscv: Add task switch support for vector
  riscv: Add ptrace vector support
  riscv: signal: Add sigcontext save/restore for vector
  riscv: prevent stack corruption by reserving task_pt_regs(p) early

Guo Ren (4):
  riscv: Rename __switch_to_aux() -> fpu
  riscv: Extending cpufeature.c to detect V-extension
  riscv: Disable Vector Instructions for kernel itself
  riscv: Enable Vector code to be built

Vincent Chen (3):
  riscv: signal: Report signal frame size to userspace via auxv
  riscv: kvm: Add V extension to KVM ISA
  riscv: KVM: Add vector lazy save/restore support

 Documentation/riscv/hwprobe.rst               |   3 +
 Documentation/riscv/index.rst                 |   1 +
 Documentation/riscv/vector.rst                | 132 +++++++++
 arch/riscv/Kconfig                            |  39 ++-
 arch/riscv/Makefile                           |   6 +-
 arch/riscv/include/asm/csr.h                  |  18 +-
 arch/riscv/include/asm/elf.h                  |  11 +-
 arch/riscv/include/asm/hwcap.h                |   3 +
 arch/riscv/include/asm/insn.h                 |  29 ++
 arch/riscv/include/asm/kvm_host.h             |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h      |  82 ++++++
 arch/riscv/include/asm/processor.h            |  13 +
 arch/riscv/include/asm/switch_to.h            |   9 +-
 arch/riscv/include/asm/thread_info.h          |   3 +
 arch/riscv/include/asm/vector.h               | 184 ++++++++++++
 arch/riscv/include/uapi/asm/auxvec.h          |   1 +
 arch/riscv/include/uapi/asm/hwcap.h           |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   8 +
 arch/riscv/include/uapi/asm/ptrace.h          |  39 +++
 arch/riscv/include/uapi/asm/sigcontext.h      |  16 +-
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/cpufeature.c                |  25 ++
 arch/riscv/kernel/entry.S                     |   6 +-
 arch/riscv/kernel/head.S                      |  41 ++-
 arch/riscv/kernel/process.c                   |  20 ++
 arch/riscv/kernel/ptrace.c                    |  70 +++++
 arch/riscv/kernel/setup.c                     |   3 +
 arch/riscv/kernel/signal.c                    | 220 ++++++++++++--
 arch/riscv/kernel/smpboot.c                   |   7 +
 arch/riscv/kernel/sys_riscv.c                 |   4 +
 arch/riscv/kernel/traps.c                     |  26 +-
 arch/riscv/kernel/vector.c                    | 276 ++++++++++++++++++
 arch/riscv/kvm/Makefile                       |   1 +
 arch/riscv/kvm/vcpu.c                         |  25 ++
 arch/riscv/kvm/vcpu_vector.c                  | 186 ++++++++++++
 include/uapi/linux/elf.h                      |   1 +
 include/uapi/linux/prctl.h                    |  11 +
 kernel/sys.c                                  |  12 +
 tools/testing/selftests/riscv/Makefile        |   2 +-
 .../selftests/riscv/hwprobe/.gitignore        |   1 +
 .../testing/selftests/riscv/vector/.gitignore |   2 +
 tools/testing/selftests/riscv/vector/Makefile |  15 +
 .../riscv/vector/vstate_exec_nolibc.c         | 111 +++++++
 .../selftests/riscv/vector/vstate_prctl.c     | 189 ++++++++++++
 45 files changed, 1805 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/riscv/vector.rst
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/kernel/vector.c
 create mode 100644 arch/riscv/kvm/vcpu_vector.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/.gitignore
 create mode 100644 tools/testing/selftests/riscv/vector/.gitignore
 create mode 100644 tools/testing/selftests/riscv/vector/Makefile
 create mode 100644 tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
 create mode 100644 tools/testing/selftests/riscv/vector/vstate_prctl.c

-- 
2.17.1



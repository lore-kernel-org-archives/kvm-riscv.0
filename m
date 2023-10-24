From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 24 Oct 2023 15:26:50 +0200
Subject: [PATCH v2 0/5] riscv: cleanup assembly usage of ENTRY()/END() and use local labels
Message-ID: <20231024132655.730417-1-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does a cleanup of all ENTRY()/END() macros that are used in
arch/riscv/ as well as use of local labels. This allows to remove the
use of the now deprecated ENTRY()/END()/WEAK() macros as well as using
the new SYM_*() ones which provide a better understanding of what is
meant to be annotated. Some wrong usage of SYM_FUNC_START() are also
fixed in this series by using the correct annotations. Finally a few
labels that were meant to be local have been renamed to use the .L
suffix and thus not to be emitted as visible symbols.

Note: the patches have been split between arch/riscv/ and
arch/riscv/kvm/ due to having different maintainers.

---

Changes in V2:
 - Remove duplicated SYM_FUNC_END(memmove)
 - Use SYM_DATA for simple .quad usage
 - Added Andrew Rb:

Cl?ment L?ger (5):
  riscv: use ".L" local labels in assembly when applicable
  riscv: Use SYM_*() assembly macros instead of deprecated ones
  riscv: kernel: Use correct SYM_DATA_*() macro for data
  riscv: kvm: Use SYM_*() assembly macros instead of deprecated ones
  riscv: kvm: use ".L" local labels in assembly when applicable

 arch/riscv/kernel/copy-unaligned.S            |  8 +--
 arch/riscv/kernel/entry.S                     | 19 +++----
 arch/riscv/kernel/fpu.S                       |  8 +--
 arch/riscv/kernel/head.S                      | 30 +++++-----
 arch/riscv/kernel/hibernate-asm.S             | 12 ++--
 arch/riscv/kernel/mcount-dyn.S                | 20 +++----
 arch/riscv/kernel/mcount.S                    | 18 +++---
 arch/riscv/kernel/probes/rethook_trampoline.S |  4 +-
 arch/riscv/kernel/suspend_entry.S             |  4 +-
 arch/riscv/kernel/vdso/flush_icache.S         |  4 +-
 arch/riscv/kernel/vdso/getcpu.S               |  4 +-
 arch/riscv/kernel/vdso/rt_sigreturn.S         |  4 +-
 arch/riscv/kernel/vdso/sys_hwprobe.S          |  4 +-
 arch/riscv/kvm/vcpu_switch.S                  | 32 +++++------
 arch/riscv/lib/memcpy.S                       |  6 +-
 arch/riscv/lib/memmove.S                      | 57 +++++++++----------
 arch/riscv/lib/memset.S                       |  6 +-
 arch/riscv/lib/uaccess.S                      | 11 ++--
 arch/riscv/purgatory/entry.S                  | 16 ++----
 19 files changed, 124 insertions(+), 143 deletions(-)

-- 
2.42.0



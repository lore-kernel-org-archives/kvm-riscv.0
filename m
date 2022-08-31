From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 Aug 2022 19:24:56 +0200
Subject: [PATCH v2 0/4] riscv: Introduce support for defining instructions
Message-ID: <20220831172500.752195-1-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When compiling with toolchains that haven't yet been taught about
new instructions we need to encode them ourselves. This series
creates a new file where support for instruction definitions can
evolve. For starters the file is initiated with a macro for R-type
encodings. The series then applies the R-type encoding macro to all
instances of hard coded instruction definitions in KVM.

Not only should using instruction encoding macros improve readability
and maintainability of code, but we should also gain potential for
more optimized code after compilation as the compiler will have control
over the input and output registers used, which may provide more
opportunities for inlining.

I grepped for other places we may want to use these macros and the
only place I found was ALT_CMO_OP(), but I didn't dare touch it :-)
I do suggest we apply this to the Svinal support [1] as we won't
want to frustrate the compiler's inlining efforts with hard coded
register selection.

[1] https://lore.kernel.org/linux-riscv/20220812042921.14508-1-mchitale at ventanamicro.com/

v2:
 - Cleaned up some whitespace issues pointed out by Anup, myself
   and checkpatch and dropped some {}
 - Pushed the quoting of register tokens into the macros
 - Picked up Anup's r-b's

Andrew Jones (4):
  riscv: Add X register names to gpr-nums
  riscv: Introduce support for defining instructions
  riscv: KVM: Apply insn-def to hfence encodings
  riscv: KVM: Apply insn-def to hlv encodings

 arch/riscv/Kconfig                |   3 +
 arch/riscv/include/asm/gpr-num.h  |   8 ++
 arch/riscv/include/asm/insn-def.h | 113 ++++++++++++++++++++++++++
 arch/riscv/kvm/tlb.c              | 129 ++++--------------------------
 arch/riscv/kvm/vcpu_exit.c        |  29 ++-----
 5 files changed, 146 insertions(+), 136 deletions(-)
 create mode 100644 arch/riscv/include/asm/insn-def.h

-- 
2.37.2



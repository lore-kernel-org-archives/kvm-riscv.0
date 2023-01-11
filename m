From: Jisheng Zhang <jszhang@kernel.org>
Date: Thu, 12 Jan 2023 01:10:14 +0800
Subject: [PATCH v3 00/13] riscv: improve boot time isa extensions handling
Message-ID: <20230111171027.2392-1-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Generally, riscv ISA extensions are fixed for any specific hardware
platform, so a hart's features won't change after booting, this
chacteristic makes it straightforward to use a static branch to check
a specific ISA extension is supported or not to optimize performance.

However, some ISA extensions such as SVPBMT and ZICBOM are handled
via. the alternative sequences.

Basically, for ease of maintenance, we prefer to use static branches
in C code, but recently, Samuel found that the static branch usage in
cpu_relax() breaks building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]. As
Samuel pointed out, "Having a static branch in cpu_relax() is
problematic because that function is widely inlined, including in some
quite complex functions like in the VDSO. A quick measurement shows
this static branch is responsible by itself for around 40% of the jump
table."

Samuel's findings pointed out one of a few downsides of static branches
usage in C code to handle ISA extensions detected at boot time:
static branch's metadata in the __jump_table section, which is not
discarded after ISA extensions are finalized, wastes some space.

I want to try to solve the issue for all possible dynamic handling of
ISA extensions at boot time. Inspired by Mark[2], this patch introduces
riscv_has_extension_*() helpers, which work like static branches but
are patched using alternatives, thus the metadata can be freed after
patching.

Hi Heiko,

I combined your code and my code into patch1, since one of the key
patch in the merged "Allow calls in alternatives" series rolled
back to your v1. So I added your Co-developed-by and Signed-off-by
thanks

Since v2
 - rebase on riscv-next
 - collect Reviewed-by tag
 - fix jal imm construction
 - combine Heiko's code and my code for jal patching, thus add
   Co-developed-by tag
 - address comments from Conor

Since v1
 - rebase on v6.1-rc7 + Heiko's alternative improvements[3]
 - collect Reviewed-by tag
 - add one patch to update jal offsets in patched alternatives
 - add one patch to switch to relative alternative entries
 - add patches to patch vdso

[1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel at sholland.org/
[2]https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-mark.rutland at arm.com/
[3]https://lore.kernel.org/linux-riscv/20221130225614.1594256-1-heiko at sntech.de/


Andrew Jones (1):
  riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()

Jisheng Zhang (12):
  riscv: fix jal offsets in patched alternatives
  riscv: move riscv_noncoherent_supported() out of ZICBOM probe
  riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
  riscv: hwcap: make ISA extension ids can be used in asm
  riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA
    extensions
  riscv: introduce riscv_has_extension_[un]likely()
  riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
  riscv: module: move find_section to module.h
  riscv: switch to relative alternative entries
  riscv: alternative: patch alternatives in the vDSO
  riscv: cpu_relax: switch to riscv_has_extension_likely()
  riscv: remove riscv_isa_ext_keys[] array and related usage

 arch/riscv/errata/sifive/errata.c           |  4 +-
 arch/riscv/errata/thead/errata.c            | 11 ++-
 arch/riscv/include/asm/alternative-macros.h | 20 ++---
 arch/riscv/include/asm/alternative.h        | 12 +--
 arch/riscv/include/asm/errata_list.h        |  9 +-
 arch/riscv/include/asm/hwcap.h              | 97 +++++++++++----------
 arch/riscv/include/asm/insn.h               | 27 ++++++
 arch/riscv/include/asm/module.h             | 16 ++++
 arch/riscv/include/asm/switch_to.h          |  3 +-
 arch/riscv/include/asm/vdso.h               |  4 +
 arch/riscv/include/asm/vdso/processor.h     |  2 +-
 arch/riscv/kernel/alternative.c             | 52 +++++++++++
 arch/riscv/kernel/cpufeature.c              | 78 +++--------------
 arch/riscv/kernel/module.c                  | 15 ----
 arch/riscv/kernel/setup.c                   |  3 +
 arch/riscv/kernel/vdso.c                    |  5 --
 arch/riscv/kernel/vdso/vdso.lds.S           |  7 ++
 arch/riscv/kvm/tlb.c                        |  3 +-
 18 files changed, 206 insertions(+), 162 deletions(-)

-- 
2.38.1



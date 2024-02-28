From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:16 +0100
Subject: [kvm-unit-tests PATCH 00/13] Enable EFI support
Message-ID: <20240228150416.248948-15-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series starts with some fixes for backtraces for bugs found
when tracing with riscv EFI builds. The series then brings EFI
support to riscv, basing the approach heavily on arm64's support
(including arm64's improvements[1]). It should now be possible
to launch tests from EFI-capable bootloaders.

[1] https://lore.kernel.org/all/20240227192109.487402-20-andrew.jones at linux.dev/

Thanks,
drew

Andrew Jones (13):
  riscv: Call abort instead of assert on unhandled exceptions
  riscv: show_regs: Prepare for EFI images
  treewide: lib/stack: Fix backtrace
  treewide: lib/stack: Make base_address arch specific
  riscv: Import gnu-efi files
  riscv: Tweak the gnu-efi imported code
  riscv: Enable building for EFI
  riscv: efi: Switch stack in _start
  efi: Add support for obtaining the boot hartid
  riscv: Refactor setup code
  riscv: Enable EFI boot
  riscv: efi: Add run script
  riscv: efi: Use efi-direct by default

 configure                     |  12 +-
 lib/arm/stack.c               |  13 +--
 lib/arm64/stack.c             |  29 +++--
 lib/efi.c                     |  33 ++++++
 lib/elf.h                     |   5 +
 lib/riscv/asm/setup.h         |   5 +
 lib/riscv/processor.c         |  11 +-
 lib/riscv/setup.c             | 170 +++++++++++++++++++++-------
 lib/riscv/stack.c             |  30 +++--
 lib/s390x/stack.c             |  12 +-
 lib/stack.c                   |  19 +---
 lib/stack.h                   |  26 +++--
 lib/x86/stack.c               |  29 +++--
 riscv/Makefile                |  24 +++-
 riscv/cstart.S                |   4 +
 riscv/efi/crt0-efi-riscv64.S  | 205 ++++++++++++++++++++++++++++++++++
 riscv/efi/elf_riscv64_efi.lds | 142 +++++++++++++++++++++++
 riscv/efi/reloc_riscv64.c     |  91 +++++++++++++++
 riscv/efi/run                 | 106 ++++++++++++++++++
 riscv/flat.lds                |   1 +
 riscv/run                     |   2 +-
 21 files changed, 859 insertions(+), 110 deletions(-)
 create mode 100644 riscv/efi/crt0-efi-riscv64.S
 create mode 100644 riscv/efi/elf_riscv64_efi.lds
 create mode 100644 riscv/efi/reloc_riscv64.c
 create mode 100755 riscv/efi/run

-- 
2.43.0



From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 26 Jan 2024 15:23:25 +0100
Subject: [kvm-unit-tests PATCH v2 00/24] Introduce RISC-V
Message-ID: <20240126142324.66674-26-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v2:
 - While basing [1] on this series I found two bugs (one in exception
   return and another in isa string parsing). I also decided to expose
   a get_pte() function to unit tests and also an isa-extension-by-name
   function to check for arbitrary extensions. Finally, I picked up
   Thomas' gitlab-ci suggestion and his tags.

(Having [1] and the selftests running makes me pretty happy with the
series, so, unless somebody shouts, I'll merge this sometime next week.)

[1] https://gitlab.com/jones-drew/kvm-unit-tests/-/commit/e9c6c58b1c799de77fd39970b358a7592ecd048f

Thanks,
drew

Original cover letter follows:

This series adds another architecture to kvm-unit-tests (RISC-V, both
32-bit and 64-bit). Much of the code is borrowed from arm/arm64 by
mimicking its patterns or by first making the arm code more generic
and moving it to the common lib.

This series brings UART, SMP, MMU, and exception handling support.
One should be able to start writing CPU validation tests in a mix
of C and asm as well as write SBI tests, as is the plan for the SBI
verification framework. kvm-unit-tests provides backtraces on asserts
and input can be given to the tests through command line arguments,
environment variables, and the DT (there's already an ISA string
parser for extension detection).

This series only targets QEMU TCG and KVM, but OpenSBI may be replaced
with other SBI implementations, such as RustSBI. It's a goal to target
bare-metal as soon as possible, so EFI support is already in progress
and will be posted soon. More follow on series will come as well,
bringing interrupt controller support for timer and PMU testing,
support to run tests in usermode, and whatever else people need for
their tests.


Andrew Jones (24):
  configure: Add ARCH_LIBDIR
  riscv: Initial port, hello world
  arm/arm64: Move cpumask.h to common lib
  arm/arm64: Share cpu online, present and idle masks
  riscv: Add DT parsing
  riscv: Add initial SBI support
  riscv: Add run script and unittests.cfg
  riscv: Add riscv32 support
  riscv: Add exception handling
  riscv: Add backtrace support
  arm/arm64: Generalize wfe/sev names in smp.c
  arm/arm64: Remove spinlocks from on_cpu_async
  arm/arm64: Share on_cpus
  riscv: Compile with march
  riscv: Add SMP support
  arm/arm64: Share memregions
  riscv: Populate memregions and switch to page allocator
  riscv: Add MMU support
  riscv: Enable the MMU in secondaries
  riscv: Enable vmalloc
  lib: Add strcasecmp and strncasecmp
  riscv: Add isa string parsing
  gitlab-ci: Add riscv64 tests
  MAINTAINERS: Add riscv

 .gitlab-ci.yml               |  17 +++
 MAINTAINERS                  |   8 ++
 Makefile                     |   2 +-
 arm/Makefile.common          |   2 +
 arm/selftest.c               |   3 +-
 configure                    |  16 +++
 lib/arm/asm/gic-v2.h         |   2 +-
 lib/arm/asm/gic-v3.h         |   2 +-
 lib/arm/asm/gic.h            |   2 +-
 lib/arm/asm/setup.h          |  14 --
 lib/arm/asm/smp.h            |  45 +-----
 lib/arm/mmu.c                |   3 +-
 lib/arm/setup.c              |  93 +++----------
 lib/arm/smp.c                | 135 +-----------------
 lib/arm64/asm/cpumask.h      |   1 -
 lib/{arm/asm => }/cpumask.h  |  42 +++++-
 lib/ctype.h                  |  10 ++
 lib/elf.h                    |  11 ++
 lib/ldiv32.c                 |  16 +++
 lib/linux/const.h            |   2 +
 lib/memregions.c             |  82 +++++++++++
 lib/memregions.h             |  29 ++++
 lib/on-cpus.c                | 154 +++++++++++++++++++++
 lib/on-cpus.h                |  14 ++
 lib/riscv/.gitignore         |   1 +
 lib/riscv/asm-offsets.c      |  62 +++++++++
 lib/riscv/asm/asm-offsets.h  |   1 +
 lib/riscv/asm/barrier.h      |  20 +++
 lib/riscv/asm/bitops.h       |  21 +++
 lib/riscv/asm/bug.h          |  20 +++
 lib/riscv/asm/csr.h          | 100 ++++++++++++++
 lib/riscv/asm/io.h           |  87 ++++++++++++
 lib/riscv/asm/isa.h          |  33 +++++
 lib/riscv/asm/memory_areas.h |   1 +
 lib/riscv/asm/mmu.h          |  32 +++++
 lib/riscv/asm/page.h         |  21 +++
 lib/riscv/asm/pgtable.h      |  42 ++++++
 lib/riscv/asm/processor.h    |  29 ++++
 lib/riscv/asm/ptrace.h       |  46 +++++++
 lib/riscv/asm/sbi.h          |  54 ++++++++
 lib/riscv/asm/setup.h        |  15 ++
 lib/riscv/asm/smp.h          |  29 ++++
 lib/riscv/asm/spinlock.h     |   7 +
 lib/riscv/asm/stack.h        |  12 ++
 lib/riscv/bitops.c           |  47 +++++++
 lib/riscv/io.c               |  97 +++++++++++++
 lib/riscv/isa.c              | 126 +++++++++++++++++
 lib/riscv/mmu.c              | 205 +++++++++++++++++++++++++++
 lib/riscv/processor.c        |  64 +++++++++
 lib/riscv/sbi.c              |  40 ++++++
 lib/riscv/setup.c            | 188 +++++++++++++++++++++++++
 lib/riscv/smp.c              |  70 ++++++++++
 lib/riscv/stack.c            |  32 +++++
 lib/string.c                 |  14 ++
 lib/string.h                 |   2 +
 riscv/Makefile               | 106 ++++++++++++++
 riscv/cstart.S               | 259 +++++++++++++++++++++++++++++++++++
 riscv/flat.lds               |  75 ++++++++++
 riscv/run                    |  41 ++++++
 riscv/sbi.c                  |  41 ++++++
 riscv/selftest.c             | 100 ++++++++++++++
 riscv/sieve.c                |   1 +
 riscv/unittests.cfg          |  37 +++++
 63 files changed, 2616 insertions(+), 267 deletions(-)
 delete mode 100644 lib/arm64/asm/cpumask.h
 rename lib/{arm/asm => }/cpumask.h (72%)
 create mode 100644 lib/memregions.c
 create mode 100644 lib/memregions.h
 create mode 100644 lib/on-cpus.c
 create mode 100644 lib/on-cpus.h
 create mode 100644 lib/riscv/.gitignore
 create mode 100644 lib/riscv/asm-offsets.c
 create mode 100644 lib/riscv/asm/asm-offsets.h
 create mode 100644 lib/riscv/asm/barrier.h
 create mode 100644 lib/riscv/asm/bitops.h
 create mode 100644 lib/riscv/asm/bug.h
 create mode 100644 lib/riscv/asm/csr.h
 create mode 100644 lib/riscv/asm/io.h
 create mode 100644 lib/riscv/asm/isa.h
 create mode 100644 lib/riscv/asm/memory_areas.h
 create mode 100644 lib/riscv/asm/mmu.h
 create mode 100644 lib/riscv/asm/page.h
 create mode 100644 lib/riscv/asm/pgtable.h
 create mode 100644 lib/riscv/asm/processor.h
 create mode 100644 lib/riscv/asm/ptrace.h
 create mode 100644 lib/riscv/asm/sbi.h
 create mode 100644 lib/riscv/asm/setup.h
 create mode 100644 lib/riscv/asm/smp.h
 create mode 100644 lib/riscv/asm/spinlock.h
 create mode 100644 lib/riscv/asm/stack.h
 create mode 100644 lib/riscv/bitops.c
 create mode 100644 lib/riscv/io.c
 create mode 100644 lib/riscv/isa.c
 create mode 100644 lib/riscv/mmu.c
 create mode 100644 lib/riscv/processor.c
 create mode 100644 lib/riscv/sbi.c
 create mode 100644 lib/riscv/setup.c
 create mode 100644 lib/riscv/smp.c
 create mode 100644 lib/riscv/stack.c
 create mode 100644 riscv/Makefile
 create mode 100644 riscv/cstart.S
 create mode 100644 riscv/flat.lds
 create mode 100755 riscv/run
 create mode 100644 riscv/sbi.c
 create mode 100644 riscv/selftest.c
 create mode 120000 riscv/sieve.c
 create mode 100644 riscv/unittests.cfg

-- 
2.43.0



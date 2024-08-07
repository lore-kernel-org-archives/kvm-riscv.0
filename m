From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed,  7 Aug 2024 17:16:30 +0200
Subject: [kvm-unit-tests PATCH 0/3] riscv: 32-bit should use phys_addr_t
Message-ID: <20240807151629.144168-5-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We don't really expect to test 32-bit RISC-V with physical addresses
larger than 32 bits (at least not any time too soon), but the spec
says 32-bit RISC-V can have up to 34-bit wide physical addresses and the
SBI testing wants to pretend like there's a chance the high words may be
nonzero (since SBI calls require high words as parameters). This series
ensures we use phys_addr_t where it makes sense to do so. The first couple
patches are fixes for issues found while preparing the third.

Thanks,
drew

Andrew Jones (3):
  riscv: Fix virt_to_phys again
  riscv: setup: Apply VA_BASE check to rv64
  riscv: Support up to 34-bit physical addresses on rv32, sort of

 lib/riscv/asm/io.h |  4 ++--
 lib/riscv/mmu.c    | 32 ++++++++++++++++++++------------
 lib/riscv/setup.c  |  2 +-
 lib/riscv/smp.c    |  7 ++++++-
 4 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.45.2



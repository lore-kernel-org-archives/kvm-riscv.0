From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 13 Dec 2023 21:29:57 +0100
Subject: [PATCH v2 0/4] riscv: Use READ_ONCE()/WRITE_ONCE() for pte accesses
Message-ID: <20231213203001.179237-1-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series is a follow-up for riscv of a recent series from Ryan [1] which
converts all direct dereferences of pte_t into a ptet_get() access.

The goal here for riscv is to use READ_ONCE()/WRITE_ONCE() for all page
table entries accesses to avoid any compiler transformation when the
hardware can concurrently modify the page tables entries (A/D bits for
example).

I went a bit further and added pud/p4d/pgd_get() helpers as such concurrent
modifications can happen too at those levels.

[1] https://lore.kernel.org/all/20230612151545.3317766-1-ryan.roberts at arm.com/

Changes in v2:
- Fix the kernel test report on arm32
- Remove the pte suffix patch
- Fix pud_offset/p4d_offset which were missing the use of accessors
- Rebase on top of 6.7-rc4

Alexandre Ghiti (4):
  riscv: Use WRITE_ONCE() when setting page table entries
  mm: Introduce pudp/p4dp/pgdp_get() functions
  riscv: mm: Only compile pgtable.c if MMU
  riscv: Use accessors to page table entries instead of direct
    dereference

 arch/arm/include/asm/pgtable.h      |  2 ++
 arch/riscv/include/asm/kfence.h     |  4 +--
 arch/riscv/include/asm/pgtable-64.h | 22 +++----------
 arch/riscv/include/asm/pgtable.h    | 33 +++++--------------
 arch/riscv/kernel/efi.c             |  2 +-
 arch/riscv/kvm/mmu.c                | 22 ++++++-------
 arch/riscv/mm/Makefile              |  3 +-
 arch/riscv/mm/fault.c               | 16 ++++-----
 arch/riscv/mm/hugetlbpage.c         | 12 +++----
 arch/riscv/mm/kasan_init.c          | 45 +++++++++++++------------
 arch/riscv/mm/pageattr.c            | 44 ++++++++++++-------------
 arch/riscv/mm/pgtable.c             | 51 ++++++++++++++++++++++++++---
 include/linux/pgtable.h             | 21 ++++++++++++
 13 files changed, 157 insertions(+), 120 deletions(-)

-- 
2.39.2



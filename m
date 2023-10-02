From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon,  2 Oct 2023 17:10:26 +0200
Subject: [PATCH 0/5] riscv: Use READ_ONCE()/WRITE_ONCE() for pte accesses
Message-ID: <20231002151031.110551-1-alexghiti@rivosinc.com>
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

Alexandre Ghiti (5):
  riscv: Use WRITE_ONCE() when setting page table entries
  mm: Introduce pudp/p4dp/pgdp_get() functions
  riscv: mm: Only compile pgtable.c if MMU
  riscv: Suffix all page table entry pointers with 'p'
  riscv: Use accessors to page table entries instead of direct
    dereference

 arch/riscv/include/asm/kfence.h     |   6 +-
 arch/riscv/include/asm/kvm_host.h   |   2 +-
 arch/riscv/include/asm/pgalloc.h    |  86 ++++++++++----------
 arch/riscv/include/asm/pgtable-64.h |  26 +++---
 arch/riscv/include/asm/pgtable.h    |  33 ++------
 arch/riscv/kernel/efi.c             |   2 +-
 arch/riscv/kvm/mmu.c                |  44 +++++-----
 arch/riscv/mm/Makefile              |   3 +-
 arch/riscv/mm/fault.c               |  38 ++++-----
 arch/riscv/mm/hugetlbpage.c         |  80 +++++++++----------
 arch/riscv/mm/init.c                |  30 +++----
 arch/riscv/mm/kasan_init.c          | 119 ++++++++++++++--------------
 arch/riscv/mm/pageattr.c            |  74 +++++++++--------
 arch/riscv/mm/pgtable.c             |  71 +++++++++++------
 include/linux/pgtable.h             |  21 +++++
 15 files changed, 334 insertions(+), 301 deletions(-)

-- 
2.39.2



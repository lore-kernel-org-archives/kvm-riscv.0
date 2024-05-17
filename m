From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 17 May 2024 15:40:01 +0200
Subject: [kvm-unit-tests PATCH v1 0/4] riscv: add SBI SSE extension tests
Message-ID: <20240517134007.928539-1-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds an individual test for SBI SSE extension as well as
needed infrastructure for SSE support.

Cl?ment L?ger (4):
  riscv: move REG_L/REG_W in a dedicated asm.h file
  riscv: add SBI SSE extension definitions
  riscv: add SSE assembly entry handling
  riscv: add SBI SSE extension tests

 riscv/Makefile          |   2 +
 lib/riscv/asm/asm.h     |  19 +
 lib/riscv/asm/csr.h     |   2 +
 lib/riscv/asm/sbi.h     |  76 ++++
 lib/riscv/asm/sse.h     |  16 +
 lib/riscv/sse_entry.S   | 100 ++++
 lib/riscv/asm-offsets.c |   9 +
 riscv/cstart.S          |  14 +-
 riscv/sbi_sse.c         | 983 ++++++++++++++++++++++++++++++++++++++++
 riscv/unittests.cfg     |   4 +
 10 files changed, 1212 insertions(+), 13 deletions(-)
 create mode 100644 lib/riscv/asm/asm.h
 create mode 100644 lib/riscv/asm/sse.h
 create mode 100644 lib/riscv/sse_entry.S
 create mode 100644 riscv/sbi_sse.c

-- 
2.43.0



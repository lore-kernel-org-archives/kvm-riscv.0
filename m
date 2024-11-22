From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 22 Nov 2024 15:04:54 +0100
Subject: [kvm-unit-tests PATCH v2 0/3] riscv: add SBI SSE extension tests
Message-ID: <20241122140459.566306-1-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds an individual test for SBI SSE extension as well as
needed infrastructure for SSE support.

---

V2:
 - Rebased on origin/master and integrate it into sbi.c tests

Cl?ment L?ger (3):
  riscv: lib: Add SBI SSE extension definitions
  riscv: lib: Add SSE assembly entry handling
  riscv: sbi: Add SSE extension tests

 riscv/Makefile          |   2 +
 lib/riscv/asm/csr.h     |   2 +
 lib/riscv/asm/sbi.h     |  76 ++++
 lib/riscv/asm/sse.h     |  16 +
 lib/riscv/sse-entry.S   | 100 ++++
 lib/riscv/asm-offsets.c |   9 +
 riscv/sbi-tests.h       |   4 +
 riscv/sbi-sse.c         | 981 ++++++++++++++++++++++++++++++++++++++++
 riscv/sbi.c             |   1 +
 riscv/unittests.cfg     |   4 +
 10 files changed, 1195 insertions(+)
 create mode 100644 lib/riscv/asm/sse.h
 create mode 100644 lib/riscv/sse-entry.S
 create mode 100644 riscv/sbi-sse.c

-- 
2.45.2



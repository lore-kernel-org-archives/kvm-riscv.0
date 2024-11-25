From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 25 Nov 2024 12:54:44 +0100
Subject: [kvm-unit-tests PATCH v3 0/4] riscv: add SBI SSE extension tests
Message-ID: <20241125115452.1255745-1-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds an individual test for SBI SSE extension as well as
needed infrastructure for SSE support.

---

V3:
 - Add -deps variable for test specific dependencies
 - Fix formatting errors/typo in sbi.h
 - Add missing double trap event
 - Alphabetize sbi-sse.c includes
 - Fix a6 content after unmasking event
 - Add SSE HART_MASK/UNMASK test
 - Use mv instead of move
 - move sbi_check_sse() definition in sbi.c
 - Remove sbi_sse test from unitests.cfg

V2:
 - Rebased on origin/master and integrate it into sbi.c tests

Cl?ment L?ger (4):
  riscv: Add "-deps" handling for tests
  riscv: lib: Add SBI SSE extension definitions
  riscv: lib: Add SSE assembly entry handling
  riscv: sbi: Add SSE extension tests

 riscv/Makefile          |    9 +-
 lib/riscv/asm/csr.h     |    2 +
 lib/riscv/asm/sbi.h     |   83 ++++
 lib/riscv/asm/sse.h     |   16 +
 lib/riscv/sse-entry.S   |  100 ++++
 lib/riscv/asm-offsets.c |    9 +
 riscv/sbi-sse.c         | 1043 +++++++++++++++++++++++++++++++++++++++
 riscv/sbi.c             |    3 +
 8 files changed, 1262 insertions(+), 3 deletions(-)
 create mode 100644 lib/riscv/asm/sse.h
 create mode 100644 lib/riscv/sse-entry.S
 create mode 100644 riscv/sbi-sse.c

-- 
2.45.2



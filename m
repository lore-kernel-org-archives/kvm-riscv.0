From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 25 Nov 2024 17:21:49 +0100
Subject: [kvm-unit-tests PATCH v4 0/5] riscv: add SBI SSE extension tests
Message-ID: <20241125162200.1630845-1-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds an individual test for SBI SSE extension as well as
needed infrastructure for SSE support. It also adds test specific
asm-offsets generation to use custom OFFSET and DEFINE from the test
directory.

---

V4:
 - Fix typo sbi_ext_ss_fid -> sbi_ext_sse_fid
 - Add proper asm-offset generation for tests
 - Move SSE specific file from lib/riscv to riscv/

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

Cl?ment L?ger (5):
  kbuild: allow multiple asm-offsets file to be generated
  riscv: use asm-offsets to generate SBI_EXT_HSM values
  riscv: Add "-deps" handling for tests
  riscv: lib: Add SBI SSE extension definitions
  riscv: sbi: Add SSE extension tests

 scripts/asm-offsets.mak  |   22 +-
 riscv/Makefile           |   10 +-
 lib/riscv/asm/csr.h      |    2 +
 lib/riscv/asm/sbi.h      |   83 +++
 riscv/sbi-tests.h        |   12 +
 riscv/sbi-asm.S          |   96 +++-
 riscv/asm-offsets-test.c |   19 +
 riscv/sbi-sse.c          | 1043 ++++++++++++++++++++++++++++++++++++++
 riscv/sbi.c              |    3 +
 riscv/.gitignore         |    1 +
 10 files changed, 1278 insertions(+), 13 deletions(-)
 create mode 100644 riscv/asm-offsets-test.c
 create mode 100644 riscv/sbi-sse.c
 create mode 100644 riscv/.gitignore

-- 
2.45.2



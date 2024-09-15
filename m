From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Mon, 16 Sep 2024 02:34:56 +0800
Subject: [kvm-unit-tests PATCH v4 0/3] riscv: sbi: Add support to test HSM extension
Message-ID: <20240915183459.52476-1-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for testing all 4 functions of the HSM
extension as defined in the RISC-V SBI specification. The first 2
patches adds some helper routines to prepare for the HSM test, while
the third patch adds the actual test for the HSM extension.

v4:
- Addressed all of Andrew's comments.
- Included the 2 patches from Andrew's branch that refactored some
  functions.
- Added timers to all of the waiting activities in the HSM tests.

v3:
- Addressed all of Andrew's comments.
- Split the report_prefix_pop patch into its own series.
- Added a new environment variable to specify the maximum number of
  CPUs supported by the SBI implementation.

v2:
- Addressed all of Andrew's comments.
- Added a new patch to add helper routines to clear multiple prefixes.
- Reworked the approach to test the HSM extension by using cpumask and
  on-cpus.

Andrew Jones (1):
  riscv: Rewrite hartid_to_cpu in assembly

James Raphael Tiovalen (2):
  riscv: sbi: Provide entry point for HSM tests
  riscv: sbi: Add tests for HSM extension

 riscv/Makefile          |   3 +-
 lib/riscv/asm-offsets.c |   5 +
 lib/riscv/setup.c       |  10 -
 riscv/sbi-tests.h       |  10 +
 riscv/sbi.h             |  10 +
 riscv/cstart.S          |  23 ++
 riscv/sbi-asm.S         |  71 +++++
 riscv/sbi.c             | 566 ++++++++++++++++++++++++++++++++++++++++
 8 files changed, 687 insertions(+), 11 deletions(-)
 create mode 100644 riscv/sbi-tests.h
 create mode 100644 riscv/sbi.h
 create mode 100644 riscv/sbi-asm.S

--
2.43.0



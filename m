From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Sat, 21 Sep 2024 18:08:18 +0800
Subject: [kvm-unit-tests PATCH v5 0/5] riscv: sbi: Add support to test HSM extension
Message-ID: <20240921100824.151761-1-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for testing all 4 functions of the HSM
extension as defined in the RISC-V SBI specification. The first 4
patches add some helper routines to prepare for the HSM test, while
the last patch adds the actual test for the HSM extension.

v5:
- Addressed all of Andrew's comments.
- Added 2 new patches to clear on_cpu_info[cpu].func and to set the
  cpu_started mask, which are used to perform cleanup after running the
  HSM tests.
- Added some new tests to validate suspension on RV64 with the high
  bits set for suspend_type.
- Picked up the hartid_to_cpu rewrite patch from Andrew's branch.
- Moved the variables declared in riscv/sbi.c in patch 2 to group it
  together with the other HSM test variables declared in patch 5.

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

James Raphael Tiovalen (4):
  riscv: sbi: Provide entry point for HSM tests
  lib/on-cpus: Add helper method to clear the function from on_cpu_info
  riscv: Add helper method to set cpu started mask
  riscv: sbi: Add tests for HSM extension

 riscv/Makefile          |   3 +-
 lib/riscv/asm/smp.h     |   2 +
 lib/on-cpus.h           |   1 +
 lib/on-cpus.c           |  11 +
 lib/riscv/asm-offsets.c |   5 +
 lib/riscv/setup.c       |  10 -
 lib/riscv/smp.c         |   8 +
 riscv/sbi-tests.h       |  10 +
 riscv/cstart.S          |  24 ++
 riscv/sbi-asm.S         |  71 +++++
 riscv/sbi.c             | 651 ++++++++++++++++++++++++++++++++++++++++
 11 files changed, 785 insertions(+), 11 deletions(-)
 create mode 100644 riscv/sbi-tests.h
 create mode 100644 riscv/sbi-asm.S

--
2.43.0



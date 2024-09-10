From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Tue, 10 Sep 2024 23:15:34 +0800
Subject: [kvm-unit-tests PATCH v3 0/2] riscv: sbi: Add support to test HSM extension
Message-ID: <20240910151536.163830-1-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for testing all 4 functions of the HSM
extension as defined in the RISC-V SBI specification. The first patch
adds some helper routines to prepare for the HSM test, while the
second patch adds the actual test for the HSM extension.

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

James Raphael Tiovalen (2):
  riscv: sbi: Add HSM extension functions
  riscv: sbi: Add tests for HSM extension

 riscv/Makefile      |   3 +-
 lib/riscv/asm/sbi.h |  17 +++
 lib/riscv/sbi.c     |  10 ++
 riscv/sbi.h         |  10 ++
 riscv/sbi-asm.S     |  47 ++++++
 riscv/sbi.c         | 357 ++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 443 insertions(+), 1 deletion(-)
 create mode 100644 riscv/sbi.h
 create mode 100644 riscv/sbi-asm.S

--
2.43.0



From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Mon, 26 Aug 2024 01:08:20 +0800
Subject: [kvm-unit-tests PATCH v2 0/4] riscv: sbi: Add support to test HSM extension
Message-ID: <20240825170824.107467-1-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for testing all 4 functions of the HSM
extension as defined in the RISC-V SBI specification. The first 3
patches add some helper routines to prepare for the HSM test, while the
last patch adds the actual test for the HSM extension.

James Raphael Tiovalen (4):
  lib/report: Add helper methods to clear multiple prefixes
  riscv: sbi: Add IPI extension support
  riscv: sbi: Add HSM extension functions
  riscv: sbi: Add tests for HSM extension

 riscv/Makefile      |   7 +-
 lib/riscv/asm/sbi.h |  23 +++
 lib/libcflat.h      |   2 +
 lib/report.c        |  13 ++
 lib/riscv/sbi.c     |  15 ++
 riscv/sbi-asm.S     |  79 +++++++++
 riscv/sbi.c         | 387 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 523 insertions(+), 3 deletions(-)
 create mode 100644 riscv/sbi-asm.S

--
2.43.0



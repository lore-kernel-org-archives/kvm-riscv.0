From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Sun,  7 Jul 2024 18:10:49 +0800
Subject: [kvm-unit-tests PATCH v2 0/3] riscv: sbi: Add support to test timer extension
Message-ID: <20240707101053.74386-1-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for testing the timer extension as
defined in the RISC-V SBI specification. The first 2 patches add
infrastructural support for handling interrupts, while the last patch
adds the actual test for the timer extension.

v2:
- Addressed all of the previous comments from Andrew.
- Updated the test to get the timer frequency value from the device tree
  and allow the test parameters to be specified in microseconds instead of
  cycles.

Andrew Jones (1):
  riscv: Extend exception handling support for interrupts

James Raphael Tiovalen (2):
  riscv: Update exception cause list
  riscv: sbi: Add test for timer extension

 lib/riscv/asm/csr.h       |  23 +++++++++
 lib/riscv/asm/processor.h |  15 +++++-
 lib/riscv/asm/sbi.h       |   5 ++
 lib/riscv/asm/setup.h     |   1 +
 lib/riscv/asm/timer.h     |  30 +++++++++++
 lib/riscv/processor.c     |  32 ++++++++++--
 lib/riscv/setup.c         |  24 +++++++++
 riscv/sbi.c               | 106 ++++++++++++++++++++++++++++++++++++++
 8 files changed, 231 insertions(+), 5 deletions(-)
 create mode 100644 lib/riscv/asm/timer.h

--
2.43.0



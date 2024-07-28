From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Mon, 29 Jul 2024 00:50:17 +0800
Subject: [kvm-unit-tests PATCH v5 0/5] riscv: sbi: Add support to test timer extension
Message-ID: <20240728165022.30075-1-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for testing the timer extension as
defined in the RISC-V SBI specification. The first 2 patches add
infrastructural support for handling interrupts, the next 2 patches add
some helper routines that can be used by SBI extension tests, while the
last patch adds the actual test for the timer extension.

v5:
- Addressed all of Andrew's comments on v4.
- Updated the test to check if `sip.STIP` is cleared for both cases of
  setting the timer to -1 and masking the timer irq as per the spec.
- Updated the test to check if `sie.STIE` is writable for the mask irq
  test.

v4:
- Addressed all of Andrew's comments on v3.

v3:
- Addressed all of Andrew's comments on v2.
- Added 2 new patches to add sbi_probe and the delay and timer routines.

v2:
- Addressed all of the previous comments from Andrew.
- Updated the test to get the timer frequency value from the device tree
  and allow the test parameters to be specified in microseconds instead of
  cycles.

Andrew Jones (1):
  riscv: Extend exception handling support for interrupts

James Raphael Tiovalen (4):
  riscv: Update exception cause list
  riscv: Add method to probe for SBI extensions
  riscv: Add some delay and timer routines
  riscv: sbi: Add test for timer extension

 riscv/Makefile            |   2 +
 lib/riscv/asm/csr.h       |  21 ++++++
 lib/riscv/asm/delay.h     |  16 +++++
 lib/riscv/asm/processor.h |  15 +++-
 lib/riscv/asm/sbi.h       |   6 ++
 lib/riscv/asm/setup.h     |   1 +
 lib/riscv/asm/timer.h     |  24 +++++++
 lib/riscv/delay.c         |  21 ++++++
 lib/riscv/processor.c     |  27 +++++--
 lib/riscv/sbi.c           |  13 ++++
 lib/riscv/setup.c         |   4 ++
 lib/riscv/timer.c         |  28 ++++++++
 riscv/sbi.c               | 144 ++++++++++++++++++++++++++++++++++++++
 13 files changed, 317 insertions(+), 5 deletions(-)
 create mode 100644 lib/riscv/asm/delay.h
 create mode 100644 lib/riscv/asm/timer.h
 create mode 100644 lib/riscv/delay.c
 create mode 100644 lib/riscv/timer.c

--
2.43.0



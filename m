From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Wed, 19 Jun 2024 01:30:49 +0800
Subject: [kvm-unit-tests PATCH 0/4] riscv: sbi: Add support to test timer extension
Message-ID: <20240618173053.364776-1-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for testing the timer extension as
defined in the RISC-V SBI specification. The first 3 patches add
infrastructural support for handling interrupts, while the last patch
adds the actual test for the timer extension.

James Raphael Tiovalen (4):
  riscv: Extend exception handling support for interrupts
  riscv: Update exception cause list
  riscv: Add methods to toggle interrupt enable bits
  riscv: sbi: Add test for timer extension

 riscv/Makefile            |  1 +
 lib/riscv/asm/csr.h       | 30 +++++++++++---
 lib/riscv/asm/interrupt.h | 12 ++++++
 lib/riscv/asm/processor.h | 15 ++++++-
 lib/riscv/asm/sbi.h       |  5 +++
 lib/riscv/interrupt.c     | 39 ++++++++++++++++++
 lib/riscv/processor.c     | 27 ++++++++++--
 riscv/sbi.c               | 87 +++++++++++++++++++++++++++++++++++++++
 8 files changed, 205 insertions(+), 11 deletions(-)
 create mode 100644 lib/riscv/asm/interrupt.h
 create mode 100644 lib/riscv/interrupt.c

--
2.43.0



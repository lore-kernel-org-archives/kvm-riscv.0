From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 24 Oct 2024 14:41:02 +0200
Subject: [kvm-unit-tests PATCH 0/3] riscv: sbi: Add SUSP tests
Message-ID: <20241024124101.73405-5-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add tests for the SBI SUSP extension.

Based-on: https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Andrew Jones (3):
  riscv: Implement setjmp/longjmp
  riscv: sbi: Clean up env checking
  riscv: sbi: Add SUSP tests

 lib/riscv/asm/asm.h |   3 +
 lib/riscv/asm/sbi.h |   1 +
 lib/riscv/setjmp.S  |  50 +++++++
 lib/setjmp.h        |   4 +
 riscv/Makefile      |   1 +
 riscv/sbi-asm.S     |  55 ++++++++
 riscv/sbi-tests.h   |  19 +++
 riscv/sbi.c         | 308 ++++++++++++++++++++++++++++++++++++++++----
 8 files changed, 417 insertions(+), 24 deletions(-)
 create mode 100644 lib/riscv/setjmp.S

-- 
2.47.0



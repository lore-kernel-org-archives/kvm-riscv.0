From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Aug 2024 18:22:01 +0200
Subject: [kvm-unit-tests PATCH 0/3] riscv: Timer support
Message-ID: <20240828162200.1384696-5-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We already have some timer / delay support but we leave a lot to
the unit test authors for deciding what timer to use (SBI vs. Sstc)
and setting it. Provide an API that prefers Sstc and falls back to
SBI.

This found a bug in QEMU's Sstc that I'll try to find time to fix.
If we start a timer with a long delay and then stop it before it has
expired, QEMU still delivers the interrupt. The only way to avoid
getting it on QEMU is to disable the timer irq. The BPI, which also
has Sstc, behaves as expected though, i.e. even with the timer irq
always enabled we won't get a timer irq if we stop it before it had
a chance to expire. Disabling Sstc on QEMU, which falls back to SBI
TIME, also behaves as expected.

Andrew Jones (3):
  riscv: Introduce local_timer_init
  riscv: Share sbi_time_ecall with framework
  riscv: Provide timer_start and timer_stop

 lib/riscv/asm/sbi.h   |  1 +
 lib/riscv/asm/timer.h |  3 +++
 lib/riscv/sbi.c       |  5 +++++
 lib/riscv/setup.c     |  2 ++
 lib/riscv/smp.c       |  2 ++
 lib/riscv/timer.c     | 46 +++++++++++++++++++++++++++++++++++++++++++
 riscv/sbi.c           | 18 ++++-------------
 7 files changed, 63 insertions(+), 14 deletions(-)

-- 
2.45.2



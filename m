From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 21 Jun 2024 17:32:21 +0800
Subject: [RFC v2 0/2] riscv: Idle thread using Zawrs extension
Message-ID: <20240621093223.37893-1-luxu.kernel@bytedance.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is the second version of idle thread based on Zawrs extension. We
rebased our code on Andrew's patch series[1] which provides basic
support for Zawrs as well as optimization for spinlock.

This patch series introduces a new implementation of idle thread using
Zawrs extension.

The Zawrs[0] extension introduces two new instructions named WRS.STO and
WRS.NTO in RISC-V. When software registers a reservation set using LR
instruction, a subsequent WRS.STO or WRS.NTO instruction will cause the
hart to stall in a low-power state until a store happens to the
reservation set or an interrupt becomes pending. The difference between
these two instructions is that WRS.STO will terminate stall after an
implementation-defined timeout while WRS.NTO won't.

This patch series implements idle thread using WRS.NTO instruction.
Besides, we found there is no need to send a real IPI to wake up an idle
CPU. Instead, we write IPI information to the reservation set of an idle
CPU to wake it up and let it handle IPI quickly, without going through
tranditional interrupt handling routine.

[0] https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
[1] https://github.com/jones-drew/linux/commits/riscv/zawrs-v3

Xu Lu (2):
  riscv: process: Introduce idle thread using Zawrs extension
  riscv: Use Zawrs to accelerate IPI to idle cpu

 arch/riscv/Kconfig                 |  10 +++
 arch/riscv/include/asm/cpuidle.h   |  11 +---
 arch/riscv/include/asm/processor.h |  32 +++++++++
 arch/riscv/include/asm/smp.h       |  14 ++++
 arch/riscv/kernel/cpu.c            |   5 ++
 arch/riscv/kernel/process.c        | 102 ++++++++++++++++++++++++++++-
 arch/riscv/kernel/smp.c            |  39 +++++++----
 7 files changed, 190 insertions(+), 23 deletions(-)

-- 
2.20.1



From: Jisheng Zhang <jszhang@kernel.org>
Date: Thu,  1 Sep 2022 01:59:15 +0800
Subject: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Message-ID: <20220831175920.2806-1-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series is to add PREEMPT_RT support to riscv:
patch1 adds the missing number of signal exits in vCPU stat
patch2 switches to the generic guest entry infrastructure
patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
RT
patch4 adds lazy preempt support
patch5 allows to enable PREEMPT_RT

I assume patch1, patch2 and patch3 can be reviewed and merged for
riscv-next, patch4 and patch5 can be reviewed and maintained in rt tree,
and finally merged once the remaining patches in rt tree are all
mainlined.

Since v1:
  - send to related maillist, I press ENTER too quickly when sending v1
  - remove the signal_pending() handling because that's covered by
    generic guest entry infrastructure

Jisheng Zhang (5):
  RISC-V: KVM: Record number of signal exits as a vCPU stat
  RISC-V: KVM: Use generic guest entry infrastructure
  riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
  riscv: add lazy preempt support
  riscv: Allow to enable RT

 arch/riscv/Kconfig                   |  3 +++
 arch/riscv/include/asm/kvm_host.h    |  1 +
 arch/riscv/include/asm/thread_info.h |  7 +++++--
 arch/riscv/kernel/asm-offsets.c      |  1 +
 arch/riscv/kernel/entry.S            |  9 +++++++--
 arch/riscv/kvm/Kconfig               |  1 +
 arch/riscv/kvm/vcpu.c                | 18 +++++++-----------
 7 files changed, 25 insertions(+), 15 deletions(-)

-- 
2.34.1



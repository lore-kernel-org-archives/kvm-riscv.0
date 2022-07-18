From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 18 Jul 2022 10:01:56 -0700
Subject: [RFC  0/9] KVM perf support 
Message-ID: <20220718170205.2972215-1-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series extends perf support for KVM. The KVM implementation relies
on the SBI PMU extension and trap n emulation of hpmcounter CSRs.
The KVM implementation exposes the virtual counters to the guest and internally
manage the counters using kernel perf counters. 

This series doesn't support the counter overflow as the Sscofpmf extension
doesn't allow trap & emulation mechanism of scountovf CSR yet. The required
changes to allow that are being under discussions. Supporting overflow interrupt
also requires AIA support which is not frozen either.

This series can be found at github[1] as well. It depends Anup's CSR emulation
framework[1] series.

perf stat works in kvm guests with this series. 

Here is example of running perf stat in a guest running in KVM.
===========================================================================
/ # /host/apps/perf stat -e instructions -e cycles -e r8000000000000005 \
> -e r8000000000000006 -e r8000000000000007 -e r8000000000000008 \
> -e r800000000000000a perf bench sched messaging -g 5 -l 15
# Running 'sched/messaging' benchmark:
# 20 sender and receiver processes per group
# 5 groups == 200 processes run

     Total time: 5.210 [sec] 

 Performance counter stats for 'perf bench sched messaging -g 5 -l 15':

       37209585734      instructions              #    1.00  insn per cycle
       37177435570      cycles 
              2740      r8000000000000005
              3727      r8000000000000006
              3655      r8000000000000007
                10      r8000000000000008
                 0      r800000000000000a

       5.863014800 seconds time elapsed

       0.569373000 seconds user
      10.771533000 seconds sys 

[1] https://github.com/atishp04/linux/tree/kvm_perf_rfc
[2] https://lkml.org/lkml/2022/6/15/389

Atish Patra (9):
RISC-V: Define a helper function to probe number of hardware counters
RISC-V: Define a helper function to return counter width
RISC-V: KVM: Define a probe function for SBI extension data structures
RISC-V: KVM: Improve privilege mode filtering for perf
RISC-V: KVM: Add skeleton support for perf
RISC-V: KVM: Add SBI PMU extension support
RISC-V: KVM: Implement trap & emulate for hpmcounters
RISC-V: KVM: Implement perf support
RISC-V: KVM: Implement firmware events

arch/riscv/include/asm/kvm_host.h     |   3 +
arch/riscv/include/asm/kvm_vcpu_pmu.h | 102 +++++
arch/riscv/include/asm/kvm_vcpu_sbi.h |   3 +
arch/riscv/include/asm/sbi.h          |   2 +-
arch/riscv/kvm/Makefile               |   1 +
arch/riscv/kvm/main.c                 |   3 +-
arch/riscv/kvm/tlb.c                  |   6 +-
arch/riscv/kvm/vcpu.c                 |   5 +
arch/riscv/kvm/vcpu_insn.c            |   4 +-
arch/riscv/kvm/vcpu_pmu.c             | 517 ++++++++++++++++++++++++++
arch/riscv/kvm/vcpu_sbi.c             |  11 +
arch/riscv/kvm/vcpu_sbi_base.c        |  13 +-
arch/riscv/kvm/vcpu_sbi_pmu.c         |  81 ++++
arch/riscv/kvm/vcpu_sbi_replace.c     |   7 +
drivers/perf/riscv_pmu_sbi.c          |  75 +++-
include/linux/perf/riscv_pmu.h        |   7 +
16 files changed, 823 insertions(+), 17 deletions(-)
create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
create mode 100644 arch/riscv/kvm/vcpu_pmu.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c

--
2.25.1



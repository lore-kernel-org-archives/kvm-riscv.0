From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 28 Feb 2024 17:01:15 -0800
Subject: [PATCH v4 00/15] RISC-V SBI v2.0 PMU improvements and Perf sampling in KVM guest
Message-ID: <20240229010130.1380926-1-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series implements SBI PMU improvements done in SBI v2.0[1] i.e. PMU snapshot
and fw_read_hi() functions. 

SBI v2.0 introduced PMU snapshot feature which allows the SBI implementation
to provide counter information (i.e. values/overflow status) via a shared
memory between the SBI implementation and supervisor OS. This allows to minimize
the number of traps in when perf being used inside a kvm guest as it relies on
SBI PMU + trap/emulation of the counters. 

The current set of ratified RISC-V specification also doesn't allow scountovf
to be trap/emulated by the hypervisor. The SBI PMU snapshot bridges the gap
in ISA as well and enables perf sampling in the guest. However, LCOFI in the
guest only works via IRQ filtering in AIA specification. That's why, AIA
has to be enabled in the hardware (at least the Ssaia extension) in order to
use the sampling support in the perf. 

Here are the patch wise implementation details.

PATCH 1,6,7 : Generic cleanups/improvements.
PATCH 2,3,10 : FW_READ_HI function implementation
PATCH 4-5: Add PMU snapshot feature in sbi pmu driver
PATCH 6-7: KVM implementation for snapshot and sampling in kvm guests
PATCH 11-15: KVM selftests for SBI PMU extension

The series is based on kvm-next and is available at:

https://github.com/atishp04/linux/tree/kvm_pmu_snapshot_v4

The series is based on kvm-riscv/queue branch + fixes suggested on the following
series
https://patchwork.kernel.org/project/kvm/cover/cover.1705916069.git.haibo1.xu at intel.com/

The kvmtool patch is also available at:
https://github.com/atishp04/kvmtool/tree/sscofpmf

It also requires Ssaia ISA extension to be present in the hardware in order to
get perf sampling support in the guest. In Qemu virt machine, it can be done
by the following config.

```
-cpu rv64,sscofpmf=true,x-ssaia=true
```

There is no other dependencies on AIA apart from that. Thus, Ssaia must be disabled
for the guest if AIA patches are not available. Here is the example command.

```
./lkvm-static run -m 256 -c2 --console serial -p "console=ttyS0 earlycon" --disable-ssaia -k ./Image --debug 
```

The series has been tested only in Qemu.
Here is the snippet of the perf running inside a kvm guest.

===================================================
$ perf record -e cycles -e instructions perf bench sched messaging -g 5
...
$ Running 'sched/messaging' benchmark:
...
[   45.928723] perf_duration_warn: 2 callbacks suppressed
[   45.929000] perf: interrupt took too long (484426 > 483186), lowering kernel.perf_event_max_sample_rate to 250
$ 20 sender and receiver processes per group
$ 5 groups == 200 processes run

     Total time: 14.220 [sec]
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.117 MB perf.data (1942 samples) ]
$ perf report --stdio
$ To display the perf.data header info, please use --header/--header-only optio>
$
$
$ Total Lost Samples: 0
$
$ Samples: 943  of event 'cycles'
$ Event count (approx.): 5128976844
$
$ Overhead  Command          Shared Object                Symbol               >
$ ........  ...............  ...........................  .....................>
$
     7.59%  sched-messaging  [kernel.kallsyms]            [k] memcpy
     5.48%  sched-messaging  [kernel.kallsyms]            [k] percpu_counter_ad>
     5.24%  sched-messaging  [kernel.kallsyms]            [k] __sbi_rfence_v02_>
     4.00%  sched-messaging  [kernel.kallsyms]            [k] _raw_spin_unlock_>
     3.79%  sched-messaging  [kernel.kallsyms]            [k] set_pte_range
     3.72%  sched-messaging  [kernel.kallsyms]            [k] next_uptodate_fol>
     3.46%  sched-messaging  [kernel.kallsyms]            [k] filemap_map_pages
     3.31%  sched-messaging  [kernel.kallsyms]            [k] handle_mm_fault
     3.20%  sched-messaging  [kernel.kallsyms]            [k] finish_task_switc>
     3.16%  sched-messaging  [kernel.kallsyms]            [k] clear_page
     3.03%  sched-messaging  [kernel.kallsyms]            [k] mtree_range_walk
     2.42%  sched-messaging  [kernel.kallsyms]            [k] flush_icache_pte

===================================================

[1] https://github.com/riscv-non-isa/riscv-sbi-doc

Changes from v3->v4:
1. Added selftests.
2. Fixed an issue to clear the interrupt pending bits.
3. Fixed the counter index in snapshot memory start function.

Changes from v2->v3:
1. Fixed a patchwork warning on patch6.
2. Fixed a comment formatting & nit fix in PATCH 3 & 5.
3. Moved the hvien update and sscofpmf enabling to PATCH 9 from PATCH 8.

Changes from v1->v2:
1. Fixed warning/errors from patchwork CI.
2. Rebased on top of kvm-next.
3. Added Acked-by tags.

Changes from RFC->v1:
1. Addressed all the comments on RFC series.
2. Removed PATCH2 and merged into later patches.
3. Added 2 more patches for minor fixes.
4. Fixed KVM boot issue without Ssaia and made sscofpmf in guest dependent on
   Ssaia in the host.

Atish Patra (15):
RISC-V: Fix the typo in Scountovf CSR name
RISC-V: Add FIRMWARE_READ_HI definition
drivers/perf: riscv: Read upper bits of a firmware counter
RISC-V: Add SBI PMU snapshot definitions
drivers/perf: riscv: Implement SBI PMU snapshot function
RISC-V: KVM: No need to update the counter value during reset
RISC-V: KVM: No need to exit to the user space if perf event failed
RISC-V: KVM: Implement SBI PMU Snapshot feature
RISC-V: KVM: Add perf sampling support for guests
RISC-V: KVM: Support 64 bit firmware counters on RV32
KVM: riscv: selftests: Add Sscofpmf to get-reg-list test
KVM: riscv: selftests: Add SBI PMU extension definitions
KVM: riscv: selftests: Add SBI PMU selftest
KVM: riscv: selftests: Add a test for PMU snapshot functionality
KVM: riscv: selftests: Add a test for counter overflow

arch/riscv/include/asm/csr.h                  |   5 +-
arch/riscv/include/asm/errata_list.h          |   2 +-
arch/riscv/include/asm/kvm_vcpu_pmu.h         |  14 +-
arch/riscv/include/asm/sbi.h                  |  12 +
arch/riscv/include/uapi/asm/kvm.h             |   1 +
arch/riscv/kvm/aia.c                          |   5 +
arch/riscv/kvm/vcpu.c                         |  14 +-
arch/riscv/kvm/vcpu_onereg.c                  |   9 +-
arch/riscv/kvm/vcpu_pmu.c                     | 247 +++++++-
arch/riscv/kvm/vcpu_sbi_pmu.c                 |  15 +-
drivers/perf/riscv_pmu.c                      |   1 +
drivers/perf/riscv_pmu_sbi.c                  | 229 ++++++-
include/linux/perf/riscv_pmu.h                |   6 +
tools/testing/selftests/kvm/Makefile          |   1 +
.../selftests/kvm/include/riscv/processor.h   |  92 +++
.../selftests/kvm/lib/riscv/processor.c       |  12 +
.../selftests/kvm/riscv/get-reg-list.c        |   4 +
tools/testing/selftests/kvm/riscv/sbi_pmu.c   | 588 ++++++++++++++++++
18 files changed, 1212 insertions(+), 45 deletions(-)
create mode 100644 tools/testing/selftests/kvm/riscv/sbi_pmu.c

--
2.34.1



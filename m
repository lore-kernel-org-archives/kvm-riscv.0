From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 7 Dec 2023 12:02:50 +0000
Subject: [RFC 0/9] RISC-V SBI v2.0 PMU improvements and Perf sampling in
 KVM guest
In-Reply-To: <20231205024310.1593100-1-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
Message-ID: <20231207-affiliate-state-c4a20ea7e8de@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Atish,

On Mon, Dec 04, 2023 at 06:43:01PM -0800, Atish Patra wrote:
> This series implements SBI PMU improvements done in SBI v2.0[1] i.e. PMU snapshot
> and fw_read_hi() functions. 

I don't see any commentary in this cover letter as to why the series is
an RFC. v2.0 is a frozen spec per the Releases tab on GitHub, so that
has ruled out the usual reason for spec related things being RFCs.

What is it about the series that you are not yet willing to stand over?

Cheers,
Conor.

> SBI v2.0 introduced PMU snapshot feature which allows the SBI implementation
> to provide counter information (i.e. values/overlfow status) via a shared
> memory between the SBI implementation and supervisor OS. This allows to minimize
> the number of traps in when perf being used inside a kvm guest as it relies on
> SBI PMU + trap/emulation of the counters. 
> 
> The current set of ratified RISC-V specification also doesn't allow scountovf
> to be trap/emulated by the hypervisor. The SBI PMU snapshot bridges the gap
> in ISA as well and enables perf sampling in the guest. However, LCOFI in the
> guest only works via IRQ filtering in AIA specification. That's why, AIA
> has to be enabled in the hardware (at least the Ssaia extension) in order to
> use the sampling support in the perf. 
> 
> Here are the patch wise implementation details.
> 
> PATCH 1-2 : Generic cleanups/improvements.
> PATCH 3,4,9 : FW_READ_HI function implementation
> PATCH 5-6: Add PMU snapshot feature in sbi pmu driver
> PATCH 7-8: KVM implementation for snapshot and sampling in kvm guests
> 
> The series is based on v6.70-rc3 and is available at:
> 
> https://github.com/atishp04/linux/tree/kvm_pmu_snapshot_v1
> 
> The kvmtool patch is also available at:
> https://github.com/atishp04/kvmtool/tree/sscofpmf
> 
> It also requires Ssaia ISA extension to be present in the hardware in order to
> get perf sampling support in the guest. In Qemu virt machine, it can be done
> by the following config.
> 
> ```
> -cpu rv64,sscofpmf=true,x-ssaia=true
> ```
> 
> There is no other dependancies on AIA apart from that. Thus, Ssaia must be disabled
> for the guest if AIA patches are not available. Here is the example command.
> 
> ```
> ./lkvm-static run -m 256 -c2 --console serial -p "console=ttyS0 earlycon" --disable-ssaia -k ./Image --debug 
> ```
> 
> The series has been tested only in Qemu.
> Here is the snippet of the perf running inside a kvm guest.
> 
> ===================================================
> # perf record -e cycles -e instructions perf bench sched messaging -g 5
> ...
> # Running 'sched/messaging' benchmark:
> ...
> [   45.928723] perf_duration_warn: 2 callbacks suppressed
> [   45.929000] perf: interrupt took too long (484426 > 483186), lowering kernel.perf_event_max_sample_rate to 250
> # 20 sender and receiver processes per group
> # 5 groups == 200 processes run
> 
>      Total time: 14.220 [sec]
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 0.117 MB perf.data (1942 samples) ]
> # perf report --stdio
> # To display the perf.data header info, please use --header/--header-only optio>
> #
> #
> # Total Lost Samples: 0
> #
> # Samples: 943  of event 'cycles'
> # Event count (approx.): 5128976844
> #
> # Overhead  Command          Shared Object                Symbol               >
> # ........  ...............  ...........................  .....................>
> #
>      7.59%  sched-messaging  [kernel.kallsyms]            [k] memcpy
>      5.48%  sched-messaging  [kernel.kallsyms]            [k] percpu_counter_ad>
>      5.24%  sched-messaging  [kernel.kallsyms]            [k] __sbi_rfence_v02_>
>      4.00%  sched-messaging  [kernel.kallsyms]            [k] _raw_spin_unlock_>
>      3.79%  sched-messaging  [kernel.kallsyms]            [k] set_pte_range
>      3.72%  sched-messaging  [kernel.kallsyms]            [k] next_uptodate_fol>
>      3.46%  sched-messaging  [kernel.kallsyms]            [k] filemap_map_pages
>      3.31%  sched-messaging  [kernel.kallsyms]            [k] handle_mm_fault
>      3.20%  sched-messaging  [kernel.kallsyms]            [k] finish_task_switc>
>      3.16%  sched-messaging  [kernel.kallsyms]            [k] clear_page
>      3.03%  sched-messaging  [kernel.kallsyms]            [k] mtree_range_walk
>      2.42%  sched-messaging  [kernel.kallsyms]            [k] flush_icache_pte
> 
> ===================================================
> 
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc
> 
> Atish Patra (9):
> RISC-V: Fix the typo in Scountovf CSR name
> drivers/perf: riscv: Add a flag to indicate SBI v2.0 support
> RISC-V: Add FIRMWARE_READ_HI definition
> drivers/perf: riscv: Read upper bits of a firmware counter
> RISC-V: Add SBI PMU snapshot definitions
> drivers/perf: riscv: Implement SBI PMU snapshot function
> RISC-V: KVM: Implement SBI PMU Snapshot feature
> RISC-V: KVM: Add perf sampling support for guests
> RISC-V: KVM: Support 64 bit firmware counters on RV32
> 
> arch/riscv/include/asm/csr.h          |   5 +-
> arch/riscv/include/asm/errata_list.h  |   2 +-
> arch/riscv/include/asm/kvm_vcpu_pmu.h |  16 +-
> arch/riscv/include/asm/sbi.h          |  11 ++
> arch/riscv/include/uapi/asm/kvm.h     |   1 +
> arch/riscv/kvm/main.c                 |   1 +
> arch/riscv/kvm/vcpu.c                 |   8 +-
> arch/riscv/kvm/vcpu_onereg.c          |   1 +
> arch/riscv/kvm/vcpu_pmu.c             | 232 ++++++++++++++++++++++++--
> arch/riscv/kvm/vcpu_sbi_pmu.c         |  10 ++
> drivers/perf/riscv_pmu.c              |   1 +
> drivers/perf/riscv_pmu_sbi.c          | 219 ++++++++++++++++++++++--
> include/linux/perf/riscv_pmu.h        |   6 +
> 13 files changed, 478 insertions(+), 35 deletions(-)
> 
> --
> 2.34.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20231207/dc933a66/attachment-0001.sig>

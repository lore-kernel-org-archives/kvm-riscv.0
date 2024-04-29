From: Shenlin Liang <liangshenlin@eswincomputing.com>
Date: Mon, 29 Apr 2024 14:13:22 +0800 (GMT+08:00)
Subject: [PATCH v3 0/2] perf kvm: Add kvm stat support on riscv
In-Reply-To: <20240422080833.8745-1-liangshenlin@eswincomputing.com>
References: <20240422080833.8745-1-liangshenlin@eswincomputing.com>
Message-ID: <5e830d33.45c7.18f287c8f73.Coremail.liangshenlin@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Gentle ping...

> 
> 'perf kvm stat report/record' generates a statistical analysis of KVM
> events and can be used to analyze guest exit reasons. This patch tries
> to add stat support on riscv.
> 
> Map the return value of trace_kvm_exit() to the specific cause of the 
> exception, and export it to userspace.
> 
> It records on two available KVM tracepoints for riscv: "kvm:kvm_entry"
> and "kvm:kvm_exit", and reports statistical data which includes events
> handles time, samples, and so on.
> 
> Cross compiling perf in X86 environment may encounter issues with missing
> libraries and tools. Suggest compiling nativly in RISC-V environment
> 
> Simple tests go below:
> 
> # ./perf kvm record -e "kvm:kvm_entry" -e "kvm:kvm_exit"
> Lowering default frequency rate from 4000 to 2500.
> Please consider tweaking /proc/sys/kernel/perf_event_max_sample_rate.
> [ perf record: Woken up 18 times to write data ]
> [ perf record: Captured and wrote 5.433 MB perf.data.guest (62519 samples) 
> 
> # ./perf kvm report
> 31K kvm:kvm_entry
> 31K kvm:kvm_exit
> 
> # ./perf kvm stat record -a
> [ perf record: Woken up 3 times to write data ]
> [ perf record: Captured and wrote 8.502 MB perf.data.guest (99338 samples) ]
> 
> # ./perf kvm stat report --event=vmexit
> Event name                Samples   Sample%    Time (ns)     Time%   Max Time (ns)   Min Time (ns)  Mean Time (ns)
> STORE_GUEST_PAGE_FAULT     26968     54.00%    2003031800    40.00%     3361400         27600          74274
> LOAD_GUEST_PAGE_FAULT      17645     35.00%    1153338100    23.00%     2513400         30800          65363
> VIRTUAL_INST_FAULT         1247      2.00%     340820800     6.00%      1190800         43300          273312
> INST_GUEST_PAGE_FAULT      1128      2.00%     340645800     6.00%      2123200         30200          301990
> SUPERVISOR_SYSCALL         1019      2.00%     245989900     4.00%      1851500         29300          241403
> LOAD_ACCESS                986       1.00%     671556200     13.00%     4180200         100700         681091
> INST_ACCESS                655       1.00%     170054800     3.00%      1808300         54600          259625
> HYPERVISOR_SYSCALL         21        0.00%     4276400       0.00%      716500          116000         203638 
> 
> Changes from v1->v2:
> - Rebased on Linux 6.9-rc3.
> 
> Changes from v2->v3:
> - Add the missing assignment for 'vcpu_id_str' in patch 2.
> - Remove parentheses that cause compilation errors
> 
> Shenlin Liang (2):
>   RISCV: KVM: add tracepoints for entry and exit events
>   perf kvm/riscv: Port perf kvm stat to RISC-V
> 
>  arch/riscv/kvm/trace.h                        | 67 ++++++++++++++++
>  arch/riscv/kvm/vcpu.c                         |  7 ++
>  tools/perf/arch/riscv/Makefile                |  1 +
>  tools/perf/arch/riscv/util/Build              |  1 +
>  tools/perf/arch/riscv/util/kvm-stat.c         | 79 +++++++++++++++++++
>  .../arch/riscv/util/riscv_exception_types.h   | 35 ++++++++
>  6 files changed, 190 insertions(+)
>  create mode 100644 arch/riscv/kvm/trace.h
>  create mode 100644 tools/perf/arch/riscv/util/kvm-stat.c
>  create mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h
> 
> -- 
> 2.37.2

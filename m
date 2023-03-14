From: Schaffner, Tobias <tobias.schaffner@siemens.com>
Date: Tue, 14 Mar 2023 13:07:32 +0000
Subject: [PATCH v2 0/5] riscv: add PREEMPT_RT support
In-Reply-To: <20220831175920.2806-1-jszhang@kernel.org>
References: <20220831175920.2806-1-jszhang@kernel.org>
Message-ID: <b615dd8b-27f3-702a-3c36-ab18df64d5aa@siemens.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 31/08/2022 18:59, Jisheng Zhang wrote:
 > This series is to add PREEMPT_RT support to riscv:
 > patch1 adds the missing number of signal exits in vCPU stat
 > patch2 switches to the generic guest entry infrastructure
 > patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
 > RT
 > patch4 adds lazy preempt support
 > patch5 allows to enable PREEMPT_RT
 >
 > I assume patch1, patch2 and patch3 can be reviewed and merged for
 > riscv-next, patch4 and patch5 can be reviewed and maintained in rt tree,
 > and finally merged once the remaining patches in rt tree are all
 > mainlined.

I tested the last two patches on a StarFive VisionFive V2 (DT) board 
with 6.1.12-rt7-gdfa52cc14f3b today and the results looked pretty good 
for a first run.

root at StarFive:~# lscpu
Architecture:          riscv64
   Byte Order:          Little Endian
CPU(s):                4
   On-line CPU(s) list: 0-3

root at StarFive:~# uname -a
Linux StarFive 6.1.12-rt7-gdfa52cc14f3b #1 SMP PREEMPT_RT Thu, 01 Jan 
1970 01:00:00 +0000 riscv64 GNU/Linuxb

root at StarFive:~# cat /proc/cmdline
initrd=\initrd.img-6.1.12-rt7-gdfa52cc14f3b LABEL=Boot 
root=PARTUUID=7176479f-eeea-46ac-afb6-7ec47ff7c390 console=tty0 
console=ttyS0,115200 earlycon rootwait isolcpus=2-3 rcu_nocbs=2-3 
nohz_full=2-3 irqaffinity=0-1

root at StarFive:~# cyclictest -m -S -p 90 -i 50 -d 0 -q -D 10m
WARN: stat /dev/cpu_dma_latency failed: No such file or directory
T: 0 (  358) P:90 I:50 C:11999999 Min:     11 Act:   11 Avg:   11 Max: 
    55
T: 1 (  359) P:90 I:50 C:11999241 Min:     11 Act:   11 Avg:   11 Max: 
    60

Feel free to reach out for further tests or logs.

Best,
Tobias

 > Since v1:
 >   - send to related maillist, I press ENTER too quickly when sending v1
 >   - remove the signal_pending() handling because that's covered by
 >     generic guest entry infrastructure
 >
 > Jisheng Zhang (5):
 >   RISC-V: KVM: Record number of signal exits as a vCPU stat
 >   RISC-V: KVM: Use generic guest entry infrastructure
 >   riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 >   riscv: add lazy preempt support
 >   riscv: Allow to enable RT
 >
 >  arch/riscv/Kconfig                   |  3 +++
 >  arch/riscv/include/asm/kvm_host.h    |  1 +
 >  arch/riscv/include/asm/thread_info.h |  7 +++++--
 >  arch/riscv/kernel/asm-offsets.c      |  1 +
 >  arch/riscv/kernel/entry.S            |  9 +++++++--
 >  arch/riscv/kvm/Kconfig               |  1 +
 >  arch/riscv/kvm/vcpu.c                | 18 +++++++-----------
 >  7 files changed, 25 insertions(+), 15 deletions(-)
 >
 > --
 > 2.34.1
 >
 >
 > _______________________________________________
 > linux-riscv mailing list
 > linux-riscv at lists.infradead.org
 > http://lists.infradead.org/mailman/listinfo/linux-riscv

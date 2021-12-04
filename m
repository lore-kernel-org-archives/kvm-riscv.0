From: Atish Patra <atishp@atishpatra.org>
Date: Fri,  3 Dec 2021 16:20:32 -0800
Subject: [RFC 0/6] Sparse HART id support 
Message-ID: <20211204002038.113653-1-atishp@atishpatra.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, sparse hartid is not supported for Linux RISC-V for the following
reasons.
1. Both spinwait and ordered booting method uses __cpu_up_stack/task_pointer
   which is an array size of NR_CPUs.
2. During early booting, any hartid greater than NR_CPUs are not booted at all.
3. riscv_cpuid_to_hartid_mask uses struct cpumask for generating hartid bitmap.
4. SBI v0.2 implementation uses NR_CPUs as the maximum hartid number while
   generating hartmask.

In order to support sparse hartid, the hartid & NR_CPUS needs to be disassociated
which was logically incorrect anyways. NR_CPUs represent the maximum logical|
CPU id configured in the kernel while the hartid represent the physical hartid
stored in mhartid CSR defined by the privilege specification. Thus, hartid
can have much greater value than logical cpuid.

Currently, we have two methods of booting. Ordered booting where the booting
hart brings up each non-booting hart one by one using SBI HSM extension.
The spinwait booting method relies on harts jumping to Linux kernel randomly
and boot hart is selected by a lottery. All other non-booting harts keep
spinning on __cpu_up_stack/task_pointer until boot hart initializes the data.
Both these methods rely on __cpu_up_stack/task_pointer to setup the stack/
task pointer. The spinwait method is mostly used to support older firmwares
without SBI HSM extension and M-mode Linux.  The ordered booting method is the
preferred booting method for booting general Linux because it can support
cpu hotplug and kexec.

The first patch modified the ordered booting method to use an opaque parameter
already available in HSM start API to setup the stack/task pointer. The third
patch resolves the issue #1 by limiting the usage of
__cpu_up_stack/task_pointer to spinwait specific booting method. The fourth 
and fifth patch moves the entire hart lottery selection and spinwait method
to a separate config that can be disabled if required. It solves the issue #2.
The 6th patch solves issue #3 and #4 by removing riscv_cpuid_to_hartid_mask
completely. All the SBI APIs directly pass a pointer to struct cpumask and
the SBI implementation takes care of generating the hart bitmap from the
cpumask.

It is not trivial to support sparse hartid for spinwait booting method and
there are no usecases to support sparse hartid for spinwait method as well.
Any platform with sparse hartid will probably require more advanced features
such as cpu hotplug and kexec. Thus, the series supports the sparse hartid via
ordered booting method only. To maintain backward compatibility, spinwait
booting method is currently enabled in defconfig so that M-mode linux will
continue to work. Any platform that requires to sparse hartid must disable the
spinwait method.

This series also fixes the out-of-bounds access error[1] reported by Geert.
The issue can be reproduced with SMP booting with NR_CPUS=4 on platforms with
discontiguous hart numbering (HiFive unleashed/unmatched & polarfire).
Spinwait method should also be disabled for such configuration where NR_CPUS
value is less than maximum hartid in the platform. 

[1] https://lore.kernel.org/lkml/CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ at mail.gmail.com/#t

The series is based on queue branch on kvm-riscv as it has kvm related changes
as well. I have tested it on HiFive Unmatched and Qemu.

Atish Patra (6):
RISC-V: Avoid using per cpu array for ordered booting
RISC-V: Do not print the SBI version during HSM extension boot print
RISC-V: Use __cpu_up_stack/task_pointer only for spinwait method
RISC-V: Move the entire hart selection via lottery to SMP
RISC-V: Move spinwait booting method to its own config
RISC-V: Do not use cpumask data structure for hartid bitmap

arch/riscv/Kconfig                   |  14 ++
arch/riscv/include/asm/cpu_ops.h     |   2 -
arch/riscv/include/asm/cpu_ops_sbi.h |  28 ++++
arch/riscv/include/asm/sbi.h         |  19 +--
arch/riscv/include/asm/smp.h         |   8 --
arch/riscv/kernel/Makefile           |   3 +-
arch/riscv/kernel/cpu_ops.c          |  26 ++--
arch/riscv/kernel/cpu_ops_sbi.c      |  23 +++-
arch/riscv/kernel/cpu_ops_spinwait.c |  27 +++-
arch/riscv/kernel/head.S             |  33 +++--
arch/riscv/kernel/head.h             |   6 +-
arch/riscv/kernel/sbi.c              | 189 +++++++++++++++------------
arch/riscv/kernel/smp.c              |  10 --
arch/riscv/kernel/smpboot.c          |   2 +-
arch/riscv/kvm/mmu.c                 |   4 +-
arch/riscv/kvm/vcpu_sbi_replace.c    |  11 +-
arch/riscv/kvm/vcpu_sbi_v01.c        |  11 +-
arch/riscv/kvm/vmid.c                |   4 +-
arch/riscv/mm/cacheflush.c           |   5 +-
arch/riscv/mm/tlbflush.c             |   9 +-
20 files changed, 252 insertions(+), 182 deletions(-)
create mode 100644 arch/riscv/include/asm/cpu_ops_sbi.h

--
2.33.1



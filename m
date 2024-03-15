From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 15 Mar 2024 14:40:10 +0100
Subject: [PATCH 0/5] riscv: Apply Zawrs when available
Message-ID: <20240315134009.580167-7-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Zawrs provides two instructions (wrs.nto and wrs.sto), where both are
meant to allow the hart to enter a low-power state while waiting on a
store to a memory location. The instructions also both wait an
implementation-defined "short" duration (unless the implementation
terminates the stall for another reason). The difference is that while
wrs.sto will terminate when the duration elapses, wrs.nto, depending on
configuration, will either just keep waiting or an ILL exception will be
raised.

Like wfi (and with the same {m,h}status bits to configure it), when
wrs.nto is configured to raise exceptions it's expected that the higher
privilege level will see the instruction was a wait instruction, do
something, and then resume execution following the instruction.
Currently, it's not expected that M-mode will configure and handle
exceptions for timeouts (so it's expected that mstatus.TW=0), but KVM does
configure exceptions for wfi (hstatus.VTW=1) and therefore also for
wrs.nto. KVM does this for wfi since it's better to allow other tasks to
be scheduled while a VCPU waits for an interrupt. For waits such as those
where wrs.nto/sto would be used, which are typically locks, it is also a
good idea for KVM to be involved, as it can attempt to schedule the lock
holding VCPU.

This series starts with Christoph's addition of riscv smp_cond_load*
functions which apply wrs.sto when available. We then switch from
wrs.sto to wrs.nto, add hwprobe support (since the instructions are also
usable from usermode), and finally teach KVM about wrs.nto, allowing
guests to see and use the Zawrs extension.

We still don't have test results from hardware, and it's not possible to
prove that using Zawrs is a win when testing on QEMU, not even when
oversubscribing VCPUs to guests. However, it is possible to use KVM
selftests to force a scenario where we can prove Zawrs does its job and
does it well. [4] is a test which does this and, on my machine, without
Zawrs it takes 16 seconds to complete and with Zawrs it takes 0.25
seconds.

This series is based on kvm/queue and also available here [1]. In order
to use QEMU for testing a build with [2] is needed. In order to enable
guests to use Zawrs with KVM using kvmtool, the branch at [3] may be used.

[1] https://github.com/jones-drew/linux/commits/riscv/zawrs-v1/
[2] https://lore.kernel.org/all/20240312152901.512001-2-ajones at ventanamicro.com/
[3] https://github.com/jones-drew/kvmtool/commits/riscv/zawrs/
[4] https://github.com/jones-drew/linux/commit/2e712b19b7bb78634199bf262e6a75e09e1c87d2

Thanks,
drew


Andrew Jones (4):
  riscv: Prefer wrs.nto over wrs.sto
  riscv: hwprobe: export Zawrs ISA extension
  KVM: riscv: Support guest wrs.nto
  KVM: riscv: selftests: Add Zawrs extension to get-reg-list test

Christoph M?llner (1):
  riscv: Add Zawrs support for spinlocks

 Documentation/arch/riscv/hwprobe.rst          |  4 +
 arch/riscv/Kconfig                            | 13 +++
 arch/riscv/include/asm/barrier.h              | 87 +++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/kvm_host.h             |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kernel/cpufeature.c                |  1 +
 arch/riscv/kernel/sys_hwprobe.c               |  1 +
 arch/riscv/kvm/vcpu.c                         |  1 +
 arch/riscv/kvm/vcpu_insn.c                    | 15 ++++
 arch/riscv/kvm/vcpu_onereg.c                  |  2 +
 .../selftests/kvm/riscv/get-reg-list.c        |  4 +
 13 files changed, 132 insertions(+)

-- 
2.44.0



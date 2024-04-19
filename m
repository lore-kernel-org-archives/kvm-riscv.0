From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 19 Apr 2024 15:53:22 +0200
Subject: [PATCH v2 0/6] riscv: Apply Zawrs when available
Message-ID: <20240419135321.70781-8-ajones@ventanamicro.com>
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
raised. Linux will use wrs.nto, so if platforms have an implementation
which falls in the "just keep waiting" category, then it should _not_
advertise Zawrs in the hardware description. Text to that effect has
been added to the Zawrs DT definition.

Like wfi (and with the same {m,h}status bits to configure it), when
wrs.nto is configured to raise exceptions it's expected that the higher
privilege level will see the instruction was a wait instruction, do
something, and then resume execution following the instruction. For
example, KVM does configure exceptions for wfi (hstatus.VTW=1) and
therefore also for wrs.nto. KVM does this for wfi since it's better to
allow other tasks to be scheduled while a VCPU waits for an interrupt.
For waits such as those where wrs.nto/sto would be used, which are
typically locks, it is also a good idea for KVM to be involved, as it
can attempt to schedule the lock holding VCPU.

This series starts with Christoph's addition of riscv smp_cond_load*
functions which apply wrs.sto when available. That patch has been
reworked to use wrs.nto and to use the same approach as Arm for the
wait loop, since we can't have arbitrary C code between the load-
reserved and the wrs. Then, hwprobe support is added (since the
instructions are also usable from usermode), and finally KVM is
taught about wrs.nto, allowing guests to see and use the Zawrs
extension.

We still don't have test results from hardware, and it's not possible to
prove that using Zawrs is a win when testing on QEMU, not even when
oversubscribing VCPUs to guests. However, it is possible to use KVM
selftests to force a scenario where we can prove Zawrs does its job and
does it well. [4] is a test which does this and, on my machine, without
Zawrs it takes 16 seconds to complete and with Zawrs it takes 0.25
seconds.

This series is also available here [1]. In order to use QEMU for testing
a build with [2] is needed. In order to enable guests to use Zawrs with
KVM using kvmtool, the branch at [3] may be used.

[1] https://github.com/jones-drew/linux/commits/riscv/zawrs-v2/
[2] https://lore.kernel.org/all/20240312152901.512001-2-ajones at ventanamicro.com/
[3] https://github.com/jones-drew/kvmtool/commits/riscv/zawrs/
[4] https://github.com/jones-drew/linux/commit/9311702bcd118bdbfa8b9be4a8ec355c40559499

Thanks,
drew

v2:
 - Added DT bindings patch with additional Linux specifications due
   to wrs.nto potentially never terminating, as suggested by Palmer
 - Added patch to share pause insn definition
 - Rework main Zawrs support patch to use Arm approach (which is
   also the approach that Andrea Parri suggested)
 - Dropped the riscv implementation of smp_cond_load_acquire().
   afaict, the generic implementation, which will use the riscv
   implementation of smp_cond_load_relaxed() is sufficient for riscv.
 - The rework was large enough (IMO) to drop Heiko's s-o-b and to
   add myself as a co-developer


Andrew Jones (5):
  riscv: Provide a definition for 'pause'
  dt-bindings: riscv: Add Zawrs ISA extension description
  riscv: hwprobe: export Zawrs ISA extension
  KVM: riscv: Support guest wrs.nto
  KVM: riscv: selftests: Add Zawrs extension to get-reg-list test

Christoph M?llner (1):
  riscv: Add Zawrs support for spinlocks

 Documentation/arch/riscv/hwprobe.rst          |  4 ++
 .../devicetree/bindings/riscv/extensions.yaml | 12 +++++
 arch/riscv/Kconfig                            | 20 +++++---
 arch/riscv/Makefile                           |  3 --
 arch/riscv/include/asm/barrier.h              | 45 ++++++++++------
 arch/riscv/include/asm/cmpxchg.h              | 51 +++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/insn-def.h             |  4 ++
 arch/riscv/include/asm/kvm_host.h             |  1 +
 arch/riscv/include/asm/vdso/processor.h       |  8 +--
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kernel/cpufeature.c                |  1 +
 arch/riscv/kernel/sys_hwprobe.c               |  1 +
 arch/riscv/kvm/vcpu.c                         |  1 +
 arch/riscv/kvm/vcpu_insn.c                    | 15 ++++++
 arch/riscv/kvm/vcpu_onereg.c                  |  2 +
 .../selftests/kvm/riscv/get-reg-list.c        |  4 ++
 18 files changed, 144 insertions(+), 31 deletions(-)

-- 
2.44.0



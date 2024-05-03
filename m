From: David Matlack <dmatlack@google.com>
Date: Fri,  3 May 2024 11:17:31 -0700
Subject: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out while running
Message-ID: <20240503181734.1467938-1-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series changes KVM to mark a vCPU as preempted/ready if-and-only-if
it's scheduled out while running. i.e. Do not mark a vCPU
preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
when userspace is doing KVM_RUN with immediate_exit=true.

This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
set st->preempted when going back to user space"), which  stopped
marking a vCPU as preempted when returning to userspace. But if userspace
invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
preempted/ready. This is arguably incorrect behavior since the vCPU was
not actually preempted while the guest was running, it was preempted
while doing something on behalf of userspace.

In practice, this avoids KVM dirtying guest memory via the steal time
page after userspace has paused vCPUs, e.g. for Live Migration, which
allows userspace to collect the final dirty bitmap before or in parallel
with saving vCPU state without having to worry about saving vCPU state
triggering writes to guest memory.

Patch 1 introduces vcpu->wants_to_run to allow KVM to detect when a vCPU
is in its core run loop.

Patch 2 renames immediated_exit to immediated_exit__unsafe within KVM to
ensure that any new references get extra scrutiny.

Patch 3 perform leverages vcpu->wants_to_run to contrain when
vcpu->preempted and vcpu->ready are set.

v3:
 - Use READ_ONCE() to read immediate_exit [Sean]
 - Replace use of immediate_exit with !wants_to_run to avoid TOCTOU [Sean]
 - Hide/Rename immediate_exit in KVM to harden against TOCTOU bugs [Sean]

v2: https://lore.kernel.org/kvm/20240307163541.92138-1-dmatlack at google.com/
 - Drop Google-specific "PRODKERNEL: " shortlog prefix [me]

v1: https://lore.kernel.org/kvm/20231218185850.1659570-1-dmatlack at google.com/

David Matlack (3):
  KVM: Introduce vcpu->wants_to_run
  KVM: Ensure new code that references immediate_exit gets extra
    scrutiny
  KVM: Mark a vCPU as preempted/ready iff it's scheduled out while
    running

 arch/arm64/kvm/arm.c       |  2 +-
 arch/loongarch/kvm/vcpu.c  |  2 +-
 arch/mips/kvm/mips.c       |  2 +-
 arch/powerpc/kvm/powerpc.c |  2 +-
 arch/riscv/kvm/vcpu.c      |  2 +-
 arch/s390/kvm/kvm-s390.c   |  2 +-
 arch/x86/kvm/x86.c         |  4 ++--
 include/linux/kvm_host.h   |  1 +
 include/uapi/linux/kvm.h   | 15 ++++++++++++++-
 virt/kvm/kvm_main.c        |  5 ++++-
 10 files changed, 27 insertions(+), 10 deletions(-)


base-commit: 296655d9bf272cfdd9d2211d099bcb8a61b93037
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog



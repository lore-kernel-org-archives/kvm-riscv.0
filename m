From: Chao Gao <chao.gao@intel.com>
Date: Mon, 27 Dec 2021 16:15:06 +0800
Subject: [PATCH 0/6] Improve KVM's interaction with CPU hotplug
Message-ID: <20211227081515.2088920-1-chao.gao@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM registers its CPU hotplug callback to CPU starting section. And in the
callback, KVM enables hardware virtualization on hotplugged CPUs if any VM
is running on existing CPUs.

There are two problems in the process:
1. KVM doesn't do compatibility checks before enabling hardware
virtualization on hotplugged CPUs. This may cause #GP if VMX isn't
supported or vmentry failure if some in-use VMX features are missing on
hotplugged CPUs. Both break running VMs.
2. Callbacks in CPU STARTING section cannot fail. So, even if KVM finds
some incompatible CPUs, its callback cannot block CPU hotplug.

This series improves KVM's interaction with CPU hotplug to avoid
incompatible CPUs breaking running VMs. Following changes are made:

1. move KVM's CPU hotplug callback to ONLINE section (suggested by Thomas)
2. do compatibility checks on hotplugged CPUs.
3. abort onlining incompatible CPUs if there is a running VM.

This series is a follow-up to the discussion about KVM and CPU hotplug
https://lore.kernel.org/lkml/3d3296f0-9245-40f9-1b5a-efffdb082de9 at redhat.com/T/

Note: this series is tested only on Intel systems.

Chao Gao (6):
  KVM: x86: Move check_processor_compatibility from init ops to runtime
    ops
  KVM: x86: Use kvm_x86_ops in kvm_arch_check_processor_compat
  KVM: Remove opaque from kvm_arch_check_processor_compat
  KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section
  KVM: x86: Remove WARN_ON in kvm_arch_check_processor_compat
  KVM: Do compatibility checks on hotplugged CPUs

 arch/arm64/kvm/arm.c            |  2 +-
 arch/mips/kvm/mips.c            |  2 +-
 arch/powerpc/kvm/powerpc.c      |  2 +-
 arch/riscv/kvm/main.c           |  2 +-
 arch/s390/kvm/kvm-s390.c        |  2 +-
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/svm/svm.c          |  4 +-
 arch/x86/kvm/vmx/evmcs.c        |  2 +-
 arch/x86/kvm/vmx/evmcs.h        |  2 +-
 arch/x86/kvm/vmx/vmx.c          | 12 +++---
 arch/x86/kvm/x86.c              |  7 +---
 include/linux/cpuhotplug.h      |  2 +-
 include/linux/kvm_host.h        |  2 +-
 virt/kvm/kvm_main.c             | 74 ++++++++++++++++++++++++---------
 14 files changed, 74 insertions(+), 43 deletions(-)

-- 
2.25.1



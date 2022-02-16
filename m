From: Chao Gao <chao.gao@intel.com>
Date: Wed, 16 Feb 2022 11:15:15 +0800
Subject: [PATCH v4 0/6] Improve KVM's interaction with CPU hotplug
Message-ID: <20220216031528.92558-1-chao.gao@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changes from v3->v4:
 - rebased to the lastest kvm/next branch.
 - add Sean's reviewed-by tags
 - add Marc's patch to simplify ARM's cpu hotplug logic in KVM

Changes from v2->v3:
 - rebased to the latest kvm/next branch. 
 - patch 1: rename {svm,vmx}_check_processor_compat to follow the name
	    convention
 - patch 3: newly added to provide more information when hardware enabling
	    fails
 - patch 4: reset hardware_enable_failed if hardware enabling fails. And
	    remove redundent kernel log.
 - patch 5: add a pr_err() for setup_vmcs_config() path.

Changes from v1->v2: (all comments/suggestions on v1 are from Sean, thanks)
 - Merged v1's patch 2 into patch 1, and v1's patch 5 into patch 6.
 - Use static_call for check_processor_compatibility().
 - Generate patch 2 with "git revert" and do manual changes based on that.
 - Loosen the WARN_ON() in kvm_arch_check_processor_compat() instead of
   removing it.
 - KVM always prevent incompatible CPUs from being brought up regardless of
   running VMs.
 - Use pr_warn instead of pr_info to emit logs when KVM finds offending
   CPUs.

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
3. abort onlining incompatible CPUs

This series is a follow-up to the discussion about KVM and CPU hotplug
https://lore.kernel.org/lkml/3d3296f0-9245-40f9-1b5a-efffdb082de9 at redhat.com/T/

Note: this series is tested only on Intel systems.

Chao Gao (4):
  KVM: x86: Move check_processor_compatibility from init ops to runtime
    ops
  Partially revert "KVM: Pass kvm_init()'s opaque param to additional
    arch funcs"
  KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section
  KVM: Do compatibility checks on hotplugged CPUs

Marc Zyngier (1):
  KVM: arm64: Simplify the CPUHP logic

Sean Christopherson (1):
  KVM: Provide more information in kernel log if hardware enabling fails

 arch/arm64/kvm/arch_timer.c        | 27 ++++-------
 arch/arm64/kvm/arm.c               |  6 ++-
 arch/arm64/kvm/vgic/vgic-init.c    | 19 +-------
 arch/mips/kvm/mips.c               |  2 +-
 arch/powerpc/kvm/powerpc.c         |  2 +-
 arch/riscv/kvm/main.c              |  2 +-
 arch/s390/kvm/kvm-s390.c           |  2 +-
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  2 +-
 arch/x86/kvm/svm/svm.c             |  4 +-
 arch/x86/kvm/vmx/evmcs.c           |  2 +-
 arch/x86/kvm/vmx/evmcs.h           |  2 +-
 arch/x86/kvm/vmx/vmx.c             | 22 +++++----
 arch/x86/kvm/x86.c                 | 16 +++++--
 include/kvm/arm_arch_timer.h       |  4 ++
 include/kvm/arm_vgic.h             |  4 ++
 include/linux/cpuhotplug.h         |  5 +-
 include/linux/kvm_host.h           |  2 +-
 virt/kvm/kvm_main.c                | 73 +++++++++++++++++++-----------
 19 files changed, 107 insertions(+), 90 deletions(-)

-- 
2.25.1



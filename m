From: Thomas Huth <thuth@redhat.com>
Date: Wed,  8 Feb 2023 15:00:59 +0100
Subject: [PATCH v2 0/6] KVM: Standardize on "int" return types instead of "long"
Message-ID: <20230208140105.655814-1-thuth@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM functions use "long" return values for functions that are wired up
to "struct file_operations", but otherwise use "int" return values for
functions that can return 0/-errno in order to avoid unintentional
divergences between 32-bit and 64-bit kernels. Some related functions
that are not part of a "struct file_operations" still use "long", though,
which can cause confusion or even subtle problems (see the x86 and the
arm64 patches). Thus let's standardize on using "int" for return values
in these functions to avoid such problems in the future.

v2:
- Remove KVM_GET_NR_MMU_PAGES ioctl instead of trying to work-around
  the problem (the ioctl is not used in any userspace app anyway)
- Add check for INT_MAX to the arm64 patch
- Added Reviewed-bys from v1

Thomas Huth (6):
  KVM: PPC: Standardize on "int" return types in the powerpc KVM code
  KVM: s390: Use "int" as return type for kvm_s390_get/set_skeys()
  KVM: x86: Remove the KVM_GET_NR_MMU_PAGES ioctl
  KVM: arm64: Limit length in kvm_vm_ioctl_mte_copy_tags() to INT_MAX
  KVM: Standardize on "int" return types instead of "long" in kvm_main.c
  KVM: Change return type of kvm_arch_vm_ioctl() to "int"

 Documentation/virt/kvm/api.rst      |  3 ++-
 arch/arm64/include/asm/kvm_host.h   |  4 ++--
 arch/arm64/kvm/arm.c                |  3 +--
 arch/arm64/kvm/guest.c              |  8 ++++++--
 arch/mips/kvm/mips.c                |  4 ++--
 arch/powerpc/include/asm/kvm_ppc.h  | 14 +++++++-------
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 14 +++++++-------
 arch/powerpc/kvm/book3s_64_vio.c    |  4 ++--
 arch/powerpc/kvm/book3s_hv.c        |  6 +++---
 arch/powerpc/kvm/book3s_pr.c        |  4 ++--
 arch/powerpc/kvm/powerpc.c          |  5 ++---
 arch/riscv/kvm/vm.c                 |  3 +--
 arch/s390/kvm/kvm-s390.c            |  7 +++----
 arch/x86/kvm/x86.c                  | 11 +----------
 include/linux/kvm_host.h            |  3 +--
 include/uapi/linux/kvm.h            |  2 +-
 tools/include/uapi/linux/kvm.h      |  2 +-
 virt/kvm/kvm_main.c                 |  4 ++--
 18 files changed, 46 insertions(+), 55 deletions(-)

-- 
2.31.1



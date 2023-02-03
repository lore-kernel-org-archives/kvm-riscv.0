From: Thomas Huth <thuth@redhat.com>
Date: Fri,  3 Feb 2023 10:42:23 +0100
Subject: [PATCH 0/7] KVM: Standardize on "int" return types instead of "long"
Message-ID: <20230203094230.266952-1-thuth@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series is a follow-up from one of my patches in 2022 and
Sean's reply here:

 https://lore.kernel.org/kvm/YpZu6%2Fk+8EydfBKf at google.com/

KVM functions use "long" return values for functions that are wired up
to "struct file_operations", but otherwise use "int" return values for
functions that can return 0/-errno in order to avoid unintentional
divergences between 32-bit and 64-bit kernels. Some related functions
that are not part of a "struct file_operations" still use "long", though,
which can cause confusion or even subtle problems (see second patch).
Thus let's standardize on using "int" for return values in these functions
to avoid such problems in the future.

Thomas Huth (7):
  KVM: Standardize on "int" return types instead of "long" in kvm_main.c
  KVM: x86: Improve return type handling in
    kvm_vm_ioctl_get_nr_mmu_pages()
  KVM: Move KVM_GET_NR_MMU_PAGES into the deprecation section
  KVM: PPC: Standardize on "int" return types in the powerpc KVM code
  KVM: s390: Use "int" as return type for kvm_s390_get/set_skeys()
  KVM: arm64: Change return type of kvm_vm_ioctl_mte_copy_tags() to
    "int"
  KVM: Change return type of kvm_arch_vm_ioctl() to "int"

 arch/arm64/include/asm/kvm_host.h   |  4 ++--
 arch/arm64/kvm/arm.c                |  3 +--
 arch/arm64/kvm/guest.c              |  4 ++--
 arch/mips/kvm/mips.c                |  4 ++--
 arch/powerpc/include/asm/kvm_ppc.h  | 14 +++++++-------
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 14 +++++++-------
 arch/powerpc/kvm/book3s_64_vio.c    |  4 ++--
 arch/powerpc/kvm/book3s_hv.c        |  6 +++---
 arch/powerpc/kvm/book3s_pr.c        |  4 ++--
 arch/powerpc/kvm/powerpc.c          |  5 ++---
 arch/riscv/kvm/vm.c                 |  3 +--
 arch/s390/kvm/kvm-s390.c            |  7 +++----
 arch/x86/kvm/x86.c                  |  8 +++++---
 include/linux/kvm_host.h            |  3 +--
 include/uapi/linux/kvm.h            |  3 ++-
 virt/kvm/kvm_main.c                 |  4 ++--
 16 files changed, 44 insertions(+), 46 deletions(-)

-- 
2.31.1



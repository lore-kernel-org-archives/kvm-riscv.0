From: Sean Christopherson <seanjc@google.com>
Date: Tue, 18 Jul 2023 16:44:43 -0700
Subject: [RFC PATCH v11 00/29]  KVM: guest_memfd() and per-page attributes
Message-ID: <20230718234512.1690985-1-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is the next iteration of implementing fd-based (instead of vma-based)
memory for KVM guests.  If you want the full background of why we are doing
this, please go read the v10 cover letter[1].

The biggest change from v10 is to implement the backing storage in KVM
itself, and expose it via a KVM ioctl() instead of a "generic" sycall.
See link[2] for details on why we pivoted to a KVM-specific approach.

Key word is "biggest".  Relative to v10, there are many big changes.
Highlights below (I can't remember everything that got changed at
this point).

Tagged RFC as there are a lot of empty changelogs, and a lot of missing
documentation.  And ideally, we'll have even more tests before merging.
There are also several gaps/opens (to be discussed in tomorrow's PUCK).

v11:
 - Test private<=>shared conversions *without* doing fallocate()
 - PUNCH_HOLE all memory between iterations of the conversion test so that
   KVM doesn't retain pages in the guest_memfd
 - Rename hugepage control to be a very generic ALLOW_HUGEPAGE, instead of
   giving it a THP or PMD specific name.
 - Fold in fixes from a lot of people (thank you!)
 - Zap SPTEs *before* updating attributes to ensure no weirdness, e.g. if
   KVM handles a page fault and looks at inconsistent attributes
 - Refactor MMU interaction with attributes updates to reuse much of KVM's
   framework for mmu_notifiers.

[1] https://lore.kernel.org/all/20221202061347.1070246-1-chao.p.peng at linux.intel.com
[2] https://lore.kernel.org/all/ZEM5Zq8oo+xnApW9 at google.com

Ackerley Tng (1):
  KVM: selftests: Test KVM exit behavior for private memory/access

Chao Peng (7):
  KVM: Use gfn instead of hva for mmu_notifier_retry
  KVM: Add KVM_EXIT_MEMORY_FAULT exit
  KVM: Introduce per-page memory attributes
  KVM: x86: Disallow hugepages when memory attributes are mixed
  KVM: x86/mmu: Handle page fault for private memory
  KVM: selftests: Add KVM_SET_USER_MEMORY_REGION2 helper
  KVM: selftests: Expand set_memory_region_test to validate
    guest_memfd()

Sean Christopherson (18):
  KVM: Wrap kvm_gfn_range.pte in a per-action union
  KVM: Tweak kvm_hva_range and hva_handler_t to allow reusing for gfn
    ranges
  KVM: PPC: Drop dead code related to KVM_ARCH_WANT_MMU_NOTIFIER
  KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to
    CONFIG_KVM_GENERIC_MMU_NOTIFIER
  KVM: Introduce KVM_SET_USER_MEMORY_REGION2
  mm: Add AS_UNMOVABLE to mark mapping as completely unmovable
  security: Export security_inode_init_security_anon() for use by KVM
  KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing
    memory
  KVM: Add transparent hugepage support for dedicated guest memory
  KVM: Drop superfluous __KVM_VCPU_MULTIPLE_ADDRESS_SPACE macro
  KVM: Allow arch code to track number of memslot address spaces per VM
  KVM: x86: Add support for "protected VMs" that can utilize private
    memory
  KVM: selftests: Drop unused kvm_userspace_memory_region_find() helper
  KVM: selftests: Convert lib's mem regions to
    KVM_SET_USER_MEMORY_REGION2
  KVM: selftests: Add support for creating private memslots
  KVM: selftests: Introduce VM "shape" to allow tests to specify the VM
    type
  KVM: selftests: Add GUEST_SYNC[1-6] macros for synchronizing more data
  KVM: selftests: Add basic selftest for guest_memfd()

Vishal Annapurve (3):
  KVM: selftests: Add helpers to convert guest memory b/w private and
    shared
  KVM: selftests: Add helpers to do KVM_HC_MAP_GPA_RANGE hypercalls
    (x86)
  KVM: selftests: Add x86-only selftest for private memory conversions

 Documentation/virt/kvm/api.rst                | 114 ++++
 arch/arm64/include/asm/kvm_host.h             |   2 -
 arch/arm64/kvm/Kconfig                        |   2 +-
 arch/arm64/kvm/mmu.c                          |   2 +-
 arch/mips/include/asm/kvm_host.h              |   2 -
 arch/mips/kvm/Kconfig                         |   2 +-
 arch/mips/kvm/mmu.c                           |   2 +-
 arch/powerpc/include/asm/kvm_host.h           |   2 -
 arch/powerpc/kvm/Kconfig                      |   8 +-
 arch/powerpc/kvm/book3s_hv.c                  |   2 +-
 arch/powerpc/kvm/powerpc.c                    |   5 +-
 arch/riscv/include/asm/kvm_host.h             |   2 -
 arch/riscv/kvm/Kconfig                        |   2 +-
 arch/riscv/kvm/mmu.c                          |   2 +-
 arch/x86/include/asm/kvm_host.h               |  17 +-
 arch/x86/include/uapi/asm/kvm.h               |   3 +
 arch/x86/kvm/Kconfig                          |  14 +-
 arch/x86/kvm/debugfs.c                        |   2 +-
 arch/x86/kvm/mmu/mmu.c                        | 287 +++++++-
 arch/x86/kvm/mmu/mmu_internal.h               |   4 +
 arch/x86/kvm/mmu/mmutrace.h                   |   1 +
 arch/x86/kvm/mmu/tdp_mmu.c                    |   8 +-
 arch/x86/kvm/vmx/vmx.c                        |  11 +-
 arch/x86/kvm/x86.c                            |  24 +-
 include/linux/kvm_host.h                      | 129 +++-
 include/linux/pagemap.h                       |  11 +
 include/uapi/linux/kvm.h                      |  50 ++
 include/uapi/linux/magic.h                    |   1 +
 mm/compaction.c                               |   4 +
 mm/migrate.c                                  |   2 +
 security/security.c                           |   1 +
 tools/testing/selftests/kvm/Makefile          |   3 +
 tools/testing/selftests/kvm/dirty_log_test.c  |   2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  | 114 ++++
 .../selftests/kvm/include/kvm_util_base.h     | 141 +++-
 .../testing/selftests/kvm/include/test_util.h |   5 +
 .../selftests/kvm/include/ucall_common.h      |  12 +
 .../selftests/kvm/include/x86_64/processor.h  |  15 +
 .../selftests/kvm/kvm_page_table_test.c       |   2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 230 ++++---
 tools/testing/selftests/kvm/lib/memstress.c   |   3 +-
 .../selftests/kvm/set_memory_region_test.c    |  99 +++
 .../kvm/x86_64/private_mem_conversions_test.c | 408 +++++++++++
 .../kvm/x86_64/private_mem_kvm_exits_test.c   | 115 ++++
 .../kvm/x86_64/ucna_injection_test.c          |   2 +-
 virt/kvm/Kconfig                              |  17 +
 virt/kvm/Makefile.kvm                         |   1 +
 virt/kvm/dirty_ring.c                         |   2 +-
 virt/kvm/guest_mem.c                          | 635 ++++++++++++++++++
 virt/kvm/kvm_main.c                           | 384 +++++++++--
 virt/kvm/kvm_mm.h                             |  38 ++
 51 files changed, 2700 insertions(+), 246 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/guest_memfd_test.c
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
 create mode 100644 virt/kvm/guest_mem.c


base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
-- 
2.41.0.255.g8b1d071c50-goog



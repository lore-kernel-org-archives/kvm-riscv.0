From: David Woodhouse <dwmw2@infradead.org>
Date: Sun, 21 Nov 2021 12:54:39 +0000
Subject: [PATCH v5 00/12] KVM: x86/xen: Add in-kernel Xen event channel
 delivery
Message-ID: <20211121125451.9489-1-dwmw2@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce the basic concept of 2 level event channels for kernel delivery,
which is just a simple matter of a few test_and_set_bit calls on a mapped
shared info page.

This can be used for routing MSI of passthrough devices to PIRQ event
channels in a Xen guest, and we can build on it for delivering IPIs and
timers directly from the kernel too.

v1: Use kvm_map_gfn() although I didn't quite see how it works.

v2: Avoid kvm_map_gfn() and implement a safe mapping with invalidation
    support for myself.

v3: Reinvent gfn_to_pfn_cache with sane invalidation semantics, for my
    use case as well as nesting.

v4: Rework dirty handling, as it became apparently that we need an active
    vCPU context to mark pages dirty so it can't be done from the MMU
    notifier duing the invalidation; it has to happen on unmap.

v5: Fix sparse warnings reported by kernel test robot <lkp@intel.com>.

    Fix revalidation when memslots change but the resulting HVA stays
    the same. We can use the same kernel mapping in that case, if the
    HVA ? PFN translation was valid before. So that probably means we
    shouldn't unmap the "old_hva". Augment the test case to exercise
    that one too.

    Include the fix for the dirty ring vs. Xen shinfo oops reported
    by butt3rflyh4ck <butterflyhuangxx@gmail.com>.


As in the previous two rounds, the last patch (this time patch 12) is
included as illustration of how we *might* use this for fixing the UAF
bugs in nesting, but isn't intended to be applied as-is. Patches 1-11 are.



David Woodhouse (12):
      KVM: Introduce CONFIG_HAVE_KVM_DIRTY_RING
      KVM: Add Makefile.kvm for common files, use it for x86
      KVM: s390: Use Makefile.kvm for common files
      KVM: mips: Use Makefile.kvm for common files
      KVM: RISC-V: Use Makefile.kvm for common files
      KVM: powerpc: Use Makefile.kvm for common files
      KVM: arm64: Use Makefile.kvm for common files
      KVM: Reinstate gfn_to_pfn_cache with invalidation support
      KVM: x86/xen: Maintain valid mapping of Xen shared_info page
      KVM: x86/xen: Add KVM_IRQ_ROUTING_XEN_EVTCHN and event channel delivery
      KVM: x86: Fix wall clock writes in Xen shared_info not to mark page dirty
      KVM: x86: First attempt at converting nested virtual APIC page to gpc

 Documentation/virt/kvm/api.rst                     |  33 ++
 arch/arm64/kvm/Makefile                            |   6 +-
 arch/mips/kvm/Makefile                             |   3 +-
 arch/powerpc/kvm/Makefile                          |   6 +-
 arch/riscv/kvm/Makefile                            |   6 +-
 arch/s390/kvm/Makefile                             |   6 +-
 arch/x86/include/asm/kvm_host.h                    |   4 +-
 arch/x86/kvm/Kconfig                               |   2 +
 arch/x86/kvm/Makefile                              |   7 +-
 arch/x86/kvm/irq_comm.c                            |  12 +
 arch/x86/kvm/vmx/nested.c                          |  50 ++-
 arch/x86/kvm/vmx/vmx.c                             |  12 +-
 arch/x86/kvm/vmx/vmx.h                             |   2 +-
 arch/x86/kvm/x86.c                                 |  15 +-
 arch/x86/kvm/x86.h                                 |   1 -
 arch/x86/kvm/xen.c                                 | 341 +++++++++++++++++++--
 arch/x86/kvm/xen.h                                 |   9 +
 include/linux/kvm_dirty_ring.h                     |   8 +-
 include/linux/kvm_host.h                           | 110 +++++++
 include/linux/kvm_types.h                          |  18 ++
 include/uapi/linux/kvm.h                           |  11 +
 .../testing/selftests/kvm/x86_64/xen_shinfo_test.c | 184 ++++++++++-
 virt/kvm/Kconfig                                   |   6 +
 virt/kvm/Makefile.kvm                              |  14 +
 virt/kvm/dirty_ring.c                              |   2 +-
 virt/kvm/kvm_main.c                                |  16 +-
 virt/kvm/kvm_mm.h                                  |  44 +++
 virt/kvm/mmu_lock.h                                |  23 --
 virt/kvm/pfncache.c                                | 323 +++++++++++++++++++
 29 files changed, 1173 insertions(+), 101 deletions(-)




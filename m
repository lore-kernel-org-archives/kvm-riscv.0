From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 17 Nov 2021 17:39:51 +0000
Subject: [PATCH v3 00/12] KVM: x86/xen: Add in-kernel Xen event channel
 delivery
Message-ID: <20211117174003.297096-1-dwmw2@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Event channels, yeah. That really is where I started.

It was all so simple in Joao and Ankur's original version at 
https://www.spinics.net/lists/kvm/msg182556.html ? just a handful
of simple test_and_set_bit() calls on the mapped page.

When I posted v1 I didn't quite understand how steal time and nesting
were safely using the kvm_map_gfn() function, and I posted the Xen
part declaring that I had "reduced it to a previously solved problem".

Then I frowned at kvm_map_gfn() for a bit longer, concluded it was
basically impossible to use it safely on its own because the page it
maps might belong to another guest by the time it even returns to its
caller, and posted a v2 in which I did something safer for myself by
hooking into the MMU notifiers.

I then fixed the steal time reporting, and killed gfn_to_pfn_cache,
under separate cover.

In v3 of this series I re-introduce a saner gfn_to_pfn_cache with MMU 
notifier support to give it proper invalidation semantics. This can now 
be used for the Xen event channel support and should also be usable for 
fixing the various use-after-free races in the nesting code too ? the 
last patch in this series being an untested proof of concept attempt at 
fixing one such.

Since adding a C file in virt/kvm/ was somewhat more painful than it
really should have been, there is a small detour into all the arch
specific Makefiles to make them include a common one.

Intended for merging up to patch 11. Patch 12 is for illustration.

David Woodhouse (12):
      KVM: Introduce CONFIG_HAVE_KVM_DIRTY_RING
      KVM: Add Makefile.kvm for common files, use it for x86
      KVM: s390: Use Makefile.kvm for common files
      KVM: mips: Use Makefile.kvm for common files
      KVM: RISC-V: Use Makefile.kvm for common files
      KVM: powerpc: Use Makefile.kvm for common files
      KVM: arm64: Use Makefile.kvm for common files
      KVM: Propagate vcpu explicitly to mark_page_dirty_in_slot()
      KVM: Reinstate gfn_to_pfn_cache with invalidation support
      KVM: x86/xen: Maintain valid mapping of Xen shared_info page
      KVM: x86/xen: Add KVM_IRQ_ROUTING_XEN_EVTCHN and event channel delivery
      KVM: x86: First attempt at converting nested virtual APIC page to gpc

 Documentation/virt/kvm/api.rst                     |  21 ++
 arch/arm64/kvm/Makefile                            |   6 +-
 arch/arm64/kvm/mmu.c                               |   2 +-
 arch/mips/kvm/Makefile                             |   3 +-
 arch/powerpc/kvm/Makefile                          |   6 +-
 arch/riscv/kvm/Makefile                            |   6 +-
 arch/s390/kvm/Makefile                             |   6 +-
 arch/x86/include/asm/kvm_host.h                    |   4 +-
 arch/x86/kvm/Kconfig                               |   2 +
 arch/x86/kvm/Makefile                              |   7 +-
 arch/x86/kvm/irq_comm.c                            |  12 +
 arch/x86/kvm/mmu/mmu.c                             |   2 +-
 arch/x86/kvm/mmu/spte.c                            |   2 +-
 arch/x86/kvm/mmu/tdp_mmu.c                         |   2 +-
 arch/x86/kvm/vmx/nested.c                          |  50 +++-
 arch/x86/kvm/vmx/vmx.c                             |  12 +-
 arch/x86/kvm/vmx/vmx.h                             |   2 +-
 arch/x86/kvm/x86.c                                 |  17 +-
 arch/x86/kvm/xen.c                                 | 287 +++++++++++++++++++--
 arch/x86/kvm/xen.h                                 |   9 +
 include/linux/kvm_dirty_ring.h                     |  14 +-
 include/linux/kvm_host.h                           | 100 ++++++-
 include/linux/kvm_types.h                          |  18 ++
 include/uapi/linux/kvm.h                           |  11 +
 .../testing/selftests/kvm/x86_64/xen_shinfo_test.c | 112 +++++++-
 virt/kvm/Kconfig                                   |   6 +
 virt/kvm/Makefile.kvm                              |  14 +
 virt/kvm/dirty_ring.c                              |  10 +-
 virt/kvm/kvm_main.c                                |  34 ++-
 virt/kvm/{mmu_lock.h => kvm_mm.h}                  |  23 +-
 virt/kvm/pfncache.c                                | 281 ++++++++++++++++++++
 31 files changed, 992 insertions(+), 89 deletions(-)





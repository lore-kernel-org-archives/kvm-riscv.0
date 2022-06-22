From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jun 2022 15:26:47 -0400
Subject: [PATCH v7 00/23] KVM: Extend Eager Page Splitting to the shadow MMU
Message-ID: <20220622192710.2547152-1-pbonzini@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For the description of the "why" of this patch, I'll just direct you to
David's excellent cover letter from v6, which can be found at
https://lore.kernel.org/r/20220516232138.1783324-1-dmatlack at google.com.

This version mostly does the following:

- apply the feedback from Sean and other reviewers, which is mostly
  aesthetic

- replace the refactoring of drop_large_spte()/__drop_large_spte()
  with my own version.  The insight there is that drop_large_spte()
  is always followed by {,__}link_shadow_page(), so the call is
  moved there

- split the TLB flush optimization into a separate patch, mostly
  to perform the previous refactoring independent of the optional
  TLB flush

- rename a few functions from *nested_mmu* to *shadow_mmu*

David Matlack (21):
  KVM: x86/mmu: Optimize MMU page cache lookup for all direct SPs
  KVM: x86/mmu: Use a bool for direct
  KVM: x86/mmu: Stop passing "direct" to mmu_alloc_root()
  KVM: x86/mmu: Derive shadow MMU page role from parent
  KVM: x86/mmu: Always pass 0 for @quadrant when gptes are 8 bytes
  KVM: x86/mmu: Decompose kvm_mmu_get_page() into separate functions
  KVM: x86/mmu: Consolidate shadow page allocation and initialization
  KVM: x86/mmu: Rename shadow MMU functions that deal with shadow pages
  KVM: x86/mmu: Move guest PT write-protection to account_shadowed()
  KVM: x86/mmu: Pass memory caches to allocate SPs separately
  KVM: x86/mmu: Replace vcpu with kvm in kvm_mmu_alloc_shadow_page()
  KVM: x86/mmu: Pass kvm pointer separately from vcpu to
    kvm_mmu_find_shadow_page()
  KVM: x86/mmu: Allow NULL @vcpu in kvm_mmu_find_shadow_page()
  KVM: x86/mmu: Pass const memslot to rmap_add()
  KVM: x86/mmu: Decouple rmap_add() and link_shadow_page() from kvm_vcpu
  KVM: x86/mmu: Update page stats in __rmap_add()
  KVM: x86/mmu: Cache the access bits of shadowed translations
  KVM: x86/mmu: Extend make_huge_page_split_spte() for the shadow MMU
  KVM: x86/mmu: Zap collapsible SPTEs in shadow MMU at all possible
    levels
  KVM: Allow for different capacities in kvm_mmu_memory_cache structs
  KVM: x86/mmu: Extend Eager Page Splitting to nested MMUs

Paolo Bonzini (2):
  KVM: x86/mmu: pull call to drop_large_spte() into __link_shadow_page()
  KVM: x86/mmu: Avoid unnecessary flush on eager page split

 .../admin-guide/kernel-parameters.txt         |   3 +-
 arch/arm64/kvm/mmu.c                          |   2 +-
 arch/riscv/kvm/mmu.c                          |   5 +-
 arch/x86/include/asm/kvm_host.h               |  24 +-
 arch/x86/kvm/mmu/mmu.c                        | 719 ++++++++++++++----
 arch/x86/kvm/mmu/mmu_internal.h               |  17 +-
 arch/x86/kvm/mmu/paging_tmpl.h                |  43 +-
 arch/x86/kvm/mmu/spte.c                       |  15 +-
 arch/x86/kvm/mmu/spte.h                       |   4 +-
 arch/x86/kvm/mmu/tdp_mmu.c                    |   2 +-
 include/linux/kvm_host.h                      |   1 +
 include/linux/kvm_types.h                     |   6 +-
 virt/kvm/kvm_main.c                           |  33 +-
 13 files changed, 666 insertions(+), 208 deletions(-)

-- 
2.31.1



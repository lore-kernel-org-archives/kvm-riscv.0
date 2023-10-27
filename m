From: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Oct 2023 11:21:42 -0700
Subject: [PATCH v13 00/35] KVM: guest_memfd() and per-page attributes
Message-ID: <20231027182217.3615211-1-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Non-KVM people, please take a gander at two small-ish patches buried in the
middle of this series:

  fs: Export anon_inode_getfile_secure() for use by KVM
  mm: Add AS_UNMOVABLE to mark mapping as completely unmovable

Our plan/hope is to take this through the KVM tree for 6.8, reviews (and acks!)
would be much appreciated.  Note, adding AS_UNMOVABLE isn't strictly required as
it's "just" an optimization, but we'd prefer to have it in place straightaway.

Reviews on all the KVM changes, especially the guest_memfd.c implementation, are
also most definitely welcome.

The "what and why" at the very bottom is hopefully old news for most readers.  My
plan is to copy the blurb into a tag when this is merged (today's word of the day
is: optimism), e.g. so that the big picture and why we're doing this is captured
in the git history.

Note, the v13 changelog below captures only changes that were not posted and
applied to the v12+ development branch.  Those changes can be found in commits
46c10adeda81..74a4d3b6a284 at
 
    https://github.com/kvm-x86/linux.git tags/kvm-x86-guest_memfd-v12

This series can be found at

    https://github.com/kvm-x86/linux.git guest_memfd

kvm-x86/guest_memfd is also now being fed into kvm-x86/next, i.e. will be getting
coverage in linux-next as of the next build.

Similar to the v12 "development cycle", any changes needed will be applied on
top of v13, and squashed prior to sending v14 (if needed) or merging (optimism!).

KVM folks, ***LOOK HERE***.  v13 has several breaking userspace changes relative
to v12.  Some were "necessary" (removal of a pointless ioctl), others were
opportunistic and opinionated (renaming kvm_userspace_memory_region2 fields to
use guest_memfd instead of gmem).  I didn't post changes as I found the "issues"
very late (when writing documentation) and didn't want to delay v13.

Here's a diff of the linux/include/uapi/linux/kvm.h changes that will break
userspace developed for v12.

@@ -102,8 +102,8 @@ struct kvm_userspace_memory_region2 {
        __u64 guest_phys_addr;
        __u64 memory_size;
        __u64 userspace_addr;
-       __u64 gmem_offset;
-       __u32 gmem_fd;
+       __u64 guest_memfd_offset;
+       __u32 guest_memfd;
        __u32 pad1;
        __u64 pad2[14];
 };

@@ -1231,9 +1215,10 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
 #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
 #define KVM_CAP_USER_MEMORY2 230
-#define KVM_CAP_MEMORY_ATTRIBUTES 231
-#define KVM_CAP_GUEST_MEMFD 232
-#define KVM_CAP_VM_TYPES 233
+#define KVM_CAP_MEMORY_FAULT_INFO 231
+#define KVM_CAP_MEMORY_ATTRIBUTES 232
+#define KVM_CAP_GUEST_MEMFD 233
+#define KVM_CAP_VM_TYPES 234
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -2301,8 +2286,7 @@ struct kvm_s390_zpci_op {
 #define KVM_S390_ZPCIOP_REGAEN_HOST    (1 << 0)
 
 /* Available with KVM_CAP_MEMORY_ATTRIBUTES */
-#define KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES    _IOR(KVMIO,  0xd2, __u64)
-#define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd3, struct kvm_memory_attributes)
+#define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd2, struct kvm_memory_attributes)
 
v13:
 - Drop KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES, have KVM_CAP_MEMORY_ATTRIBUTES
   return the supported attributes.
 - Add KVM_CAP_MEMORY_FAULT_INFO to report support for KVM_EXIT_MEMORY_FAULT,
   and shift capability numbers accordingly.
 - Do s/gmem/guest_memfd (roughly) in userspace-facing APIs, i.e. use guest_memfd
   as the formal name.  Going off of various internal conversations, "gmem" isn't
   at all intuitive, whereas "guest_memfd" gives readers/listeners a rough idea
   of what's going on.  If you don't like the rename, then next time volunteer
   to write the documentation.  :-)
 - Rename a leftover "out_restricted" label to "out_unbind".
 - Write and clean up changelogs.
 - Write and clean up documentation.
 - Move "memory_fault" to the standard exit reasons union (requires userspace to
   rebuild, but shouldn't require code changes).
 - Fix intermediate build issues (hidden behind unselectable Kconfigs)
 - KVM_CAP_GUEST_MEMFD and KVM_CREATE_GUEST_MEMFD under the same #ifdefs.
 - Fix a bug in kvm_mmu_invalidate_range_add() where adding multiple ranges in a
   single invalidation would captured only the last range. [Xu Yilun]

v12: https://lore.kernel.org/all/20230914015531.1419405-1-seanjc at google.com
v11: https://lore.kernel.org/all/20230718234512.1690985-1-seanjc at google.com
v10: https://lore.kernel.org/all/20221202061347.1070246-1-chao.p.peng at linux.intel.coms

Fodder for a merge tag:
---
Introduce several new KVM uAPIs to ultimately create a guest-first memory
subsystem within KVM, a.k.a. guest_memfd.  Guest-first memory allows KVM to
provide features, enhancements, and optimizations that are kludgly or outright
impossible to implement in a generic memory subsystem.

The core KVM ioctl() for guest_memfd is KVM_CREATE_GUEST_MEMFD, which similar
to the generic memfd_create(), creates an anonymous file and returns a file
descriptor that refers to it.  Again like "regular" memfd files, guest_memfd
files live in RAM, have volatile storage, and are automatically released when
the last reference is dropped.  The key differences between memfd files (and
every other memory subystem) is that guest_memfd files are bound to their owning
virtual machine, cannot be mapped, read, or written by userspace, and cannot be
resized (guest_memfd files do however support PUNCH_HOLE).

A second KVM ioctl(), KVM_SET_MEMORY_ATTRIBUTES, allows userspace to specify
attributes for a given page of guest memory, e.g. in the long term, it will
likely be extended to allow userspace to specify per-gfn RWX protections.

The immediate and driving use case for guest_memfd are Confidential (CoCo) VMs,
specifically AMD's SEV-SNP, Intel's TDX, and KVM's own pKVM.  For KVM CoCo use
cases, being able to map memory into KVM guests without requireming said memory
to be mapped into the host is a hard requirement.  While SEV+ and TDX prevent
untrusted software from reading guest private data by encrypting guest memory,
pKVM provides confidentiality and integrity *without* relying on memory
encryption.  And with SEV-SNP and TDX, accessing guest private memory can be
fatal to the host, i.e. KVM must be prevent host userspace from accessing guest
memory irrespective of hardware behavior.

Long term, guest_memfd provides KVM line-of-sight to use cases beyond CoCo VMs,
e.g. KVM currently doesn't support mapping memory as writable in the guest
without it also being writable in host userspace, as KVM's ABI uses userspace
VMA protections to define the allow guest protection (with an exception granted
to mapping guest memory executable).

Similarly, KVM currently requires the guest mapping size to be a strict subset
of the host userspace mapping size, e.g. KVM doesn?t support creating a 1GiB
guest mapping unless userspace also has a 1GiB guest mapping.  Decoupling the
mappings sizes would allow userspace to precisely map only what is needed
without impacting guest performance, e.g. to again harden against unintentional
accesses to guest memory.

A guest-first memory subsystem also provides clearer line of sight to things
like a dedicated memory pool (for slice-of-hardware VMs) and elimination of
"struct page" (for offload setups where userspace _never_ needs to mmap() guest
memory).

guest_memfd is the result of 3+ years of development and exploration; taking on
memory management responsibilities in KVM was not the first, second, or even
third choice for supporting CoCo VMs.  But after many failed attempts to avoid
KVM-specific backing memory, and looking at where things ended up, it is quite
clear that of all approaches tried, guest_memfd is the simplest, most robust,
and most extensible, and the right thing to do for KVM and the kernel at-large.
---

Ackerley Tng (1):
  KVM: selftests: Test KVM exit behavior for private memory/access

Chao Peng (8):
  KVM: Use gfn instead of hva for mmu_notifier_retry
  KVM: Add KVM_EXIT_MEMORY_FAULT exit to report faults to userspace
  KVM: Introduce per-page memory attributes
  KVM: x86: Disallow hugepages when memory attributes are mixed
  KVM: x86/mmu: Handle page fault for private memory
  KVM: selftests: Add KVM_SET_USER_MEMORY_REGION2 helper
  KVM: selftests: Expand set_memory_region_test to validate
    guest_memfd()
  KVM: selftests: Add basic selftest for guest_memfd()

Sean Christopherson (23):
  KVM: Tweak kvm_hva_range and hva_handler_t to allow reusing for gfn
    ranges
  KVM: Assert that mmu_invalidate_in_progress *never* goes negative
  KVM: WARN if there are dangling MMU invalidations@VM destruction
  KVM: PPC: Drop dead code related to KVM_ARCH_WANT_MMU_NOTIFIER
  KVM: PPC: Return '1' unconditionally for KVM_CAP_SYNC_MMU
  KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to
    CONFIG_KVM_GENERIC_MMU_NOTIFIER
  KVM: Introduce KVM_SET_USER_MEMORY_REGION2
  KVM: Add a dedicated mmu_notifier flag for reclaiming freed memory
  KVM: Drop .on_unlock() mmu_notifier hook
  KVM: Prepare for handling only shared mappings in mmu_notifier events
  mm: Add AS_UNMOVABLE to mark mapping as completely unmovable
  fs: Export anon_inode_getfile_secure() for use by KVM
  KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing
    memory
  KVM: Add transparent hugepage support for dedicated guest memory
  KVM: x86: "Reset" vcpu->run->exit_reason early in KVM_RUN
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

Vishal Annapurve (3):
  KVM: selftests: Add helpers to convert guest memory b/w private and
    shared
  KVM: selftests: Add helpers to do KVM_HC_MAP_GPA_RANGE hypercalls
    (x86)
  KVM: selftests: Add x86-only selftest for private memory conversions

 Documentation/virt/kvm/api.rst                | 208 ++++++
 arch/arm64/include/asm/kvm_host.h             |   2 -
 arch/arm64/kvm/Kconfig                        |   2 +-
 arch/mips/include/asm/kvm_host.h              |   2 -
 arch/mips/kvm/Kconfig                         |   2 +-
 arch/powerpc/include/asm/kvm_host.h           |   2 -
 arch/powerpc/kvm/Kconfig                      |   8 +-
 arch/powerpc/kvm/book3s_hv.c                  |   2 +-
 arch/powerpc/kvm/powerpc.c                    |   7 +-
 arch/riscv/include/asm/kvm_host.h             |   2 -
 arch/riscv/kvm/Kconfig                        |   2 +-
 arch/x86/include/asm/kvm_host.h               |  17 +-
 arch/x86/include/uapi/asm/kvm.h               |   3 +
 arch/x86/kvm/Kconfig                          |  14 +-
 arch/x86/kvm/debugfs.c                        |   2 +-
 arch/x86/kvm/mmu/mmu.c                        | 271 +++++++-
 arch/x86/kvm/mmu/mmu_internal.h               |   2 +
 arch/x86/kvm/vmx/vmx.c                        |  11 +-
 arch/x86/kvm/x86.c                            |  26 +-
 fs/anon_inodes.c                              |   1 +
 include/linux/kvm_host.h                      | 143 ++++-
 include/linux/kvm_types.h                     |   1 +
 include/linux/pagemap.h                       |  19 +-
 include/uapi/linux/kvm.h                      |  51 ++
 mm/compaction.c                               |  43 +-
 mm/migrate.c                                  |   2 +
 tools/testing/selftests/kvm/Makefile          |   3 +
 tools/testing/selftests/kvm/dirty_log_test.c  |   2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  | 221 +++++++
 .../selftests/kvm/include/kvm_util_base.h     | 148 ++++-
 .../testing/selftests/kvm/include/test_util.h |   5 +
 .../selftests/kvm/include/ucall_common.h      |  11 +
 .../selftests/kvm/include/x86_64/processor.h  |  15 +
 .../selftests/kvm/kvm_page_table_test.c       |   2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 233 ++++---
 tools/testing/selftests/kvm/lib/memstress.c   |   3 +-
 .../selftests/kvm/set_memory_region_test.c    | 100 +++
 .../kvm/x86_64/private_mem_conversions_test.c | 487 ++++++++++++++
 .../kvm/x86_64/private_mem_kvm_exits_test.c   | 120 ++++
 .../kvm/x86_64/ucna_injection_test.c          |   2 +-
 virt/kvm/Kconfig                              |  17 +
 virt/kvm/Makefile.kvm                         |   1 +
 virt/kvm/dirty_ring.c                         |   2 +-
 virt/kvm/guest_memfd.c                        | 607 ++++++++++++++++++
 virt/kvm/kvm_main.c                           | 505 ++++++++++++---
 virt/kvm/kvm_mm.h                             |  26 +
 46 files changed, 3083 insertions(+), 272 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/guest_memfd_test.c
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
 create mode 100644 virt/kvm/guest_memfd.c


base-commit: 2b3f2325e71f09098723727d665e2e8003d455dc
-- 
2.42.0.820.g83a721a137-goog



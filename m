From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Mar 2024 16:26:19 -0700
Subject: [PATCH 00/18] KVM: selftests: Clean up x86's DT initialization
Message-ID: <20240314232637.2538648-1-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The vast majority of this series is x86 specific, and aims to clean up the
core library's handling of descriptor tables and segments.  Currently, the
library (a) waits until vCPUs are created to allocate per-VM assets, and
(b) forces tests to opt-in to allocate the structures needed to handler
exceptions, which has result in some rather odd tests, and makes it
unnecessarily difficult to debug unexpected exceptions.

By the end of this series, the descriptor tables, segments, and exception
handlers are allocated and installed when non-barebones VMs are created.

Patch 1 is a selftests-tree-wide change to drop kvm_util_base.h.  The
existence of that file has baffled (and annoyed) me for quite a long time.
After rereading its initial changelog multiple times, I realized that the
_only_ reason it exists is so that files don't need to manually #include
ucall_common.h.

Patch 1 will obviously create conflicts all over the place, though with
the help of meld, I've found them all trivially easy to resolve.  If no
objects to the removal of kvm_util_base.h, I will try to bribe Paolo into
grabbing it early in the 6.10 cycle so that everyone can bring it into
the arch trees.

Ackerley Tng (1):
  KVM: selftests: Fix off-by-one initialization of GDT limit

Sean Christopherson (17):
  Revert "kvm: selftests: move base kvm_util.h declarations to
    kvm_util_base.h"
  KVM: sefltests: Add kvm_util_types.h to hold common types, e.g.
    vm_vaddr_t
  KVM: selftests: Move GDT, IDT, and TSS fields to x86's kvm_vm_arch
  KVM: selftests: Move platform_info_test's main assert into guest code
  KVM: selftests: Rework platform_info_test to actually verify #GP
  KVM: selftests: Explicitly clobber the IDT in the "delete memslot"
    testcase
  KVM: selftests: Move x86's descriptor table helpers "up" in
    processor.c
  KVM: selftests: Rename x86's vcpu_setup() to vcpu_init_sregs()
  KVM: selftests: Init IDT and exception handlers for all VMs/vCPUs on
    x86
  KVM: selftests: Map x86's exception_handlers at VM creation, not vCPU
    setup
  KVM: selftests: Allocate x86's GDT during VM creation
  KVM: selftests: Drop superfluous switch() on vm->mode in
    vcpu_init_sregs()
  KVM: selftests: Fold x86's descriptor tables helpers into
    vcpu_init_sregs()
  KVM: selftests: Allocate x86's TSS at VM creation
  KVM: selftests: Add macro for TSS selector, rename up code/data macros
  KVM: selftests: Init x86's segments during VM creation
  KVM: selftests: Drop @selector from segment helpers

 .../selftests/kvm/aarch64/arch_timer.c        |    1 +
 tools/testing/selftests/kvm/arch_timer.c      |    1 +
 .../selftests/kvm/demand_paging_test.c        |    1 +
 .../selftests/kvm/dirty_log_perf_test.c       |    1 +
 tools/testing/selftests/kvm/dirty_log_test.c  |    1 +
 .../testing/selftests/kvm/guest_memfd_test.c  |    2 +-
 .../testing/selftests/kvm/guest_print_test.c  |    1 +
 .../selftests/kvm/include/aarch64/processor.h |    2 +
 .../selftests/kvm/include/aarch64/ucall.h     |    2 +-
 .../testing/selftests/kvm/include/kvm_util.h  | 1111 +++++++++++++++-
 .../selftests/kvm/include/kvm_util_base.h     | 1135 -----------------
 .../selftests/kvm/include/kvm_util_types.h    |   20 +
 .../selftests/kvm/include/s390x/ucall.h       |    2 +-
 .../kvm/include/x86_64/kvm_util_arch.h        |    6 +
 .../selftests/kvm/include/x86_64/processor.h  |    5 +-
 .../selftests/kvm/include/x86_64/ucall.h      |    2 +-
 .../selftests/kvm/kvm_page_table_test.c       |    1 +
 .../selftests/kvm/lib/aarch64/processor.c     |    2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |    1 +
 tools/testing/selftests/kvm/lib/memstress.c   |    1 +
 .../selftests/kvm/lib/riscv/processor.c       |    1 +
 .../testing/selftests/kvm/lib/ucall_common.c  |    5 +-
 .../selftests/kvm/lib/x86_64/processor.c      |  305 ++---
 .../testing/selftests/kvm/riscv/arch_timer.c  |    1 +
 tools/testing/selftests/kvm/rseq_test.c       |    1 +
 tools/testing/selftests/kvm/s390x/cmma_test.c |    1 +
 tools/testing/selftests/kvm/s390x/memop.c     |    1 +
 tools/testing/selftests/kvm/s390x/tprot.c     |    1 +
 .../selftests/kvm/set_memory_region_test.c    |   12 +
 tools/testing/selftests/kvm/steal_time.c      |    1 +
 tools/testing/selftests/kvm/x86_64/amx_test.c |    2 -
 .../x86_64/dirty_log_page_splitting_test.c    |    1 +
 .../x86_64/exit_on_emulation_failure_test.c   |    2 +-
 .../selftests/kvm/x86_64/fix_hypercall_test.c |    2 -
 .../selftests/kvm/x86_64/hyperv_evmcs.c       |    2 -
 .../selftests/kvm/x86_64/hyperv_features.c    |    6 -
 .../testing/selftests/kvm/x86_64/hyperv_ipi.c |    3 -
 .../selftests/kvm/x86_64/kvm_pv_test.c        |    3 -
 .../selftests/kvm/x86_64/monitor_mwait_test.c |    3 -
 .../selftests/kvm/x86_64/platform_info_test.c |   59 +-
 .../selftests/kvm/x86_64/pmu_counters_test.c  |    3 -
 .../kvm/x86_64/pmu_event_filter_test.c        |    6 -
 .../smaller_maxphyaddr_emulation_test.c       |    3 -
 .../selftests/kvm/x86_64/svm_int_ctl_test.c   |    3 -
 .../kvm/x86_64/svm_nested_shutdown_test.c     |    5 +-
 .../kvm/x86_64/svm_nested_soft_inject_test.c  |    5 +-
 .../kvm/x86_64/ucna_injection_test.c          |    5 -
 .../kvm/x86_64/userspace_msr_exit_test.c      |    3 -
 .../vmx_exception_with_invalid_guest_state.c  |    3 -
 .../selftests/kvm/x86_64/vmx_pmu_caps_test.c  |    3 -
 .../selftests/kvm/x86_64/xapic_ipi_test.c     |    2 -
 .../selftests/kvm/x86_64/xcr0_cpuid_test.c    |    3 -
 .../selftests/kvm/x86_64/xen_shinfo_test.c    |    2 -
 53 files changed, 1335 insertions(+), 1421 deletions(-)
 delete mode 100644 tools/testing/selftests/kvm/include/kvm_util_base.h
 create mode 100644 tools/testing/selftests/kvm/include/kvm_util_types.h


base-commit: e9a2bba476c8332ed547fce485c158d03b0b9659
-- 
2.44.0.291.gc1ea87d7ee-goog



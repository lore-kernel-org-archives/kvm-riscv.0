From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed,  6 Dec 2023 18:02:42 +0100
Subject: [PATCH 0/5] KVM: selftests: Remove redundant newlines
Message-ID: <20231206170241.82801-7-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series has a lot of churn for dubious value, but I'm posting it
anyway since I've already done the work. Each patch in the series is
simply removing trailing newlines from format strings in TEST_* function
callsites, since TEST_* functions append their own. The first patch
addresses common lib and test code, the rest of the changes are split
by arch in the remaining patches.

Figuring out which newlines to delete was done with a long, ugly
grep regular expression[*] and then highlighting '\n' in the output
and manually skimming to find, and then manually fix, each instance.
I'm sure there's some AI tool that would have done everything for me,
but this was my chance to prove I'm still as capable as AI (well,
unless I missed some...)

[*] grep -rn . tools/testing/selftests/kvm |
    grep -Pzo '(?s)\n[^\n]*TEST_(ASSERT|REQUIRE|FAIL)\(.*?\)\s*;' |
    tr '\0' '\n'


Andrew Jones (5):
  KVM: selftests: Remove redundant newlines
  KVM: selftests: aarch64: Remove redundant newlines
  KVM: selftests: riscv: Remove redundant newlines
  KVM: selftests: s390x: Remove redundant newlines
  KVM: selftests: x86_64: Remove redundant newlines

 .../selftests/kvm/aarch64/arch_timer.c        | 12 ++++----
 .../selftests/kvm/aarch64/hypercalls.c        | 16 +++++------
 .../selftests/kvm/aarch64/page_fault_test.c   |  6 ++--
 .../selftests/kvm/aarch64/smccc_filter.c      |  2 +-
 .../kvm/aarch64/vpmu_counter_access.c         | 12 ++++----
 .../selftests/kvm/demand_paging_test.c        |  4 +--
 .../selftests/kvm/dirty_log_perf_test.c       |  4 +--
 tools/testing/selftests/kvm/dirty_log_test.c  |  4 +--
 tools/testing/selftests/kvm/get-reg-list.c    |  2 +-
 .../testing/selftests/kvm/guest_print_test.c  |  8 +++---
 .../selftests/kvm/hardware_disable_test.c     |  6 ++--
 .../selftests/kvm/kvm_create_max_vcpus.c      |  2 +-
 .../selftests/kvm/kvm_page_table_test.c       |  4 +--
 .../selftests/kvm/lib/aarch64/processor.c     |  2 +-
 .../testing/selftests/kvm/lib/aarch64/vgic.c  |  4 +--
 tools/testing/selftests/kvm/lib/elf.c         |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 16 +++++------
 tools/testing/selftests/kvm/lib/memstress.c   |  2 +-
 .../selftests/kvm/lib/riscv/processor.c       |  2 +-
 .../selftests/kvm/lib/s390x/processor.c       |  2 +-
 .../selftests/kvm/lib/userfaultfd_util.c      |  2 +-
 .../selftests/kvm/lib/x86_64/processor.c      | 10 +++----
 tools/testing/selftests/kvm/lib/x86_64/vmx.c  |  6 ++--
 .../kvm/memslot_modification_stress_test.c    |  2 +-
 .../testing/selftests/kvm/memslot_perf_test.c |  6 ++--
 .../selftests/kvm/riscv/get-reg-list.c        |  2 +-
 tools/testing/selftests/kvm/rseq_test.c       |  4 +--
 tools/testing/selftests/kvm/s390x/resets.c    |  4 +--
 .../selftests/kvm/s390x/sync_regs_test.c      | 20 ++++++-------
 .../selftests/kvm/set_memory_region_test.c    |  6 ++--
 .../kvm/system_counter_offset_test.c          |  2 +-
 tools/testing/selftests/kvm/x86_64/amx_test.c |  2 +-
 .../testing/selftests/kvm/x86_64/cpuid_test.c |  4 +--
 .../selftests/kvm/x86_64/flds_emulation.h     |  2 +-
 .../selftests/kvm/x86_64/hyperv_clock.c       |  4 +--
 .../testing/selftests/kvm/x86_64/hyperv_ipi.c |  2 +-
 .../selftests/kvm/x86_64/hyperv_tlb_flush.c   |  2 +-
 .../selftests/kvm/x86_64/kvm_clock_test.c     |  8 +++---
 .../selftests/kvm/x86_64/platform_info_test.c |  2 +-
 .../kvm/x86_64/pmu_event_filter_test.c        |  2 +-
 .../selftests/kvm/x86_64/sev_migrate_tests.c  | 28 +++++++++----------
 .../smaller_maxphyaddr_emulation_test.c       |  4 +--
 .../selftests/kvm/x86_64/sync_regs_test.c     | 10 +++----
 .../kvm/x86_64/ucna_injection_test.c          |  8 +++---
 .../selftests/kvm/x86_64/userspace_io_test.c  |  2 +-
 .../kvm/x86_64/vmx_apic_access_test.c         |  2 +-
 .../selftests/kvm/x86_64/vmx_dirty_log_test.c | 16 +++++------
 .../vmx_exception_with_invalid_guest_state.c  |  2 +-
 .../selftests/kvm/x86_64/xapic_ipi_test.c     |  8 +++---
 .../selftests/kvm/x86_64/xcr0_cpuid_test.c    |  2 +-
 .../selftests/kvm/x86_64/xss_msr_test.c       |  2 +-
 51 files changed, 144 insertions(+), 144 deletions(-)

-- 
2.43.0



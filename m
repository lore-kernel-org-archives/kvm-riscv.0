From: Sean Christopherson <seanjc@google.com>
Date: Wed, 24 Aug 2022 03:21:09 +0000
Subject: [PATCH v4 0/6] KVM: selftests: Implement ucall "pool" (for SEV)
Message-ID: <20220824032115.3563686-1-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is "v4" of Peter's SEV series, minus the actual SEV tests.  My plan
is to get this queued sooner than later so that Peter can build on top.

Non-KVM folks, y'all got pulled in because of the atomic_test_and_set_bit()
patch.

Rework the ucall infrastructure to use a pool of ucall structs to pass
memory instead of using the guest's stack.  For confidential VMs with
encrypted memory, e.g. SEV, the guest's stack "needs" to be private memory
and so can't be used to communicate with the host.

Convert all implementations to the pool as all of the complexity is hidden
in common code, and supporting multiple interfaces adds its own kind of
complexity. 

Tested on x86 and ARM, compile tested on s390 and RISC-V.

Peter Gonda (2):
  tools: Add atomic_test_and_set_bit()
  KVM: selftests: Add ucall pool based implementation

Sean Christopherson (4):
  KVM: selftests: Consolidate common code for populating ucall struct
  KVM: selftests: Consolidate boilerplate code in get_ucall()
  KVM: selftests: Automatically do init_ucall() for non-barebones VMs
  KVM: selftests: Make arm64's MMIO ucall multi-VM friendly

 tools/arch/x86/include/asm/atomic.h           |   7 ++
 tools/include/asm-generic/atomic-gcc.h        |  12 ++
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/aarch64/arch_timer.c        |   1 -
 .../selftests/kvm/aarch64/debug-exceptions.c  |   1 -
 .../selftests/kvm/aarch64/hypercalls.c        |   1 -
 .../testing/selftests/kvm/aarch64/psci_test.c |   1 -
 .../testing/selftests/kvm/aarch64/vgic_init.c |   2 -
 .../testing/selftests/kvm/aarch64/vgic_irq.c  |   1 -
 tools/testing/selftests/kvm/dirty_log_test.c  |   2 -
 .../selftests/kvm/include/kvm_util_base.h     |  16 +++
 .../selftests/kvm/include/ucall_common.h      |  13 +-
 .../selftests/kvm/kvm_page_table_test.c       |   1 -
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 101 +++-------------
 tools/testing/selftests/kvm/lib/kvm_util.c    |  11 ++
 .../selftests/kvm/lib/perf_test_util.c        |   2 -
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  40 ++----
 tools/testing/selftests/kvm/lib/s390x/ucall.c |  37 ++----
 .../testing/selftests/kvm/lib/ucall_common.c  | 114 ++++++++++++++++++
 .../testing/selftests/kvm/lib/x86_64/ucall.c  |  37 ++----
 .../testing/selftests/kvm/memslot_perf_test.c |   1 -
 tools/testing/selftests/kvm/rseq_test.c       |   1 -
 tools/testing/selftests/kvm/steal_time.c      |   1 -
 .../kvm/system_counter_offset_test.c          |   1 -
 24 files changed, 213 insertions(+), 192 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/lib/ucall_common.c


base-commit: 372d07084593dc7a399bf9bee815711b1fb1bcf2
-- 
2.37.1.595.g718a3a8f04-goog



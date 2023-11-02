From: Zeng Guang <guang.zeng@intel.com>
Date: Thu,  2 Nov 2023 23:51:03 +0800
Subject: [RFC PATCH v1 0/8] KVM: seftests: Support guest user mode execution and running
Message-ID: <20231102155111.28821-1-guang.zeng@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series give a proposal to support guest VM running
in user mode and in canonical linear address organization as
well.

First design to parition the 64-bit canonical linear address space
into two half parts belonging to user-mode and supervisor-mode
respectively, similar as the organization of linear addresses used
in linux OS. Currently the linear addresses use 48-bit canonical
format in which bits 63:47 of the address are identical.

Secondly setup page table mapping the same guest physical address
of test code and data segment onto both user-mode and supervisor-mode
address space. It allows guest in different runtime mode, i.e.
user or supervisor, can run one code base in the corresponding
linear address space.

Also provide the runtime environment setup API for switching to
user mode execution.     


Zeng Guang (8):
  KVM: selftests: x86: Fix bug in addr_arch_gva2gpa()
  KVM: selftests: x86: Support guest running on canonical linear-address
    organization
  KVM: selftests: Add virt_arch_ucall_prealloc() arch specific
    implementation
  KVM : selftests : Adapt selftest cases to kernel canonical linear
    address
  KVM: selftests: x86: Prepare setup for user mode support
  KVM: selftests: x86: Allow user to access user-mode address and I/O
    address space
  KVM: selftests: x86: Support vcpu run in user mode
  KVM: selftests: x86: Add KVM forced emulation prefix capability

 .../selftests/kvm/include/kvm_util_base.h     |  20 ++-
 .../selftests/kvm/include/x86_64/processor.h  |  48 ++++++-
 .../selftests/kvm/lib/aarch64/processor.c     |   5 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |   6 +-
 .../selftests/kvm/lib/riscv/processor.c       |   5 +
 .../selftests/kvm/lib/s390x/processor.c       |   5 +
 .../testing/selftests/kvm/lib/ucall_common.c  |   2 +
 .../selftests/kvm/lib/x86_64/processor.c      | 117 ++++++++++++++----
 .../selftests/kvm/set_memory_region_test.c    |  13 +-
 .../testing/selftests/kvm/x86_64/debug_regs.c |   2 +-
 .../kvm/x86_64/userspace_msr_exit_test.c      |   9 +-
 11 files changed, 195 insertions(+), 37 deletions(-)

-- 
2.21.3



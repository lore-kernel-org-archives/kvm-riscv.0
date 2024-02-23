From: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Feb 2024 16:42:47 -0800
Subject: [PATCH v9 00/11] KVM: selftests: Add SEV and SEV-ES smoke tests
Message-ID: <20240223004258.3104051-1-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add basic SEV and SEV-ES smoke tests.  Unlike the intra-host migration tests,
this one actually runs a small chunk of code in the guest.

Unless anyone strongly objects to the quick and dirty approach I've taken for 
SEV-ES, I'll get all of this queued for 6.9 soon-ish.

As for _why_ I added the quick-and-dirty SEV-ES testcase, I have a series to
cleanup __svm_sev_es_vcpu_run(), and found out that apparently I have a version
of OVMF that doesn't quite have to the right <something> for SEV-ES, and so I
could even get a "real" VM to reach KVM_RUN.  I assumed (correctly, yay!) that
hacking together a selftest would be faster than figuring out what firmware
magic I am missing.

v9:
 - Drop is_kvm_sev_supported() and rely purely on KVM capabilities.
 - Check X86_FEATURE_SEV to ensure SEV is actually enabled.
 - Collect tags. [Carlos, Itaru]

v8:
 - https://lore.kernel.org/all/cc9a1951-e76c-470d-a4d1-8ad67bae5794 at amd.com
 - Undo the kvm.h uAPI breakage.
 - Take advantage of "struct vm_shape", introduced by the guest_memfd
   selftests, to simply tracking the SEV/SEV-ES subtypes.
 - Rename the test to "sev_smoke_test" instead of "sev_all_boot_test",
   as the "all" is rather nonsensical, and the test isn't booting anything
   in the traditional sense of the word.
 - Drop vm->protected and instead add an arch hook to query if the VM has
   protected memory.
 - Assert that the target memory region supports protected memory when
   allocating protected memory.
 - Allocate protected_phy_pages for memory regions if and only if the VM
   supports protected memory.
 - Rename kvm_host.h to kvm_util_arch.h, and move it to selftests/kvm where
   it belongs.
 - Fix up some SoB goofs.
 - Convert the intrahost SEV/SEV-ES migration tests to use common ioctl()
   wrappers.

Ackerley Tng (1):
  KVM: selftests: Add a macro to iterate over a sparsebit range

Michael Roth (2):
  KVM: selftests: Make sparsebit structs const where appropriate
  KVM: selftests: Add support for protected vm_vaddr_* allocations

Peter Gonda (5):
  KVM: selftests: Add support for allocating/managing protected guest
    memory
  KVM: selftests: Explicitly ucall pool from shared memory
  KVM: selftests: Allow tagging protected memory in guest page tables
  KVM: selftests: Add library for creating and interacting with SEV
    guests
  KVM: selftests: Add a basic SEV smoke test

Sean Christopherson (3):
  KVM: selftests: Extend VM creation's @shape to allow control of VM
    subtype
  KVM: selftests: Use the SEV library APIs in the intra-host migration
    test
  KVM: selftests: Add a basic SEV-ES smoke test

 tools/testing/selftests/kvm/Makefile          |   2 +
 .../kvm/include/aarch64/kvm_util_arch.h       |   7 ++
 .../selftests/kvm/include/kvm_util_base.h     |  50 +++++++-
 .../kvm/include/riscv/kvm_util_arch.h         |   7 ++
 .../kvm/include/s390x/kvm_util_arch.h         |   7 ++
 .../testing/selftests/kvm/include/sparsebit.h |  56 ++++++---
 .../kvm/include/x86_64/kvm_util_arch.h        |  23 ++++
 .../selftests/kvm/include/x86_64/processor.h  |   8 ++
 .../selftests/kvm/include/x86_64/sev.h        | 107 ++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  67 ++++++++--
 tools/testing/selftests/kvm/lib/sparsebit.c   |  48 ++++----
 .../testing/selftests/kvm/lib/ucall_common.c  |   3 +-
 .../selftests/kvm/lib/x86_64/processor.c      |  32 ++++-
 tools/testing/selftests/kvm/lib/x86_64/sev.c  | 114 ++++++++++++++++++
 .../selftests/kvm/x86_64/sev_migrate_tests.c  |  67 ++++------
 .../selftests/kvm/x86_64/sev_smoke_test.c     |  88 ++++++++++++++
 16 files changed, 583 insertions(+), 103 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/sev.h
 create mode 100644 tools/testing/selftests/kvm/lib/x86_64/sev.c
 create mode 100644 tools/testing/selftests/kvm/x86_64/sev_smoke_test.c


base-commit: 60eedcfceda9db46f1b333e5e1aa9359793f04fb
-- 
2.44.0.rc0.258.g7320e95886-goog



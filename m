From: Sean Christopherson <seanjc@google.com>
Date: Mon, 31 Jul 2023 13:30:23 -0700
Subject: [PATCH v4.1 0/3] KVM: selftests: Guest printf extra prep patches
Message-ID: <20230731203026.1192091-1-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Delta patches for v4 of the guest printf series to enable guest_printf_test
for all architectures.  Sending all 36 patches seemed counter-productive,
and I want to get input on adding ucall.h asap.

v4.1:
 - Add ucall.h and have each arch UCALL_EXIT_REASON so that generic code
   can query whether or not a ucall exit actually occurred. [Drew]
 - Use UCALL_EXIT_REASON in guest_printf_test.c and enable the test for
   all architectures. [Drew]

v4: https://lore.kernel.org/all/20230729003643.1053367-1-seanjc at google.com

Aaron Lewis (1):
  KVM: selftests: Add a selftest for guest prints and formatted asserts

Sean Christopherson (2):
  KVM: selftests: Add arch ucall.h and inline simple arch hooks
  KVM: selftests: Add #define of expected KVM exit reason for ucall

 tools/testing/selftests/kvm/Makefile          |   4 +
 .../testing/selftests/kvm/guest_print_test.c  | 221 ++++++++++++++++++
 .../selftests/kvm/include/aarch64/ucall.h     |  20 ++
 .../selftests/kvm/include/riscv/ucall.h       |  20 ++
 .../selftests/kvm/include/s390x/ucall.h       |  19 ++
 .../selftests/kvm/include/ucall_common.h      |   1 +
 .../selftests/kvm/include/x86_64/ucall.h      |  13 ++
 .../testing/selftests/kvm/lib/aarch64/ucall.c |  11 +-
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  11 -
 tools/testing/selftests/kvm/lib/s390x/ucall.c |  10 -
 .../testing/selftests/kvm/lib/x86_64/ucall.c  |   4 -
 11 files changed, 299 insertions(+), 35 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/guest_print_test.c
 create mode 100644 tools/testing/selftests/kvm/include/aarch64/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/s390x/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/ucall.h


base-commit: 12dcd9e1fe9264d306837622952b8f79d1181fab
-- 
2.41.0.585.gd2178a4bd4-goog



From: Sean Christopherson <seanjc@google.com>
Date: Mon, 31 Jul 2023 13:30:25 -0700
Subject: [PATCH v4.1 2/3] KVM: selftests: Add #define of expected KVM exit
 reason for ucall
In-Reply-To: <20230731203026.1192091-1-seanjc@google.com>
References: <20230731203026.1192091-1-seanjc@google.com>
Message-ID: <20230731203026.1192091-3-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Define the expected architecture specific exit reason for a successful
ucall so that common tests can assert that a ucall occurred without the
test needing to implement arch specific code.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/aarch64/ucall.h | 2 ++
 tools/testing/selftests/kvm/include/riscv/ucall.h   | 2 ++
 tools/testing/selftests/kvm/include/s390x/ucall.h   | 2 ++
 tools/testing/selftests/kvm/include/x86_64/ucall.h  | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/aarch64/ucall.h b/tools/testing/selftests/kvm/include/aarch64/ucall.h
index fe65fdf4f0d3..4b68f37efd36 100644
--- a/tools/testing/selftests/kvm/include/aarch64/ucall.h
+++ b/tools/testing/selftests/kvm/include/aarch64/ucall.h
@@ -4,6 +4,8 @@
 
 #include "kvm_util_base.h"
 
+#define UCALL_EXIT_REASON       KVM_EXIT_MMIO
+
 /*
  * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
  * VM), it must not be accessed from host code.
diff --git a/tools/testing/selftests/kvm/include/riscv/ucall.h b/tools/testing/selftests/kvm/include/riscv/ucall.h
index 86ed0500972b..be46eb32ec27 100644
--- a/tools/testing/selftests/kvm/include/riscv/ucall.h
+++ b/tools/testing/selftests/kvm/include/riscv/ucall.h
@@ -4,6 +4,8 @@
 
 #include "processor.h"
 
+#define UCALL_EXIT_REASON       KVM_EXIT_RISCV_SBI
+
 static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
 }
diff --git a/tools/testing/selftests/kvm/include/s390x/ucall.h b/tools/testing/selftests/kvm/include/s390x/ucall.h
index 47ad4b1fbccb..b231bf2e49d6 100644
--- a/tools/testing/selftests/kvm/include/s390x/ucall.h
+++ b/tools/testing/selftests/kvm/include/s390x/ucall.h
@@ -4,6 +4,8 @@
 
 #include "kvm_util_base.h"
 
+#define UCALL_EXIT_REASON       KVM_EXIT_S390_SIEIC
+
 static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
 }
diff --git a/tools/testing/selftests/kvm/include/x86_64/ucall.h b/tools/testing/selftests/kvm/include/x86_64/ucall.h
index 05cc69b0d550..06b244bd06ee 100644
--- a/tools/testing/selftests/kvm/include/x86_64/ucall.h
+++ b/tools/testing/selftests/kvm/include/x86_64/ucall.h
@@ -4,6 +4,8 @@
 
 #include "kvm_util_base.h"
 
+#define UCALL_EXIT_REASON       KVM_EXIT_IO
+
 static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
 }
-- 
2.41.0.585.gd2178a4bd4-goog



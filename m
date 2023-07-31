From: Sean Christopherson <seanjc@google.com>
Date: Mon, 31 Jul 2023 13:30:24 -0700
Subject: [PATCH v4.1 1/3] KVM: selftests: Add arch ucall.h and inline simple
 arch hooks
In-Reply-To: <20230731203026.1192091-1-seanjc@google.com>
References: <20230731203026.1192091-1-seanjc@google.com>
Message-ID: <20230731203026.1192091-2-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add an architecture specific ucall.h and inline the simple arch hooks,
e.g. the init hook for everything except ARM, and the actual "do ucall"
hook for everything except x86 (which should be simple, but temporarily
isn't due to carrying a workaround).

Having a per-arch ucall header will allow adding a #define for the
expected KVM exit reason for a ucall that is colocated (for everything
except x86) with the ucall itself.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/aarch64/ucall.h      | 18 ++++++++++++++++++
 .../selftests/kvm/include/riscv/ucall.h        | 18 ++++++++++++++++++
 .../selftests/kvm/include/s390x/ucall.h        | 17 +++++++++++++++++
 .../selftests/kvm/include/ucall_common.h       |  1 +
 .../selftests/kvm/include/x86_64/ucall.h       | 11 +++++++++++
 .../testing/selftests/kvm/lib/aarch64/ucall.c  | 11 +----------
 tools/testing/selftests/kvm/lib/riscv/ucall.c  | 11 -----------
 tools/testing/selftests/kvm/lib/s390x/ucall.c  | 10 ----------
 tools/testing/selftests/kvm/lib/x86_64/ucall.c |  4 ----
 9 files changed, 66 insertions(+), 35 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/aarch64/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/s390x/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/ucall.h

diff --git a/tools/testing/selftests/kvm/include/aarch64/ucall.h b/tools/testing/selftests/kvm/include/aarch64/ucall.h
new file mode 100644
index 000000000000..fe65fdf4f0d3
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/aarch64/ucall.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_UCALL_H
+#define SELFTEST_KVM_UCALL_H
+
+#include "kvm_util_base.h"
+
+/*
+ * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
+ * VM), it must not be accessed from host code.
+ */
+extern vm_vaddr_t *ucall_exit_mmio_addr;
+
+static inline void ucall_arch_do_ucall(vm_vaddr_t uc)
+{
+	WRITE_ONCE(*ucall_exit_mmio_addr, uc);
+}
+
+#endif
diff --git a/tools/testing/selftests/kvm/include/riscv/ucall.h b/tools/testing/selftests/kvm/include/riscv/ucall.h
new file mode 100644
index 000000000000..86ed0500972b
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/riscv/ucall.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_UCALL_H
+#define SELFTEST_KVM_UCALL_H
+
+#include "processor.h"
+
+static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+}
+
+static inline void ucall_arch_do_ucall(vm_vaddr_t uc)
+{
+	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
+		  KVM_RISCV_SELFTESTS_SBI_UCALL,
+		  uc, 0, 0, 0, 0, 0);
+}
+
+#endif
diff --git a/tools/testing/selftests/kvm/include/s390x/ucall.h b/tools/testing/selftests/kvm/include/s390x/ucall.h
new file mode 100644
index 000000000000..47ad4b1fbccb
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/s390x/ucall.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_UCALL_H
+#define SELFTEST_KVM_UCALL_H
+
+#include "kvm_util_base.h"
+
+static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+}
+
+static inline void ucall_arch_do_ucall(vm_vaddr_t uc)
+{
+	/* Exit via DIAGNOSE 0x501 (normally used for breakpoints) */
+	asm volatile ("diag 0,%0,0x501" : : "a"(uc) : "memory");
+}
+
+#endif
diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index 4ce11c15285a..9e5948dab030 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -7,6 +7,7 @@
 #ifndef SELFTEST_KVM_UCALL_COMMON_H
 #define SELFTEST_KVM_UCALL_COMMON_H
 #include "test_util.h"
+#include "ucall.h"
 
 /* Common ucalls */
 enum {
diff --git a/tools/testing/selftests/kvm/include/x86_64/ucall.h b/tools/testing/selftests/kvm/include/x86_64/ucall.h
new file mode 100644
index 000000000000..05cc69b0d550
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86_64/ucall.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_UCALL_H
+#define SELFTEST_KVM_UCALL_H
+
+#include "kvm_util_base.h"
+
+static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+}
+
+#endif
diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
index f212bd8ab93d..ddab0ce89d4d 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
@@ -6,11 +6,7 @@
  */
 #include "kvm_util.h"
 
-/*
- * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
- * VM), it must not be accessed from host code.
- */
-static vm_vaddr_t *ucall_exit_mmio_addr;
+vm_vaddr_t *ucall_exit_mmio_addr;
 
 void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
@@ -23,11 +19,6 @@ void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 	write_guest_global(vm, ucall_exit_mmio_addr, (vm_vaddr_t *)mmio_gva);
 }
 
-void ucall_arch_do_ucall(vm_vaddr_t uc)
-{
-	WRITE_ONCE(*ucall_exit_mmio_addr, uc);
-}
-
 void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index 9a3476a2dfca..fe6d1004f018 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -10,10 +10,6 @@
 #include "kvm_util.h"
 #include "processor.h"
 
-void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
-{
-}
-
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
 			unsigned long arg3, unsigned long arg4,
@@ -40,13 +36,6 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 	return ret;
 }
 
-void ucall_arch_do_ucall(vm_vaddr_t uc)
-{
-	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
-		  KVM_RISCV_SELFTESTS_SBI_UCALL,
-		  uc, 0, 0, 0, 0, 0);
-}
-
 void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
index a7f02dc372cf..cca98734653d 100644
--- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
+++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
@@ -6,16 +6,6 @@
  */
 #include "kvm_util.h"
 
-void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
-{
-}
-
-void ucall_arch_do_ucall(vm_vaddr_t uc)
-{
-	/* Exit via DIAGNOSE 0x501 (normally used for breakpoints) */
-	asm volatile ("diag 0,%0,0x501" : : "a"(uc) : "memory");
-}
-
 void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
index a53df3ece2f8..1265cecc7dd1 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
@@ -8,10 +8,6 @@
 
 #define UCALL_PIO_PORT ((uint16_t)0x1000)
 
-void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
-{
-}
-
 void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
 	/*
-- 
2.41.0.585.gd2178a4bd4-goog



From: Sean Christopherson <seanjc@google.com>
Date: Wed, 24 Aug 2022 03:21:10 +0000
Subject: [PATCH v4 1/6] KVM: selftests: Consolidate common code for populating
 ucall struct
In-Reply-To: <20220824032115.3563686-1-seanjc@google.com>
References: <20220824032115.3563686-1-seanjc@google.com>
Message-ID: <20220824032115.3563686-2-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make ucall() a common helper that populates struct ucall, and only calls
into arch code to make the actually call out to userspace.

Rename all arch-specific helpers to make it clear they're arch-specific,
and to avoid collisions with common helpers (one more on its way...)

Add WRITE_ONCE() to stores in ucall() code (as already done to aarch64
code in commit 9e2f6498efbb ("selftests: KVM: Handle compiler
optimizations in ucall")) to prevent clang optimizations breaking ucalls.

Cc: Colton Lewis <coltonlewis@google.com>
Cc: Peter Gonda <pgonda@google.com>
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          |  1 +
 .../selftests/kvm/include/ucall_common.h      | 23 ++++++++++++++++---
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 22 ++++--------------
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 23 ++++---------------
 tools/testing/selftests/kvm/lib/s390x/ucall.c | 23 ++++---------------
 .../testing/selftests/kvm/lib/ucall_common.c  | 20 ++++++++++++++++
 .../testing/selftests/kvm/lib/x86_64/ucall.c  | 23 ++++---------------
 7 files changed, 61 insertions(+), 74 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/lib/ucall_common.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 4c122f1b1737..23649c5d42fc 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -47,6 +47,7 @@ LIBKVM += lib/perf_test_util.c
 LIBKVM += lib/rbtree.c
 LIBKVM += lib/sparsebit.c
 LIBKVM += lib/test_util.c
+LIBKVM += lib/ucall_common.c
 
 LIBKVM_x86_64 += lib/x86_64/apic.c
 LIBKVM_x86_64 += lib/x86_64/handlers.S
diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index ee79d180e07e..5a85f5318bbe 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -24,10 +24,27 @@ struct ucall {
 	uint64_t args[UCALL_MAX_ARGS];
 };
 
-void ucall_init(struct kvm_vm *vm, void *arg);
-void ucall_uninit(struct kvm_vm *vm);
+void ucall_arch_init(struct kvm_vm *vm, void *arg);
+void ucall_arch_uninit(struct kvm_vm *vm);
+void ucall_arch_do_ucall(vm_vaddr_t uc);
+uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
+
 void ucall(uint64_t cmd, int nargs, ...);
-uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
+
+static inline void ucall_init(struct kvm_vm *vm, void *arg)
+{
+	ucall_arch_init(vm, arg);
+}
+
+static inline void ucall_uninit(struct kvm_vm *vm)
+{
+	ucall_arch_uninit(vm);
+}
+
+static inline uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+{
+	return ucall_arch_get_ucall(vcpu, uc);
+}
 
 #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4)	\
 				ucall(UCALL_SYNC, 6, "hello", stage, arg1, arg2, arg3, arg4)
diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
index ed237b744690..3630708c32d6 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
@@ -21,7 +21,7 @@ static bool ucall_mmio_init(struct kvm_vm *vm, vm_paddr_t gpa)
 	return true;
 }
 
-void ucall_init(struct kvm_vm *vm, void *arg)
+void ucall_arch_init(struct kvm_vm *vm, void *arg)
 {
 	vm_paddr_t gpa, start, end, step, offset;
 	unsigned int bits;
@@ -64,30 +64,18 @@ void ucall_init(struct kvm_vm *vm, void *arg)
 	TEST_FAIL("Can't find a ucall mmio address");
 }
 
-void ucall_uninit(struct kvm_vm *vm)
+void ucall_arch_uninit(struct kvm_vm *vm)
 {
 	ucall_exit_mmio_addr = 0;
 	sync_global_to_guest(vm, ucall_exit_mmio_addr);
 }
 
-void ucall(uint64_t cmd, int nargs, ...)
+void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
-	struct ucall uc = {};
-	va_list va;
-	int i;
-
-	WRITE_ONCE(uc.cmd, cmd);
-	nargs = min(nargs, UCALL_MAX_ARGS);
-
-	va_start(va, nargs);
-	for (i = 0; i < nargs; ++i)
-		WRITE_ONCE(uc.args[i], va_arg(va, uint64_t));
-	va_end(va);
-
-	WRITE_ONCE(*ucall_exit_mmio_addr, (vm_vaddr_t)&uc);
+	WRITE_ONCE(*ucall_exit_mmio_addr, uc);
 }
 
-uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 {
 	struct kvm_run *run = vcpu->run;
 	struct ucall ucall = {};
diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index 087b9740bc8f..b1598f418c1f 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -10,11 +10,11 @@
 #include "kvm_util.h"
 #include "processor.h"
 
-void ucall_init(struct kvm_vm *vm, void *arg)
+void ucall_arch_init(struct kvm_vm *vm, void *arg)
 {
 }
 
-void ucall_uninit(struct kvm_vm *vm)
+void ucall_arch_uninit(struct kvm_vm *vm)
 {
 }
 
@@ -44,27 +44,14 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 	return ret;
 }
 
-void ucall(uint64_t cmd, int nargs, ...)
+void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
-	struct ucall uc = {
-		.cmd = cmd,
-	};
-	va_list va;
-	int i;
-
-	nargs = min(nargs, UCALL_MAX_ARGS);
-
-	va_start(va, nargs);
-	for (i = 0; i < nargs; ++i)
-		uc.args[i] = va_arg(va, uint64_t);
-	va_end(va);
-
 	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
 		  KVM_RISCV_SELFTESTS_SBI_UCALL,
-		  (vm_vaddr_t)&uc, 0, 0, 0, 0, 0);
+		  uc, 0, 0, 0, 0, 0);
 }
 
-uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 {
 	struct kvm_run *run = vcpu->run;
 	struct ucall ucall = {};
diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
index 73dc4e21190f..114cb4af295f 100644
--- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
+++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
@@ -6,34 +6,21 @@
  */
 #include "kvm_util.h"
 
-void ucall_init(struct kvm_vm *vm, void *arg)
+void ucall_arch_init(struct kvm_vm *vm, void *arg)
 {
 }
 
-void ucall_uninit(struct kvm_vm *vm)
+void ucall_arch_uninit(struct kvm_vm *vm)
 {
 }
 
-void ucall(uint64_t cmd, int nargs, ...)
+void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
-	struct ucall uc = {
-		.cmd = cmd,
-	};
-	va_list va;
-	int i;
-
-	nargs = min(nargs, UCALL_MAX_ARGS);
-
-	va_start(va, nargs);
-	for (i = 0; i < nargs; ++i)
-		uc.args[i] = va_arg(va, uint64_t);
-	va_end(va);
-
 	/* Exit via DIAGNOSE 0x501 (normally used for breakpoints) */
-	asm volatile ("diag 0,%0,0x501" : : "a"(&uc) : "memory");
+	asm volatile ("diag 0,%0,0x501" : : "a"(uc) : "memory");
 }
 
-uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 {
 	struct kvm_run *run = vcpu->run;
 	struct ucall ucall = {};
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
new file mode 100644
index 000000000000..2395c7f1d543
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "kvm_util.h"
+
+void ucall(uint64_t cmd, int nargs, ...)
+{
+	struct ucall uc = {};
+	va_list va;
+	int i;
+
+	WRITE_ONCE(uc.cmd, cmd);
+
+	nargs = min(nargs, UCALL_MAX_ARGS);
+
+	va_start(va, nargs);
+	for (i = 0; i < nargs; ++i)
+		WRITE_ONCE(uc.args[i], va_arg(va, uint64_t));
+	va_end(va);
+
+	ucall_arch_do_ucall((vm_vaddr_t)&uc);
+}
diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
index e5f0f9e0d3ee..9f532dba1003 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
@@ -8,34 +8,21 @@
 
 #define UCALL_PIO_PORT ((uint16_t)0x1000)
 
-void ucall_init(struct kvm_vm *vm, void *arg)
+void ucall_arch_init(struct kvm_vm *vm, void *arg)
 {
 }
 
-void ucall_uninit(struct kvm_vm *vm)
+void ucall_arch_uninit(struct kvm_vm *vm)
 {
 }
 
-void ucall(uint64_t cmd, int nargs, ...)
+void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
-	struct ucall uc = {
-		.cmd = cmd,
-	};
-	va_list va;
-	int i;
-
-	nargs = min(nargs, UCALL_MAX_ARGS);
-
-	va_start(va, nargs);
-	for (i = 0; i < nargs; ++i)
-		uc.args[i] = va_arg(va, uint64_t);
-	va_end(va);
-
 	asm volatile("in %[port], %%al"
-		: : [port] "d" (UCALL_PIO_PORT), "D" (&uc) : "rax", "memory");
+		: : [port] "d" (UCALL_PIO_PORT), "D" (uc) : "rax", "memory");
 }
 
-uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 {
 	struct kvm_run *run = vcpu->run;
 	struct ucall ucall = {};
-- 
2.37.1.595.g718a3a8f04-goog



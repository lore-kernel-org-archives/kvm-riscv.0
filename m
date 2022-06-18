From: Sean Christopherson <seanjc@google.com>
Date: Sat, 18 Jun 2022 00:16:18 +0000
Subject: [PATCH 3/3] KVM: selftest: Add __weak stubs for ucall_arch_(un)init()
In-Reply-To: <20220618001618.1840806-1-seanjc@google.com>
References: <20220618001618.1840806-1-seanjc@google.com>
Message-ID: <20220618001618.1840806-4-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide __weak stubs for (un)initializing ucall, aarch64 is the only
architecture that actually needs to do work.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/riscv/ucall.c  |  8 --------
 tools/testing/selftests/kvm/lib/s390x/ucall.c  |  8 --------
 tools/testing/selftests/kvm/lib/ucall_common.c | 10 ++++++++++
 tools/testing/selftests/kvm/lib/x86_64/ucall.c |  8 --------
 4 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index 37e091d4366e..1c6c0432bdd7 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -10,14 +10,6 @@
 #include "kvm_util.h"
 #include "processor.h"
 
-void ucall_arch_init(struct kvm_vm *vm, void *arg)
-{
-}
-
-void ucall_arch_uninit(struct kvm_vm *vm)
-{
-}
-
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
 			unsigned long arg3, unsigned long arg4,
diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
index 0f695a031d35..3e8d4275c9e4 100644
--- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
+++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
@@ -6,14 +6,6 @@
  */
 #include "kvm_util.h"
 
-void ucall_arch_init(struct kvm_vm *vm, void *arg)
-{
-}
-
-void ucall_arch_uninit(struct kvm_vm *vm)
-{
-}
-
 void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
 	/* Exit via DIAGNOSE 0x501 (normally used for breakpoints) */
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index c488ed23d0dd..a1e563fd8fcc 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -1,6 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include "kvm_util.h"
 
+void __weak ucall_arch_init(struct kvm_vm *vm, void *arg)
+{
+
+}
+
+void __weak ucall_arch_uninit(struct kvm_vm *vm)
+{
+
+}
+
 void ucall(uint64_t cmd, int nargs, ...)
 {
 	struct ucall uc = {
diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
index ec53a406f689..2f724f0bed32 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
@@ -8,14 +8,6 @@
 
 #define UCALL_PIO_PORT ((uint16_t)0x1000)
 
-void ucall_arch_init(struct kvm_vm *vm, void *arg)
-{
-}
-
-void ucall_arch_uninit(struct kvm_vm *vm)
-{
-}
-
 void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
 	asm volatile("in %[port], %%al"
-- 
2.37.0.rc0.104.g0611611a94-goog



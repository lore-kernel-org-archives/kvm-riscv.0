From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Mar 2022 12:59:11 +0530
Subject: [PATCH 3/3] KVM: selftests: riscv: Improve unexpected guest trap
 handling
In-Reply-To: <20220329072911.1692766-1-apatel@ventanamicro.com>
References: <20220329072911.1692766-1-apatel@ventanamicro.com>
Message-ID: <20220329072911.1692766-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, we simply hang using "while (1) ;" upon any unexpected
guest traps because the default guest trap handler is guest_hang().

The above approach is not useful to anyone because KVM selftests
users will only see a hung application upon any unexpected guest
trap.

This patch improves unexpected guest trap handling for KVM RISC-V
selftests by doing the following:
1) Return to host user-space
2) Dump VCPU registers
3) Die using TEST_ASSERT(0, ...)

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/include/riscv/processor.h   |  8 +++--
 .../selftests/kvm/lib/riscv/processor.c       |  9 +++---
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 31 +++++++++++++------
 3 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index eca5c622efd2..4fcfd1c0389d 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -119,10 +119,12 @@ static inline void set_reg(struct kvm_vm *vm, uint32_t vcpuid, uint64_t id,
 #define SATP_ASID_SHIFT				44
 #define SATP_ASID_MASK				_AC(0xFFFF, UL)
 
-#define SBI_EXT_EXPERIMENTAL_START	0x08000000
-#define SBI_EXT_EXPERIMENTAL_END	0x08FFFFFF
+#define SBI_EXT_EXPERIMENTAL_START		0x08000000
+#define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
 
-#define KVM_RISCV_SELFTESTS_SBI_EXT	SBI_EXT_EXPERIMENTAL_END
+#define KVM_RISCV_SELFTESTS_SBI_EXT		SBI_EXT_EXPERIMENTAL_END
+#define KVM_RISCV_SELFTESTS_SBI_UCALL		0
+#define KVM_RISCV_SELFTESTS_SBI_UNEXP		1
 
 struct sbiret {
 	long error;
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 3961487a4870..56e4705f7744 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -268,10 +268,11 @@ void vcpu_dump(FILE *stream, struct kvm_vm *vm, uint32_t vcpuid, uint8_t indent)
 		core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
 }
 
-static void __aligned(16) guest_hang(void)
+static void __aligned(16) guest_unexp_trap(void)
 {
-	while (1)
-		;
+	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
+		  KVM_RISCV_SELFTESTS_SBI_UNEXP,
+		  0, 0, 0, 0, 0, 0);
 }
 
 void vm_vcpu_add_default(struct kvm_vm *vm, uint32_t vcpuid, void *guest_code)
@@ -310,7 +311,7 @@ void vm_vcpu_add_default(struct kvm_vm *vm, uint32_t vcpuid, void *guest_code)
 
 	/* Setup default exception vector of guest */
 	set_reg(vm, vcpuid, RISCV_CSR_REG(stvec),
-		(unsigned long)guest_hang);
+		(unsigned long)guest_unexp_trap);
 }
 
 void vcpu_args_set(struct kvm_vm *vm, uint32_t vcpuid, unsigned int num, ...)
diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index 9e42d8248fa6..8550f424d093 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -60,8 +60,9 @@ void ucall(uint64_t cmd, int nargs, ...)
 		uc.args[i] = va_arg(va, uint64_t);
 	va_end(va);
 
-	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT, 0, (vm_vaddr_t)&uc,
-		  0, 0, 0, 0, 0);
+	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
+		  KVM_RISCV_SELFTESTS_SBI_UCALL,
+		  (vm_vaddr_t)&uc, 0, 0, 0, 0, 0);
 }
 
 uint64_t get_ucall(struct kvm_vm *vm, uint32_t vcpu_id, struct ucall *uc)
@@ -73,14 +74,24 @@ uint64_t get_ucall(struct kvm_vm *vm, uint32_t vcpu_id, struct ucall *uc)
 		memset(uc, 0, sizeof(*uc));
 
 	if (run->exit_reason == KVM_EXIT_RISCV_SBI &&
-	    run->riscv_sbi.extension_id == KVM_RISCV_SELFTESTS_SBI_EXT &&
-	    run->riscv_sbi.function_id == 0) {
-		memcpy(&ucall, addr_gva2hva(vm, run->riscv_sbi.args[0]),
-			sizeof(ucall));
-
-		vcpu_run_complete_io(vm, vcpu_id);
-		if (uc)
-			memcpy(uc, &ucall, sizeof(ucall));
+	    run->riscv_sbi.extension_id == KVM_RISCV_SELFTESTS_SBI_EXT) {
+		switch (run->riscv_sbi.function_id) {
+		case KVM_RISCV_SELFTESTS_SBI_UCALL:
+			memcpy(&ucall, addr_gva2hva(vm,
+			       run->riscv_sbi.args[0]), sizeof(ucall));
+
+			vcpu_run_complete_io(vm, vcpu_id);
+			if (uc)
+				memcpy(uc, &ucall, sizeof(ucall));
+
+			break;
+		case KVM_RISCV_SELFTESTS_SBI_UNEXP:
+			vcpu_dump(stderr, vm, vcpu_id, 2);
+			TEST_ASSERT(0, "Unexpected trap taken by guest");
+			break;
+		default:
+			break;
+		}
 	}
 
 	return ucall.cmd;
-- 
2.25.1



From: Chao Du <duchao@eswincomputing.com>
Date: Tue,  2 Apr 2024 06:26:28 +0000
Subject: [PATCH v4 3/3] RISC-V: KVM: selftests: Add ebreak test support
In-Reply-To: <20240402062628.5425-1-duchao@eswincomputing.com>
References: <20240402062628.5425-1-duchao@eswincomputing.com>
Message-ID: <20240402062628.5425-4-duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Initial support for RISC-V KVM ebreak test. Check the exit reason and
the PC when guest debug is enabled. Also to make sure the guest could
handle the ebreak exception without exiting to the VMM when guest debug
is not enabled.

Signed-off-by: Chao Du <duchao@eswincomputing.com>
---
 tools/testing/selftests/kvm/Makefile          |  1 +
 .../testing/selftests/kvm/riscv/ebreak_test.c | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/riscv/ebreak_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 741c7dc16afc..7f4430242c9e 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -189,6 +189,7 @@ TEST_GEN_PROGS_s390x += rseq_test
 TEST_GEN_PROGS_s390x += set_memory_region_test
 TEST_GEN_PROGS_s390x += kvm_binary_stats_test
 
+TEST_GEN_PROGS_riscv += riscv/ebreak_test
 TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += demand_paging_test
 TEST_GEN_PROGS_riscv += dirty_log_test
diff --git a/tools/testing/selftests/kvm/riscv/ebreak_test.c b/tools/testing/selftests/kvm/riscv/ebreak_test.c
new file mode 100644
index 000000000000..823c132069b4
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/ebreak_test.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RISC-V KVM ebreak test.
+ *
+ * Copyright 2024 Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ */
+#include "kvm_util.h"
+
+#define LABEL_ADDRESS(v) ((uint64_t)&(v))
+
+extern unsigned char sw_bp_1, sw_bp_2;
+static uint64_t sw_bp_addr;
+
+static void guest_code(void)
+{
+	asm volatile(
+		".option push\n"
+		".option norvc\n"
+		"sw_bp_1: ebreak\n"
+		"sw_bp_2: ebreak\n"
+		".option pop\n"
+	);
+	GUEST_ASSERT_EQ(READ_ONCE(sw_bp_addr), LABEL_ADDRESS(sw_bp_2));
+
+	GUEST_DONE();
+}
+
+static void guest_breakpoint_handler(struct ex_regs *regs)
+{
+	WRITE_ONCE(sw_bp_addr, regs->epc);
+	regs->epc += 4;
+}
+
+int main(void)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	uint64_t pc;
+	struct kvm_guest_debug debug = {
+		.control = KVM_GUESTDBG_ENABLE,
+	};
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_SET_GUEST_DEBUG));
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	vm_init_vector_tables(vm);
+	vcpu_init_vector_tables(vcpu);
+	vm_install_exception_handler(vm, EXC_BREAKPOINT,
+					guest_breakpoint_handler);
+
+	/*
+	 * Enable the guest debug.
+	 * ebreak should exit to the VMM with KVM_EXIT_DEBUG reason.
+	 */
+	vcpu_guest_debug_set(vcpu, &debug);
+	vcpu_run(vcpu);
+
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_DEBUG);
+
+	vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.pc), &pc);
+	TEST_ASSERT_EQ(pc, LABEL_ADDRESS(sw_bp_1));
+
+	/* skip sw_bp_1 */
+	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), pc + 4);
+
+	/*
+	 * Disable all debug controls.
+	 * Guest should handle the ebreak without exiting to the VMM.
+	 */
+	memset(&debug, 0, sizeof(debug));
+	vcpu_guest_debug_set(vcpu, &debug);
+
+	vcpu_run(vcpu);
+
+	TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_DONE);
+
+	kvm_vm_free(vm);
+
+	return 0;
+}
-- 
2.17.1



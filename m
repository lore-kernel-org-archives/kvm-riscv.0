From: Zeng Guang <guang.zeng@intel.com>
Date: Thu,  2 Nov 2023 23:51:07 +0800
Subject: [RFC PATCH v1 4/8] KVM : selftests : Adapt selftest cases to kernel canonical linear address
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
Message-ID: <20231102155111.28821-5-guang.zeng@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adapt RIP to kernel canonical linear address in test cases
set_memory_region_test/debug_regs/userspace_msr_exit_test.

No functional change intended.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../testing/selftests/kvm/set_memory_region_test.c  | 13 ++++++++++---
 tools/testing/selftests/kvm/x86_64/debug_regs.c     |  2 +-
 .../selftests/kvm/x86_64/userspace_msr_exit_test.c  |  9 +++++----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index b32960189f5f..8ab897bae3e0 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -31,6 +31,12 @@
 #define MEM_REGION_GPA		0xc0000000
 #define MEM_REGION_SLOT		10
 
+/*
+ * Offset to execute code at kernel address space
+ */
+#define KERNEL_LNA_OFFSET	0xffff800000000000
+#define CAST_TO_KERN(x)		(x | KERNEL_LNA_OFFSET)
+
 static const uint64_t MMIO_VAL = 0xbeefull;
 
 extern const uint64_t final_rip_start;
@@ -300,10 +306,11 @@ static void test_delete_memory_region(void)
 	 * so the instruction pointer would point to the reset vector.
 	 */
 	if (run->exit_reason == KVM_EXIT_INTERNAL_ERROR)
-		TEST_ASSERT(regs.rip >= final_rip_start &&
-			    regs.rip < final_rip_end,
+		TEST_ASSERT(regs.rip >= CAST_TO_KERN(final_rip_start) &&
+			    regs.rip < CAST_TO_KERN(final_rip_end),
 			    "Bad rip, expected 0x%lx - 0x%lx, got 0x%llx\n",
-			    final_rip_start, final_rip_end, regs.rip);
+			    CAST_TO_KERN(final_rip_start), CAST_TO_KERN(final_rip_end),
+			    regs.rip);
 
 	kvm_vm_free(vm);
 }
diff --git a/tools/testing/selftests/kvm/x86_64/debug_regs.c b/tools/testing/selftests/kvm/x86_64/debug_regs.c
index f6b295e0b2d2..73ce373e3299 100644
--- a/tools/testing/selftests/kvm/x86_64/debug_regs.c
+++ b/tools/testing/selftests/kvm/x86_64/debug_regs.c
@@ -64,7 +64,7 @@ static void guest_code(void)
 	GUEST_DONE();
 }
 
-#define  CAST_TO_RIP(v)  ((unsigned long long)&(v))
+#define  CAST_TO_RIP(v)  ((unsigned long long)&(v) | KERNEL_LNA_OFFSET)
 
 static void vcpu_skip_insn(struct kvm_vcpu *vcpu, int insn_len)
 {
diff --git a/tools/testing/selftests/kvm/x86_64/userspace_msr_exit_test.c b/tools/testing/selftests/kvm/x86_64/userspace_msr_exit_test.c
index 3533dc2fbfee..ab6b3f88352f 100644
--- a/tools/testing/selftests/kvm/x86_64/userspace_msr_exit_test.c
+++ b/tools/testing/selftests/kvm/x86_64/userspace_msr_exit_test.c
@@ -18,6 +18,7 @@
 static int fep_available = 1;
 
 #define MSR_NON_EXISTENT 0x474f4f00
+#define CAST_TO_KERN(x)  (x | KERNEL_LNA_OFFSET)
 
 static u64 deny_bits = 0;
 struct kvm_msr_filter filter_allow = {
@@ -363,12 +364,12 @@ static void __guest_gp_handler(struct ex_regs *regs,
 			       char *r_start, char *r_end,
 			       char *w_start, char *w_end)
 {
-	if (regs->rip == (uintptr_t)r_start) {
-		regs->rip = (uintptr_t)r_end;
+	if (regs->rip == CAST_TO_KERN((uintptr_t)r_start)) {
+		regs->rip = CAST_TO_KERN((uintptr_t)r_end);
 		regs->rax = 0;
 		regs->rdx = 0;
-	} else if (regs->rip == (uintptr_t)w_start) {
-		regs->rip = (uintptr_t)w_end;
+	} else if (regs->rip == CAST_TO_KERN((uintptr_t)w_start)) {
+		regs->rip = CAST_TO_KERN((uintptr_t)w_end);
 	} else {
 		GUEST_ASSERT(!"RIP is at an unknown location!");
 	}
-- 
2.21.3



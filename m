From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed,  6 Dec 2023 18:02:46 +0100
Subject: [PATCH 4/5] KVM: selftests: s390x: Remove redundant newlines
In-Reply-To: <20231206170241.82801-7-ajones@ventanamicro.com>
References: <20231206170241.82801-7-ajones@ventanamicro.com>
Message-ID: <20231206170241.82801-11-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

TEST_* functions append their own newline. Remove newlines from
TEST_* callsites to avoid extra newlines in output.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/lib/s390x/processor.c       |  2 +-
 tools/testing/selftests/kvm/s390x/resets.c    |  4 ++--
 .../selftests/kvm/s390x/sync_regs_test.c      | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/s390x/processor.c b/tools/testing/selftests/kvm/lib/s390x/processor.c
index 15945121daf1..f6d227892cbc 100644
--- a/tools/testing/selftests/kvm/lib/s390x/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390x/processor.c
@@ -198,7 +198,7 @@ void vcpu_args_set(struct kvm_vcpu *vcpu, unsigned int num, ...)
 	int i;
 
 	TEST_ASSERT(num >= 1 && num <= 5, "Unsupported number of args,\n"
-		    "  num: %u\n",
+		    "  num: %u",
 		    num);
 
 	va_start(ap, num);
diff --git a/tools/testing/selftests/kvm/s390x/resets.c b/tools/testing/selftests/kvm/s390x/resets.c
index e41e2cb8ffa9..357943f2bea8 100644
--- a/tools/testing/selftests/kvm/s390x/resets.c
+++ b/tools/testing/selftests/kvm/s390x/resets.c
@@ -78,7 +78,7 @@ static void assert_noirq(struct kvm_vcpu *vcpu)
 	 * (notably, the emergency call interrupt we have injected) should
 	 * be cleared by the resets, so this should be 0.
 	 */
-	TEST_ASSERT(irqs >= 0, "Could not fetch IRQs: errno %d\n", errno);
+	TEST_ASSERT(irqs >= 0, "Could not fetch IRQs: errno %d", errno);
 	TEST_ASSERT(!irqs, "IRQ pending");
 }
 
@@ -199,7 +199,7 @@ static void inject_irq(struct kvm_vcpu *vcpu)
 	irq->type = KVM_S390_INT_EMERGENCY;
 	irq->u.emerg.code = vcpu->id;
 	irqs = __vcpu_ioctl(vcpu, KVM_S390_SET_IRQ_STATE, &irq_state);
-	TEST_ASSERT(irqs >= 0, "Error injecting EMERGENCY IRQ errno %d\n", errno);
+	TEST_ASSERT(irqs >= 0, "Error injecting EMERGENCY IRQ errno %d", errno);
 }
 
 static struct kvm_vm *create_vm(struct kvm_vcpu **vcpu)
diff --git a/tools/testing/selftests/kvm/s390x/sync_regs_test.c b/tools/testing/selftests/kvm/s390x/sync_regs_test.c
index 636a70ddac1e..43fb25ddc3ec 100644
--- a/tools/testing/selftests/kvm/s390x/sync_regs_test.c
+++ b/tools/testing/selftests/kvm/s390x/sync_regs_test.c
@@ -39,13 +39,13 @@ static void guest_code(void)
 #define REG_COMPARE(reg) \
 	TEST_ASSERT(left->reg == right->reg, \
 		    "Register " #reg \
-		    " values did not match: 0x%llx, 0x%llx\n", \
+		    " values did not match: 0x%llx, 0x%llx", \
 		    left->reg, right->reg)
 
 #define REG_COMPARE32(reg) \
 	TEST_ASSERT(left->reg == right->reg, \
 		    "Register " #reg \
-		    " values did not match: 0x%x, 0x%x\n", \
+		    " values did not match: 0x%x, 0x%x", \
 		    left->reg, right->reg)
 
 
@@ -82,14 +82,14 @@ void test_read_invalid(struct kvm_vcpu *vcpu)
 	run->kvm_valid_regs = INVALID_SYNC_FIELD;
 	rv = _vcpu_run(vcpu);
 	TEST_ASSERT(rv < 0 && errno == EINVAL,
-		    "Invalid kvm_valid_regs did not cause expected KVM_RUN error: %d\n",
+		    "Invalid kvm_valid_regs did not cause expected KVM_RUN error: %d",
 		    rv);
 	run->kvm_valid_regs = 0;
 
 	run->kvm_valid_regs = INVALID_SYNC_FIELD | TEST_SYNC_FIELDS;
 	rv = _vcpu_run(vcpu);
 	TEST_ASSERT(rv < 0 && errno == EINVAL,
-		    "Invalid kvm_valid_regs did not cause expected KVM_RUN error: %d\n",
+		    "Invalid kvm_valid_regs did not cause expected KVM_RUN error: %d",
 		    rv);
 	run->kvm_valid_regs = 0;
 }
@@ -103,14 +103,14 @@ void test_set_invalid(struct kvm_vcpu *vcpu)
 	run->kvm_dirty_regs = INVALID_SYNC_FIELD;
 	rv = _vcpu_run(vcpu);
 	TEST_ASSERT(rv < 0 && errno == EINVAL,
-		    "Invalid kvm_dirty_regs did not cause expected KVM_RUN error: %d\n",
+		    "Invalid kvm_dirty_regs did not cause expected KVM_RUN error: %d",
 		    rv);
 	run->kvm_dirty_regs = 0;
 
 	run->kvm_dirty_regs = INVALID_SYNC_FIELD | TEST_SYNC_FIELDS;
 	rv = _vcpu_run(vcpu);
 	TEST_ASSERT(rv < 0 && errno == EINVAL,
-		    "Invalid kvm_dirty_regs did not cause expected KVM_RUN error: %d\n",
+		    "Invalid kvm_dirty_regs did not cause expected KVM_RUN error: %d",
 		    rv);
 	run->kvm_dirty_regs = 0;
 }
@@ -125,12 +125,12 @@ void test_req_and_verify_all_valid_regs(struct kvm_vcpu *vcpu)
 	/* Request and verify all valid register sets. */
 	run->kvm_valid_regs = TEST_SYNC_FIELDS;
 	rv = _vcpu_run(vcpu);
-	TEST_ASSERT(rv == 0, "vcpu_run failed: %d\n", rv);
+	TEST_ASSERT(rv == 0, "vcpu_run failed: %d", rv);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_S390_SIEIC);
 	TEST_ASSERT(run->s390_sieic.icptcode == 4 &&
 		    (run->s390_sieic.ipa >> 8) == 0x83 &&
 		    (run->s390_sieic.ipb >> 16) == 0x501,
-		    "Unexpected interception code: ic=%u, ipa=0x%x, ipb=0x%x\n",
+		    "Unexpected interception code: ic=%u, ipa=0x%x, ipb=0x%x",
 		    run->s390_sieic.icptcode, run->s390_sieic.ipa,
 		    run->s390_sieic.ipb);
 
@@ -161,7 +161,7 @@ void test_set_and_verify_various_reg_values(struct kvm_vcpu *vcpu)
 	}
 
 	rv = _vcpu_run(vcpu);
-	TEST_ASSERT(rv == 0, "vcpu_run failed: %d\n", rv);
+	TEST_ASSERT(rv == 0, "vcpu_run failed: %d", rv);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_S390_SIEIC);
 	TEST_ASSERT(run->s.regs.gprs[11] == 0xBAD1DEA + 1,
 		    "r11 sync regs value incorrect 0x%llx.",
@@ -193,7 +193,7 @@ void test_clear_kvm_dirty_regs_bits(struct kvm_vcpu *vcpu)
 	run->s.regs.gprs[11] = 0xDEADBEEF;
 	run->s.regs.diag318 = 0x4B1D;
 	rv = _vcpu_run(vcpu);
-	TEST_ASSERT(rv == 0, "vcpu_run failed: %d\n", rv);
+	TEST_ASSERT(rv == 0, "vcpu_run failed: %d", rv);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_S390_SIEIC);
 	TEST_ASSERT(run->s.regs.gprs[11] != 0xDEADBEEF,
 		    "r11 sync regs value incorrect 0x%llx.",
-- 
2.43.0



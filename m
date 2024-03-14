From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Mar 2024 16:26:25 -0700
Subject: [PATCH 06/18] KVM: selftests: Rework platform_info_test to actually
 verify #GP
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com>
Message-ID: <20240314232637.2538648-7-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rework platform_info_test to actually handle and verify the expected #GP
on RDMSR when the associated KVM capability is disabled.  Currently, the
test _deliberately_ doesn't handle the #GP, and instead lets it escalated
to a triple fault shutdown.

In addition to verifying that KVM generates the correct fault, handling
the #GP will be necessary (without even more shenanigans) when a future
change to the core KVM selftests library configures the IDT and exception
handlers by default (the test subtly relies on the IDT limit being '0').

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86_64/platform_info_test.c | 66 +++++++++----------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/platform_info_test.c b/tools/testing/selftests/kvm/x86_64/platform_info_test.c
index cdad7e2124c8..6300bb70f028 100644
--- a/tools/testing/selftests/kvm/x86_64/platform_info_test.c
+++ b/tools/testing/selftests/kvm/x86_64/platform_info_test.c
@@ -26,40 +26,18 @@
 static void guest_code(void)
 {
 	uint64_t msr_platform_info;
+	uint8_t vector;
 
-	for (;;) {
-		msr_platform_info = rdmsr(MSR_PLATFORM_INFO);
-		GUEST_ASSERT_EQ(msr_platform_info & MSR_PLATFORM_INFO_MAX_TURBO_RATIO,
-				MSR_PLATFORM_INFO_MAX_TURBO_RATIO);
-		GUEST_SYNC(0);
-		asm volatile ("inc %r11");
-	}
-}
+	GUEST_SYNC(true);
+	msr_platform_info = rdmsr(MSR_PLATFORM_INFO);
+	GUEST_ASSERT_EQ(msr_platform_info & MSR_PLATFORM_INFO_MAX_TURBO_RATIO,
+			MSR_PLATFORM_INFO_MAX_TURBO_RATIO);
 
-static void test_msr_platform_info_enabled(struct kvm_vcpu *vcpu)
-{
-	struct ucall uc;
+	GUEST_SYNC(false);
+	vector = rdmsr_safe(MSR_PLATFORM_INFO, &msr_platform_info);
+	GUEST_ASSERT_EQ(vector, GP_VECTOR);
 
-	vm_enable_cap(vcpu->vm, KVM_CAP_MSR_PLATFORM_INFO, true);
-	vcpu_run(vcpu);
-	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
-
-	switch (get_ucall(vcpu, &uc)) {
-	case UCALL_SYNC:
-		break;
-	case UCALL_ABORT:
-		REPORT_GUEST_ASSERT(uc);
-	default:
-		TEST_FAIL("Unexpected ucall %lu", uc.cmd);
-		break;
-	}
-}
-
-static void test_msr_platform_info_disabled(struct kvm_vcpu *vcpu)
-{
-	vm_enable_cap(vcpu->vm, KVM_CAP_MSR_PLATFORM_INFO, false);
-	vcpu_run(vcpu);
-	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_SHUTDOWN);
+	GUEST_DONE();
 }
 
 int main(int argc, char *argv[])
@@ -67,16 +45,38 @@ int main(int argc, char *argv[])
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	uint64_t msr_platform_info;
+	struct ucall uc;
 
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_MSR_PLATFORM_INFO));
 
 	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
 
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(vcpu);
+
 	msr_platform_info = vcpu_get_msr(vcpu, MSR_PLATFORM_INFO);
 	vcpu_set_msr(vcpu, MSR_PLATFORM_INFO,
 		     msr_platform_info | MSR_PLATFORM_INFO_MAX_TURBO_RATIO);
-	test_msr_platform_info_enabled(vcpu);
-	test_msr_platform_info_disabled(vcpu);
+
+	for (;;) {
+		vcpu_run(vcpu);
+		TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_SYNC:
+			vm_enable_cap(vm, KVM_CAP_MSR_PLATFORM_INFO, uc.args[1]);
+			break;
+		case UCALL_DONE:
+			goto done;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+		default:
+			TEST_FAIL("Unexpected ucall %lu", uc.cmd);
+			break;
+		}
+	}
+
+done:
 	vcpu_set_msr(vcpu, MSR_PLATFORM_INFO, msr_platform_info);
 
 	kvm_vm_free(vm);
-- 
2.44.0.291.gc1ea87d7ee-goog



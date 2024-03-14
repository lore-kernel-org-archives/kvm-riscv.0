From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Mar 2024 16:26:24 -0700
Subject: [PATCH 05/18] KVM: selftests: Move platform_info_test's main assert
 into guest code
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com>
Message-ID: <20240314232637.2538648-6-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As a first step toward gracefully handling the expected #GP on RDMSR in
platform_info_test, move the test's assert on the non-faulting RDMSR
result into the guest itself.  This will allow using a unified flow for
the host userspace side of things.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86_64/platform_info_test.c | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/platform_info_test.c b/tools/testing/selftests/kvm/x86_64/platform_info_test.c
index 87011965dc41..cdad7e2124c8 100644
--- a/tools/testing/selftests/kvm/x86_64/platform_info_test.c
+++ b/tools/testing/selftests/kvm/x86_64/platform_info_test.c
@@ -29,7 +29,9 @@ static void guest_code(void)
 
 	for (;;) {
 		msr_platform_info = rdmsr(MSR_PLATFORM_INFO);
-		GUEST_SYNC(msr_platform_info);
+		GUEST_ASSERT_EQ(msr_platform_info & MSR_PLATFORM_INFO_MAX_TURBO_RATIO,
+				MSR_PLATFORM_INFO_MAX_TURBO_RATIO);
+		GUEST_SYNC(0);
 		asm volatile ("inc %r11");
 	}
 }
@@ -42,13 +44,15 @@ static void test_msr_platform_info_enabled(struct kvm_vcpu *vcpu)
 	vcpu_run(vcpu);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
 
-	get_ucall(vcpu, &uc);
-	TEST_ASSERT(uc.cmd == UCALL_SYNC,
-			"Received ucall other than UCALL_SYNC: %lu", uc.cmd);
-	TEST_ASSERT((uc.args[1] & MSR_PLATFORM_INFO_MAX_TURBO_RATIO) ==
-		MSR_PLATFORM_INFO_MAX_TURBO_RATIO,
-		"Expected MSR_PLATFORM_INFO to have max turbo ratio mask: %i.",
-		MSR_PLATFORM_INFO_MAX_TURBO_RATIO);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_SYNC:
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+	default:
+		TEST_FAIL("Unexpected ucall %lu", uc.cmd);
+		break;
+	}
 }
 
 static void test_msr_platform_info_disabled(struct kvm_vcpu *vcpu)
-- 
2.44.0.291.gc1ea87d7ee-goog



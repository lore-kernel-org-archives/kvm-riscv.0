From: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Feb 2024 16:42:57 -0800
Subject: [PATCH v9 10/11] KVM: selftests: Add a basic SEV smoke test
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
References: <20240223004258.3104051-1-seanjc@google.com>
Message-ID: <20240223004258.3104051-11-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Peter Gonda <pgonda@google.com>

Add a basic smoke test for SEV guests to verify that KVM can launch an
SEV guest and run a few instructions without exploding.  To verify that
SEV is indeed enabled, assert that SEV is reported as enabled in
MSR_AMD64_SEV, a.k.a. SEV_STATUS, which cannot be intercepted by KVM
(architecturally enforced).

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerly Tng <ackerleytng@google.com>
cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Suggested-by: Michael Roth <michael.roth@amd.com>
Tested-by: Carlos Bilbao <carlos.bilbao@amd.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
[sean: rename to "sev_smoke_test"]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          |  1 +
 .../selftests/kvm/x86_64/sev_smoke_test.c     | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86_64/sev_smoke_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 169b6ee8f733..da20e6bb43ed 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -120,6 +120,7 @@ TEST_GEN_PROGS_x86_64 += x86_64/vmx_pmu_caps_test
 TEST_GEN_PROGS_x86_64 += x86_64/xen_shinfo_test
 TEST_GEN_PROGS_x86_64 += x86_64/xen_vmcall_test
 TEST_GEN_PROGS_x86_64 += x86_64/sev_migrate_tests
+TEST_GEN_PROGS_x86_64 += x86_64/sev_smoke_test
 TEST_GEN_PROGS_x86_64 += x86_64/amx_test
 TEST_GEN_PROGS_x86_64 += x86_64/max_vcpuid_cap_test
 TEST_GEN_PROGS_x86_64 += x86_64/triple_fault_event_test
diff --git a/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c b/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
new file mode 100644
index 000000000000..54d72efd9b4d
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+#include "svm_util.h"
+#include "linux/psp-sev.h"
+#include "sev.h"
+
+static void guest_sev_code(void)
+{
+	GUEST_ASSERT(this_cpu_has(X86_FEATURE_SEV));
+	GUEST_ASSERT(rdmsr(MSR_AMD64_SEV) & MSR_AMD64_SEV_ENABLED);
+
+	GUEST_DONE();
+}
+
+static void test_sev(void *guest_code, uint64_t policy)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+
+	vm = vm_sev_create_with_one_vcpu(policy, guest_code, &vcpu);
+
+	for (;;) {
+		vcpu_run(vcpu);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_SYNC:
+			continue;
+		case UCALL_DONE:
+			return;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+		default:
+			TEST_FAIL("Unexpected exit: %s",
+				  exit_reason_str(vcpu->run->exit_reason));
+		}
+	}
+
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char *argv[])
+{
+	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV));
+
+	test_sev(guest_sev_code, SEV_POLICY_NO_DBG);
+	test_sev(guest_sev_code, 0);
+
+	return 0;
+}
-- 
2.44.0.rc0.258.g7320e95886-goog



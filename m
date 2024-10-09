From: Sean Christopherson <seanjc@google.com>
Date: Wed,  9 Oct 2024 08:49:48 -0700
Subject: [PATCH v3 09/14] KVM: sefltests: Explicitly include ucall_common.h in mmu_stress_test.c
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
References: <20241009154953.1073471-1-seanjc@google.com>
Message-ID: <20241009154953.1073471-10-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Explicitly include ucall_common.h in the MMU stress test, as unlike arm64
and x86-64, RISC-V doesn't include ucall_common.h in its processor.h, i.e.
this will allow enabling the test on RISC-V.

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 5467b12f5903..fbb693428a82 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -15,6 +15,7 @@
 #include "test_util.h"
 #include "guest_modes.h"
 #include "processor.h"
+#include "ucall_common.h"
 
 static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 {
-- 
2.47.0.rc0.187.ge670bccf7e-goog



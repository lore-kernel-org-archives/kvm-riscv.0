From: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Sep 2024 13:41:55 -0700
Subject: [PATCH v2 10/13] KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
References: <20240911204158.2034295-1-seanjc@google.com>
Message-ID: <20240911204158.2034295-11-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use vcpu_arch_put_guest() to write memory from the guest in
mmu_stress_test as an easy way to provide a bit of extra coverage.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 5467b12f5903..80863e8290db 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -22,7 +22,7 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 
 	for (;;) {
 		for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
-			*((volatile uint64_t *)gpa) = gpa;
+			vcpu_arch_put_guest(*((volatile uint64_t *)gpa), gpa);
 		GUEST_SYNC(0);
 	}
 }
-- 
2.46.0.598.g6f2099f65c-goog



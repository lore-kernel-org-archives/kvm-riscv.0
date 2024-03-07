From: Colin Ian King <colin.i.king@gmail.com>
Date: Thu,  7 Mar 2024 08:19:51 +0000
Subject: [PATCH][next] KVM: selftests: Fix spelling mistake "trigged" -> "triggered"
Message-ID: <20240307081951.1954830-1-colin.i.king@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are spelling mistakes in __GUEST_ASSERT messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/kvm/aarch64/arch_timer.c | 2 +-
 tools/testing/selftests/kvm/riscv/arch_timer.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/arch_timer.c b/tools/testing/selftests/kvm/aarch64/arch_timer.c
index ddba2c2fb5de..16ac74d07d68 100644
--- a/tools/testing/selftests/kvm/aarch64/arch_timer.c
+++ b/tools/testing/selftests/kvm/aarch64/arch_timer.c
@@ -136,7 +136,7 @@ static void guest_run_stage(struct test_vcpu_shared_data *shared_data,
 		irq_iter = READ_ONCE(shared_data->nr_iter);
 		__GUEST_ASSERT(config_iter + 1 == irq_iter,
 				"config_iter + 1 = 0x%lx, irq_iter = 0x%lx.\n"
-				"  Guest timer interrupt was not trigged within the specified\n"
+				"  Guest timer interrupt was not triggered within the specified\n"
 				"  interval, try to increase the error margin by [-e] option.\n",
 				config_iter + 1, irq_iter);
 	}
diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
index e22848f747c0..0f9cabd99fd4 100644
--- a/tools/testing/selftests/kvm/riscv/arch_timer.c
+++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
@@ -60,7 +60,7 @@ static void guest_run(struct test_vcpu_shared_data *shared_data)
 		irq_iter = READ_ONCE(shared_data->nr_iter);
 		__GUEST_ASSERT(config_iter + 1 == irq_iter,
 				"config_iter + 1 = 0x%x, irq_iter = 0x%x.\n"
-				"  Guest timer interrupt was not trigged within the specified\n"
+				"  Guest timer interrupt was not triggered within the specified\n"
 				"  interval, try to increase the error margin by [-e] option.\n",
 				config_iter + 1, irq_iter);
 	}
-- 
2.39.2



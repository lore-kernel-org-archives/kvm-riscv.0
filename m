From: Haibo Xu <haibo1.xu@intel.com>
Date: Mon, 22 Jan 2024 17:58:33 +0800
Subject: [PATCH v5 03/12] KVM: arm64: selftests: Enable tuning of error margin in arch_timer test
In-Reply-To: <cover.1705916069.git.haibo1.xu@intel.com>
References: <cover.1705916069.git.haibo1.xu@intel.com>
Message-ID: <e75f59a1957aa782807b6d361655bde83fce483c.1705916069.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are intermittent failures occurred when stressing the
arch-timer test in a Qemu VM:

 Guest assert failed,  vcpu 0; stage; 4; iter: 3
 ==== Test Assertion Failure ====
   aarch64/arch_timer.c:196: config_iter + 1 == irq_iter
   pid=4048 tid=4049 errno=4 - Interrupted system call
      1  0x000000000040253b: test_vcpu_run at arch_timer.c:248
      2  0x0000ffffb60dd5c7: ?? ??:0
      3  0x0000ffffb6145d1b: ?? ??:0
   0x3 != 0x2 (config_iter + 1 != irq_iter)e

Further test and debug show that the timeout for an interrupt
to arrive do have random high fluctuation, espectially when
testing in an virtual environment.

To alleviate this issue, just expose the timeout value as user
configurable and print some hint message to increase the value
when hitting the failure..

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/aarch64/arch_timer.c        | 32 +++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/arch_timer.c b/tools/testing/selftests/kvm/aarch64/arch_timer.c
index 3260fefcc1b3..9b9a119bdd61 100644
--- a/tools/testing/selftests/kvm/aarch64/arch_timer.c
+++ b/tools/testing/selftests/kvm/aarch64/arch_timer.c
@@ -6,16 +6,18 @@
  * CVAL and TVAL registers. This consitutes the four stages in the test.
  * The guest's main thread configures the timer interrupt for a stage
  * and waits for it to fire, with a timeout equal to the timer period.
- * It asserts that the timeout doesn't exceed the timer period.
+ * It asserts that the timeout doesn't exceed the timer period plus
+ * a user configurable error margin(default to 100us).
  *
  * On the other hand, upon receipt of an interrupt, the guest's interrupt
  * handler validates the interrupt by checking if the architectural state
  * is in compliance with the specifications.
  *
  * The test provides command-line options to configure the timer's
- * period (-p), number of vCPUs (-n), and iterations per stage (-i).
- * To stress-test the timer stack even more, an option to migrate the
- * vCPUs across pCPUs (-m), at a particular rate, is also provided.
+ * period (-p), number of vCPUs (-n), iterations per stage (-i) and timer
+ * interrupt arrival error margin (-e). To stress-test the timer stack
+ * even more, an option to migrate the vCPUs across pCPUs (-m), at a
+ * particular rate, is also provided.
  *
  * Copyright (c) 2021, Google LLC.
  */
@@ -46,6 +48,7 @@ struct test_args {
 	uint32_t nr_iter;
 	uint32_t timer_period_ms;
 	uint32_t migration_freq_ms;
+	uint32_t timer_err_margin_us;
 	struct kvm_arm_counter_offset offset;
 };
 
@@ -54,6 +57,7 @@ static struct test_args test_args = {
 	.nr_iter = NR_TEST_ITERS_DEF,
 	.timer_period_ms = TIMER_TEST_PERIOD_MS_DEF,
 	.migration_freq_ms = TIMER_TEST_MIGRATION_FREQ_MS,
+	.timer_err_margin_us = TIMER_TEST_ERR_MARGIN_US,
 	.offset = { .reserved = 1 },
 };
 
@@ -190,10 +194,14 @@ static void guest_run_stage(struct test_vcpu_shared_data *shared_data,
 
 		/* Setup a timeout for the interrupt to arrive */
 		udelay(msecs_to_usecs(test_args.timer_period_ms) +
-			TIMER_TEST_ERR_MARGIN_US);
+			test_args.timer_err_margin_us);
 
 		irq_iter = READ_ONCE(shared_data->nr_iter);
-		GUEST_ASSERT_EQ(config_iter + 1, irq_iter);
+		__GUEST_ASSERT(config_iter + 1 == irq_iter,
+				"config_iter + 1 = 0x%lx, irq_iter = 0x%lx.\n"
+				"  Guest timer interrupt was not trigged within the specified\n"
+				"  interval, try to increase the error margin by [-e] option.\n",
+				config_iter + 1, irq_iter);
 	}
 }
 
@@ -408,8 +416,9 @@ static void test_vm_cleanup(struct kvm_vm *vm)
 
 static void test_print_help(char *name)
 {
-	pr_info("Usage: %s [-h] [-n nr_vcpus] [-i iterations] [-p timer_period_ms]\n",
-		name);
+	pr_info("Usage: %s [-h] [-n nr_vcpus] [-i iterations] [-p timer_period_ms]\n"
+		"\t\t    [-m migration_freq_ms] [-o counter_offset]\n"
+		"\t\t    [-e timer_err_margin_us]\n", name);
 	pr_info("\t-n: Number of vCPUs to configure (default: %u; max: %u)\n",
 		NR_VCPUS_DEF, KVM_MAX_VCPUS);
 	pr_info("\t-i: Number of iterations per stage (default: %u)\n",
@@ -419,6 +428,8 @@ static void test_print_help(char *name)
 	pr_info("\t-m: Frequency (in ms) of vCPUs to migrate to different pCPU. 0 to turn off (default: %u)\n",
 		TIMER_TEST_MIGRATION_FREQ_MS);
 	pr_info("\t-o: Counter offset (in counter cycles, default: 0)\n");
+	pr_info("\t-e: Interrupt arrival error margin (in us) of the guest timer (default: %u)\n",
+		TIMER_TEST_ERR_MARGIN_US);
 	pr_info("\t-h: print this help screen\n");
 }
 
@@ -426,7 +437,7 @@ static bool parse_args(int argc, char *argv[])
 {
 	int opt;
 
-	while ((opt = getopt(argc, argv, "hn:i:p:m:o:")) != -1) {
+	while ((opt = getopt(argc, argv, "hn:i:p:m:o:e:")) != -1) {
 		switch (opt) {
 		case 'n':
 			test_args.nr_vcpus = atoi_positive("Number of vCPUs", optarg);
@@ -445,6 +456,9 @@ static bool parse_args(int argc, char *argv[])
 		case 'm':
 			test_args.migration_freq_ms = atoi_non_negative("Frequency", optarg);
 			break;
+		case 'e':
+			test_args.timer_err_margin_us = atoi_non_negative("Error Margin", optarg);
+			break;
 		case 'o':
 			test_args.offset.counter_offset = strtol(optarg, NULL, 0);
 			test_args.offset.reserved = 0;
-- 
2.34.1



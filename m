From: Vipin Sharma <vipinsh@google.com>
Date: Fri, 21 Apr 2023 09:53:00 -0700
Subject: [PATCH 4/9] KVM: selftests: Print read and write accesses of pages by
 vCPUs in dirty_log_perf_test
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
References: <20230421165305.804301-1-vipinsh@google.com>
Message-ID: <20230421165305.804301-5-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fetch read and write accesses of pages from guest code and print count
across all vCPUs in dirty_log_perf_test.

This data provides progress made by vCPUs during dirty logging
operations. Since, vCPUs execute in lockstep with userspace dirty log
iterations, this metric is not very interesting. However, in future
commits when dirty_log_perf_test can execute vCPUs independently from
dirty log iterations then this metric can give good measure of vCPUs
performance during dirty logging.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../selftests/kvm/dirty_log_perf_test.c        | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_perf_test.c b/tools/testing/selftests/kvm/dirty_log_perf_test.c
index 338f03a4a550..0a08a3d21123 100644
--- a/tools/testing/selftests/kvm/dirty_log_perf_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_perf_test.c
@@ -12,6 +12,7 @@
 #include <stdlib.h>
 #include <time.h>
 #include <pthread.h>
+#include <stdatomic.h>
 #include <linux/bitmap.h>
 
 #include "kvm_util.h"
@@ -66,17 +67,22 @@ static u64 dirty_log_manual_caps;
 static bool host_quit;
 static int iteration;
 static int vcpu_last_completed_iteration[KVM_MAX_VCPUS];
+static atomic_ullong total_reads;
+static atomic_ullong total_writes;
 
 static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 {
 	struct kvm_vcpu *vcpu = vcpu_args->vcpu;
 	int vcpu_idx = vcpu_args->vcpu_idx;
 	uint64_t pages_count = 0;
+	uint64_t reads = 0;
+	uint64_t writes = 0;
 	struct kvm_run *run;
 	struct timespec start;
 	struct timespec ts_diff;
 	struct timespec total = (struct timespec){0};
 	struct timespec avg;
+	struct ucall uc = {};
 	int ret;
 
 	run = vcpu->run;
@@ -89,7 +95,7 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 		ts_diff = timespec_elapsed(start);
 
 		TEST_ASSERT(ret == 0, "vcpu_run failed: %d\n", ret);
-		TEST_ASSERT(get_ucall(vcpu, NULL) == UCALL_SYNC,
+		TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_SYNC,
 			    "Invalid guest sync status: exit_reason=%s\n",
 			    exit_reason_str(run->exit_reason));
 
@@ -101,6 +107,8 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 		if (current_iteration) {
 			pages_count += vcpu_args->pages;
 			total = timespec_add(total, ts_diff);
+			reads += uc.args[2];
+			writes += uc.args[3];
 			pr_debug("vCPU %d iteration %d dirty memory time: %ld.%.9lds\n",
 				vcpu_idx, current_iteration, ts_diff.tv_sec,
 				ts_diff.tv_nsec);
@@ -123,6 +131,8 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 	pr_debug("\nvCPU %d dirtied 0x%lx pages over %d iterations in %ld.%.9lds. (Avg %ld.%.9lds/iteration)\n",
 		vcpu_idx, pages_count, vcpu_last_completed_iteration[vcpu_idx],
 		total.tv_sec, total.tv_nsec, avg.tv_sec, avg.tv_nsec);
+	atomic_fetch_add(&total_reads, reads);
+	atomic_fetch_add(&total_writes, writes);
 }
 
 struct test_params {
@@ -176,6 +186,8 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 			      dirty_log_manual_caps);
 
 	arch_setup_vm(vm, nr_vcpus);
+	atomic_store(&total_reads, 0);
+	atomic_store(&total_writes, 0);
 
 	/* Start the iterations */
 	iteration = 0;
@@ -295,6 +307,10 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 			clear_dirty_log_total.tv_nsec, avg.tv_sec, avg.tv_nsec);
 	}
 
+	pr_info("Total pages touched: %llu (Reads: %llu, Writes: %llu)\n",
+		atomic_load(&total_reads) + atomic_load(&total_writes),
+		atomic_load(&total_reads), atomic_load(&total_writes));
+
 	memstress_free_bitmaps(bitmaps, p->slots);
 	arch_cleanup_vm(vm);
 	memstress_destroy_vm(vm);
-- 
2.40.0.634.g4ca3ef3211-goog



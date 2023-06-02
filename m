From: Vipin Sharma <vipinsh@google.com>
Date: Fri,  2 Jun 2023 09:09:00 -0700
Subject: [PATCH v2 02/16] KVM: selftests: Add optional delay between
 consecutive clear-dirty-log calls
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
Message-ID: <20230602160914.4011728-3-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In dirty_log_perf_test, add option "-l" to wait between consecutive
clear-dirty-log calls. Accept delay from user in milliseconds. If option
is not provided then fallback to no wait between clear calls.

This allows dirty_log_perf_test to mimic real world use where after
clearing dirty memory, some time is spent in transferring memory before
making a subsequeunt clear-dirty-log call.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../selftests/kvm/dirty_log_perf_test.c       | 35 +++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_perf_test.c b/tools/testing/selftests/kvm/dirty_log_perf_test.c
index 119ddfc7306e..2e31f13aaba6 100644
--- a/tools/testing/selftests/kvm/dirty_log_perf_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_perf_test.c
@@ -135,6 +135,7 @@ struct test_params {
 	uint32_t random_seed;
 	bool random_access;
 	uint64_t clear_chunk_size;
+	int clear_chunk_wait_time_ms;
 };
 
 static void toggle_dirty_logging(struct kvm_vm *vm, int slots, bool enable)
@@ -173,8 +174,14 @@ static void get_dirty_log(struct kvm_vm *vm, unsigned long *bitmaps[], int slots
 static void clear_dirty_log_in_chunks(struct kvm_vm *vm,
 				      unsigned long *bitmaps[], int slots,
 				      uint64_t pages_per_slot,
-				      uint64_t pages_per_clear)
+				      uint64_t pages_per_clear, int wait_ms,
+				      struct timespec *time_taken)
 {
+	struct timespec wait = {
+		.tv_sec = wait_ms / 1000,
+		.tv_nsec = (wait_ms % 1000) * 1000000ull,
+	};
+	struct timespec start, end;
 	uint64_t from, clear_pages_count;
 	int i, slot;
 
@@ -186,12 +193,17 @@ static void clear_dirty_log_in_chunks(struct kvm_vm *vm,
 		while (from < pages_per_slot) {
 			if (from + clear_pages_count > pages_per_slot)
 				clear_pages_count = pages_per_slot - from;
+			clock_gettime(CLOCK_MONOTONIC, &start);
 			kvm_vm_clear_dirty_log(vm, slot, bitmaps[i], from,
 					       clear_pages_count);
+			end = timespec_elapsed(start);
+			*time_taken = timespec_add(*time_taken, end);
 			from += clear_pages_count;
+			if (wait_ms)
+				nanosleep(&wait, NULL);
+
 		}
 	}
-
 }
 
 static unsigned long **alloc_bitmaps(int slots, uint64_t pages_per_slot)
@@ -329,11 +341,11 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 			iteration, ts_diff.tv_sec, ts_diff.tv_nsec);
 
 		if (dirty_log_manual_caps) {
-			clock_gettime(CLOCK_MONOTONIC, &start);
 			clear_dirty_log_in_chunks(vm, bitmaps, p->slots,
 						  pages_per_slot,
-						  pages_per_clear);
-			ts_diff = timespec_elapsed(start);
+						  pages_per_clear,
+						  p->clear_chunk_wait_time_ms,
+						  &ts_diff);
 			clear_dirty_log_total = timespec_add(clear_dirty_log_total,
 							     ts_diff);
 			pr_info("Iteration %d clear dirty log time: %ld.%.9lds\n",
@@ -435,6 +447,11 @@ static void help(char *name)
 	       "     the memslot size then whole memslot is cleared in one call.\n"
 	       "     Size must be aligned to the host page size. e.g. 10M or 3G\n"
 	       "     (default: UINT64_MAX, clears whole memslot in one call)\n");
+	printf(" -l: Specify time in milliseconds to wait after Clear-Dirty-Log\n"
+	       "     call. This allows to mimic use cases where flow is to get\n"
+	       "     dirty log followed by multiple clear dirty log calls and\n"
+	       "     sending corresponding memory to destination (in this test\n"
+	       "     sending will be just idle waiting)\n");
 	puts("");
 	exit(0);
 }
@@ -451,6 +468,7 @@ int main(int argc, char *argv[])
 		.random_seed = 1,
 		.write_percent = 100,
 		.clear_chunk_size = UINT64_MAX,
+		.clear_chunk_wait_time_ms = 0,
 	};
 	int opt;
 
@@ -461,7 +479,7 @@ int main(int argc, char *argv[])
 
 	guest_modes_append_default();
 
-	while ((opt = getopt(argc, argv, "ab:c:eghi:k:m:nop:r:s:v:x:w:")) != -1) {
+	while ((opt = getopt(argc, argv, "ab:c:eghi:k:l:m:nop:r:s:v:x:w:")) != -1) {
 		switch (opt) {
 		case 'a':
 			p.random_access = true;
@@ -488,6 +506,11 @@ int main(int argc, char *argv[])
 		case 'k':
 			p.clear_chunk_size = parse_size(optarg);
 			break;
+		case 'l':
+			p.clear_chunk_wait_time_ms =
+					atoi_non_negative("Clear dirty log chunks wait time",
+							  optarg);
+			break;
 		case 'm':
 			guest_modes_cmdline(optarg);
 			break;
-- 
2.41.0.rc0.172.g3f132b7071-goog



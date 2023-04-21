From: Vipin Sharma <vipinsh@google.com>
Date: Fri, 21 Apr 2023 09:52:58 -0700
Subject: [PATCH 2/9] KVM: selftests: Add optional delay between consecutive
 Clear-Dirty-Log calls
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
References: <20230421165305.804301-1-vipinsh@google.com>
Message-ID: <20230421165305.804301-3-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In dirty_log_perf_test, add option "-l" to wait between consecutive
Clear-Dirty-Log calls. Accept delay in milliseconds.

This allows dirty_log_perf_test to mimic real world use where after
clearing dirty memory, some time is spent in transferring memory before
making a subsequeunt Clear-Dirty-Log call.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/dirty_log_perf_test.c | 17 +++++++++++++++--
 tools/testing/selftests/kvm/include/memstress.h |  5 +++--
 tools/testing/selftests/kvm/lib/memstress.c     | 10 +++++++++-
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_perf_test.c b/tools/testing/selftests/kvm/dirty_log_perf_test.c
index 0852a7ba42e1..338f03a4a550 100644
--- a/tools/testing/selftests/kvm/dirty_log_perf_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_perf_test.c
@@ -135,6 +135,7 @@ struct test_params {
 	uint32_t random_seed;
 	bool random_access;
 	uint64_t clear_chunk_size;
+	int clear_chunk_wait_time_ms
 };
 
 static void run_test(enum vm_guest_mode mode, void *arg)
@@ -249,7 +250,8 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 			clock_gettime(CLOCK_MONOTONIC, &start);
 			memstress_clear_dirty_log_in_chunks(vm, bitmaps, p->slots,
 							    pages_per_slot,
-							    pages_per_clear);
+							    pages_per_clear,
+							    p->clear_chunk_wait_time_ms);
 			ts_diff = timespec_elapsed(start);
 			clear_dirty_log_total = timespec_add(clear_dirty_log_total,
 							     ts_diff);
@@ -352,6 +354,11 @@ static void help(char *name)
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
@@ -368,6 +375,7 @@ int main(int argc, char *argv[])
 		.random_seed = 1,
 		.write_percent = 100,
 		.clear_chunk_size = UINT64_MAX,
+		.clear_chunk_wait_time_ms = 0,
 	};
 	int opt;
 
@@ -378,7 +386,7 @@ int main(int argc, char *argv[])
 
 	guest_modes_append_default();
 
-	while ((opt = getopt(argc, argv, "ab:c:eghi:k:m:nop:r:s:v:x:w:")) != -1) {
+	while ((opt = getopt(argc, argv, "ab:c:eghi:k:l:m:nop:r:s:v:x:w:")) != -1) {
 		switch (opt) {
 		case 'a':
 			p.random_access = true;
@@ -405,6 +413,11 @@ int main(int argc, char *argv[])
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
diff --git a/tools/testing/selftests/kvm/include/memstress.h b/tools/testing/selftests/kvm/include/memstress.h
index 2acc93f76fc3..01fdcea80360 100644
--- a/tools/testing/selftests/kvm/include/memstress.h
+++ b/tools/testing/selftests/kvm/include/memstress.h
@@ -78,12 +78,13 @@ void memstress_get_dirty_log(struct kvm_vm *vm, unsigned long *bitmaps[], int sl
 void memstress_clear_dirty_log_in_chunks(struct kvm_vm *vm,
 					 unsigned long *bitmaps[], int slots,
 					 uint64_t pages_per_slot,
-					 uint64_t pages_per_clear);
+					 uint64_t pages_per_clear,
+					 int wait_ms);
 static inline void memstress_clear_dirty_log(struct kvm_vm *vm,
 					     unsigned long *bitmaps[], int slots,
 					     uint64_t pages_per_slot) {
 	memstress_clear_dirty_log_in_chunks(vm, bitmaps, slots, pages_per_slot,
-					    pages_per_slot);
+					    pages_per_slot, 0);
 }
 unsigned long **memstress_alloc_bitmaps(int slots, uint64_t pages_per_slot);
 void memstress_free_bitmaps(unsigned long *bitmaps[], int slots);
diff --git a/tools/testing/selftests/kvm/lib/memstress.c b/tools/testing/selftests/kvm/lib/memstress.c
index e0c701ab4e9a..483ecbc53a5b 100644
--- a/tools/testing/selftests/kvm/lib/memstress.c
+++ b/tools/testing/selftests/kvm/lib/memstress.c
@@ -358,10 +358,15 @@ void memstress_get_dirty_log(struct kvm_vm *vm, unsigned long *bitmaps[], int sl
 void memstress_clear_dirty_log_in_chunks(struct kvm_vm *vm,
 					 unsigned long *bitmaps[], int slots,
 					 uint64_t pages_per_slot,
-					 uint64_t pages_per_clear)
+					 uint64_t pages_per_clear,
+					 int wait_ms)
 {
 	int i, slot;
 	uint64_t from, clear_pages_count;
+	struct timespec wait = {
+		.tv_sec = wait_ms / 1000,
+		.tv_nsec = (wait_ms % 1000) * 1000000ull,
+	};
 
 	for (i = 0; i < slots; i++) {
 		slot = MEMSTRESS_MEM_SLOT_INDEX + i;
@@ -374,6 +379,9 @@ void memstress_clear_dirty_log_in_chunks(struct kvm_vm *vm,
 			kvm_vm_clear_dirty_log(vm, slot, bitmaps[i], from,
 					       clear_pages_count);
 			from += clear_pages_count;
+			if (wait_ms)
+				nanosleep(&wait, NULL);
+
 		}
 	}
 
-- 
2.40.0.634.g4ca3ef3211-goog



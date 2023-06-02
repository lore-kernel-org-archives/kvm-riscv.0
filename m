From: Vipin Sharma <vipinsh@google.com>
Date: Fri,  2 Jun 2023 09:09:10 -0700
Subject: [PATCH v2 12/16] KVM: arm64: Retry shared page table walks outside of
 fault handler
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
Message-ID: <20230602160914.4011728-13-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For a shared page walker which is not fault handler, retry the walk if
walker callback function returns -EAGAIN, or continue to the next SPTE
if callback function return -ENOENT. Update the kvm_pgtable_walk
documentation.

For fault handler logic remains same, i.e. exit the walk and resume the
guest when getting -EAGAIN and -ENOENT errors from walker callback
function.

Currently, there is no page walker which is shared and not a fault
handler, but this will change in future patches when clear-dirty-log
walker will use MMU read lock and run via shared walker.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 23 ++++++++++-------
 arch/arm64/kvm/hyp/pgtable.c         | 38 +++++++++++++++++++++++-----
 2 files changed, 46 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 23e7e7851f1d..145be12a5fc2 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -716,15 +716,20 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * type of the walker, i.e. shared walker (vCPU fault handlers) or non-shared
  * walker.
  *
- * Walker Type  | Callback         | Walker action
- * -------------|------------------|--------------
- * Non-Shared   | 0                | Continue
- * Non-Shared   | -EAGAIN          | Continue
- * Non-Shared   | -ENOENT          | Continue
- * Non-Shared   | Any other        | Exit
- * -------------|------------------|--------------
- * Shared       | 0                | Continue
- * Shared       | Any other        | Exit
+ * Walker Type            | Callback         | Walker action
+ * -----------------------|------------------|--------------
+ * Non-Shared             | 0                | Continue
+ * Non-Shared             | -EAGAIN          | Continue
+ * Non-Shared             | -ENOENT          | Continue
+ * Non-Shared             | Any other        | Exit
+ * -----------------------|------------------|--------------
+ * Shared                 | 0                | Continue
+ * Shared                 | -EAGAIN          | Retry
+ * Shared                 | -ENOENT          | Continue
+ * Shared                 | Any other        | Exit
+ * -----------------------|------------------|--------------
+ * Shared (Fault Handler) | 0                | Continue
+ * Shared (Fault Handler) | Any other        | Exit
  *
  * Return: 0 on success, negative error code on failure.
  */
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 7f80e953b502..23cda3de2dd4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -191,15 +191,21 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 	 * Callbacks can also return ENOENT when PTE which is visited is not
 	 * valid.
 	 *
-	 * In the context of a shared walker interpret these as a signal
+	 * In the context of a fault handler interpret these as a signal
 	 * to retry guest execution.
 	 *
-	 * Ignore these return codes altogether for walkers outside a fault
-	 * handler (e.g. write protecting a range of memory) and chug along
+	 * In the context of a shared walker which is not fault handler
+	 * interpret:
+	 * 1. EAGAIN - A signal to retry walk again.
+	 * 2. ENOENT - A signal to ignore and move on to next SPTE.
+	 *
+	 * Ignore these return codes altogether for other walkers and chug along
 	 * with the page table walk.
 	 */
-	if (r == -EAGAIN || r == -ENOENT)
+	if (r == -EAGAIN)
 		return !(walker->flags & KVM_PGTABLE_WALK_SHARED);
+	if (r == -ENOENT)
+		return !(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
 
 	return !r;
 }
@@ -260,24 +266,44 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 	return ret;
 }
 
+static bool kvm_pgtable_walk_retry(const struct kvm_pgtable_walker *walker,
+				   int r)
+{
+	/*
+	 * All shared page table walks where visitor callbacks return -EAGAIN
+	 * should be retried with the exception of fault handler. In case of
+	 * fault handler retry is achieved by resuming the guest.
+	 */
+	if (r == -EAGAIN)
+		return (walker->flags & KVM_PGTABLE_WALK_SHARED) &&
+				!(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
+
+	return !r;
+}
+
 static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
 			      struct kvm_pgtable_mm_ops *mm_ops, kvm_pteref_t pgtable, u32 level)
 {
 	u32 idx;
 	int ret = 0;
+	kvm_pteref_t pteref;
 
 	if (WARN_ON_ONCE(level >= KVM_PGTABLE_MAX_LEVELS))
 		return -EINVAL;
 
 	for (idx = kvm_pgtable_idx(data, level); idx < PTRS_PER_PTE; ++idx) {
-		kvm_pteref_t pteref = &pgtable[idx];
+retry:
+		pteref = &pgtable[idx];
 
 		if (data->addr >= data->end)
 			break;
 
 		ret = __kvm_pgtable_visit(data, mm_ops, pteref, level);
-		if (ret)
+		if (ret) {
+			if (kvm_pgtable_walk_retry(data->walker, ret))
+				goto retry;
 			break;
+		}
 	}
 
 	return ret;
-- 
2.41.0.rc0.172.g3f132b7071-goog



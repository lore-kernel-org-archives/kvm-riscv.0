From: Vipin Sharma <vipinsh@google.com>
Date: Fri,  2 Jun 2023 09:09:08 -0700
Subject: [PATCH v2 10/16] KVM: arm64: Return -ENOENT if PTE is not valid in stage2_attr_walker
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
Message-ID: <20230602160914.4011728-11-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Return -ENOENT from stage2_attr_walker for invalid PTE. Continue page
table walk if walker callback returns -ENOENT outside of the fault
handler path else terminate the walk. In fault handler path, similar to
-EAGAIN in user_mem_abort, retry guest execution.

stage2_attr_walker() is used from multiple places like, write
protection, MMU notifier callbacks, and relaxing permission during vCPU
faults. This function returns -EAGAIN for different cases:
1. When PTE is not valid.
2. When cmpxchg() fails while setting new SPTE.

For non-shared walkers, like write protection and MMU notifier, above 2
cases are just ignored by walker and it moves to the next SPTE. #2 will
never happen for non-shared walkers as they don't use cmpxchg() for
updating SPTEs.

For shared walkers, like vCPU fault handler, above 2 cases results in
walk termination.

In future commits, clear-dirty-log walker will write protect SPTEs under
MMU read lock and use shared page table walker. This will result in two
shared page table walkers type, vCPUs fault handler and clear-dirty-log,
competing with each other and sometime causing cmpxchg() failure. So,
-EAGAIN in clear-dirty-log walker due to cmpxchg() failure must be
retried. Whereas, -EAGAIN in the clear-dirty-log due to invalid SPTE
must be ignored instead of exiting as per the current logic of shared
page table walker. This is not needed for vCPU fault handler which also
runs via shared page table walker and terminates walk on getting -EAGAIN
due to invalid SPTE.

To handle all these scenarios, stage2_attr_walker must return different
error codes for invalid SPTEs and cmxchg() failure. -ENOENT for invalid
SPTE is chosen because it is not used by any other shared walker. When
clear-dirty-log will be changed to use shared page table walker, it will
be possible to differentiate cases of retrying, continuing or
terminating the walk for shared fault handler and shared
clear-dirty-log.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h |  1 +
 arch/arm64/kvm/hyp/pgtable.c         | 19 ++++++++++++-------
 arch/arm64/kvm/mmu.c                 |  2 +-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 957bc20dab00..23e7e7851f1d 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -720,6 +720,7 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * -------------|------------------|--------------
  * Non-Shared   | 0                | Continue
  * Non-Shared   | -EAGAIN          | Continue
+ * Non-Shared   | -ENOENT          | Continue
  * Non-Shared   | Any other        | Exit
  * -------------|------------------|--------------
  * Shared       | 0                | Continue
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index a3a0812b2301..bc8c5c4ac1cf 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -186,14 +186,19 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 	/*
 	 * Visitor callbacks return EAGAIN when the conditions that led to a
 	 * fault are no longer reflected in the page tables due to a race to
-	 * update a PTE. In the context of a fault handler this is interpreted
-	 * as a signal to retry guest execution.
+	 * update a PTE.
 	 *
-	 * Ignore the return code altogether for walkers outside a fault handler
-	 * (e.g. write protecting a range of memory) and chug along with the
-	 * page table walk.
+	 * Callbacks can also return ENOENT when PTE which is visited is not
+	 * valid.
+	 *
+	 * In the context of a fault handler interpret these as a signal
+	 * to retry guest execution.
+	 *
+	 * Ignore these return codes altogether for walkers outside a fault
+	 * handler (e.g. write protecting a range of memory) and chug along
+	 * with the page table walk.
 	 */
-	if (r == -EAGAIN)
+	if (r == -EAGAIN || r == -ENOENT)
 		return !(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
 
 	return !r;
@@ -1072,7 +1077,7 @@ static int stage2_attr_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 
 	if (!kvm_pte_valid(ctx->old))
-		return -EAGAIN;
+		return -ENOENT;
 
 	data->level = ctx->level;
 	data->pte = pte;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1030921d89f8..356dc4131023 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1551,7 +1551,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	read_unlock(&kvm->mmu_lock);
 	kvm_set_pfn_accessed(pfn);
 	kvm_release_pfn_clean(pfn);
-	return ret != -EAGAIN ? ret : 0;
+	return (ret != -EAGAIN && ret != -ENOENT) ? ret : 0;
 }
 
 /* Resolve the access fault by making the page young again. */
-- 
2.41.0.rc0.172.g3f132b7071-goog



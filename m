From: Vipin Sharma <vipinsh@google.com>
Date: Fri,  2 Jun 2023 09:09:12 -0700
Subject: [PATCH v2 14/16] KVM: arm64: Pass page walker flags from callers of
 stage 2 split walker
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
Message-ID: <20230602160914.4011728-15-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Pass enum kvm_pgtable_walk_flags{} to kvm_pgtable_stage2_split() walker
from its caller.

This allows split walker users to specify if they want to run split
logic via shared walker or non-shared walker.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +++-
 arch/arm64/kvm/hyp/pgtable.c         | 5 +++--
 arch/arm64/kvm/mmu.c                 | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 145be12a5fc2..fbf5c6c509fb 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -684,6 +684,7 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * @size:	 Size of the range.
  * @mc:		 Cache of pre-allocated and zeroed memory from which to allocate
  *		 page-table pages.
+ * @flags:	 Page walker flags
  *
  * The function tries to split any level 1 or 2 entry that overlaps
  * with the input range (given by @addr and @size).
@@ -693,7 +694,8 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * blocks in the input range as allowed by @mc_capacity.
  */
 int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
-			     struct kvm_mmu_memory_cache *mc);
+			     struct kvm_mmu_memory_cache *mc,
+			     enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_walk() - Walk a page-table.
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 23cda3de2dd4..7e84be13d76d 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1408,11 +1408,12 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 }
 
 int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
-			     struct kvm_mmu_memory_cache *mc)
+			     struct kvm_mmu_memory_cache *mc,
+			     enum kvm_pgtable_walk_flags flags)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_split_walker,
-		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.flags	= flags | KVM_PGTABLE_WALK_LEAF,
 		.arg	= mc,
 	};
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7c966f6f1a41..34d2bd03cf5f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -153,7 +153,7 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 			return -EINVAL;
 
 		next = __stage2_range_addr_end(addr, end, chunk_size);
-		ret = kvm_pgtable_stage2_split(pgt, addr, next - addr, cache);
+		ret = kvm_pgtable_stage2_split(pgt, addr, next - addr, cache, 0);
 		if (ret)
 			break;
 	} while (addr = next, addr != end);
-- 
2.41.0.rc0.172.g3f132b7071-goog



From: Vipin Sharma <vipinsh@google.com>
Date: Fri,  2 Jun 2023 09:09:06 -0700
Subject: [PATCH v2 08/16] KMV: arm64: Pass page table walker flags to stage2_apply_range_*()
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
Message-ID: <20230602160914.4011728-9-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allow stage2_apply_range_*() to accept enum kvm_pgtable_walk_flags{}
for stage 2 walkers. Pass 0 as the flag value from all of its caller
effectively making it a no-op.

Page table walker flags  will be used in future commits to enable
clear-dirty-log operation under MMU read lock.

Current users of stage2_apply_range_*() API runs under assumption of
holding MMU write lock. Stage2 page table walkers then run under the
same assumption. In future commits, when clear-dirty-log is modified to
run under MMU read lock then this flag will be used to pass shared page
walk intent.

No functional changes intended.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h  | 12 +++++++++---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  4 ++--
 arch/arm64/kvm/hyp/pgtable.c          | 16 ++++++++++------
 arch/arm64/kvm/mmu.c                  | 26 ++++++++++++++++----------
 4 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index d542a671c564..8ef7e8f3f054 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -560,6 +560,7 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address from which to remove the mapping.
  * @size:	Size of the mapping.
+ * @flags:	Page-table walker flags.
  *
  * The offset of @addr within a page is ignored and @size is rounded-up to
  * the next page boundary.
@@ -572,7 +573,8 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
  *
  * Return: 0 on success, negative error code on failure.
  */
-int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
+int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size,
+			     enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_wrprotect() - Write-protect guest stage-2 address range
@@ -580,6 +582,7 @@ int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address from which to write-protect,
  * @size:	Size of the range.
+ * @flags:	Page-table walker flags.
  *
  * The offset of @addr within a page is ignored and @size is rounded-up to
  * the next page boundary.
@@ -590,7 +593,8 @@ int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
  *
  * Return: 0 on success, negative error code on failure.
  */
-int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
+int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size,
+				 enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_mkyoung() - Set the access flag in a page-table entry.
@@ -662,13 +666,15 @@ bool kvm_pgtable_stage2_is_young(struct kvm_pgtable *pgt, u64 addr);
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address from which to flush.
  * @size:	Size of the range.
+ * @flags:	Page-table walker flags.
  *
  * The offset of @addr within a page is ignored and @size is rounded-up to
  * the next page boundary.
  *
  * Return: 0 on success, negative error code on failure.
  */
-int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
+int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size,
+			     enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_split() - Split a range of huge pages into leaf PTEs pointing
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d35e75b13ffe..13f5cf5f87c3 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -333,11 +333,11 @@ static int host_stage2_unmap_dev_all(void)
 	/* Unmap all non-memory regions to recycle the pages */
 	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
 		reg = &hyp_memory[i];
-		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
+		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr, 0);
 		if (ret)
 			return ret;
 	}
-	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
+	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr, 0);
 }
 
 struct kvm_mem_range {
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 364b68013038..a3a0812b2301 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1044,12 +1044,14 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
-int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
+int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size,
+			     enum kvm_pgtable_walk_flags flags)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_unmap_walker,
 		.arg	= pgt,
-		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
+		.flags	= flags | KVM_PGTABLE_WALK_LEAF |
+			  KVM_PGTABLE_WALK_TABLE_POST,
 	};
 
 	return kvm_pgtable_walk(pgt, addr, size, &walker);
@@ -1128,11 +1130,12 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 	return 0;
 }
 
-int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
+int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size,
+				 enum kvm_pgtable_walk_flags flags)
 {
 	return stage2_update_leaf_attrs(pgt, addr, size, 0,
 					KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
-					NULL, NULL, 0);
+					NULL, NULL, flags);
 }
 
 kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
@@ -1213,11 +1216,12 @@ static int stage2_flush_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
-int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
+int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size,
+			     enum kvm_pgtable_walk_flags flags)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_flush_walker,
-		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.flags	= flags | KVM_PGTABLE_WALK_LEAF,
 		.arg	= pgt,
 	};
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0c2c2c0846f1..1030921d89f8 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -55,7 +55,9 @@ static phys_addr_t stage2_range_addr_end(phys_addr_t addr, phys_addr_t end)
  */
 static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
 			      phys_addr_t end,
-			      int (*fn)(struct kvm_pgtable *, u64, u64),
+			      enum kvm_pgtable_walk_flags flags,
+			      int (*fn)(struct kvm_pgtable *, u64, u64,
+					enum kvm_pgtable_walk_flags),
 			      bool resched)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
@@ -68,7 +70,7 @@ static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
 			return -EINVAL;
 
 		next = stage2_range_addr_end(addr, end);
-		ret = fn(pgt, addr, next - addr);
+		ret = fn(pgt, addr, next - addr, flags);
 		if (ret)
 			break;
 
@@ -79,8 +81,8 @@ static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
 	return ret;
 }
 
-#define stage2_apply_range_resched(mmu, addr, end, fn)			\
-	stage2_apply_range(mmu, addr, end, fn, true)
+#define stage2_apply_range_resched(mmu, addr, end, flags, fn)		\
+	stage2_apply_range(mmu, addr, end, flags, fn, true)
 
 /*
  * Get the maximum number of page-tables pages needed to split a range
@@ -316,7 +318,7 @@ static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	WARN_ON(size & ~PAGE_MASK);
-	WARN_ON(stage2_apply_range(mmu, start, end, kvm_pgtable_stage2_unmap,
+	WARN_ON(stage2_apply_range(mmu, start, end, 0, kvm_pgtable_stage2_unmap,
 				   may_block));
 }
 
@@ -331,7 +333,8 @@ static void stage2_flush_memslot(struct kvm *kvm,
 	phys_addr_t addr = memslot->base_gfn << PAGE_SHIFT;
 	phys_addr_t end = addr + PAGE_SIZE * memslot->npages;
 
-	stage2_apply_range_resched(&kvm->arch.mmu, addr, end, kvm_pgtable_stage2_flush);
+	stage2_apply_range_resched(&kvm->arch.mmu, addr, end, 0,
+				   kvm_pgtable_stage2_flush);
 }
 
 /**
@@ -1041,10 +1044,13 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
  * @mmu:        The KVM stage-2 MMU pointer
  * @addr:	Start address of range
  * @end:	End address of range
+ * @flags:	Page-table walker flags.
  */
-static void stage2_wp_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
+static void stage2_wp_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end,
+			    enum kvm_pgtable_walk_flags flags)
 {
-	stage2_apply_range_resched(mmu, addr, end, kvm_pgtable_stage2_wrprotect);
+	stage2_apply_range_resched(mmu, addr, end, flags,
+				   kvm_pgtable_stage2_wrprotect);
 }
 
 /**
@@ -1073,7 +1079,7 @@ static void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot)
 	end = (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
 
 	write_lock(&kvm->mmu_lock);
-	stage2_wp_range(&kvm->arch.mmu, start, end);
+	stage2_wp_range(&kvm->arch.mmu, start, end, 0);
 	write_unlock(&kvm->mmu_lock);
 	kvm_flush_remote_tlbs(kvm);
 }
@@ -1128,7 +1134,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	write_lock(&kvm->mmu_lock);
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
-	stage2_wp_range(&kvm->arch.mmu, start, end);
+	stage2_wp_range(&kvm->arch.mmu, start, end, 0);
 
 	/*
 	 * Eager-splitting is done when manual-protect is set.  We
-- 
2.41.0.rc0.172.g3f132b7071-goog



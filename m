From: David Matlack <dmatlack@google.com>
Date: Fri, 11 Mar 2022 00:25:15 +0000
Subject: [PATCH v2 13/26] KVM: x86/mmu: Pass const memslot to
 init_shadow_page() and descendants
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
Message-ID: <20220311002528.2230172-14-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use a const pointer so that init_shadow_page() can be called from
contexts where we have a const pointer.

No functional change intended.

Reviewed-by: Ben Gardon <bgardon@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_page_track.h | 2 +-
 arch/x86/kvm/mmu/mmu.c                | 6 +++---
 arch/x86/kvm/mmu/mmu_internal.h       | 2 +-
 arch/x86/kvm/mmu/page_track.c         | 4 ++--
 arch/x86/kvm/mmu/tdp_mmu.c            | 2 +-
 arch/x86/kvm/mmu/tdp_mmu.h            | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
index eb186bc57f6a..3a2dc183ae9a 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -58,7 +58,7 @@ int kvm_page_track_create_memslot(struct kvm *kvm,
 				  unsigned long npages);
 
 void kvm_slot_page_track_add_page(struct kvm *kvm,
-				  struct kvm_memory_slot *slot, gfn_t gfn,
+				  const struct kvm_memory_slot *slot, gfn_t gfn,
 				  enum kvm_page_track_mode mode);
 void kvm_slot_page_track_remove_page(struct kvm *kvm,
 				     struct kvm_memory_slot *slot, gfn_t gfn,
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 23c0a36ac93f..d7ad71be6c52 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -794,7 +794,7 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn)
 }
 
 static void account_shadowed(struct kvm *kvm,
-			     struct kvm_memory_slot *slot,
+			     const struct kvm_memory_slot *slot,
 			     struct kvm_mmu_page *sp)
 {
 	gfn_t gfn;
@@ -1373,7 +1373,7 @@ int kvm_cpu_dirty_log_size(void)
 }
 
 bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
-				    struct kvm_memory_slot *slot, u64 gfn,
+				    const struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level)
 {
 	struct kvm_rmap_head *rmap_head;
@@ -2151,7 +2151,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 }
 
 static void init_shadow_page(struct kvm *kvm, struct kvm_mmu_page *sp,
-			     struct kvm_memory_slot *slot, gfn_t gfn,
+			     const struct kvm_memory_slot *slot, gfn_t gfn,
 			     union kvm_mmu_page_role role)
 {
 	struct hlist_head *sp_list;
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index d4e2de5f2a6d..b6e22ba9c654 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -134,7 +134,7 @@ int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
 void kvm_mmu_gfn_disallow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
 void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
 bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
-				    struct kvm_memory_slot *slot, u64 gfn,
+				    const struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
 void kvm_flush_remote_tlbs_with_address(struct kvm *kvm,
 					u64 start_gfn, u64 pages);
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 2e09d1b6249f..3e7901294573 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -84,7 +84,7 @@ int kvm_page_track_write_tracking_alloc(struct kvm_memory_slot *slot)
 	return 0;
 }
 
-static void update_gfn_track(struct kvm_memory_slot *slot, gfn_t gfn,
+static void update_gfn_track(const struct kvm_memory_slot *slot, gfn_t gfn,
 			     enum kvm_page_track_mode mode, short count)
 {
 	int index, val;
@@ -112,7 +112,7 @@ static void update_gfn_track(struct kvm_memory_slot *slot, gfn_t gfn,
  * @mode: tracking mode, currently only write track is supported.
  */
 void kvm_slot_page_track_add_page(struct kvm *kvm,
-				  struct kvm_memory_slot *slot, gfn_t gfn,
+				  const struct kvm_memory_slot *slot, gfn_t gfn,
 				  enum kvm_page_track_mode mode)
 {
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index f285fd76717b..85b7bc333302 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1768,7 +1768,7 @@ static bool write_protect_gfn(struct kvm *kvm, struct kvm_mmu_page *root,
  * Returns true if an SPTE was set and a TLB flush is needed.
  */
 bool kvm_tdp_mmu_write_protect_gfn(struct kvm *kvm,
-				   struct kvm_memory_slot *slot, gfn_t gfn,
+				   const struct kvm_memory_slot *slot, gfn_t gfn,
 				   int min_level)
 {
 	struct kvm_mmu_page *root;
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 54bc8118c40a..8308bfa4126b 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -42,7 +42,7 @@ void kvm_tdp_mmu_zap_collapsible_sptes(struct kvm *kvm,
 				       const struct kvm_memory_slot *slot);
 
 bool kvm_tdp_mmu_write_protect_gfn(struct kvm *kvm,
-				   struct kvm_memory_slot *slot, gfn_t gfn,
+				   const struct kvm_memory_slot *slot, gfn_t gfn,
 				   int min_level);
 
 void kvm_tdp_mmu_try_split_huge_pages(struct kvm *kvm,
-- 
2.35.1.723.g4982287a31-goog



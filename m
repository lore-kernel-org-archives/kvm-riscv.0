From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:17 +0000
Subject: [PATCH v5.5 16/30] KVM: x86: Don't assume old/new memslots are
 non-NULL at memslot commit
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-17-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Play nice with a NULL @old or @new when handling memslot updates so that
common KVM can pass NULL for one or the other in CREATE and DELETE cases
instead of having to synthesize a dummy memslot.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 80e726f73dd7..80183f7eadeb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11762,13 +11762,15 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 				     const struct kvm_memory_slot *new,
 				     enum kvm_mr_change change)
 {
-	bool log_dirty_pages = new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+	u32 old_flags = old ? old->flags : 0;
+	u32 new_flags = new ? new->flags : 0;
+	bool log_dirty_pages = new_flags & KVM_MEM_LOG_DIRTY_PAGES;
 
 	/*
 	 * Update CPU dirty logging if dirty logging is being toggled.  This
 	 * applies to all operations.
 	 */
-	if ((old->flags ^ new->flags) & KVM_MEM_LOG_DIRTY_PAGES)
+	if ((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES)
 		kvm_mmu_update_cpu_dirty_logging(kvm, log_dirty_pages);
 
 	/*
@@ -11786,7 +11788,7 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 	 * MOVE/DELETE: The old mappings will already have been cleaned up by
 	 *		kvm_arch_flush_shadow_memslot().
 	 */
-	if ((change != KVM_MR_FLAGS_ONLY) || (new->flags & KVM_MEM_READONLY))
+	if ((change != KVM_MR_FLAGS_ONLY) || (new_flags & KVM_MEM_READONLY))
 		return;
 
 	/*
@@ -11794,7 +11796,7 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 	 * other flag is LOG_DIRTY_PAGES, i.e. something is wrong if dirty
 	 * logging isn't being toggled on or off.
 	 */
-	if (WARN_ON_ONCE(!((old->flags ^ new->flags) & KVM_MEM_LOG_DIRTY_PAGES)))
+	if (WARN_ON_ONCE(!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES)))
 		return;
 
 	if (!log_dirty_pages) {
-- 
2.33.1.1089.g2158813163f-goog



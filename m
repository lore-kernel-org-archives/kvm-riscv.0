From: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Oct 2023 11:21:44 -0700
Subject: [PATCH v13 02/35] KVM: Assert that mmu_invalidate_in_progress *never*
 goes negative
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
Message-ID: <20231027182217.3615211-3-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the assertion on the in-progress invalidation count from the primary
MMU's notifier path to KVM's common notification path, i.e. assert that
the count doesn't go negative even when the invalidation is coming from
KVM itself.

Opportunistically convert the assertion to a KVM_BUG_ON(), i.e. kill only
the affected VM, not the entire kernel.  A corrupted count is fatal to the
VM, e.g. the non-zero (negative) count will cause mmu_invalidate_retry()
to block any and all attempts to install new mappings.  But it's far from
guaranteed that an end() without a start() is fatal or even problematic to
anything other than the target VM, e.g. the underlying bug could simply be
a duplicate call to end().  And it's much more likely that a missed
invalidation, i.e. a potential use-after-free, would manifest as no
notification whatsoever, not an end() without a start().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0524933856d4..5a97e6c7d9c2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -833,6 +833,7 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
 	 * in conjunction with the smp_rmb in mmu_invalidate_retry().
 	 */
 	kvm->mmu_invalidate_in_progress--;
+	KVM_BUG_ON(kvm->mmu_invalidate_in_progress < 0, kvm);
 }
 
 static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
@@ -863,8 +864,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 	 */
 	if (wake)
 		rcuwait_wake_up(&kvm->mn_memslots_update_rcuwait);
-
-	BUG_ON(kvm->mmu_invalidate_in_progress < 0);
 }
 
 static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
-- 
2.42.0.820.g83a721a137-goog



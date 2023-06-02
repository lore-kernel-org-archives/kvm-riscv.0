From: Vipin Sharma <vipinsh@google.com>
Date: Fri,  2 Jun 2023 09:09:09 -0700
Subject: [PATCH v2 11/16] KVM: arm64: Use KVM_PGTABLE_WALK_SHARED flag instead
 of KVM_PGTABLE_WALK_HANDLE_FAULT
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
Message-ID: <20230602160914.4011728-12-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Check against shared page table walker flag instead of fault handler
flag when determining if walk should continue or not.

vCPU page fault handlers uses shared page walker and there are no
other shared page walkers in Arm. This will change in future commit when
clear-dirty-log will use shared page walker and continue, retry or
terminate logic for a walk will change between shared page walkers.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index bc8c5c4ac1cf..7f80e953b502 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -191,7 +191,7 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 	 * Callbacks can also return ENOENT when PTE which is visited is not
 	 * valid.
 	 *
-	 * In the context of a fault handler interpret these as a signal
+	 * In the context of a shared walker interpret these as a signal
 	 * to retry guest execution.
 	 *
 	 * Ignore these return codes altogether for walkers outside a fault
@@ -199,7 +199,7 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 	 * with the page table walk.
 	 */
 	if (r == -EAGAIN || r == -ENOENT)
-		return !(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
+		return !(walker->flags & KVM_PGTABLE_WALK_SHARED);
 
 	return !r;
 }
-- 
2.41.0.rc0.172.g3f132b7071-goog



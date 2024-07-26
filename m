From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:55 -0700
Subject: [PATCH v12 46/84] KVM: x86/mmu: Put refcounted pages instead of
 blindly releasing pfns
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-47-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that all x86 page fault paths precisely track refcounted pages, use
Use kvm_page_fault.refcounted_page to put references to struct page memory
when finishing page faults.  This is a baby step towards eliminating
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 146e57c9c86d..3cdb1bd80823 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4326,6 +4326,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
 			    r == RET_PF_RETRY);
 
+	if (!fault->refcounted_page)
+		return;
+
 	/*
 	 * If the page that KVM got from the *primary MMU* is writable, and KVM
 	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
@@ -4337,9 +4340,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
 	if (!fault->map_writable || r == RET_PF_RETRY)
-		kvm_release_pfn_clean(fault->pfn);
+		kvm_release_page_clean(fault->refcounted_page);
 	else
-		kvm_release_pfn_dirty(fault->pfn);
+		kvm_release_page_dirty(fault->refcounted_page);
 }
 
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
-- 
2.46.0.rc1.232.g9752f9e123-goog



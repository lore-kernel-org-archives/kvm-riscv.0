From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:56 -0700
Subject: [PATCH v12 47/84] KVM: x86/mmu: Don't mark unused faultin pages as accessed
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-48-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When finishing guest page faults, don't mark pages as accessed if KVM
is resuming the guest _without_ installing a mapping, i.e. if the page
isn't being used.  While it's possible that marking the page accessed
could avoid minor thrashing due to reclaiming a page that the guest is
about to access, it's far more likely that the gfn=>pfn mapping was
was invalidated, e.g. due a memslot change, or because the corresponding
VMA is being modified.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3cdb1bd80823..95beb50748fc 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4339,7 +4339,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	 * fault handler, and so KVM must (somewhat) speculatively mark the
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
-	if (!fault->map_writable || r == RET_PF_RETRY)
+	if (r == RET_PF_RETRY)
+		kvm_release_page_unused(fault->refcounted_page);
+	else if (!fault->map_writable)
 		kvm_release_page_clean(fault->refcounted_page);
 	else
 		kvm_release_page_dirty(fault->refcounted_page);
-- 
2.46.0.rc1.232.g9752f9e123-goog



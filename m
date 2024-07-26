From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:15 -0700
Subject: [PATCH v12 06/84] KVM: x86/mmu: Skip the "try unsync" path iff the
 old SPTE was a leaf SPTE
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-7-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Apply make_spte()'s optimization to skip trying to unsync shadow pages if
and only if the old SPTE was a leaf SPTE, as non-leaf SPTEs in direct MMUs
are always writable, i.e. could trigger a false positive and incorrectly
lead to KVM creating a SPTE without write-protecting or marking shadow
pages unsync.

This bug only affects the TDP MMU, as the shadow MMU only overwrites a
shadow-present SPTE when synchronizing SPTEs (and only 4KiB SPTEs can be
unsync).  Specifically, mmu_set_spte() drops any non-leaf SPTEs *before*
calling make_spte(), whereas the TDP MMU can do a direct replacement of a
page table with the leaf SPTE.

Opportunistically update the comment to explain why skipping the unsync
stuff is safe, as opposed to simply saying "it's someone else's problem".

Cc: stable at vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/spte.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index d4527965e48c..a3baf0cadbee 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -226,12 +226,20 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		spte |= PT_WRITABLE_MASK | shadow_mmu_writable_mask;
 
 		/*
-		 * Optimization: for pte sync, if spte was writable the hash
-		 * lookup is unnecessary (and expensive). Write protection
-		 * is responsibility of kvm_mmu_get_page / kvm_mmu_sync_roots.
-		 * Same reasoning can be applied to dirty page accounting.
+		 * When overwriting an existing leaf SPTE, and the old SPTE was
+		 * writable, skip trying to unsync shadow pages as any relevant
+		 * shadow pages must already be unsync, i.e. the hash lookup is
+		 * unnecessary (and expensive).
+		 *
+		 * The same reasoning applies to dirty page/folio accounting;
+		 * KVM will mark the folio dirty using the old SPTE, thus
+		 * there's no need to immediately mark the new SPTE as dirty.
+		 *
+		 * Note, both cases rely on KVM not changing PFNs without first
+		 * zapping the old SPTE, which is guaranteed by both the shadow
+		 * MMU and the TDP MMU.
 		 */
-		if (is_writable_pte(old_spte))
+		if (is_last_spte(old_spte, level) && is_writable_pte(old_spte))
 			goto out;
 
 		/*
-- 
2.46.0.rc1.232.g9752f9e123-goog



From: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:07 -0700
Subject: [PATCH v13 05/85] KVM: x86/mmu: Don't overwrite shadow-present MMU
 SPTEs when prefaulting
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
References: <20241010182427.1434605-1-seanjc@google.com>
Message-ID: <20241010182427.1434605-6-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Treat attempts to prefetch/prefault MMU SPTEs as spurious if there's an
existing shadow-present SPTE, as overwriting a SPTE that may have been
create by a "real" fault is at best confusing, and at worst potentially
harmful.  E.g. mmu_try_to_unsync_pages() doesn't unsync when prefetching,
which creates a scenario where KVM could try to replace a Writable SPTE
with a !Writable SPTE, as sp->unsync is checked prior to acquiring
mmu_unsync_pages_lock.

Note, this applies to three of the four flavors of "prefetch" in KVM:

  - KVM_PRE_FAULT_MEMORY
  - Async #PF (host or PV)
  - Prefetching

The fourth flavor, SPTE synchronization, i.e. FNAME(sync_spte), _only_
overwrites shadow-present SPTEs when calling make_spte().  But SPTE
synchronization specifically uses mmu_spte_update(), and so naturally
avoids the @prefetch check in mmu_set_spte().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 3 +++
 arch/x86/kvm/mmu/tdp_mmu.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a9a23e058555..a8c64069aa89 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2919,6 +2919,9 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	}
 
 	if (is_shadow_present_pte(*sptep)) {
+		if (prefetch)
+			return RET_PF_SPURIOUS;
+
 		/*
 		 * If we overwrite a PTE page pointer with a 2MB PMD, unlink
 		 * the parent of the now unreachable PTE.
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 3b996c1fdaab..3c6583468742 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1026,6 +1026,9 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 	if (WARN_ON_ONCE(sp->role.level != fault->goal_level))
 		return RET_PF_RETRY;
 
+	if (fault->prefetch && is_shadow_present_pte(iter->old_spte))
+		return RET_PF_SPURIOUS;
+
 	if (unlikely(!fault->slot))
 		new_spte = make_mmio_spte(vcpu, iter->gfn, ACC_ALL);
 	else
-- 
2.47.0.rc1.288.g06298d1525-goog



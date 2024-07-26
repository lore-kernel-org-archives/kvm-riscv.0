From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:24 -0700
Subject: [PATCH v12 15/84] KVM: x86/mmu: Drop kvm_page_fault.hva, i.e. don't
 track intermediate hva
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-16-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove kvm_page_fault.hva as it is never read, only written.  This will
allow removing the @hva param from __gfn_to_pfn_memslot().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 5 ++---
 arch/x86/kvm/mmu/mmu_internal.h | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index eb9ad0283fd5..e0bfbf95646c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3248,7 +3248,6 @@ static int kvm_handle_noslot_fault(struct kvm_vcpu *vcpu,
 	fault->slot = NULL;
 	fault->pfn = KVM_PFN_NOSLOT;
 	fault->map_writable = false;
-	fault->hva = KVM_HVA_ERR_BAD;
 
 	/*
 	 * If MMIO caching is disabled, emulate immediately without
@@ -4333,7 +4332,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 
 	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable,
-					  &fault->hva);
+					  NULL);
 
 	/*
 	 * If resolving the page failed because I/O is needed to fault-in the
@@ -4362,7 +4361,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	 */
 	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
 					  fault->write, &fault->map_writable,
-					  &fault->hva);
+					  NULL);
 	return RET_PF_CONTINUE;
 }
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 1721d97743e9..f67396c435df 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -238,7 +238,6 @@ struct kvm_page_fault {
 	/* Outputs of kvm_faultin_pfn.  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
-	hva_t hva;
 	bool map_writable;
 
 	/*
@@ -310,7 +309,6 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 		.is_private = err & PFERR_PRIVATE_ACCESS,
 
 		.pfn = KVM_PFN_ERR_FAULT,
-		.hva = KVM_HVA_ERR_BAD,
 	};
 	int r;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog



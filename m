From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:53 -0700
Subject: [PATCH v12 44/84] KVM: x86/mmu: Convert page fault paths to kvm_faultin_pfn()
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-45-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert KVM x86 to use the recently introduced __kvm_faultin_pfn().
Opportunstically capture the refcounted_page grabbed by KVM for use in
future changes.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 14 ++++++++++----
 arch/x86/kvm/mmu/mmu_internal.h |  1 +
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 7e7b855ce1e1..53555ea5e5bb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4369,11 +4369,14 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 				 struct kvm_page_fault *fault)
 {
+	unsigned int foll = fault->write ? FOLL_WRITE : 0;
+
 	if (fault->is_private)
 		return kvm_mmu_faultin_pfn_private(vcpu, fault);
 
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
-					  fault->write, &fault->map_writable);
+	foll |= FOLL_NOWAIT;
+	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
+				       &fault->map_writable, &fault->refcounted_page);
 
 	/*
 	 * If resolving the page failed because I/O is needed to fault-in the
@@ -4400,8 +4403,11 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 	 * to wait for IO.  Note, gup always bails if it is unable to quickly
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
-					  fault->write, &fault->map_writable);
+	foll |= FOLL_INTERRUPTIBLE;
+	foll &= ~FOLL_NOWAIT;
+	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
+				       &fault->map_writable, &fault->refcounted_page);
+
 	return RET_PF_CONTINUE;
 }
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index a5113347bb12..e1f8385105a5 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -238,6 +238,7 @@ struct kvm_page_fault {
 	/* Outputs of kvm_mmu_faultin_pfn().  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
+	struct page *refcounted_page;
 	bool map_writable;
 
 	/*
-- 
2.46.0.rc1.232.g9752f9e123-goog



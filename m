From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:58 -0700
Subject: [PATCH v12 49/84] KVM: VMX: Hold mmu_lock until page is released when
 updating APIC access page
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-50-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hold mmu_lock across kvm_release_pfn_clean() when refreshing the APIC
access page address to ensure that KVM doesn't mark a page/folio as
accessed after it has been unmapped.  Practically speaking marking a folio
accesses is benign in this scenario, as KVM does hold a reference (it's
really just marking folios dirty that is problematic), but there's no
reason not to be paranoid (moving the APIC access page isn't a hot path),
and no reason to be different from other mmu_notifier-protected flows in
KVM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f18c2d8c7476..30032585f7dc 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6828,25 +6828,22 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 		return;
 
 	read_lock(&vcpu->kvm->mmu_lock);
-	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
+	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
 		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
-		read_unlock(&vcpu->kvm->mmu_lock);
-		goto out;
-	}
+	else
+		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
 
-	vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
-	read_unlock(&vcpu->kvm->mmu_lock);
-
-	/*
-	 * No need for a manual TLB flush at this point, KVM has already done a
-	 * flush if there were SPTEs pointing at the previous page.
-	 */
-out:
 	/*
 	 * Do not pin apic access page in memory, the MMU notifier
 	 * will call us again if it is migrated or swapped out.
 	 */
 	kvm_release_pfn_clean(pfn);
+
+	/*
+	 * No need for a manual TLB flush at this point, KVM has already done a
+	 * flush if there were SPTEs pointing at the previous page.
+	 */
+	read_unlock(&vcpu->kvm->mmu_lock);
 }
 
 void vmx_hwapic_isr_update(int max_isr)
-- 
2.46.0.rc1.232.g9752f9e123-goog



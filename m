From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:32 -0700
Subject: [PATCH v12 23/84] KVM: nVMX: Add helper to put (unmap) vmcs12 pages
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-24-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a helper to dedup unmapping the vmcs12 pages.  This will reduce the
amount of churn when a future patch refactors the kvm_vcpu_unmap() API.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 372d005e09e7..8d05d1d9f544 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -314,6 +314,21 @@ static void vmx_switch_vmcs(struct kvm_vcpu *vcpu, struct loaded_vmcs *vmcs)
 	vcpu->arch.regs_dirty = 0;
 }
 
+static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+
+	/*
+	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
+	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
+	 * and if it is written, the contents are irrelevant.
+	 */
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
+	vmx->nested.pi_desc = NULL;
+}
+
 /*
  * Free whatever needs to be freed from vmx->nested when L1 goes down, or
  * just stops using VMX.
@@ -346,15 +361,8 @@ static void free_nested(struct kvm_vcpu *vcpu)
 	vmx->nested.cached_vmcs12 = NULL;
 	kfree(vmx->nested.cached_shadow_vmcs12);
 	vmx->nested.cached_shadow_vmcs12 = NULL;
-	/*
-	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
-	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
-	 * and if it is written, the contents are irrelevant.
-	 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
-	vmx->nested.pi_desc = NULL;
+
+	nested_put_vmcs12_pages(vcpu);
 
 	kvm_mmu_free_roots(vcpu->kvm, &vcpu->arch.guest_mmu, KVM_MMU_ROOTS_ALL);
 
@@ -4942,11 +4950,7 @@ void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 		vmx_update_cpu_dirty_logging(vcpu);
 	}
 
-	/* Unpin physical memory we referred to in vmcs02 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
-	vmx->nested.pi_desc = NULL;
+	nested_put_vmcs12_pages(vcpu);
 
 	if (vmx->nested.reload_vmcs01_apic_access_page) {
 		vmx->nested.reload_vmcs01_apic_access_page = false;
-- 
2.46.0.rc1.232.g9752f9e123-goog



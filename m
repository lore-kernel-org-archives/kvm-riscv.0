From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:31 -0700
Subject: [PATCH v12 22/84] KVM: nVMX: Drop pointless msr_bitmap_map field from
 struct nested_vmx
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-23-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove vcpu_vmx.msr_bitmap_map and instead use an on-stack structure in
the one function that uses the map, nested_vmx_prepare_msr_bitmap().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 8 ++++----
 arch/x86/kvm/vmx/vmx.h    | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index a34b49ea64b5..372d005e09e7 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -621,7 +621,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	int msr;
 	unsigned long *msr_bitmap_l1;
 	unsigned long *msr_bitmap_l0 = vmx->nested.vmcs02.msr_bitmap;
-	struct kvm_host_map *map = &vmx->nested.msr_bitmap_map;
+	struct kvm_host_map msr_bitmap_map;
 
 	/* Nothing to do if the MSR bitmap is not in use.  */
 	if (!cpu_has_vmx_msr_bitmap() ||
@@ -644,10 +644,10 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 			return true;
 	}
 
-	if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), map))
+	if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), &msr_bitmap_map))
 		return false;
 
-	msr_bitmap_l1 = (unsigned long *)map->hva;
+	msr_bitmap_l1 = (unsigned long *)msr_bitmap_map.hva;
 
 	/*
 	 * To keep the control flow simple, pay eight 8-byte writes (sixteen
@@ -711,7 +711,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
 
-	kvm_vcpu_unmap(vcpu, &vmx->nested.msr_bitmap_map, false);
+	kvm_vcpu_unmap(vcpu, &msr_bitmap_map, false);
 
 	vmx->nested.force_msr_bitmap_recalc = false;
 
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 42498fa63abb..889c6c42ee27 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -204,8 +204,6 @@ struct nested_vmx {
 	struct kvm_host_map virtual_apic_map;
 	struct kvm_host_map pi_desc_map;
 
-	struct kvm_host_map msr_bitmap_map;
-
 	struct pi_desc *pi_desc;
 	bool pi_pending;
 	u16 posted_intr_nv;
-- 
2.46.0.rc1.232.g9752f9e123-goog



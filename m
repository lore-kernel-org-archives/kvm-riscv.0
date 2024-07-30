From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 30 Jul 2024 11:05:35 +0200
Subject: [PATCH v12 45/84] KVM: guest_memfd: Provide "struct page" as
 output from kvm_gmem_get_pfn()
In-Reply-To: <20240726235234.228822-46-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-46-seanjc@google.com>
Message-ID: <2da6b57e-d5c2-4016-b89b-d51700eeb845@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/27/24 01:51, Sean Christopherson wrote:
> Provide the "struct page" associated with a guest_memfd pfn as an output
> from __kvm_gmem_get_pfn() so that KVM guest page fault handlers can
        ^^^^^^^^^^^^^^^^^^^^

Just "kvm_gmem_get_pfn()".

> directly put the page instead of having to rely on
> kvm_pfn_to_refcounted_page().

This will conflict with my series, where I'm introducing
folio_file_pfn() and using it here:
> -	page = folio_file_page(folio, index);
> +	*page = folio_file_page(folio, index);
>   
> -	*pfn = page_to_pfn(page);
> +	*pfn = page_to_pfn(*page);
>   	if (max_order)
>   		*max_order = 0;

That said, I think it's better to turn kvm_gmem_get_pfn() into
kvm_gmem_get_page() here, and pull the page_to_pfn() or page_to_phys()
to the caller as applicable.  This highlights that the caller always
gets a refcounted page with guest_memfd.

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 901be9e420a4..bcc4a4c594ef 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4348,13 +4348,14 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
  		return -EFAULT;
  	}
  
-	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
+	r = kvm_gmem_get_page(vcpu->kvm, fault->slot, fault->gfn, &fault->refcounted_page,
  			     &max_order);
  	if (r) {
  		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
  		return r;
  	}
  
+	fault->pfn = page_to_pfn(page);
  	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
  	fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault->pfn,
  							 fault->max_level, max_order);
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a16c873b3232..db4181d11f2e 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3847,7 +3847,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  	if (VALID_PAGE(svm->sev_es.snp_vmsa_gpa)) {
  		gfn_t gfn = gpa_to_gfn(svm->sev_es.snp_vmsa_gpa);
  		struct kvm_memory_slot *slot;
-		kvm_pfn_t pfn;
+		struct page *page;
  
  		slot = gfn_to_memslot(vcpu->kvm, gfn);
  		if (!slot)
@@ -3857,7 +3857,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  		 * The new VMSA will be private memory guest memory, so
  		 * retrieve the PFN from the gmem backend.
  		 */
-		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, NULL))
+		if (kvm_gmem_get_page(vcpu->kvm, slot, gfn, &page, NULL))
  			return -EINVAL;
  
  		/*
@@ -3873,7 +3873,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  		svm->sev_es.snp_has_guest_vmsa = true;
  
  		/* Use the new VMSA */
-		svm->vmcb->control.vmsa_pa = pfn_to_hpa(pfn);
+		svm->vmcb->control.vmsa_pa = page_to_phys(page);
  
  		/* Mark the vCPU as runnable */
  		vcpu->arch.pv.pv_unhalted = false;
@@ -3886,7 +3886,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  		 * changes then care should be taken to ensure
  		 * svm->sev_es.vmsa is pinned through some other means.
  		 */
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_clean(page);
  	}
  
  	/*
@@ -4687,6 +4687,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
  	struct kvm *kvm = vcpu->kvm;
  	int order, rmp_level, ret;
  	bool assigned;
+	struct page *page;
  	kvm_pfn_t pfn;
  	gfn_t gfn;
  
@@ -4712,13 +4713,14 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
  		return;
  	}
  
-	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &order);
+	ret = kvm_gmem_get_page(kvm, slot, gfn, &page, &order);
  	if (ret) {
  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for private GPA 0x%llx\n",
  				    gpa);
  		return;
  	}
  
+	pfn = page_to_pfn(page);
  	ret = snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
  	if (ret || !assigned) {
  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
@@ -4770,7 +4772,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
  out:
  	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
  out_no_trace:
-	put_page(pfn_to_page(pfn));
+	kvm_release_page_unused(page);
  }
  
  static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)


And the change in virt/kvm/guest_memfd.c then is just as trivial, apart
from all the renaming:

-	*pfn = folio_file_pfn(folio, index);
+	*page = folio_file_page(folio, index);


Paolo



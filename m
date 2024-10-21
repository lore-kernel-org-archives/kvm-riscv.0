From: Yan Zhao <yan.y.zhao@intel.com>
Date: Mon, 21 Oct 2024 18:22:25 +0800
Subject: [PATCH v13 51/85] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
In-Reply-To: <20241010182427.1434605-52-seanjc@google.com>
References: <20241010182427.1434605-1-seanjc@google.com>
 <20241010182427.1434605-52-seanjc@google.com>
Message-ID: <ZxYrYe/WN8XoB+fI@yzhao56-desk.sh.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 10, 2024 at 11:23:53AM -0700, Sean Christopherson wrote:
> Use __kvm_faultin_page() get the APIC access page so that KVM can
> precisely release the refcounted page, i.e. to remove yet another user
> of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
> page fault, the semantics are effectively the same; KVM just happens to
> be mapping the pfn into a VMCS field instead of a secondary MMU.
> 
> Tested-by: Alex Benn?e <alex.bennee@linaro.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 851be0820e04..44cc25dfebba 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6790,8 +6790,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>  	struct kvm *kvm = vcpu->kvm;
>  	struct kvm_memslots *slots = kvm_memslots(kvm);
>  	struct kvm_memory_slot *slot;
> +	struct page *refcounted_page;
>  	unsigned long mmu_seq;
>  	kvm_pfn_t pfn;
> +	bool writable;
>  
>  	/* Defer reload until vmcs01 is the current VMCS. */
>  	if (is_guest_mode(vcpu)) {
> @@ -6827,7 +6829,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>  	 * controls the APIC-access page memslot, and only deletes the memslot
>  	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
>  	 */
> -	pfn = gfn_to_pfn_memslot(slot, gfn);
> +	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &refcounted_page);
>  	if (is_error_noslot_pfn(pfn))
>  		return;
>  
> @@ -6838,10 +6840,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>  		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
>  
>  	/*
> -	 * Do not pin apic access page in memory, the MMU notifier
> -	 * will call us again if it is migrated or swapped out.
> +	 * Do not pin the APIC access page in memory so that it can be freely
> +	 * migrated, the MMU notifier will call us again if it is migrated or
> +	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
> +	 * should always point at a refcounted page (if the pfn is valid).
>  	 */
> -	kvm_release_pfn_clean(pfn);
> +	if (!WARN_ON_ONCE(!refcounted_page))
> +		kvm_release_page_clean(refcounted_page);
Why it's not
if (!WARN_ON_ONCE(!refcounted_page)) {
	if (writable)
		kvm_release_page_dirty(refcounted_page)
	else
		kvm_release_page_clean(refcounted_page)
}

or simply not pass "writable" to __kvm_faultin_pfn() as we know the slot is
not read-only and then set dirty ?

if (!WARN_ON_ONCE(!refcounted_page))
	kvm_release_page_dirty(refcounted_page)

>  
>  	/*
>  	 * No need for a manual TLB flush at this point, KVM has already done a
> -- 
> 2.47.0.rc1.288.g06298d1525-goog
> 


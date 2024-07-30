From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 30 Jul 2024 10:59:57 +0200
Subject: [PATCH v12 50/84] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
In-Reply-To: <20240726235234.228822-51-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-51-seanjc@google.com>
Message-ID: <bb2d52e8-ceff-46e8-83a1-4db535754aa0@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/27/24 01:51, Sean Christopherson wrote:
> Use __kvm_faultin_page() get the APIC access page so that KVM can
> precisely release the refcounted page, i.e. to remove yet another user
> of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
> page fault, the semantics are effectively the same; KVM just happens to
> be mapping the pfn into a VMCS field instead of a secondary MMU.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/vmx/vmx.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 30032585f7dc..b109bd282a52 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6786,8 +6786,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>   	struct kvm *kvm = vcpu->kvm;
>   	struct kvm_memslots *slots = kvm_memslots(kvm);
>   	struct kvm_memory_slot *slot;
> +	struct page *refcounted_page;
>   	unsigned long mmu_seq;
>   	kvm_pfn_t pfn;
> +	bool ign;

Even if you don't use it, call the out argument "writable".

Paolo

>   
>   	/* Defer reload until vmcs01 is the current VMCS. */
>   	if (is_guest_mode(vcpu)) {
> @@ -6823,7 +6825,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>   	 * controls the APIC-access page memslot, and only deletes the memslot
>   	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
>   	 */
> -	pfn = gfn_to_pfn_memslot(slot, gfn);
> +	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &ign, &refcounted_page);
>   	if (is_error_noslot_pfn(pfn))
>   		return;
>   
> @@ -6834,10 +6836,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>   		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
>   
>   	/*
> -	 * Do not pin apic access page in memory, the MMU notifier
> -	 * will call us again if it is migrated or swapped out.
> +	 * Do not pin the APIC access page in memory so that it can be freely
> +	 * migrated, the MMU notifier will call us again if it is migrated or
> +	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
> +	 * should always point at a refcounted page (if the pfn is valid).
>   	 */
> -	kvm_release_pfn_clean(pfn);
> +	if (!WARN_ON_ONCE(!refcounted_page))
> +		kvm_release_page_clean(refcounted_page);
>   
>   	/*
>   	 * No need for a manual TLB flush at this point, KVM has already done a



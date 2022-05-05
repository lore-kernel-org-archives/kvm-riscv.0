From: Sean Christopherson <seanjc@google.com>
Date: Thu, 5 May 2022 23:46:51 +0000
Subject: [PATCH v4 13/20] KVM: x86/mmu: Decouple rmap_add() and
 link_shadow_page() from kvm_vcpu
In-Reply-To: <20220422210546.458943-14-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-14-dmatlack@google.com>
Message-ID: <YnRh6yyGQZ+U31U1@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 22, 2022, David Matlack wrote:
> -static void link_shadow_page(struct kvm_vcpu *vcpu, u64 *sptep,
> -			     struct kvm_mmu_page *sp)
> +static void __link_shadow_page(struct kvm_mmu_memory_cache *cache, u64 *sptep,
> +			       struct kvm_mmu_page *sp)
>  {
>  	u64 spte;
>  
> @@ -2297,12 +2300,17 @@ static void link_shadow_page(struct kvm_vcpu *vcpu, u64 *sptep,
>  
>  	mmu_spte_set(sptep, spte);
>  
> -	mmu_page_add_parent_pte(vcpu, sp, sptep);
> +	mmu_page_add_parent_pte(cache, sp, sptep);
>  
>  	if (sp->unsync_children || sp->unsync)
>  		mark_unsync(sptep);
>  }
>  
> +static void link_shadow_page(struct kvm_vcpu *vcpu, u64 *sptep, struct kvm_mmu_page *sp)

Nit, would prefer to wrap here, especially since __link_shadow_page() wraps.

> +{
> +	__link_shadow_page(&vcpu->arch.mmu_pte_list_desc_cache, sptep, sp);
> +}
> +
>  static void validate_direct_spte(struct kvm_vcpu *vcpu, u64 *sptep,
>  				   unsigned direct_access)
>  {
> -- 
> 2.36.0.rc2.479.g8af0fa9b8e-goog
> 


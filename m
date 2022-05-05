From: Sean Christopherson <seanjc@google.com>
Date: Thu, 5 May 2022 22:10:28 +0000
Subject: [PATCH v4 05/20] KVM: x86/mmu: Consolidate shadow page
 allocation and initialization
In-Reply-To: <20220422210546.458943-6-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-6-dmatlack@google.com>
Message-ID: <YnRLVB+t0bLBeu+/@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 22, 2022, David Matlack wrote:
> Consolidate kvm_mmu_alloc_page() and kvm_mmu_alloc_shadow_page() under
> the latter so that all shadow page allocation and initialization happens
> in one place.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 39 +++++++++++++++++----------------------
>  1 file changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 5582badf4947..7d03320f6e08 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1703,27 +1703,6 @@ static void drop_parent_pte(struct kvm_mmu_page *sp,
>  	mmu_spte_clear_no_track(parent_pte);
>  }
>  
> -static struct kvm_mmu_page *kvm_mmu_alloc_page(struct kvm_vcpu *vcpu, bool direct)
> -{
> -	struct kvm_mmu_page *sp;
> -
> -	sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
> -	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
> -	if (!direct)
> -		sp->gfns = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_gfn_array_cache);
> -	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
> -
> -	/*
> -	 * active_mmu_pages must be a FIFO list, as kvm_zap_obsolete_pages()
> -	 * depends on valid pages being added to the head of the list.  See
> -	 * comments in kvm_zap_obsolete_pages().
> -	 */
> -	sp->mmu_valid_gen = vcpu->kvm->arch.mmu_valid_gen;
> -	list_add(&sp->link, &vcpu->kvm->arch.active_mmu_pages);
> -	kvm_mod_used_mmu_pages(vcpu->kvm, +1);
> -	return sp;
> -}
> -
>  static void mark_unsync(u64 *spte);
>  static void kvm_mmu_mark_parents_unsync(struct kvm_mmu_page *sp)
>  {
> @@ -2100,7 +2079,23 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
>  						      struct hlist_head *sp_list,
>  						      union kvm_mmu_page_role role)
>  {
> -	struct kvm_mmu_page *sp = kvm_mmu_alloc_page(vcpu, role.direct);
> +	struct kvm_mmu_page *sp;
> +
> +	sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
> +	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
> +	if (!role.direct)
> +		sp->gfns = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_gfn_array_cache);
> +
> +	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
> +
> +	/*
> +	 * active_mmu_pages must be a FIFO list, as kvm_zap_obsolete_pages()
> +	 * depends on valid pages being added to the head of the list.  See
> +	 * comments in kvm_zap_obsolete_pages().
> +	 */
> +	sp->mmu_valid_gen = vcpu->kvm->arch.mmu_valid_gen;
> +	list_add(&sp->link, &vcpu->kvm->arch.active_mmu_pages);
> +	kvm_mod_used_mmu_pages(vcpu->kvm, +1);

To reduce churn later on, what about opportunistically grabbing vcpu->kvm in a
local variable in this patch?

Actually, at that point, it's a super trivial change, so you can probably just drop 

	KVM: x86/mmu: Replace vcpu with kvm in kvm_mmu_alloc_shadow_page()

and do the vcpu/kvm swap as part of

	KVM: x86/mmu: Pass memory caches to allocate SPs separately

>  	sp->gfn = gfn;
>  	sp->role = role;
> -- 
> 2.36.0.rc2.479.g8af0fa9b8e-goog
> 


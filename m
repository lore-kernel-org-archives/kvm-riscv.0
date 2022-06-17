From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 16:39:15 +0000
Subject: [PATCH v6 15/22] KVM: x86/mmu: Decouple rmap_add() and
 link_shadow_page() from kvm_vcpu
In-Reply-To: <20220516232138.1783324-16-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-16-dmatlack@google.com>
Message-ID: <YqyuM3v0SNPyrOmP@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
> @@ -1592,15 +1589,21 @@ static void rmap_add(struct kvm_vcpu *vcpu, const struct kvm_memory_slot *slot,
>  	sp = sptep_to_sp(spte);
>  	kvm_mmu_page_set_gfn(sp, spte - sp->spt, gfn);
>  	rmap_head = gfn_to_rmap(gfn, sp->role.level, slot);
> -	rmap_count = pte_list_add(vcpu, spte, rmap_head);
> +	rmap_count = pte_list_add(cache, spte, rmap_head);
>  
>  	if (rmap_count > RMAP_RECYCLE_THRESHOLD) {
> -		kvm_unmap_rmapp(vcpu->kvm, rmap_head, NULL, gfn, sp->role.level, __pte(0));
> +		kvm_unmap_rmapp(kvm, rmap_head, NULL, gfn, sp->role.level, __pte(0));

Ewww, the existing code is awful.  This call passes NULL for @slot, but it already
has a slot!  This could simply be

		pte_list_destroy(vcpu->kvm, rmap_head);

but that's undesirable with the current name as it's not remotely obvious that
pte_list_destroy() actually zaps rmaps.

I'll send a separate series to clean this up, e.g. rename pte_list_destroy() to
make it clear that it zaps SPTEs.  That'll also give me a good excuse to kill the
"p is for pointer" rmapp() naming scheme.  The only conflict with your series is
this one vcpu->kvm => kvm change, which is easy to note and resolve.

>  		kvm_flush_remote_tlbs_with_address(
> -				vcpu->kvm, sp->gfn, KVM_PAGES_PER_HPAGE(sp->role.level));
> +				kvm, sp->gfn, KVM_PAGES_PER_HPAGE(sp->role.level));
>  	}
>  }
>  
> +static void rmap_add(struct kvm_vcpu *vcpu, const struct kvm_memory_slot *slot,
> +		     u64 *spte, gfn_t gfn)
> +{
> +	__rmap_add(vcpu->kvm, &vcpu->arch.mmu_pte_list_desc_cache, slot, spte, gfn);

I prefer to grab "cache" locally,

	struct kvm_mmu_memory_cache *cache = &vcpu->arch.mmu_pte_list_desc_cache;

	__rmap_add(vcpu->kvm, cache, slot, spte, gfn);

both to keep the lines shorter in the final form (adding "access" runs yours out
to 93 chars), and because I find it easier to see read the call without a gigantic
parameter in the midde.


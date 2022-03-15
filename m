From: Peter Xu <peterx@redhat.com>
Date: Tue, 15 Mar 2022 17:03:50 +0800
Subject: [PATCH v2 06/26] KVM: x86/mmu: Pass memslot to
 kvm_mmu_new_shadow_page()
In-Reply-To: <20220311002528.2230172-7-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-7-dmatlack@google.com>
Message-ID: <YjBWdv3nEk3Cz40m@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:08AM +0000, David Matlack wrote:
> Passing the memslot to kvm_mmu_new_shadow_page() avoids the need for the
> vCPU pointer when write-protecting indirect 4k shadow pages. This moves
> us closer to being able to create new shadow pages during VM ioctls for
> eager page splitting, where there is not vCPU pointer.
> 
> This change does not negatively impact "Populate memory time" for ept=Y
> or ept=N configurations since kvm_vcpu_gfn_to_memslot() caches the last
> use slot. So even though we now look up the slot more often, it is a
> very cheap check.
> 
> Opportunistically move the code to write-protect GFNs shadowed by
> PG_LEVEL_4K shadow pages into account_shadowed() to reduce indentation
> and consolidate the code. This also eliminates a memslot lookup.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index b6fb50e32291..519910938478 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -793,16 +793,14 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn)
>  	update_gfn_disallow_lpage_count(slot, gfn, -1);
>  }
>  
> -static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
> +static void account_shadowed(struct kvm *kvm,
> +			     struct kvm_memory_slot *slot,
> +			     struct kvm_mmu_page *sp)
>  {
> -	struct kvm_memslots *slots;
> -	struct kvm_memory_slot *slot;
>  	gfn_t gfn;
>  
>  	kvm->arch.indirect_shadow_pages++;
>  	gfn = sp->gfn;
> -	slots = kvm_memslots_for_spte_role(kvm, sp->role);
> -	slot = __gfn_to_memslot(slots, gfn);
>  
>  	/* the non-leaf shadow pages are keeping readonly. */
>  	if (sp->role.level > PG_LEVEL_4K)
> @@ -810,6 +808,9 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
>  						    KVM_PAGE_TRACK_WRITE);
>  
>  	kvm_mmu_gfn_disallow_lpage(slot, gfn);
> +
> +	if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
> +		kvm_flush_remote_tlbs_with_address(kvm, gfn, 1);

It's not immediately obvious in this diff, but when looking at the code
yeah it looks right to just drop the 4K check..

I also never understood why we only write-track the >1 levels but only
wr-protect the last level.  It'll be great if there's quick answer from
anyone.. even though it's probably unrelated to the patch.

The change looks all correct:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu



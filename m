From: Peter Xu <peterx@redhat.com>
Date: Tue, 15 Mar 2022 16:50:50 +0800
Subject: [PATCH v2 04/26] KVM: x86/mmu: Decompose kvm_mmu_get_page() into
 separate functions
In-Reply-To: <20220311002528.2230172-5-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-5-dmatlack@google.com>
Message-ID: <YjBTal9gWoEKybxi@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:06AM +0000, David Matlack wrote:
> Decompose kvm_mmu_get_page() into separate helper functions to increase
> readability and prepare for allocating shadow pages without a vcpu
> pointer.
> 
> Specifically, pull the guts of kvm_mmu_get_page() into 3 helper
> functions:
> 
> __kvm_mmu_find_shadow_page() -
>   Walks the page hash checking for any existing mmu pages that match the
>   given gfn and role. Does not attempt to synchronize the page if it is
>   unsync.
> 
> kvm_mmu_find_shadow_page() -
>   Wraps __kvm_mmu_find_shadow_page() and handles syncing if necessary.
> 
> kvm_mmu_new_shadow_page()
>   Allocates and initializes an entirely new kvm_mmu_page. This currently
>   requries a vcpu pointer for allocation and looking up the memslot but
>   that will be removed in a future commit.
> 
>   Note, kvm_mmu_new_shadow_page() is temporary and will be removed in a
>   subsequent commit. The name uses "new" rather than the more typical
>   "alloc" to avoid clashing with the existing kvm_mmu_alloc_page().
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

Looks good to me, a few nitpicks and questions below.

> ---
>  arch/x86/kvm/mmu/mmu.c         | 132 ++++++++++++++++++++++++---------
>  arch/x86/kvm/mmu/paging_tmpl.h |   5 +-
>  arch/x86/kvm/mmu/spte.c        |   5 +-
>  3 files changed, 101 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 23c2004c6435..80dbfe07c87b 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -2027,16 +2027,25 @@ static void clear_sp_write_flooding_count(u64 *spte)
>  	__clear_sp_write_flooding_count(sptep_to_sp(spte));
>  }
>  
> -static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
> -					     union kvm_mmu_page_role role)
> +/*
> + * Searches for an existing SP for the given gfn and role. Makes no attempt to
> + * sync the SP if it is marked unsync.
> + *
> + * If creating an upper-level page table, zaps unsynced pages for the same
> + * gfn and adds them to the invalid_list. It's the callers responsibility
> + * to call kvm_mmu_commit_zap_page() on invalid_list.
> + */
> +static struct kvm_mmu_page *__kvm_mmu_find_shadow_page(struct kvm *kvm,
> +						       gfn_t gfn,
> +						       union kvm_mmu_page_role role,
> +						       struct list_head *invalid_list)
>  {
>  	struct hlist_head *sp_list;
>  	struct kvm_mmu_page *sp;
>  	int collisions = 0;
> -	LIST_HEAD(invalid_list);
>  
> -	sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
> -	for_each_valid_sp(vcpu->kvm, sp, sp_list) {
> +	sp_list = &kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
> +	for_each_valid_sp(kvm, sp, sp_list) {
>  		if (sp->gfn != gfn) {
>  			collisions++;
>  			continue;
> @@ -2053,60 +2062,109 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
>  			 * upper-level page will be write-protected.
>  			 */
>  			if (role.level > PG_LEVEL_4K && sp->unsync)
> -				kvm_mmu_prepare_zap_page(vcpu->kvm, sp,
> -							 &invalid_list);
> +				kvm_mmu_prepare_zap_page(kvm, sp, invalid_list);
> +
>  			continue;
>  		}
>  
> -		/* unsync and write-flooding only apply to indirect SPs. */
> -		if (sp->role.direct)
> -			goto trace_get_page;
> +		/* Write-flooding is only tracked for indirect SPs. */
> +		if (!sp->role.direct)
> +			__clear_sp_write_flooding_count(sp);
>  
> -		if (sp->unsync) {
> -			/*
> -			 * The page is good, but is stale.  kvm_sync_page does
> -			 * get the latest guest state, but (unlike mmu_unsync_children)
> -			 * it doesn't write-protect the page or mark it synchronized!
> -			 * This way the validity of the mapping is ensured, but the
> -			 * overhead of write protection is not incurred until the
> -			 * guest invalidates the TLB mapping.  This allows multiple
> -			 * SPs for a single gfn to be unsync.
> -			 *
> -			 * If the sync fails, the page is zapped.  If so, break
> -			 * in order to rebuild it.
> -			 */
> -			if (!kvm_sync_page(vcpu, sp, &invalid_list))
> -				break;
> +		goto out;
> +	}
>  
> -			WARN_ON(!list_empty(&invalid_list));
> -			kvm_flush_remote_tlbs(vcpu->kvm);
> -		}
> +	sp = NULL;
>  
> -		__clear_sp_write_flooding_count(sp);
> +out:
> +	if (collisions > kvm->stat.max_mmu_page_hash_collisions)
> +		kvm->stat.max_mmu_page_hash_collisions = collisions;
> +
> +	return sp;
> +}
>  
> -trace_get_page:
> -		trace_kvm_mmu_get_page(sp, false);
> +/*
> + * Looks up an existing SP for the given gfn and role if one exists. The
> + * return SP is guaranteed to be synced.
> + */
> +static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
> +						     gfn_t gfn,
> +						     union kvm_mmu_page_role role)
> +{
> +	struct kvm_mmu_page *sp;
> +	LIST_HEAD(invalid_list);
> +
> +	sp = __kvm_mmu_find_shadow_page(vcpu->kvm, gfn, role, &invalid_list);
> +	if (!sp)
>  		goto out;
> +
> +	if (sp->unsync) {
> +		/*
> +		 * The page is good, but is stale.  kvm_sync_page does
> +		 * get the latest guest state, but (unlike mmu_unsync_children)
> +		 * it doesn't write-protect the page or mark it synchronized!
> +		 * This way the validity of the mapping is ensured, but the
> +		 * overhead of write protection is not incurred until the
> +		 * guest invalidates the TLB mapping.  This allows multiple
> +		 * SPs for a single gfn to be unsync.
> +		 *
> +		 * If the sync fails, the page is zapped and added to the
> +		 * invalid_list.
> +		 */
> +		if (!kvm_sync_page(vcpu, sp, &invalid_list)) {
> +			sp = NULL;
> +			goto out;
> +		}
> +
> +		WARN_ON(!list_empty(&invalid_list));

Not related to this patch because I think it's a pure movement here,
however I have a question on why invalid_list is guaranteed to be empty..

I'm thinking the case where when lookup the page we could have already
called kvm_mmu_prepare_zap_page() there, then when reach here (which is the
kvm_sync_page==true case) invalid_list shouldn't be touched in
kvm_sync_page(), so it looks possible that it still contains some page to
be commited?

> +		kvm_flush_remote_tlbs(vcpu->kvm);
>  	}
>  
> +out:

I'm wondering whether this "out" can be dropped.. with something like:

        sp = __kvm_mmu_find_shadow_page(...);

        if (sp && sp->unsync) {
                if (kvm_sync_page(vcpu, sp, &invalid_list)) {
                        ..
                } else {
                        sp = NULL;
                }
        }

[...]

> +static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
> +					     union kvm_mmu_page_role role)
> +{
> +	struct kvm_mmu_page *sp;
> +	bool created = false;
> +
> +	sp = kvm_mmu_find_shadow_page(vcpu, gfn, role);
> +	if (sp)
> +		goto out;
> +
> +	created = true;
> +	sp = kvm_mmu_new_shadow_page(vcpu, gfn, role);
> +
> +out:
> +	trace_kvm_mmu_get_page(sp, created);
>  	return sp;

Same here, wondering whether we could drop the "out" by:

        sp = kvm_mmu_find_shadow_page(vcpu, gfn, role);
        if (!sp) {
                created = true;
                sp = kvm_mmu_new_shadow_page(vcpu, gfn, role);
        }

        trace_kvm_mmu_get_page(sp, created);
        return sp;

Thanks,

-- 
Peter Xu



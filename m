From: Sean Christopherson <seanjc@google.com>
Date: Sat, 9 Apr 2022 00:39:55 +0000
Subject: [PATCH v3 22/23] KVM: x86/mmu: Support Eager Page Splitting in
 the shadow MMU
In-Reply-To: <20220401175554.1931568-23-dmatlack@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
 <20220401175554.1931568-23-dmatlack@google.com>
Message-ID: <YlDV27ediz+rBuLd@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 01, 2022, David Matlack wrote:
> Add support for Eager Page Splitting pages that are mapped by the shadow
> MMU. Walk through the rmap first splitting all 1GiB pages to 2MiB pages,
> and then splitting all 2MiB pages to 4KiB pages.
> 
> Splitting huge pages mapped by the shadow MMU requries dealing with some
> extra complexity beyond that of the TDP MMU:
> 
> (1) The shadow MMU has a limit on the number of shadow pages that are
>     allowed to be allocated. So, as a policy, Eager Page Splitting
>     refuses to split if there are KVM_MIN_FREE_MMU_PAGES or fewer
>     pages available.
> 
> (2) Huge pages may be mapped by indirect shadow pages which have the
>     possibility of being unsync. As a policy we opt not to split such
>     pages as their translation may no longer be valid.

This shouldn't be possible, shadow pages whose role is > 4k are always write-protected
and not allowed to become unsync.

> 
> (3) Splitting a huge page may end up re-using an existing lower level
>     shadow page tables. This is unlike the TDP MMU which always allocates
>     new shadow page tables when splitting.

...

> +static void kvm_mmu_split_huge_page(struct kvm *kvm,
> +				    const struct kvm_memory_slot *slot,
> +				    u64 *huge_sptep, struct kvm_mmu_page **spp)
> +
> +{
> +	struct kvm_mmu_memory_cache *cache = &kvm->arch.huge_page_split_desc_cache;
> +	u64 huge_spte = READ_ONCE(*huge_sptep);
> +	struct kvm_mmu_page *sp;
> +	bool flush = false;
> +	u64 *sptep, spte;
> +	gfn_t gfn;
> +	int index;
> +
> +	sp = kvm_mmu_get_sp_for_split(kvm, slot, huge_sptep, spp);
> +
> +	for (index = 0; index < PT64_ENT_PER_PAGE; index++) {
> +		sptep = &sp->spt[index];
> +		gfn = kvm_mmu_page_get_gfn(sp, index);
> +
> +		/*
> +		 * sp may have populated page table entries, e.g. if this huge
> +		 * page is aliased by multiple sptes with the same access
> +		 * permissions. We know the sptes will be mapping the same
> +		 * gfn-to-pfn translation since sp is direct. However, a given
> +		 * spte may point to an even lower level page table. We don't
> +		 * know if that lower level page table is completely filled in,
> +		 * i.e. we may be effectively unmapping a region of memory, so
> +		 * we must flush the TLB.

Random side topic, please avoid "we" and other pronouns in comments and changelogs,
it gets real easy to lose track of what a pronoun is referring to, especially in
changelogs where "we" might be KVM, might be the kernel, might be the team that's
using the patch, might be an author that's prone to illeism, etc...


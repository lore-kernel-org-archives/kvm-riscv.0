From: Ben Gardon <bgardon@google.com>
Date: Mon, 12 Dec 2022 11:32:05 -0800
Subject: [RFC PATCH 20/37] KVM: x86/mmu: Abstract away computing the max
 mapping level
In-Reply-To: <20221208193857.4090582-21-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-21-dmatlack@google.com>
Message-ID: <CANgfPd-6LNdZ42tb0DnC21r1Z5JGR_1Lvvop8RKJJ8hEz+PUDg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 8, 2022 at 11:39 AM David Matlack <dmatlack@google.com> wrote:
>
> Abstract away kvm_mmu_max_mapping_level(), which is an x86-specific
> function for computing the max level that a given GFN can be mapped in
> KVM's page tables. This will be used in a future commit to enable moving
> the TDP MMU to common code.
>
> Provide a default implementation for non-x86 architectures that just
> returns the max level. This will result in more zapping than necessary
> when disabling dirty logging (i.e. less than optimal performance) but no
> correctness issues.

Apologies if you already implemented it in a later patch in this
series, but would it not at least be possible to port
host_pfn_mapping_level to common code and check that?
I'm assuming, though I could be wrong, that all archs map GFNs with at
most a host page table granularity mapping.
I suppose that doesn't strictly need to be included in this series,
but it would be worth addressing in the commit description.

>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/tdp_mmu.c     | 14 ++++++++++----
>  arch/x86/kvm/mmu/tdp_pgtable.c |  7 +++++++
>  2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 7670fbd8e72d..24d1dbd0a1ec 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1696,6 +1696,13 @@ void kvm_tdp_mmu_clear_dirty_pt_masked(struct kvm *kvm,
>                 clear_dirty_pt_masked(kvm, root, gfn, mask, wrprot);
>  }
>
> +__weak int tdp_mmu_max_mapping_level(struct kvm *kvm,
> +                                    const struct kvm_memory_slot *slot,
> +                                    struct tdp_iter *iter)
> +{
> +       return TDP_MAX_HUGEPAGE_LEVEL;
> +}
> +
>  static void zap_collapsible_spte_range(struct kvm *kvm,
>                                        struct kvm_mmu_page *root,
>                                        const struct kvm_memory_slot *slot)
> @@ -1727,15 +1734,14 @@ static void zap_collapsible_spte_range(struct kvm *kvm,
>                 /*
>                  * If iter.gfn resides outside of the slot, i.e. the page for
>                  * the current level overlaps but is not contained by the slot,
> -                * then the SPTE can't be made huge.  More importantly, trying
> -                * to query that info from slot->arch.lpage_info will cause an
> +                * then the SPTE can't be made huge. On x86, trying to query
> +                * that info from slot->arch.lpage_info will cause an
>                  * out-of-bounds access.
>                  */
>                 if (iter.gfn < start || iter.gfn >= end)
>                         continue;
>
> -               max_mapping_level = kvm_mmu_max_mapping_level(kvm, slot,
> -                                                             iter.gfn, PG_LEVEL_NUM);
> +               max_mapping_level = tdp_mmu_max_mapping_level(kvm, slot, &iter);
>                 if (max_mapping_level < iter.level)
>                         continue;
>
> diff --git a/arch/x86/kvm/mmu/tdp_pgtable.c b/arch/x86/kvm/mmu/tdp_pgtable.c
> index b07ed99b4ab1..840d063c45b8 100644
> --- a/arch/x86/kvm/mmu/tdp_pgtable.c
> +++ b/arch/x86/kvm/mmu/tdp_pgtable.c
> @@ -163,3 +163,10 @@ void tdp_mmu_arch_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp,
>         if (shared)
>                 spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
>  }
> +
> +int tdp_mmu_max_mapping_level(struct kvm *kvm,
> +                             const struct kvm_memory_slot *slot,
> +                             struct tdp_iter *iter)
> +{
> +       return kvm_mmu_max_mapping_level(kvm, slot, iter->gfn, PG_LEVEL_NUM);
> +}
> --
> 2.39.0.rc1.256.g54fd8350bd-goog
>


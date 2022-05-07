From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Sat, 7 May 2022 15:51:50 +0800
Subject: [PATCH v4 20/20] KVM: x86/mmu: Extend Eager Page Splitting to
 nested MMUs
In-Reply-To: <20220422210546.458943-21-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-21-dmatlack@google.com>
Message-ID: <de48ed40-4e6e-c49d-426e-91aba4ce1337@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 2022/4/23 05:05, David Matlack wrote:
> Add support for Eager Page Splitting pages that are mapped by nested
> MMUs. Walk through the rmap first splitting all 1GiB pages to 2MiB
> pages, and then splitting all 2MiB pages to 4KiB pages.
>
> Note, Eager Page Splitting is limited to nested MMUs as a policy rather
> than due to any technical reason (the sp->role.guest_mode check could
> just be deleted and Eager Page Splitting would work correctly for all
> shadow MMU pages). There is really no reason to support Eager Page
> Splitting for tdp_mmu=N, since such support will eventually be phased
> out, and there is no current use case supporting Eager Page Splitting on
> hosts where TDP is either disabled or unavailable in hardware.
> Furthermore, future improvements to nested MMU scalability may diverge
> the code from the legacy shadow paging implementation. These
> improvements will be simpler to make if Eager Page Splitting does not
> have to worry about legacy shadow paging.
>
> Splitting huge pages mapped by nested MMUs requires dealing with some
> extra complexity beyond that of the TDP MMU:
>
> (1) The shadow MMU has a limit on the number of shadow pages that are
>      allowed to be allocated. So, as a policy, Eager Page Splitting
>      refuses to split if there are KVM_MIN_FREE_MMU_PAGES or fewer
>      pages available.
>
> (2) Splitting a huge page may end up re-using an existing lower level
>      shadow page tables. This is unlike the TDP MMU which always allocates
>      new shadow page tables when splitting.
>
> (3) When installing the lower level SPTEs, they must be added to the
>      rmap which may require allocating additional pte_list_desc structs.
>
> Case (2) is especially interesting since it may require a TLB flush,
> unlike the TDP MMU which can fully split huge pages without any TLB
> flushes. Specifically, an existing lower level page table may point to
> even lower level page tables that are not fully populated, effectively
> unmapping a portion of the huge page, which requires a flush.
>
> This commit performs such flushes after dropping the huge page and
> before installing the lower level page table. This TLB flush could
> instead be delayed until the MMU lock is about to be dropped, which
> would batch flushes for multiple splits.  However these flushes should
> be rare in practice (a huge page must be aliased in multiple SPTEs and
> have been split for NX Huge Pages in only some of them). Flushing
> immediately is simpler to plumb and also reduces the chances of tripping
> over a CPU bug (e.g. see iTLB multihit).
>
> Suggested-by: Peter Feiner <pfeiner@google.com>
> [ This commit is based off of the original implementation of Eager Page
>    Splitting from Peter in Google's kernel from 2016. ]
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |   3 +-
>   arch/x86/include/asm/kvm_host.h               |  20 ++
>   arch/x86/kvm/mmu/mmu.c                        | 276 +++++++++++++++++-
>   arch/x86/kvm/x86.c                            |   6 +
>   4 files changed, 296 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3f1cc5e317ed..bc3ad3d4df0b 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2387,8 +2387,7 @@
>   			the KVM_CLEAR_DIRTY ioctl, and only for the pages being
>   			cleared.
>   
> -			Eager page splitting currently only supports splitting
> -			huge pages mapped by the TDP MMU.
> +			Eager page splitting is only supported when kvm.tdp_mmu=Y.
>   
>   			Default is Y (on).
>   
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 15131aa05701..5df4dff385a1 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1240,6 +1240,24 @@ struct kvm_arch {
>   	hpa_t	hv_root_tdp;
>   	spinlock_t hv_root_tdp_lock;
>   #endif
> +
> +	/*
> +	 * Memory caches used to allocate shadow pages when performing eager
> +	 * page splitting. No need for a shadowed_info_cache since eager page
> +	 * splitting only allocates direct shadow pages.
> +	 */
> +	struct kvm_mmu_memory_cache split_shadow_page_cache;
> +	struct kvm_mmu_memory_cache split_page_header_cache;
> +
> +	/*
> +	 * Memory cache used to allocate pte_list_desc structs while splitting
> +	 * huge pages. In the worst case, to split one huge page, 512
> +	 * pte_list_desc structs are needed to add each lower level leaf sptep
> +	 * to the rmap plus 1 to extend the parent_ptes rmap of the lower level
> +	 * page table.
> +	 */
> +#define SPLIT_DESC_CACHE_CAPACITY 513
> +	struct kvm_mmu_memory_cache split_desc_cache;
>   };
>   
>   


I think it needs to document that the topup operations for these caches are

protected by kvm->slots_lock.



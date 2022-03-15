From: Peter Xu <peterx@redhat.com>
Date: Tue, 15 Mar 2022 18:37:38 +0800
Subject: [PATCH v2 14/26] KVM: x86/mmu: Decouple rmap_add() and
 link_shadow_page() from kvm_vcpu
In-Reply-To: <20220311002528.2230172-15-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-15-dmatlack@google.com>
Message-ID: <YjBsctBz5RAWUd8r@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:16AM +0000, David Matlack wrote:
> Allow adding new entries to the rmap and linking shadow pages without a
> struct kvm_vcpu pointer by moving the implementation of rmap_add() and
> link_shadow_page() into inner helper functions.
> 
> No functional change intended.
> 
> Reviewed-by: Ben Gardon <bgardon@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 43 +++++++++++++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index d7ad71be6c52..c57070ed157d 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -725,9 +725,9 @@ static void mmu_free_memory_caches(struct kvm_vcpu *vcpu)
>  	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_header_cache);
>  }
>  
> -static struct pte_list_desc *mmu_alloc_pte_list_desc(struct kvm_vcpu *vcpu)
> +static struct pte_list_desc *mmu_alloc_pte_list_desc(struct kvm_mmu_memory_cache *cache)
>  {
> -	return kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_pte_list_desc_cache);
> +	return kvm_mmu_memory_cache_alloc(cache);
>  }

Nit: same here, IMHO we could drop mmu_alloc_pte_list_desc() already..

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



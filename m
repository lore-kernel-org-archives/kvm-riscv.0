From: Sean Christopherson <seanjc@google.com>
Date: Thu, 23 Jun 2022 23:53:59 +0000
Subject: [PATCH v7 19/23] KVM: x86/mmu: Zap collapsible SPTEs in shadow
 MMU at all possible levels
In-Reply-To: <20220622192710.2547152-20-pbonzini@redhat.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com>
 <20220622192710.2547152-20-pbonzini@redhat.com>
Message-ID: <YrT9F6S/PjYVk6Hr@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 22, 2022, Paolo Bonzini wrote:
> From: David Matlack <dmatlack@google.com>
> 
> Currently KVM only zaps collapsible 4KiB SPTEs in the shadow MMU. This
> is fine for now since KVM never creates intermediate huge pages during
> dirty logging. In other words, KVM always replaces 1GiB pages directly
> with 4KiB pages, so there is no reason to look for collapsible 2MiB
> pages.
> 
> However, this will stop being true once the shadow MMU participates in
> eager page splitting. During eager page splitting, each 1GiB is first
> split into 2MiB pages and then those are split into 4KiB pages. The
> intermediate 2MiB pages may be left behind if an error condition causes
> eager page splitting to bail early.
> 
> No functional change intended.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> Message-Id: <20220516232138.1783324-20-dmatlack@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 13a059ad5dc7..36bc49f08d60 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -6154,18 +6154,25 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
>  	return need_tlb_flush;
>  }
>  
> +static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
> +					   const struct kvm_memory_slot *slot)
> +{
> +	/*
> +	 * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1 since there's no need to zap
> +	 * pages that are already mapped at the maximum possible level.
> +	 */
> +	if (slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
> +			      PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1,
> +			      true))

Can you fix this up to put "true" on the previous line?

And if you do that, maybe also tweak the comment to reference "hugepage level"
instead of "possible level"?

---
 arch/x86/kvm/mmu/mmu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 8825716060e4..34b0e85b26a4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6450,12 +6450,11 @@ static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
 					   const struct kvm_memory_slot *slot)
 {
 	/*
-	 * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1 since there's no need to zap
-	 * pages that are already mapped at the maximum possible level.
+	 * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1, there's no need to zap pages
+	 * that are already mapped at the maximum hugepage level.
 	 */
 	if (slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
-			      PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1,
-			      true))
+			      PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1, true))
 		kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
 }


base-commit: fd43332c2900db8ca852676f37f0ab423d0c369a
--



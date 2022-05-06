From: Sean Christopherson <seanjc@google.com>
Date: Fri, 6 May 2022 19:47:13 +0000
Subject: [PATCH v4 15/20] KVM: x86/mmu: Cache the access bits of shadowed
 translations
In-Reply-To: <20220422210546.458943-16-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-16-dmatlack@google.com>
Message-ID: <YnV7QUOkYVg+Ktnl@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 22, 2022, David Matlack wrote:
> diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
> index a8a755e1561d..97bf53b29b88 100644
> --- a/arch/x86/kvm/mmu/paging_tmpl.h
> +++ b/arch/x86/kvm/mmu/paging_tmpl.h
> @@ -978,7 +978,8 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
>  }
>  
>  /*
> - * Using the cached information from sp->gfns is safe because:
> + * Using the information in sp->shadowed_translation (kvm_mmu_page_get_gfn()
> + * and kvm_mmu_page_get_access()) is safe because:
>   * - The spte has a reference to the struct page, so the pfn for a given gfn
>   *   can't change unless all sptes pointing to it are nuked first.
>   *
> @@ -1052,12 +1053,15 @@ static int FNAME(sync_page)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp)
>  		if (sync_mmio_spte(vcpu, &sp->spt[i], gfn, pte_access))
>  			continue;
>  
> -		if (gfn != sp->gfns[i]) {
> +		if (gfn != kvm_mmu_page_get_gfn(sp, i)) {
>  			drop_spte(vcpu->kvm, &sp->spt[i]);
>  			flush = true;
>  			continue;
>  		}
>  
> +		if (pte_access != kvm_mmu_page_get_access(sp, i))
> +			kvm_mmu_page_set_access(sp, i, pte_access);

Very tangentially related, and more an FYI than anything else (I'll send a patch
separately)...   Replying here because this got me wondering about the validity of
pte_access.

There's an existing bug for nEPT here, which I proved after 3 hours of fighting
with KUT's EPT tests (ugh).

  1. execute-only EPT entries are supported
  2. L1 creates a upper-level RW EPTE and a 4kb leaf RW EPTE
  3. L2 accesses the address; KVM installs a SPTE
  4. L1 modifies the leaf EPTE to be X-only, and does INVEPT
  5. ept_sync_page() creates a SPTE with pte_access=0 / RWX=0

The logic for pte_access (just above this code) is:

		pte_access = sp->role.access;
		pte_access &= FNAME(gpte_access)(gpte);

The parent guest EPTE is 'RW', and so sp->role.access is 'RW'.  When the new 'X'
EPTE is ANDed with the 'RW' parent protections, the result is a RWX=0 SPTE.  This
is only possible if execute-only is supported, because otherwise PTEs are always
readable, i.e. shadow_present_mask is non-zero.

I don't think anything bad happens per se, but it's odd to have a !PRESENT in
hardware, shadow-present SPTE.  I think the correct/easiest fix is:

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index b025decf610d..f8ea881cfce6 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -1052,7 +1052,7 @@ static int FNAME(sync_page)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp)
                if (sync_mmio_spte(vcpu, &sp->spt[i], gfn, pte_access))
                        continue;

-               if (gfn != sp->gfns[i]) {
+               if ((!pte_access && !shadow_present_mask) || gfn != sp->gfns[i]) {
                        drop_spte(vcpu->kvm, &sp->spt[i]);
                        flush = true;
                        continue;
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 75c9e87d446a..9ad60662beac 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -101,6 +101,8 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
        u64 spte = SPTE_MMU_PRESENT_MASK;
        bool wrprot = false;

+       WARN_ON_ONCE(!pte_access && !shadow_present_mask);
+
        if (sp->role.ad_disabled)
                spte |= SPTE_TDP_AD_DISABLED_MASK;
        else if (kvm_mmu_page_ad_need_write_protect(sp))


> +
>  		sptep = &sp->spt[i];
>  		spte = *sptep;
>  		host_writable = spte & shadow_host_writable_mask;
> -- 
> 2.36.0.rc2.479.g8af0fa9b8e-goog
> 


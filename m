From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Dec 2021 19:34:08 +0100
Subject: [PATCH v5 08/12] KVM: Reinstate gfn_to_pfn_cache with
 invalidation support
In-Reply-To: <20211121125451.9489-9-dwmw2@infradead.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-9-dwmw2@infradead.org>
Message-ID: <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sorry for the late review...

On 11/21/21 13:54, David Woodhouse wrote:
> +EXPORT_SYMBOL_GPL(kvm_gfn_to_pfn_cache_check);
> +
> +static void __release_gpc(struct kvm *kvm, kvm_pfn_t pfn, void *khva,
> +			  gpa_t gpa, bool dirty)
> +{
> +	/* Unmap the old page if it was mapped before, and release it */
> +	if (!is_error_noslot_pfn(pfn)) {
> +		if (khva) {
> +			if (pfn_valid(pfn))
> +				kunmap(pfn_to_page(pfn));
> +#ifdef CONFIG_HAS_IOMEM
> +			else
> +				memunmap(khva);
> +#endif
> +		}

Considering that the khva is passed directly to memunmap, perhaps it's
cleaner to ensure it's page-aligned:

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 13cae72d39e9..267477bd2972 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -147,7 +147,7 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
  
  	old_gpa = gpc->gpa;
  	old_pfn = gpc->pfn;
-	old_khva = gpc->khva;
+	old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
  	old_uhva = gpc->uhva;
  	old_valid = gpc->valid;
  	old_dirty = gpc->dirty;
@@ -209,7 +209,7 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
  
  		if (gpc->kernel_map) {
  			if (new_pfn == old_pfn) {
-				new_khva = (void *)((unsigned long)old_khva - page_offset);
+				new_khva = old_khva;
  				old_pfn = KVM_PFN_ERR_FAULT;
  				old_khva = NULL;
  			} else if (pfn_valid(new_pfn)) {
@@ -265,7 +265,7 @@ void kvm_gfn_to_pfn_cache_unmap(struct kvm *kvm, struct gfn_to_pfn_cache *gpc)
  
  	gpc->valid = false;
  
-	old_khva = gpc->khva;
+	old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
  	old_dirty = gpc->dirty;
  	old_gpa = gpc->gpa;
  	old_pfn = gpc->pfn;


> 
> +	retry_map:
> +		mmu_seq = kvm->mmu_notifier_seq;
> +		smp_rmb();
> +
> +		/* We always request a writeable mapping */
> +		new_pfn = hva_to_pfn(uhva, false, NULL, true, NULL);
> +		if (is_error_noslot_pfn(new_pfn)) {
> +			ret = -EFAULT;
> +			goto map_done;
> +		}
> +
> +		KVM_MMU_READ_LOCK(kvm);
> +		retry = mmu_notifier_retry_hva(kvm, mmu_seq, uhva);
> +		KVM_MMU_READ_UNLOCK(kvm);
> +		if (retry) {
> +			cond_resched();
> +			goto retry_map;
> +		}
> +

This should also be a separate function, like

static kvm_pfn_t hva_to_pfn_retry(unsigned long uhva)
{
         kvm_pfn_t new_pfn
         unsigned long mmu_seq;
         int retry;

retry_map:
         mmu_seq = kvm->mmu_notifier_seq;
         smp_rmb();

         /* We always request a writeable mapping */
         new_pfn = hva_to_pfn(uhva, false, NULL, true, NULL);
         if (is_error_noslot_pfn(new_pfn))
                 return new_pfn;

         KVM_MMU_READ_LOCK(kvm);
         retry = mmu_notifier_retry_hva(kvm, mmu_seq, uhva);
         KVM_MMU_READ_UNLOCK(kvm);
         if (retry) {
                 cond_resched();
                 goto retry_map;
         }
         return new_pfn;
}

> 
> +		write_lock_irq(&gpc->lock);
> +		if (ret) {
> +			gpc->valid = false;
> +			gpc->pfn = KVM_PFN_ERR_FAULT;
> +			gpc->khva = NULL;
> +		} else {
> +			/* At this point, gpc->valid may already have been cleared */
> +			gpc->pfn = new_pfn;
> +			gpc->khva = new_khva + page_offset;
> +		}

Should set gpc->khva only if new_khva != NULL (i.e. only if gpc->kernel_map
is true).

Paolo


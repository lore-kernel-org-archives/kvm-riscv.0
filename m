From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 May 2021 13:09:12 +0300
Subject: [PATCH v18 11/18] RISC-V: KVM: Implement MMU notifiers
In-Reply-To: <20210519033553.1110536-12-anup.patel@wdc.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <20210519033553.1110536-12-anup.patel@wdc.com>
Message-ID: <20210519100912.GR1955@kadam>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 19, 2021 at 09:05:46AM +0530, Anup Patel wrote:
>  int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
>  			 struct kvm_memory_slot *memslot,
>  			 gpa_t gpa, unsigned long hva, bool is_write)
> @@ -569,7 +643,7 @@ int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
>  	struct kvm_mmu_page_cache *pcache = &vcpu->arch.mmu_page_cache;
>  	bool logging = (memslot->dirty_bitmap &&
>  			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
> -	unsigned long vma_pagesize;
> +	unsigned long vma_pagesize, mmu_seq;
>  
>  	mmap_read_lock(current->mm);
>  
> @@ -608,6 +682,8 @@ int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
>  		return ret;
>  	}
>  
> +	mmu_seq = kvm->mmu_notifier_seq;
> +
>  	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writeable);
>  	if (hfn == KVM_PFN_ERR_HWPOISON) {
>  		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
> @@ -626,6 +702,9 @@ int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
>  
>  	spin_lock(&kvm->mmu_lock);
>  
> +	if (mmu_notifier_retry(kvm, mmu_seq))
> +		goto out_unlock;

Do we need an error code here or is it a success path?  You would
expect from the name that mmu_notifier_retry() would retry something
and return an error code, but it's actually a boolean function.

regards,
dan carpenter

> +
>  	if (writeable) {
>  		kvm_set_pfn_dirty(hfn);
>  		mark_page_dirty(kvm, gfn);
> @@ -639,6 +718,7 @@ int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
>  	if (ret)
>  		kvm_err("Failed to map in stage2\n");
>  
> +out_unlock:
>  	spin_unlock(&kvm->mmu_lock);
>  	kvm_set_pfn_accessed(hfn);
>  	kvm_release_pfn_clean(hfn);



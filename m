From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 24 Mar 2023 13:49:29 +0100
Subject: [PATCH] KVM: RISC-V: Retry fault if vma_lookup() results become
 invalid
In-Reply-To: <20230317211106.1234484-1-dmatlack@google.com>
References: <20230317211106.1234484-1-dmatlack@google.com>
Message-ID: <20230324124929.6epv73escdcwq44e@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 17, 2023 at 02:11:06PM -0700, David Matlack wrote:
> Read mmu_invalidate_seq before dropping the mmap_lock so that KVM can
> detect if the results of vma_lookup() (e.g. vma_shift) become stale
> before it acquires kvm->mmu_lock. This fixes a theoretical bug where a
> VMA could be changed by userspace after vma_lookup() and before KVM
> reads the mmu_invalidate_seq, causing KVM to install page table entries
> based on a (possibly) no-longer-valid vma_shift.
> 
> Re-order the MMU cache top-up to earlier in user_mem_abort() so that it

s/user_mem_abort/kvm_riscv_gstage_map/

> is not done after KVM has read mmu_invalidate_seq (i.e. so as to avoid
> inducing spurious fault retries).
> 
> It's unlikely that any sane userspace currently modifies VMAs in such a
> way as to trigger this race. And even with directed testing I was unable
> to reproduce it. But a sufficiently motivated host userspace might be
> able to exploit this race.
> 
> Note KVM/ARM had the same bug and was fixed in a separate, near
> identical patch (see Link).
> 
> Link: https://lore.kernel.org/kvm/20230313235454.2964067-1-dmatlack at google.com/
> Fixes: 9955371cc014 ("RISC-V: KVM: Implement MMU notifiers")
> Cc: stable at vger.kernel.org
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
> Note: Compile-tested only.
> 
>  arch/riscv/kvm/mmu.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 78211aed36fa..46d692995830 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -628,6 +628,13 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
>  	unsigned long vma_pagesize, mmu_seq;
>  
> +	/* We need minimum second+third level pages */
> +	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
> +	if (ret) {
> +		kvm_err("Failed to topup G-stage cache\n");
> +		return ret;
> +	}
> +
>  	mmap_read_lock(current->mm);
>  
>  	vma = vma_lookup(current->mm, hva);
> @@ -648,6 +655,15 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
>  		gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
>  
> +	/*
> +	 * Read mmu_invalidate_seq so that KVM can detect if the results of
> +	 * vma_lookup() or gfn_to_pfn_prot() become stale priort to acquiring

s/priort/prior/

> +	 * kvm->mmu_lock.
> +	 *
> +	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
> +	 * with the smp_wmb() in kvm_mmu_invalidate_end().
> +	 */
> +	mmu_seq = kvm->mmu_invalidate_seq;
>  	mmap_read_unlock(current->mm);
>  
>  	if (vma_pagesize != PUD_SIZE &&
> @@ -657,15 +673,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		return -EFAULT;
>  	}
>  
> -	/* We need minimum second+third level pages */
> -	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
> -	if (ret) {
> -		kvm_err("Failed to topup G-stage cache\n");
> -		return ret;
> -	}
> -
> -	mmu_seq = kvm->mmu_invalidate_seq;
> -
>  	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
>  	if (hfn == KVM_PFN_ERR_HWPOISON) {
>  		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
> 
> base-commit: eeac8ede17557680855031c6f305ece2378af326
> -- 
> 2.40.0.rc2.332.ga46443480c-goog
> 
>

Thanks,
drew


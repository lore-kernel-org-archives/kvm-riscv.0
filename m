From: Jiangyifei <jiangyifei@huawei.com>
Date: Mon, 16 Nov 2020 09:29:31 +0000
Subject: [PATCH v15 10/17] RISC-V: KVM: Implement stage2 page table
 programming
In-Reply-To: <20201109113240.3733496-11-anup.patel@wdc.com>
References: <20201109113240.3733496-1-anup.patel@wdc.com>
 <20201109113240.3733496-11-anup.patel@wdc.com>
Message-ID: <186ade3c372b44ef8ca1830da8c5002b@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Anup Patel [mailto:anup.patel at wdc.com]
> Sent: Monday, November 9, 2020 7:33 PM
> To: Palmer Dabbelt <palmer@dabbelt.com>; Palmer Dabbelt
> <palmerdabbelt@google.com>; Paul Walmsley <paul.walmsley@sifive.com>;
> Albert Ou <aou@eecs.berkeley.edu>; Paolo Bonzini <pbonzini@redhat.com>
> Cc: Alexander Graf <graf@amazon.com>; Atish Patra <atish.patra@wdc.com>;
> Alistair Francis <Alistair.Francis@wdc.com>; Damien Le Moal
> <damien.lemoal@wdc.com>; Anup Patel <anup@brainfault.org>;
> kvm at vger.kernel.org; kvm-riscv at lists.infradead.org;
> linux-riscv at lists.infradead.org; linux-kernel at vger.kernel.org; Anup Patel
> <anup.patel@wdc.com>; Jiangyifei <jiangyifei@huawei.com>
> Subject: [PATCH v15 10/17] RISC-V: KVM: Implement stage2 page table
> programming
> 
> This patch implements all required functions for programming the stage2 page
> table for each Guest/VM.
> 
> At high-level, the flow of stage2 related functions is similar from KVM
> ARM/ARM64 implementation but the stage2 page table format is quite
> different for KVM RISC-V.
> 
> [jiangyifei: stage2 dirty log support]
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/riscv/include/asm/kvm_host.h     |  12 +
>  arch/riscv/include/asm/pgtable-bits.h |   1 +
>  arch/riscv/kvm/Kconfig                |   1 +
>  arch/riscv/kvm/main.c                 |  19 +
>  arch/riscv/kvm/mmu.c                  | 649
> +++++++++++++++++++++++++-
>  arch/riscv/kvm/vm.c                   |   6 -
>  6 files changed, 672 insertions(+), 16 deletions(-)
> 

......

> 
>  int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu, @@ -69,27 +562,163 @@
> int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
>  			 gpa_t gpa, unsigned long hva,
>  			 bool writeable, bool is_write)
>  {
> -	/* TODO: */
> -	return 0;
> +	int ret;
> +	kvm_pfn_t hfn;
> +	short vma_pageshift;
> +	gfn_t gfn = gpa >> PAGE_SHIFT;
> +	struct vm_area_struct *vma;
> +	struct kvm *kvm = vcpu->kvm;
> +	struct kvm_mmu_page_cache *pcache = &vcpu->arch.mmu_page_cache;
> +	bool logging = (memslot->dirty_bitmap &&
> +			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
> +	unsigned long vma_pagesize;
> +
> +	mmap_read_lock(current->mm);
> +
> +	vma = find_vma_intersection(current->mm, hva, hva + 1);
> +	if (unlikely(!vma)) {
> +		kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
> +		mmap_read_unlock(current->mm);
> +		return -EFAULT;
> +	}
> +
> +	if (is_vm_hugetlb_page(vma))
> +		vma_pageshift = huge_page_shift(hstate_vma(vma));
> +	else
> +		vma_pageshift = PAGE_SHIFT;
> +	vma_pagesize = 1ULL << vma_pageshift;
> +	if (logging || (vma->vm_flags & VM_PFNMAP))
> +		vma_pagesize = PAGE_SIZE;
> +
> +	if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> +		gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
> +
> +	mmap_read_unlock(current->mm);
> +
> +	if (vma_pagesize != PGDIR_SIZE &&
> +	    vma_pagesize != PMD_SIZE &&
> +	    vma_pagesize != PAGE_SIZE) {
> +		kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);
> +		return -EFAULT;
> +	}
> +
> +	/* We need minimum second+third level pages */
> +	ret = stage2_cache_topup(pcache, stage2_pgd_levels,
> +				 KVM_MMU_PAGE_CACHE_NR_OBJS);
> +	if (ret) {
> +		kvm_err("Failed to topup stage2 cache\n");
> +		return ret;
> +	}
> +
> +	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, NULL);
> +	if (hfn == KVM_PFN_ERR_HWPOISON) {
> +		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
> +				vma_pageshift, current);
> +		return 0;
> +	}
> +	if (is_error_noslot_pfn(hfn))
> +		return -EFAULT;
> +
> +	/*
> +	 * If logging is active then we allow writable pages only
> +	 * for write faults.
> +	 */
> +	if (logging && !is_write)
> +		writeable = false;
> +
> +	spin_lock(&kvm->mmu_lock);
> +
> +	if (writeable) {

Hi Anup,

What is the purpose of "writable = !memslot_is_readonly(slot)" in this series?

When mapping the HVA to HPA above, it doesn't know that the PTE writeable of stage2 is "!memslot_is_readonly(slot)".
This may causes the difference between the writability of HVA->HPA and GPA->HPA.
For example, GPA->HPA is writeable, but HVA->HPA is not writeable.

Is it better that the writability of HVA->HPA is also determined by whether the memslot is readonly in this change?
Like this:
-    hfn = gfn_to_pfn_prot(kvm, gfn, is_write, NULL);
+    hfn = gfn_to_pfn_prot(kvm, gfn, writeable, NULL);

Regards,
Yifei

> +		kvm_set_pfn_dirty(hfn);
> +		mark_page_dirty(kvm, gfn);
> +		ret = stage2_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
> +				      vma_pagesize, false, true);
> +	} else {
> +		ret = stage2_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
> +				      vma_pagesize, true, true);
> +	}
> +
> +	if (ret)
> +		kvm_err("Failed to map in stage2\n");
> +
> +	spin_unlock(&kvm->mmu_lock);
> +	kvm_set_pfn_accessed(hfn);
> +	kvm_release_pfn_clean(hfn);
> +	return ret;
>  }
> 

......



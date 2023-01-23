From: Alexandre Ghiti <alex@ghiti.fr>
Date: Mon, 23 Jan 2023 10:31:21 +0100
Subject: [PATCH] KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page
 sizes
In-Reply-To: <20230123092928.808014-1-alexghiti@rivosinc.com>
References: <20230123092928.808014-1-alexghiti@rivosinc.com>
Message-ID: <bdabafb1-53f3-403c-ab9c-1c2d00421690@ghiti.fr>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

@Anup: Sorry, forgot to add -fixes to the patch title, as I think this 
should go into your fixes branch for 6.2.

On 1/23/23 10:29, Alexandre Ghiti wrote:
> At the moment, riscv only supports PMD and PUD hugepages. For sv39,
> PGDIR_SIZE == PUD_SIZE but not for sv48 and sv57. So fix this by changing
> PGDIR_SIZE into PUD_SIZE.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>   arch/riscv/kvm/mmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 34b57e0be2ef..dbc4ca060174 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -585,7 +585,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   	if (!kvm->arch.pgd)
>   		return false;
>   
> -	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> +	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
>   
>   	if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
>   				   &ptep, &ptep_level))
> @@ -603,7 +603,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   	if (!kvm->arch.pgd)
>   		return false;
>   
> -	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> +	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
>   
>   	if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
>   				   &ptep, &ptep_level))
> @@ -645,12 +645,12 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>   	if (logging || (vma->vm_flags & VM_PFNMAP))
>   		vma_pagesize = PAGE_SIZE;
>   
> -	if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> +	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
>   		gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
>   
>   	mmap_read_unlock(current->mm);
>   
> -	if (vma_pagesize != PGDIR_SIZE &&
> +	if (vma_pagesize != PUD_SIZE &&
>   	    vma_pagesize != PMD_SIZE &&
>   	    vma_pagesize != PAGE_SIZE) {
>   		kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);


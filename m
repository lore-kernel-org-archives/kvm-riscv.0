From: maobibo <maobibo@loongson.cn>
Date: Thu, 8 Aug 2024 19:47:48 +0800
Subject: [PATCH v12 66/84] KVM: LoongArch: Mark "struct page" pfn accessed
 before dropping mmu_lock
In-Reply-To: <20240726235234.228822-67-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-67-seanjc@google.com>
Message-ID: <9492f63e-8257-d911-1c67-33c9c7498c50@loongson.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2024/7/27 ??7:52, Sean Christopherson wrote:
> Mark pages accessed before dropping mmu_lock when faulting in guest memory
> so that LoongArch can convert to kvm_release_faultin_page() without
> tripping its lockdep assertion on mmu_lock being held.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/loongarch/kvm/mmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index 52b5c16cf250..230cafa178d7 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.cBibo Mao <maobibo@loongson.cn>
> @@ -902,13 +902,13 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
>   
>   	if (writeable)
>   		kvm_set_pfn_dirty(pfn);
> +	kvm_release_pfn_clean(pfn);
>   
>   	spin_unlock(&kvm->mmu_lock);
>   
>   	if (prot_bits & _PAGE_DIRTY)
>   		mark_page_dirty_in_slot(kvm, memslot, gfn);
>   
> -	kvm_release_pfn_clean(pfn);
>   out:
>   	srcu_read_unlock(&kvm->srcu, srcu_idx);
>   	return err;
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>



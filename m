From: Peter Xu <peterx@redhat.com>
Date: Tue, 15 Mar 2022 18:27:12 +0800
Subject: [PATCH v2 11/26] KVM: x86/mmu: Use common code to allocate
 kvm_mmu_page structs from vCPU caches
In-Reply-To: <20220311002528.2230172-12-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-12-dmatlack@google.com>
Message-ID: <YjBqAL+bPmcQpTgM@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:13AM +0000, David Matlack wrote:
>  static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
>  {
> -	struct kvm_mmu_page *sp;
> -
> -	sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
> -	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
> -	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
> -
> -	return sp;
> +	return kvm_mmu_alloc_shadow_page(vcpu, true);
>  }

Similarly I had a feeling we could drop tdp_mmu_alloc_sp() too.. anyway:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



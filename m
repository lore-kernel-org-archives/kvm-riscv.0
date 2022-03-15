From: Peter Xu <peterx@redhat.com>
Date: Tue, 15 Mar 2022 17:54:09 +0800
Subject: [PATCH v2 07/26] KVM: x86/mmu: Separate shadow MMU sp allocation
 from initialization
In-Reply-To: <20220311002528.2230172-8-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-8-dmatlack@google.com>
Message-ID: <YjBiQd0rlAk7/fZW@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:09AM +0000, David Matlack wrote:
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 519910938478..e866e05c4ba5 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1716,16 +1716,9 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
>  	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
>  	if (!direct)
>  		sp->gfns = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_gfn_array_cache);
> +
>  	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);

Trivial nit:

I read Ben's comment in previous version and that sounds reasonable to keep
the two linkages together.  It's just a bit of a pity we need to set the
private manually for each allocation.

Meanwhile we have another counter example in the tdp mmu code
(tdp_mmu_init_sp()), so we may want to align the tdp/shadow cases at some
point..

-- 
Peter Xu



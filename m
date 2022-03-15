From: Peter Xu <peterx@redhat.com>
Date: Tue, 15 Mar 2022 18:22:46 +0800
Subject: [PATCH v2 10/26] KVM: x86/mmu: Use common code to free
 kvm_mmu_page structs
In-Reply-To: <20220311002528.2230172-11-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-11-dmatlack@google.com>
Message-ID: <YjBo9iuSBm1hbqXz@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:12AM +0000, David Matlack wrote:
>  static void tdp_mmu_free_sp(struct kvm_mmu_page *sp)
>  {
> -	free_page((unsigned long)sp->spt);
> -	kmem_cache_free(mmu_page_header_cache, sp);
> +	kvm_mmu_free_shadow_page(sp);
>  }

Perhaps tdp_mmu_free_sp() can be dropped altogether with this?

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



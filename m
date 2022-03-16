From: Peter Xu <peterx@redhat.com>
Date: Wed, 16 Mar 2022 16:44:09 +0800
Subject: [PATCH v2 17/26] KVM: x86/mmu: Pass access information to
 make_huge_page_split_spte()
In-Reply-To: <20220311002528.2230172-18-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-18-dmatlack@google.com>
Message-ID: <YjGjWcmn+7sZPjNX@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:19AM +0000, David Matlack wrote:
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 85b7bc333302..541b145b2df2 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1430,7 +1430,7 @@ static int tdp_mmu_split_huge_page(struct kvm *kvm, struct tdp_iter *iter,
>  	 * not been linked in yet and thus is not reachable from any other CPU.
>  	 */
>  	for (i = 0; i < PT64_ENT_PER_PAGE; i++)
> -		sp->spt[i] = make_huge_page_split_spte(huge_spte, level, i);
> +		sp->spt[i] = make_huge_page_split_spte(huge_spte, level, i, ACC_ALL);

Pure question: is it possible that huge_spte is RO while we passed in
ACC_ALL here (which has the write bit set)?  Would it be better if we make
it a "bool exec" to be clearer?

-- 
Peter Xu



From: Gavin Shan <gshan@redhat.com>
Date: Wed, 5 Jul 2023 10:51:18 +1000
Subject: [RESEND PATCH v5 10/11] KVM: arm64: Invalidate the table entries
 upon a range
In-Reply-To: <20230621175002.2832640-11-rananta@google.com>
References: <20230621175002.2832640-1-rananta@google.com>
 <20230621175002.2832640-11-rananta@google.com>
Message-ID: <fa99d4ea-7390-906e-b691-9fa838df2788@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 6/22/23 03:50, Raghavendra Rao Ananta wrote:
> Currently, during the operations such as a hugepage collapse,
> KVM would flush the entire VM's context using 'vmalls12e1is'
> TLBI operation. Specifically, if the VM is faulting on many
> hugepages (say after dirty-logging), it creates a performance
> penalty for the guest whose pages have already been faulted
> earlier as they would have to refill their TLBs again.
> 
> Instead, leverage kvm_tlb_flush_vmid_range() for table entries.
> If the system supports it, only the required range will be
> flushed. Else, it'll fallback to the previous mechanism.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>   arch/arm64/kvm/hyp/pgtable.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index df8ac14d9d3d4..50ef7623c54db 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -766,7 +766,8 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
>   	 * value (if any).
>   	 */
>   	if (kvm_pte_table(ctx->old, ctx->level))
> -		kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
> +		kvm_tlb_flush_vmid_range(mmu, ctx->addr,
> +					kvm_granule_size(ctx->level));
>   	else if (kvm_pte_valid(ctx->old))
>   		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr, ctx->level);
>   



From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 May 2023 21:10:54 +0530
Subject: [PATCH] RISC-V: KVM: use bitmap_zero() API
In-Reply-To: <202305061710302032748@zte.com.cn>
References: <202305061710302032748@zte.com.cn>
Message-ID: <CAAhSdy0fzEi7iOTk3+xS2TaryxXB5=Fy4Qp0k++U_Qq+wJktig@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, May 6, 2023 at 2:40?PM <ye.xingchen@zte.com.cn> wrote:
>
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
>
> bitmap_zero() is faster than bitmap_clear(), so use bitmap_zero()
> instead of bitmap_clear().
>
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/tlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index 0e5479600695..44bc324aeeb0 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -296,7 +296,7 @@ static void make_xfence_request(struct kvm *kvm,
>         unsigned int actual_req = req;
>         DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
>
> -       bitmap_clear(vcpu_mask, 0, KVM_MAX_VCPUS);
> +       bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
>         kvm_for_each_vcpu(i, vcpu, kvm) {
>                 if (hbase != -1UL) {
>                         if (vcpu->vcpu_id < hbase)
> --
> 2.25.1


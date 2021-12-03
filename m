From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 18:53:20 +0530
Subject: [PATCH 3/5] riscv: kvm: make kvm_riscv_vcpu_fp_clean() static
In-Reply-To: <20211128160741.2122-4-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
 <20211128160741.2122-4-jszhang@kernel.org>
Message-ID: <CAAhSdy1ChQ6A0_zkOFFCO1dJypaK3-9RndRNLn-sNK1hNJKQEQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 28, 2021 at 9:45 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> There are no users outside vcpu_fp.c so make kvm_riscv_vcpu_fp_clean()
> static.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

I have queued this patch for 5.17

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_fp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
> index 1b070152578f..4449a976e5a6 100644
> --- a/arch/riscv/kvm/vcpu_fp.c
> +++ b/arch/riscv/kvm/vcpu_fp.c
> @@ -26,7 +26,7 @@ void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
>                 cntx->sstatus |= SR_FS_OFF;
>  }
>
> -void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
> +static void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
>  {
>         cntx->sstatus &= ~SR_FS;
>         cntx->sstatus |= SR_FS_CLEAN;
> --
> 2.34.0
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv


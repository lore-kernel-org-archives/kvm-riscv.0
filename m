From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Nov 2024 10:02:19 +0530
Subject: [PATCH] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU
 overflow bit
In-Reply-To: <20241124221458.347464-1-michaelneuling@tenstorrent.com>
References: <20241124221458.347464-1-michaelneuling@tenstorrent.com>
Message-ID: <CAAhSdy2Qq61qSLkuFkgiT2o5wXNDp3qO=U40AU1CFkcY6iNYhw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 25, 2024 at 3:45?AM Michael Neuling
<michaelneuling@tenstorrent.com> wrote:
>
> This doesn't cause a problem currently as HVIEN isn't used elsewhere
> yet. Found by inspection.
>

Fixes tag ?

> Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/aia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index 2967d305c4..9f3b527596 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -552,7 +552,7 @@ void kvm_riscv_aia_enable(void)
>         csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
>         /* Enable IRQ filtering for overflow interrupt only if sscofpmf is present */
>         if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
> -               csr_write(CSR_HVIEN, BIT(IRQ_PMU_OVF));
> +               csr_set(CSR_HVIEN, BIT(IRQ_PMU_OVF));
>  }
>
>  void kvm_riscv_aia_disable(void)
> --
> 2.34.1
>


From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 4 Oct 2024 18:49:55 +0800
Subject: [PATCH 1/1] RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
In-Reply-To: <20240808081439.24661-1-yongxuan.wang@sifive.com>
References: <20240808081439.24661-1-yongxuan.wang@sifive.com>
Message-ID: <CAMWQL2gBOma5c_A4JPnTK6uDfbyqcbcf_4qZ4Pt_S3mvBY3s0w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ping

On Thu, Aug 8, 2024 at 4:14?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
>
> In the section "4.7 Precise effects on interrupt-pending bits"
> of the RISC-V AIA specification defines that:
>
> If the source mode is Level1 or Level0 and the interrupt domain
> is configured in MSI delivery mode (domaincfg.DM = 1):
> The pending bit is cleared whenever the rectified input value is
> low, when the interrupt is forwarded by MSI, or by a relevant
> write to an in_clrip register or to clripnum.
>
> Update the aplic_write_pending() to match the spec.
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/kvm/aia_aplic.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
> index da6ff1bade0d..97c6dbcabf47 100644
> --- a/arch/riscv/kvm/aia_aplic.c
> +++ b/arch/riscv/kvm/aia_aplic.c
> @@ -142,8 +142,6 @@ static void aplic_write_pending(struct aplic *aplic, u32 irq, bool pending)
>
>         if (sm == APLIC_SOURCECFG_SM_LEVEL_HIGH ||
>             sm == APLIC_SOURCECFG_SM_LEVEL_LOW) {
> -               if (!pending)
> -                       goto skip_write_pending;
>                 if ((irqd->state & APLIC_IRQ_STATE_INPUT) &&
>                     sm == APLIC_SOURCECFG_SM_LEVEL_LOW)
>                         goto skip_write_pending;
> --
> 2.17.1
>


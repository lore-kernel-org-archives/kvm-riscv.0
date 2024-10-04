From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Oct 2024 18:09:06 +0530
Subject: [PATCH 1/1] RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
In-Reply-To: <20240808081439.24661-1-yongxuan.wang@sifive.com>
References: <20240808081439.24661-1-yongxuan.wang@sifive.com>
Message-ID: <CAAhSdy3NmwbHY9Qef9LUeXfr0iE7wC-u0d_fHzC47PXk-MzmRg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 8, 2024 at 1:44?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
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

Fixes tag ?

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

I agree that aplic_write_pending() is not handling the case
where it is called for in_clrip or clripnum writes but this still
looks incomplete.

The below two if() should be checked only when pending == true.

>                 if ((irqd->state & APLIC_IRQ_STATE_INPUT) &&
>                     sm == APLIC_SOURCECFG_SM_LEVEL_LOW)
>                         goto skip_write_pending;

How about this ?

diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index da6ff1bade0d..93ccc2a49f2b 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -143,7 +143,7 @@ static void aplic_write_pending(struct aplic
*aplic, u32 irq, bool pending)
        if (sm == APLIC_SOURCECFG_SM_LEVEL_HIGH ||
            sm == APLIC_SOURCECFG_SM_LEVEL_LOW) {
                if (!pending)
-                       goto skip_write_pending;
+                       goto noskip_write_pending;
                if ((irqd->state & APLIC_IRQ_STATE_INPUT) &&
                    sm == APLIC_SOURCECFG_SM_LEVEL_LOW)
                        goto skip_write_pending;
@@ -151,6 +151,7 @@ static void aplic_write_pending(struct aplic
*aplic, u32 irq, bool pending)
                    sm == APLIC_SOURCECFG_SM_LEVEL_HIGH)
                        goto skip_write_pending;
        }
+noskip_write_pending:

        if (pending)
                irqd->state |= APLIC_IRQ_STATE_PENDING;

Regards,
Anup


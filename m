From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Sep 2021 12:25:10 +0530
Subject: [PATCH] riscv: plic: Clear the associated bit of irq_claimed when
 writing CLAIM
In-Reply-To: <1631698442-756-1-git-send-email-vincent.chen@sifive.com>
References: <1631698442-756-1-git-send-email-vincent.chen@sifive.com>
Message-ID: <CAAhSdy0RgjUgWEpb_ebkH_TfatV3zW0HHerjbVVTq3ks-S+UdA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 15, 2021 at 3:04 PM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> When an IRQ number is written to the claim register, it means this IRQ
> has been addressed. If this interrupt is still pending, PLIC should
> clear the associated bit of irq_claimed to allow this interrupt to
> be claimed again.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Thanks Vincent, I have folded your change in PATCH5 of the v9 KVMTOOl RISC-V
series along with your SoB.

Regards,
Anup


> ---
>  riscv/plic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/riscv/plic.c b/riscv/plic.c
> index 07cadc7..d677bbf 100644
> --- a/riscv/plic.c
> +++ b/riscv/plic.c
> @@ -394,6 +394,9 @@ static void plic__context_write(struct plic_state *s,
>                         irq_update = true;
>                 break;
>         case CONTEXT_CLAIM:
> +               val = ioport__read32(data);
> +               if (val < plic.num_irq)
> +                       c->irq_claimed[val / 32] &= ~(1 << (val % 32));
>                 break;
>         default:
>                 irq_update = true;
> --
> 2.32.0
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv


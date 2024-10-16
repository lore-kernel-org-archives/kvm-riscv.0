From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 16 Oct 2024 14:40:20 -0700
Subject: [PATCH 06/13] RISC-V: KVM: Don't setup SGEI for zero guest
 external interrupts
In-Reply-To: <20240719160913.342027-7-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com> <20240719160913.342027-7-apatel@ventanamicro.com>
Message-ID: <CAOnJCUKugAua2ooQL5tJCNFr27pCrsQ53YJuKEs11UYJdVkAPw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 19, 2024 at 9:09?AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> No need to setup SGEI local interrupt when there are zero guest
> external interrupts (i.e. zero HW IMSIC guest files).
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/aia.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index 17ae4a7c0e94..8ffae0330c89 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -499,6 +499,10 @@ static int aia_hgei_init(void)
>                         hgctrl->free_bitmap = 0;
>         }
>
> +       /* Skip SGEI interrupt setup for zero guest external interrupts */
> +       if (!kvm_riscv_aia_nr_hgei)
> +               goto skip_sgei_interrupt;
> +
>         /* Find INTC irq domain */
>         domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
>                                           DOMAIN_BUS_ANY);
> @@ -522,11 +526,16 @@ static int aia_hgei_init(void)
>                 return rc;
>         }
>
> +skip_sgei_interrupt:
>         return 0;
>  }
>
>  static void aia_hgei_exit(void)
>  {
> +       /* Do nothing for zero guest external interrupts */
> +       if (!kvm_riscv_aia_nr_hgei)
> +               return;
> +
>         /* Free per-CPU SGEI interrupt */
>         free_percpu_irq(hgei_parent_irq, &aia_hgei);
>  }
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish


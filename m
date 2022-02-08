From: Guo Ren <guoren@kernel.org>
Date: Tue, 8 Feb 2022 14:11:32 +0800
Subject: [PATCH v10 2/8] RISC-V: Rename relocate() and make it global
In-Reply-To: <20220126114452.692512-3-apatel@ventanamicro.com>
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-3-apatel@ventanamicro.com>
Message-ID: <CAJF2gTQPC0-VHdwayu96UTWY5GOePLZ5dCH1z8vhseLVztr3jQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reviewed-by: Guo Ren <guoren@kernel.org>

On Wed, Jan 26, 2022 at 7:46 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> The low-level relocate() function enables mmu and relocates
> execution to link-time addresses. We rename relocate() function
> to relocate_enable_mmu() function which is more informative.
>
> Also, the relocate_enable_mmu() function will be used in the
> resume path when a CPU wakes-up from a non-retentive suspend
> so we make it global symbol.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kernel/head.S | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 2363b43312fc..5f4c6b6c4974 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -90,7 +90,8 @@ pe_head_start:
>
>  .align 2
>  #ifdef CONFIG_MMU
> -relocate:
> +       .global relocate_enable_mmu
> +relocate_enable_mmu:
>         /* Relocate return address */
>         la a1, kernel_map
>         XIP_FIXUP_OFFSET a1
> @@ -185,7 +186,7 @@ secondary_start_sbi:
>         /* Enable virtual memory and relocate to virtual address */
>         la a0, swapper_pg_dir
>         XIP_FIXUP_OFFSET a0
> -       call relocate
> +       call relocate_enable_mmu
>  #endif
>         call setup_trap_vector
>         tail smp_callin
> @@ -329,7 +330,7 @@ clear_bss_done:
>  #ifdef CONFIG_MMU
>         la a0, early_pg_dir
>         XIP_FIXUP_OFFSET a0
> -       call relocate
> +       call relocate_enable_mmu
>  #endif /* CONFIG_MMU */
>
>         call setup_trap_vector
> --
> 2.25.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/


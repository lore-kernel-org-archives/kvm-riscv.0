From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 18:27:27 +0530
Subject: [RFC 4/6] RISC-V: Move the entire hart selection via lottery to
 SMP
In-Reply-To: <20211204002038.113653-5-atishp@atishpatra.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-5-atishp@atishpatra.org>
Message-ID: <CAAhSdy2NydGsa1Mw-hmJRNeCkQh=z_Q4ob5nTr1ZQDPTRjHDaw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 4, 2021 at 5:51 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> The booting hart selection via lottery is only useful for SMP systems.
> Moreover, the lottery selection is only necessary for systems using
> spinwait booting method. It is better to keep the entire lottery
> selection together so that it can be disabled in future.
>
> Move the lottery selection code to under CONFIG_SMP.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/head.S | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 6f8e99eac6a1..9f16bfe9307e 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -264,8 +264,8 @@ pmp_done:
>         blt a0, t0, .Lgood_cores
>         tail .Lsecondary_park
>  .Lgood_cores:
> -#endif
>
> +       /* The lottery system is only required for spinwait booting method */
>  #ifndef CONFIG_XIP_KERNEL
>         /* Pick one hart to run the main boot sequence */
>         la a3, hart_lottery
> @@ -284,6 +284,10 @@ pmp_done:
>         /* first time here if hart_lottery in RAM is not set */
>         beq t0, t1, .Lsecondary_start
>
> +#endif /* CONFIG_XIP */
> +#endif /* CONFIG_SMP */
> +
> +#ifdef CONFIG_XIP_KERNEL
>         la sp, _end + THREAD_SIZE
>         XIP_FIXUP_OFFSET sp
>         mv s0, a0
> @@ -340,8 +344,8 @@ clear_bss_done:
>         call soc_early_init
>         tail start_kernel
>
> -.Lsecondary_start:
>  #ifdef CONFIG_SMP
> +.Lsecondary_start:
>         /* Set trap vector to spin forever to help debug */
>         la a3, .Lsecondary_park
>         csrw CSR_TVEC, a3
> --
> 2.33.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv


From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Aug 2022 13:54:17 +0530
Subject: [PATCH 1/4] riscv: Add X register names to gpr-nums
In-Reply-To: <20220819140250.3892995-2-ajones@ventanamicro.com>
References: <20220819140250.3892995-1-ajones@ventanamicro.com> <20220819140250.3892995-2-ajones@ventanamicro.com>
Message-ID: <CAAhSdy3C_4tNQ42XEtc+cHW-ArubPxoSEmmBnj2mCdYi04JHjg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 19, 2022 at 7:32 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When encoding instructions it's sometimes necessary to set a
> register field to a precise number. This is easiest to do using
> the x<num> naming.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/gpr-num.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/include/asm/gpr-num.h b/arch/riscv/include/asm/gpr-num.h
> index dfee2829fc7c..efeb5edf8a3a 100644
> --- a/arch/riscv/include/asm/gpr-num.h
> +++ b/arch/riscv/include/asm/gpr-num.h
> @@ -3,6 +3,11 @@
>  #define __ASM_GPR_NUM_H
>
>  #ifdef __ASSEMBLY__
> +
> +       .irp    num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
> +       .equ    .L__gpr_num_x\num, \num
> +       .endr
> +
>         .equ    .L__gpr_num_zero,       0
>         .equ    .L__gpr_num_ra,         1
>         .equ    .L__gpr_num_sp,         2
> @@ -39,6 +44,9 @@
>  #else /* __ASSEMBLY__ */
>
>  #define __DEFINE_ASM_GPR_NUMS                                  \
> +"      .irp    num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31\n" \
> +"      .equ    .L__gpr_num_x\\num, \\num\n"                    \
> +"      .endr\n"                                                \
>  "      .equ    .L__gpr_num_zero,       0\n"                    \
>  "      .equ    .L__gpr_num_ra,         1\n"                    \
>  "      .equ    .L__gpr_num_sp,         2\n"                    \
> --
> 2.37.1
>


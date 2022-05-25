From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 May 2022 16:14:23 +0530
Subject: [PATCH kvmtool v2] Fixes: 0febaae00bb6 ("Add asm/kernel.h for riscv")
In-Reply-To: <20220524180030.1848992-1-daolu@rivosinc.com>
References: <20220524180030.1848992-1-daolu@rivosinc.com>
Message-ID: <CAAhSdy3Cit9GvfO1oEDLXf8ncam2D8FqQNHJKBj0z5RfMZ26WA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 24, 2022 at 11:30 PM Dao Lu <daolu@rivosinc.com> wrote:
>
> Fixes the following compilation issue:
>
> include/linux/kernel.h:5:10: fatal error: asm/kernel.h: No such file
> or directory
>     5 | #include "asm/kernel.h"
>
> Tested-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Dao Lu <daolu@rivosinc.com>

I agree with Alexandre, we need a better PATCH subject. Also,
move the Fixes tag from PATCH subject to PATCH description just
above your Signed-off-by.

Otherwise, this looks good to me.
Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  riscv/include/asm/kernel.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 riscv/include/asm/kernel.h
>
> diff --git a/riscv/include/asm/kernel.h b/riscv/include/asm/kernel.h
> new file mode 100644
> index 0000000..4ab195f
> --- /dev/null
> +++ b/riscv/include/asm/kernel.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __ASM_KERNEL_H
> +#define __ASM_KERNEL_H
> +
> +#define NR_CPUS        512
> +
> +#endif /* __ASM_KERNEL_H */
> --
> 2.36.0
>


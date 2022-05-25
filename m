From: Alexandru Elisei <alexandru.elisei@arm.com>
Date: Wed, 25 May 2022 10:08:01 +0100
Subject: [PATCH kvmtool v2] Fixes: 0febaae00bb6 ("Add asm/kernel.h for
 riscv")
In-Reply-To: <20220524180030.1848992-1-daolu@rivosinc.com>
References: <20220524180030.1848992-1-daolu@rivosinc.com>
Message-ID: <Yo3x8U9L9baABVUr@monolith.localdoman>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I just noticed this, I think the subject could be improved. The commit id
referenced in the subject is actually "Add cpumask functions", not "Add
asm/kernel.h for riscv".

I think something like this (below) is much more useful for someone doing
git log --oneline to get an idea of what the patch does:

    riscv: Add missing asm/kernel.h header

Feel free to reword it if you can come up with something better.

If you want, you can add the fixes tag above your Signed-off-by:

Fixes: 0febaae00bb6 ("Add cpumask functions")

Thanks,
Alex

On Tue, May 24, 2022 at 11:00:30AM -0700, Dao Lu wrote:
> Fixes the following compilation issue:
> 
> include/linux/kernel.h:5:10: fatal error: asm/kernel.h: No such file
> or directory
>     5 | #include "asm/kernel.h"
> 
> Tested-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Dao Lu <daolu@rivosinc.com>
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
> +#define NR_CPUS	512
> +
> +#endif /* __ASM_KERNEL_H */
> -- 
> 2.36.0
> 


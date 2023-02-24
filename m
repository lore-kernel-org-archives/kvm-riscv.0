From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Fri, 24 Feb 2023 14:00:44 +0000
Subject: [PATCH v5 6/8] RISC-V: Use Zicboz in clear_page when available
In-Reply-To: <20230221190916.572454-7-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
 <20230221190916.572454-7-ajones@ventanamicro.com>
Message-ID: <36abc02f-ef35-88a8-1fa8-ce7cebbae7ea@codethink.co.uk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21/02/2023 19:09, Andrew Jones wrote:
> Using memset() to zero a 4K page takes 563 total instructions, where
> 20 are branches. clear_page(), with Zicboz and a 64 byte block size,
> takes 169 total instructions, where 4 are branches and 33 are nops.
> Even though the block size is a variable, thanks to alternatives, we
> can still implement a Duff device without having to do any preliminary
> calculations. This is achieved by using the alternatives' cpufeature
> value (the upper 16 bits of patch_id). The value used is the maximum
> zicboz block size order accepted at the patch site. This enables us
> to stop patching / unrolling when 4K bytes have been zeroed (we would
> loop and continue after 4K if the page size would be larger)
> 
> For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
> only loop a few times and larger block sizes to not loop at all. Since
> cbo.zero doesn't take an offset, we also need an 'add' after each
> instruction, making the loop body 112 to 160 bytes. Hopefully this
> is small enough to not cause icache misses.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   arch/riscv/Kconfig                | 13 ++++++
>   arch/riscv/include/asm/insn-def.h |  4 ++
>   arch/riscv/include/asm/page.h     |  6 ++-
>   arch/riscv/kernel/cpufeature.c    | 11 +++++
>   arch/riscv/lib/Makefile           |  1 +
>   arch/riscv/lib/clear_page.S       | 73 +++++++++++++++++++++++++++++++
>   6 files changed, 107 insertions(+), 1 deletion(-)
>   create mode 100644 arch/riscv/lib/clear_page.S

[snip]

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 0594989ead63..4a496552b812 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -292,6 +292,17 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
>   	if (!value)
>   		return true;
>   
> +	switch (id) {
> +	case RISCV_ISA_EXT_ZICBOZ:
> +		/*
> +		 * Zicboz alternative applications provide the maximum
> +		 * supported block size order, or zero when it doesn't
> +		 * matter. If the current block size exceeds the maximum,
> +		 * then the alternative cannot be applied.
> +		 */
> +		return riscv_cboz_block_size <= (1U << value);
> +	}
> +
>   	return false;
>   }
>   
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 6c74b0bedd60..26cb2502ecf8 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -8,5 +8,6 @@ lib-y			+= strlen.o
>   lib-y			+= strncmp.o
>   lib-$(CONFIG_MMU)	+= uaccess.o
>   lib-$(CONFIG_64BIT)	+= tishift.o
> +lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
>   
>   obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> new file mode 100644
> index 000000000000..7c7fa45b5ab5
> --- /dev/null
> +++ b/arch/riscv/lib/clear_page.S
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/hwcap.h>
> +#include <asm/insn-def.h>
> +#include <asm/page.h>
> +
> +#define CBOZ_ALT(order, old, new)				\
> +	ALTERNATIVE(old, new, 0,				\
> +		    ((order) << 16) | RISCV_ISA_EXT_ZICBOZ,	\
> +		    CONFIG_RISCV_ISA_ZICBOZ)
> +
> +/* void clear_page(void *page) */
> +ENTRY(__clear_page)
> +WEAK(clear_page)

out of interest, why the __clear_page() entry and the
WEAK(clear_page)?

Just followed up with a patch to fix the modpost.

So far this seems to be working with qemu and a backport to 5.19.x

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html



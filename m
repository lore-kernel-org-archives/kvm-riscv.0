From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Dec 2023 15:02:51 +0100
Subject: [PATCH v4 05/11] tools: riscv: Add header file vdso/processor.h
In-Reply-To: <7b633cc441f5133608597463301fef122f5174d3.1702371136.git.haibo1.xu@intel.com>
References: <cover.1702371136.git.haibo1.xu@intel.com>
 <7b633cc441f5133608597463301fef122f5174d3.1702371136.git.haibo1.xu@intel.com>
Message-ID: <20231213-9d5ad03bed3056007c6e714d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 12, 2023 at 05:31:14PM +0800, Haibo Xu wrote:
> Borrow the cpu_relax() definitions from kernel's
> arch/riscv/include/asm/vdso/processor.h to tools/ for riscv.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/arch/riscv/include/asm/vdso/processor.h | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 tools/arch/riscv/include/asm/vdso/processor.h
> 
> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> new file mode 100644
> index 000000000000..662aca039848
> --- /dev/null
> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_VDSO_PROCESSOR_H
> +#define __ASM_VDSO_PROCESSOR_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <asm-generic/barrier.h>
> +
> +static inline void cpu_relax(void)
> +{
> +#ifdef __riscv_muldiv
> +	int dummy;
> +	/* In lieu of a halt instruction, induce a long-latency stall. */
> +	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> +#endif
> +
> +#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> +	/*
> +	 * Reduce instruction retirement.
> +	 * This assumes the PC changes.
> +	 */
> +	__asm__ __volatile__ ("pause");
> +#else
> +	/* Encoding of the pause instruction */
> +	__asm__ __volatile__ (".4byte 0x100000F");
> +#endif
> +	barrier();
> +}
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ASM_VDSO_PROCESSOR_H */
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 7 Aug 2024 17:21:03 +0200
Subject: [kvm-unit-tests PATCH v1 1/4] riscv: move REG_L/REG_W in a
 dedicated asm.h file
In-Reply-To: <20240517134007.928539-2-cleger@rivosinc.com>
References: <20240517134007.928539-1-cleger@rivosinc.com>
 <20240517134007.928539-2-cleger@rivosinc.com>
Message-ID: <20240807-d8d51c8e443841247efaf75d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 17, 2024 at 03:40:02PM GMT, Cl?ment L?ger wrote:
> These assembly macros will be used as part of the SSE entry assembly
> code, export them in asm.h header.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  lib/riscv/asm/asm.h | 19 +++++++++++++++++++
>  riscv/cstart.S      | 14 +-------------
>  2 files changed, 20 insertions(+), 13 deletions(-)
>  create mode 100644 lib/riscv/asm/asm.h
> 
> diff --git a/lib/riscv/asm/asm.h b/lib/riscv/asm/asm.h
> new file mode 100644
> index 00000000..763b28e6
> --- /dev/null
> +++ b/lib/riscv/asm/asm.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASMRISCV_ASM_H_
> +#define _ASMRISCV_ASM_H_
> +
> +#if __riscv_xlen == 64
> +#define __REG_SEL(a, b) a
> +#elif __riscv_xlen == 32
> +#define __REG_SEL(a, b) b
> +#else
> +#error "Unexpected __riscv_xlen"
> +#endif
> +
> +#define REG_L	__REG_SEL(ld, lw)
> +#define REG_S	__REG_SEL(sd, sw)
> +#define SZREG	__REG_SEL(8, 4)
> +
> +#define FP_SIZE 16
> +
> +#endif /* _ASMRISCV_ASM_H_ */
> diff --git a/riscv/cstart.S b/riscv/cstart.S
> index 10b5da57..d5d8ad25 100644
> --- a/riscv/cstart.S
> +++ b/riscv/cstart.S
> @@ -4,22 +4,10 @@
>   *
>   * Copyright (C) 2023, Ventana Micro Systems Inc., Andrew Jones <ajones@ventanamicro.com>
>   */
> +#include <asm/asm.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/csr.h>
>  
> -#if __riscv_xlen == 64
> -#define __REG_SEL(a, b) a
> -#elif __riscv_xlen == 32
> -#define __REG_SEL(a, b) b
> -#else
> -#error "Unexpected __riscv_xlen"
> -#endif
> -
> -#define REG_L	__REG_SEL(ld, lw)
> -#define REG_S	__REG_SEL(sd, sw)
> -#define SZREG	__REG_SEL(8, 4)
> -
> -#define FP_SIZE 16
>  
>  .macro push_fp, ra=ra
>  	addi	sp, sp, -FP_SIZE
> -- 
> 2.43.0
>

Queued, https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/queue

Thanks,
drew


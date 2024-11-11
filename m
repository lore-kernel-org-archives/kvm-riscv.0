From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 11 Nov 2024 16:06:26 +0100
Subject: [kvm-unit-tests PATCH] riscv: sbi: Prepare for assembly entry
 points
In-Reply-To: <20241106094015.21204-2-andrew.jones@linux.dev>
References: <20241106094015.21204-2-andrew.jones@linux.dev>
Message-ID: <20241111-fb7b1486cc4c49ceebd93964@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 06, 2024 at 10:40:16AM +0100, Andrew Jones wrote:
> From: James Raphael Tiovalen <jamestiotio@gmail.com>
> 
> The HSM tests will need to test HSM start and resumption from HSM
> suspend. Prepare for these tests, as well other tests, such as the
> SUSP resume tests, by providing an assembly file for SBI tests.
> 
> Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  riscv/Makefile    |  3 ++-
>  riscv/sbi-asm.S   | 12 ++++++++++++
>  riscv/sbi-tests.h |  6 ++++++
>  3 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100644 riscv/sbi-asm.S
>  create mode 100644 riscv/sbi-tests.h
> 
> diff --git a/riscv/Makefile b/riscv/Makefile
> index 22fd273acac3..734441f94dad 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -43,6 +43,7 @@ cflatobjs += lib/riscv/timer.o
>  ifeq ($(ARCH),riscv32)
>  cflatobjs += lib/ldiv32.o
>  endif
> +cflatobjs += riscv/sbi-asm.o
>  
>  ########################################
>  
> @@ -82,7 +83,7 @@ CFLAGS += -mcmodel=medany
>  CFLAGS += -std=gnu99
>  CFLAGS += -ffreestanding
>  CFLAGS += -O2
> -CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
> +CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib -I $(SRCDIR)/riscv
>  
>  asm-offsets = lib/riscv/asm-offsets.h
>  include $(SRCDIR)/scripts/asm-offsets.mak
> diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
> new file mode 100644
> index 000000000000..fbf97cab39c8
> --- /dev/null
> +++ b/riscv/sbi-asm.S
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Helper assembly code routines for RISC-V SBI extension tests.
> + *
> + * Copyright (C) 2024, James Raphael Tiovalen <jamestiotio@gmail.com>
> + */
> +#define __ASSEMBLY__
> +
> +#include "sbi-tests.h"
> +
> +.section .text
> +
> diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
> new file mode 100644
> index 000000000000..c28046f7cfbd
> --- /dev/null
> +++ b/riscv/sbi-tests.h
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _RISCV_SBI_TESTS_H_
> +#define _RISCV_SBI_TESTS_H_
> +
> +
> +#endif /* _RISCV_SBI_TESTS_H_ */
> -- 
> 2.47.0
>

Merged through riscv/sbi.

Thanks,
drew


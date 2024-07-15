From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 15 Jul 2024 17:42:53 -0500
Subject: [kvm-unit-tests PATCH v2 2/3] riscv: Update exception cause list
In-Reply-To: <20240707101053.74386-3-jamestiotio@gmail.com>
References: <20240707101053.74386-1-jamestiotio@gmail.com>
 <20240707101053.74386-3-jamestiotio@gmail.com>
Message-ID: <20240715-f5383fa7245da0e0a5a03c2a@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 07, 2024 at 06:10:51PM GMT, James Raphael Tiovalen wrote:
> Update the list of exception and interrupt causes to follow the latest
> RISC-V privileged ISA specification (version 20240411 section 18.6.1).
> 
> Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> ---
>  lib/riscv/asm/csr.h       | 14 ++++++++++++++
>  lib/riscv/asm/processor.h |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
> index d6909d93..b3c48e8e 100644
> --- a/lib/riscv/asm/csr.h
> +++ b/lib/riscv/asm/csr.h
> @@ -28,6 +28,7 @@
>  #define EXC_SYSCALL		8
>  #define EXC_HYPERVISOR_SYSCALL	9
>  #define EXC_SUPERVISOR_SYSCALL	10
> +#define EXC_MACHINE_SYSCALL	11
>  #define EXC_INST_PAGE_FAULT	12
>  #define EXC_LOAD_PAGE_FAULT	13
>  #define EXC_STORE_PAGE_FAULT	15
> @@ -36,6 +37,19 @@
>  #define EXC_VIRTUAL_INST_FAULT		22
>  #define EXC_STORE_GUEST_PAGE_FAULT	23
>  
> +/* Interrupt causes */
> +#define IRQ_S_SOFT		1
> +#define IRQ_VS_SOFT		2
> +#define IRQ_M_SOFT		3
> +#define IRQ_S_TIMER		5
> +#define IRQ_VS_TIMER		6
> +#define IRQ_M_TIMER		7
> +#define IRQ_S_EXT		9
> +#define IRQ_VS_EXT		10
> +#define IRQ_M_EXT		11
> +#define IRQ_S_GEXT		12
> +#define IRQ_PMU_OVF		13
> +

While it doesn't hurt to define them, we don't need the M-mode stuff,
since we don't intend to run in M-mode.

>  #ifndef __ASSEMBLY__
>  
>  #define csr_swap(csr, val)					\
> diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
> index 6451adb5..4c9ad968 100644
> --- a/lib/riscv/asm/processor.h
> +++ b/lib/riscv/asm/processor.h
> @@ -4,7 +4,7 @@
>  #include <asm/csr.h>
>  #include <asm/ptrace.h>
>  
> -#define EXCEPTION_CAUSE_MAX	16
> +#define EXCEPTION_CAUSE_MAX	24
>  #define INTERRUPT_CAUSE_MAX	16
>  
>  typedef void (*exception_fn)(struct pt_regs *);
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>


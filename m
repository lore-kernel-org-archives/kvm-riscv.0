From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 22 Nov 2024 17:05:59 +0100
Subject: [kvm-unit-tests PATCH v2 1/3] riscv: lib: Add SBI SSE extension
 definitions
In-Reply-To: <20241122140459.566306-2-cleger@rivosinc.com>
References: <20241122140459.566306-1-cleger@rivosinc.com>
 <20241122140459.566306-2-cleger@rivosinc.com>
Message-ID: <20241122-1e45023d7cf30ca9885f7872@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 22, 2024 at 03:04:55PM +0100, Cl?ment L?ger wrote:
> Add SBI SSE extension definitions in sbi.h
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  lib/riscv/asm/sbi.h | 76 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 98a9b097..96100bc2 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -11,6 +11,9 @@
>  #define SBI_ERR_ALREADY_AVAILABLE	-6
>  #define SBI_ERR_ALREADY_STARTED		-7
>  #define SBI_ERR_ALREADY_STOPPED		-8
> +#define SBI_ERR_NO_SHMEM		-9
> +#define SBI_ERR_INVALID_STATE		-10
> +#define SBI_ERR_BAD_RANGE		-11

Might as well add SBI_ERR_TIMEOUT and SBI_ERR_IO now too.

>  
>  #ifndef __ASSEMBLY__
>  #include <cpumask.h>
> @@ -23,6 +26,7 @@ enum sbi_ext_id {
>  	SBI_EXT_SRST = 0x53525354,
>  	SBI_EXT_DBCN = 0x4442434E,
>  	SBI_EXT_SUSP = 0x53555350,
> +	SBI_EXT_SSE = 0x535345,
>  };
>  
>  enum sbi_ext_base_fid {
> @@ -71,6 +75,78 @@ enum sbi_ext_dbcn_fid {
>  	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
>  };
>  
> +/* SBI Function IDs for SSE extension */
> +#define SBI_EXT_SSE_READ_ATTR		0x00000000
> +#define SBI_EXT_SSE_WRITE_ATTR		0x00000001

These are named with an 'S' on the end in the spec, e.g.
sbi_sse_read_attrs. Let's add the S here to to be consistent.

> +#define SBI_EXT_SSE_REGISTER		0x00000002
> +#define SBI_EXT_SSE_UNREGISTER		0x00000003
> +#define SBI_EXT_SSE_ENABLE		0x00000004
> +#define SBI_EXT_SSE_DISABLE		0x00000005
> +#define SBI_EXT_SSE_COMPLETE		0x00000006
> +#define SBI_EXT_SSE_INJECT		0x00000007

What about sbi_sse_hart_unmask and sbi_sse_hart_mask?

The function IDs can be enums like the other extensions define them,
unless they need to be used in assembly. But, if they need to be used
in assembly then they should be outside the '#ifndef __ASSEMBLY__'

> +
> +/* SBI SSE Event Attributes. */
> +enum sbi_sse_attr_id {
> +	SBI_SSE_ATTR_STATUS		= 0x00000000,
> +	SBI_SSE_ATTR_PRIO		= 0x00000001,

SBI_SSE_ATTR_PRIORITY

> +	SBI_SSE_ATTR_CONFIG		= 0x00000002,
> +	SBI_SSE_ATTR_PREFERRED_HART	= 0x00000003,
> +	SBI_SSE_ATTR_ENTRY_PC		= 0x00000004,
> +	SBI_SSE_ATTR_ENTRY_ARG		= 0x00000005,
> +	SBI_SSE_ATTR_INTERRUPTED_SEPC	= 0x00000006,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS	= 0x00000007,
> +	SBI_SSE_ATTR_INTERRUPTED_A6	= 0x00000008,
> +	SBI_SSE_ATTR_INTERRUPTED_A7	= 0x00000009,
> +};
> +
> +#define SBI_SSE_ATTR_STATUS_STATE_OFFSET	0
> +#define SBI_SSE_ATTR_STATUS_STATE_MASK		0x3
> +#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET	2
> +#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET	3
> +
> +#define SBI_SSE_ATTR_CONFIG_ONESHOT	(1 << 0)
> +
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_STATUS_SPP	BIT(0)
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_STATUS_SPIE	BIT(1)

s/STATUS/SSTATUS/

> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
> +
> +enum sbi_sse_state {
> +	SBI_SSE_STATE_UNUSED     = 0,
> +	SBI_SSE_STATE_REGISTERED = 1,
> +	SBI_SSE_STATE_ENABLED    = 2,
> +	SBI_SSE_STATE_RUNNING    = 3,

Searching for tabs I see an unexpected lack of them above between
the enums and the ='s and also...

> +};
> +
> +/* SBI SSE Event IDs. */
> +#define SBI_SSE_EVENT_LOCAL_RAS			0x00000000

Missing LOCAL_DOUBLE_TRAP

> +#define	SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_0_END		0x00007fff
> +#define SBI_SSE_EVENT_GLOBAL_RAS		0x00008000
> +#define	SBI_SSE_EVENT_GLOBAL_PLAT_0_START	0x00004000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_0_END		0x00007fff

copy+paste error, global platform specific events are 0xc000 - 0xffff

> +
> +#define SBI_SSE_EVENT_LOCAL_PMU			0x00010000
> +#define	SBI_SSE_EVENT_LOCAL_PLAT_1_START	0x00014000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_1_END		0x00017fff
> +#define	SBI_SSE_EVENT_GLOBAL_PLAT_1_START	0x0001c000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_1_END		0x0001ffff
> +
> +#define	SBI_SSE_EVENT_LOCAL_PLAT_2_START	0x00024000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_2_END		0x00027fff
> +#define	SBI_SSE_EVENT_GLOBAL_PLAT_2_START	0x0002c000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_2_END		0x0002ffff
> +
> +#define SBI_SSE_EVENT_LOCAL_SOFTWARE		0xffff0000
> +#define	SBI_SSE_EVENT_LOCAL_PLAT_3_START	0xffff4000
> +#define SBI_SSE_EVENT_LOCAL_PLAT_3_END		0xffff7fff
> +#define SBI_SSE_EVENT_GLOBAL_SOFTWARE		0xffff8000
> +#define	SBI_SSE_EVENT_GLOBAL_PLAT_3_START	0xffffc000
> +#define SBI_SSE_EVENT_GLOBAL_PLAT_3_END		0xffffffff

...unexpected tabs between the #define and the symbol name in
several of the above definitions.

> +
> +#define SBI_SSE_EVENT_GLOBAL_BIT		(1 << 15)
> +#define SBI_SSE_EVENT_PLATFORM_BIT		(1 << 14)

Let's put these in numeric order like the spec has them, i.e.

  #define SBI_SSE_EVENT_PLATFORM_BIT		(1 << 14)
  #define SBI_SSE_EVENT_GLOBAL_BIT		(1 << 15)

> +
>  struct sbiret {
>  	long error;
>  	long value;
> -- 
> 2.45.2
>

Thanks,
drew


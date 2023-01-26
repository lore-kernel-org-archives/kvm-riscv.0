From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 26 Jan 2023 16:47:53 +0100
Subject: [PATCH 1/7] RISC-V: Add AIA related CSR defines
In-Reply-To: <20230112140304.1830648-2-apatel@ventanamicro.com>
References: <20230112140304.1830648-1-apatel@ventanamicro.com>
 <20230112140304.1830648-2-apatel@ventanamicro.com>
Message-ID: <20230126154753.txhgaqgudnksymrm@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 07:32:58PM +0530, Anup Patel wrote:
> The RISC-V AIA specification improves handling per-HART local interrupts
> in a backward compatible manner. This patch adds defines for new RISC-V
> AIA CSRs.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h | 93 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 0e571f6483d9..d608dac4b19f 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -73,7 +73,10 @@
>  #define IRQ_S_EXT		9
>  #define IRQ_VS_EXT		10
>  #define IRQ_M_EXT		11
> +#define IRQ_S_GEXT		12
>  #define IRQ_PMU_OVF		13
> +#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
> +#define IRQ_LOCAL_MASK		((_AC(1, UL) << IRQ_LOCAL_MAX) - 1)

How about instead of the above two defines we do

  #define IRQ_LOCAL_MASK GENMASK(13, 0)

And in general it might be nice to put GENMASK to work for all the
new masks below.

>  
>  /* Exception causes */
>  #define EXC_INST_MISALIGNED	0
> @@ -156,6 +159,27 @@
>  				 (_AC(1, UL) << IRQ_S_TIMER) | \
>  				 (_AC(1, UL) << IRQ_S_EXT))
>  
> +/* AIA CSR bits */
> +#define TOPI_IID_SHIFT		16
> +#define TOPI_IID_MASK		_AC(0xfff, UL)
> +#define TOPI_IPRIO_MASK		_AC(0xff, UL)
> +#define TOPI_IPRIO_BITS		8
> +
> +#define TOPEI_ID_SHIFT		16
> +#define TOPEI_ID_MASK		_AC(0x7ff, UL)
> +#define TOPEI_PRIO_MASK		_AC(0x7ff, UL)
> +
> +#define ISELECT_IPRIO0		0x30
> +#define ISELECT_IPRIO15		0x3f
> +#define ISELECT_MASK		_AC(0x1ff, UL)
> +
> +#define HVICTL_VTI		_AC(0x40000000, UL)

I'd rather read this as '1 << 30' to match the spec and other
bit masks in this file. Actually, it'd be nice if BIT() was
used throughout this file, e.g. #define HVICTL_VTI BIT(30)

> +#define HVICTL_IID		_AC(0x0fff0000, UL)
> +#define HVICTL_IID_SHIFT	16
> +#define HVICTL_DPR		_AC(0x00000200, UL)
> +#define HVICTL_IPRIOM		_AC(0x00000100, UL)
> +#define HVICTL_IPRIO		_AC(0x000000ff, UL)
> +
>  /* xENVCFG flags */
>  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> @@ -250,6 +274,18 @@
>  #define CSR_STIMECMP		0x14D
>  #define CSR_STIMECMPH		0x15D
>  
> +/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
> +#define CSR_SISELECT		0x150
> +#define CSR_SIREG		0x151
> +
> +/* Supervisor-Level Interrupts (AIA) */
> +#define CSR_STOPEI		0x15c
> +#define CSR_STOPI		0xdb0
> +
> +/* Supervisor-Level High-Half CSRs (AIA) */
> +#define CSR_SIEH		0x114
> +#define CSR_SIPH		0x154
> +
>  #define CSR_VSSTATUS		0x200
>  #define CSR_VSIE		0x204
>  #define CSR_VSTVEC		0x205
> @@ -279,8 +315,32 @@
>  #define CSR_HGATP		0x680
>  #define CSR_HGEIP		0xe12
>  
> +/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> +#define CSR_HVIEN		0x608
> +#define CSR_HVICTL		0x609
> +#define CSR_HVIPRIO1		0x646
> +#define CSR_HVIPRIO2		0x647
> +
> +/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
> +#define CSR_VSISELECT		0x250
> +#define CSR_VSIREG		0x251
> +
> +/* VS-Level Interrupts (H-extension with AIA) */
> +#define CSR_VSTOPEI		0x25c
> +#define CSR_VSTOPI		0xeb0
> +
> +/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
> +#define CSR_HIDELEGH		0x613
> +#define CSR_HVIENH		0x618
> +#define CSR_HVIPH		0x655
> +#define CSR_HVIPRIO1H		0x656
> +#define CSR_HVIPRIO2H		0x657
> +#define CSR_VSIEH		0x214
> +#define CSR_VSIPH		0x254
> +
>  #define CSR_MSTATUS		0x300
>  #define CSR_MISA		0x301
> +#define CSR_MIDELEG		0x303
>  #define CSR_MIE			0x304
>  #define CSR_MTVEC		0x305
>  #define CSR_MENVCFG		0x30a
> @@ -297,6 +357,25 @@
>  #define CSR_MIMPID		0xf13
>  #define CSR_MHARTID		0xf14
>  
> +/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
> +#define CSR_MISELECT		0x350
> +#define CSR_MIREG		0x351
> +
> +/* Machine-Level Interrupts (AIA) */
> +#define CSR_MTOPEI		0x35c
> +#define CSR_MTOPI		0xfb0
> +
> +/* Virtual Interrupts for Supervisor Level (AIA) */
> +#define CSR_MVIEN		0x308
> +#define CSR_MVIP		0x309
> +
> +/* Machine-Level High-Half CSRs (AIA) */
> +#define CSR_MIDELEGH		0x313
> +#define CSR_MIEH		0x314
> +#define CSR_MVIENH		0x318
> +#define CSR_MVIPH		0x319
> +#define CSR_MIPH		0x354
> +
>  #ifdef CONFIG_RISCV_M_MODE
>  # define CSR_STATUS	CSR_MSTATUS
>  # define CSR_IE		CSR_MIE
> @@ -307,6 +386,13 @@
>  # define CSR_TVAL	CSR_MTVAL
>  # define CSR_IP		CSR_MIP
>  
> +# define CSR_IEH		CSR_MIEH
> +# define CSR_ISELECT	CSR_MISELECT
> +# define CSR_IREG	CSR_MIREG
> +# define CSR_IPH		CSR_MIPH
> +# define CSR_TOPEI	CSR_MTOPEI
> +# define CSR_TOPI	CSR_MTOPI
> +
>  # define SR_IE		SR_MIE
>  # define SR_PIE		SR_MPIE
>  # define SR_PP		SR_MPP
> @@ -324,6 +410,13 @@
>  # define CSR_TVAL	CSR_STVAL
>  # define CSR_IP		CSR_SIP
>  
> +# define CSR_IEH		CSR_SIEH
> +# define CSR_ISELECT	CSR_SISELECT
> +# define CSR_IREG	CSR_SIREG
> +# define CSR_IPH		CSR_SIPH
> +# define CSR_TOPEI	CSR_STOPEI
> +# define CSR_TOPI	CSR_STOPI
> +
>  # define SR_IE		SR_SIE
>  # define SR_PIE		SR_SPIE
>  # define SR_PP		SR_SPP
> -- 
> 2.34.1
>

Besides my preference for GENMASK and BIT, this looks good to me.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


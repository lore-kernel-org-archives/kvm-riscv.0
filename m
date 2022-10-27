From: Heiko Stübner <heiko@sntech.de>
Date: Thu, 27 Oct 2022 17:03:58 +0200
Subject: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
In-Reply-To: <20221027130247.31634-3-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com> <20221027130247.31634-3-ajones@ventanamicro.com>
Message-ID: <5176908.GXAFRqVoOG@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Donnerstag, 27. Oktober 2022, 15:02:40 CEST schrieb Andrew Jones:
> Mostly follow the same pattern as Zicbom, but leave out the toolchain
> checks as we plan to use the insn-def framework for the cbo.zero
> instruction.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                  | 13 +++++++++++++
>  arch/riscv/include/asm/cacheflush.h |  3 ++-
>  arch/riscv/include/asm/hwcap.h      |  1 +
>  arch/riscv/kernel/cpu.c             |  1 +
>  arch/riscv/kernel/cpufeature.c      | 10 ++++++++++
>  arch/riscv/kernel/setup.c           |  2 +-
>  arch/riscv/mm/cacheflush.c          | 23 +++++++++++++++--------
>  7 files changed, 43 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6b48a3ae9843..c20e6fa0c0b1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -433,6 +433,19 @@ config RISCV_ISA_ZICBOM
>  
>  	   If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_ZICBOZ
> +	bool "Zicboz extension support for faster zeroing of memory"
> +	depends on !XIP_KERNEL && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the ZICBOZ
> +	   extension (cbo.zero instruction) and enable its usage.
> +
> +	   The Zicboz extension is used for faster zeroing of memory.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config FPU
>  	bool "FPU support"
>  	default y
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index f6fbe7042f1c..5b31568cf5e6 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -43,7 +43,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  #endif /* CONFIG_SMP */
>  
>  extern unsigned int riscv_cbom_block_size;
> -void riscv_init_cbom_blocksize(void);
> +extern unsigned int riscv_cboz_block_size;
> +void riscv_init_cbo_blocksizes(void);
>  
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
>  void riscv_noncoherent_supported(void);
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5d6492bde446..eaa5a972ad2d 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -45,6 +45,7 @@
>  #define RISCV_ISA_EXT_ZIHINTPAUSE	29
>  #define RISCV_ISA_EXT_SSTC		30
>  #define RISCV_ISA_EXT_SVINVAL		31
> +#define RISCV_ISA_EXT_ZICBOZ		32
>  
>  #define RISCV_ISA_EXT_ID_MAX		RISCV_ISA_EXT_MAX
>  
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index fa427bdcf773..bf969218f609 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -144,6 +144,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
>  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 18b9ed4df1f4..e13b3391de76 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -78,6 +78,15 @@ static bool riscv_isa_extension_check(int id)
>  			return false;
>  		}
>  		return true;
> +	case RISCV_ISA_EXT_ZICBOZ:
> +		if (!riscv_cboz_block_size) {
> +			pr_err("Zicboz detected in ISA string, but no cboz-block-size found\n");
> +			return false;
> +		} else if (!is_power_of_2(riscv_cboz_block_size)) {
> +			pr_err("cboz-block-size present, but is not a power-of-2\n");
> +			return false;
> +		}
> +		return true;
>  	}
>  
>  	return true;
> @@ -225,6 +234,7 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index a07917551027..26de0d8fd23d 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -296,7 +296,7 @@ void __init setup_arch(char **cmdline_p)
>  	setup_smp();
>  #endif
>  
> -	riscv_init_cbom_blocksize();
> +	riscv_init_cbo_blocksizes();
>  	riscv_fill_hwcap();
>  	apply_boot_alternatives();
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index f096b9966cae..208e0d58bde3 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -91,6 +91,9 @@ void flush_icache_pte(pte_t pte)
>  unsigned int riscv_cbom_block_size;
>  EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
>  
> +unsigned int riscv_cboz_block_size;
> +EXPORT_SYMBOL_GPL(riscv_cboz_block_size);
> +
>  static void cbo_get_block_size(struct device_node *node,
>  			       const char *name, u32 *blksz,
>  			       unsigned long *first_hartid)
> @@ -113,19 +116,23 @@ static void cbo_get_block_size(struct device_node *node,
>  	}
>  }
>  
> -void riscv_init_cbom_blocksize(void)
> +void riscv_init_cbo_blocksizes(void)
>  {
> +	unsigned long cbom_hartid, cboz_hartid;
> +	u32 cbom_blksz = 0, cboz_blksz = 0;
>  	struct device_node *node;
> -	unsigned long cbom_hartid;
> -	u32 probed_block_size;
>  
> -	probed_block_size = 0;
>  	for_each_of_cpu_node(node) {
> -		/* set block-size for cbom extension if available */
> +		/* set block-size for cbom and/or cboz extension if available */
>  		cbo_get_block_size(node, "riscv,cbom-block-size",
> -				   &probed_block_size, &cbom_hartid);
> +				   &cbom_blksz, &cbom_hartid);
> +		cbo_get_block_size(node, "riscv,cboz-block-size",

This is missing an entry in
	Documentation/devicetree/bindings/riscv/cpus.yaml
for the added riscv,cboz-block-size property.

Otherwise
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> +				   &cboz_blksz, &cboz_hartid);
>  	}
>  
> -	if (probed_block_size)
> -		riscv_cbom_block_size = probed_block_size;
> +	if (cbom_blksz)
> +		riscv_cbom_block_size = cbom_blksz;
> +
> +	if (cboz_blksz)
> +		riscv_cboz_block_size = cboz_blksz;
>  }
> 






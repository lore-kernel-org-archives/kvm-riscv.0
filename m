From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 29 May 2024 15:08:39 -0700
Subject: [PATCH v5 02/16] riscv: add ISA extension parsing for Zimop
In-Reply-To: <20240517145302.971019-3-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-3-cleger@rivosinc.com>
Message-ID: <ZlenZ+NvXxOxvqEO@ghost>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 17, 2024 at 04:52:42PM +0200, Cl?ment L?ger wrote:
> Add parsing for Zimop ISA extension which was ratified in commit
> 58220614a5f of the riscv-isa-manual.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 1f2d2599c655..b1896dade74c 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -80,6 +80,7 @@
>  #define RISCV_ISA_EXT_ZFA		71
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
> +#define RISCV_ISA_EXT_ZIMOP		74

Since my changes for removing xandespmu haven't landed here yet I think
you should keep RISCV_ISA_EXT_XANDESPMU in the diff here and make
RISCV_ISA_EXT_ZIMOP have a key of 75. Palmer can probably resolve the
conflicting keys when these two series are merged.

- Charlie

>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 2993318b8ea2..41f8ae22e7a0 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -241,6 +241,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> +	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
>  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



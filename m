From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 20 Jun 2024 15:52:44 -0700
Subject: [PATCH 3/5] riscv: hwprobe: export Zaamo and Zalrsc extensions
In-Reply-To: <20240619153913.867263-4-cleger@rivosinc.com>
References: <20240619153913.867263-1-cleger@rivosinc.com>
 <20240619153913.867263-4-cleger@rivosinc.com>
Message-ID: <ZnSyvLKC+xXlW1i+@ghost>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 19, 2024 at 05:39:10PM +0200, Cl?ment L?ger wrote:
> Export the Zaamo and Zalrsc extensions to userspace using hwprobe.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 8 ++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 25d783be2878..6836a789a9b1 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -235,6 +235,14 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         c732a4f39a4 ("Zcmop is ratified/1.0").
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZAAMO`: The Zaamo extension is supported as
> +       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
> +       ("integrate Zaamo and Zalrsc text (#1304)").
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is supported as
> +       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
> +       ("integrate Zaamo and Zalrsc text (#1304)").
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
>  
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 920fc6a586c9..52cd161e9a94 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -71,6 +71,8 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
>  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
> +#define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 48)
> +#define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 49)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 3d1aa13a0bb2..e09f1bc3af17 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -116,6 +116,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZCA);
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
> +		EXT_KEY(ZAAMO);
> +		EXT_KEY(ZALRSC);
>  
>  		/*
>  		 * All the following extensions must depend on the kernel
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>



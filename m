From: Conor Dooley <conor@kernel.org>
Date: Wed, 25 Jan 2023 21:33:30 +0000
Subject: [PATCH -next v13 02/19] riscv: Extending cpufeature.c to detect
 V-extension
In-Reply-To: <20230125142056.18356-3-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-3-andy.chiu@sifive.com>
Message-ID: <Y9GgKiF8q2k9eRdh@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 02:20:39PM +0000, Andy Chiu wrote:
> From: Guo Ren <ren_guo@c-sky.com>
> 
> Add V-extension into riscv_isa_ext_keys array and detect it with isa
> string parsing.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/hwcap.h      |  4 ++++
>  arch/riscv/include/asm/vector.h     | 26 ++++++++++++++++++++++++++
>  arch/riscv/include/uapi/asm/hwcap.h |  1 +
>  arch/riscv/kernel/cpufeature.c      | 12 ++++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 arch/riscv/include/asm/vector.h
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 57439da71c77..f413db6118e5 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -35,6 +35,7 @@ extern unsigned long elf_hwcap;
>  #define RISCV_ISA_EXT_m		('m' - 'a')
>  #define RISCV_ISA_EXT_s		('s' - 'a')
>  #define RISCV_ISA_EXT_u		('u' - 'a')
> +#define RISCV_ISA_EXT_v		('v' - 'a')
>  
>  /*
>   * Increse this to higher value as kernel support more ISA extensions.
> @@ -73,6 +74,7 @@ static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
>  enum riscv_isa_ext_key {
>  	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
>  	RISCV_ISA_EXT_KEY_SVINVAL,
> +	RISCV_ISA_EXT_KEY_VECTOR,	/* For 'V' */

That's obvious surely, no?

>  	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_KEY_MAX,
>  };
> @@ -95,6 +97,8 @@ static __always_inline int riscv_isa_ext2key(int num)

You should probably check out Jisheng's series that deletes whole
sections of this code, including this whole function.
https://lore.kernel.org/all/20230115154953.831-3-jszhang at kernel.org/T/#u


> @@ -256,6 +257,17 @@ void __init riscv_fill_hwcap(void)
>  		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
>  	}
>  
> +	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> +#ifndef CONFIG_RISCV_ISA_V
> +		/*
> +		 * ISA string in device tree might have 'v' flag, but
> +		 * CONFIG_RISCV_ISA_V is disabled in kernel.
> +		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
> +		 */
> +		elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> +#endif

I know that a later patch in this series calls rvv_enable() here, which
I'll comment on there, but I'd rather see IS_ENABLED as opposed to
ifdefs in C files where possible.

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230125/e5de0580/attachment-0001.sig>

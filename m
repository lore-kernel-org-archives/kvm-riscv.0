From: Björn Töpel <bjorn@kernel.org>
Date: Thu, 02 Mar 2023 13:47:33 +0100
Subject: [PATCH -next v14 14/19] riscv: signal: Report signal frame size
 to userspace via auxv
In-Reply-To: <20230224170118.16766-15-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-15-andy.chiu@sifive.com>
Message-ID: <877cvz48wq.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> From: Vincent Chen <vincent.chen@sifive.com>
>
> The vector register belongs to the signal context. They need to be stored
> and restored as entering and leaving the signal handler. According to the
> V-extension specification, the maximum length of the vector registers can
> be 2^(XLEN-1). Hence, if userspace refers to the MINSIGSTKSZ to create a
> sigframe, it may not be enough. To resolve this problem, this patch refers
> to the commit 94b07c1f8c39c
> ("arm64: signal: Report signal frame size to userspace via auxv") to enable
> userspace to know the minimum required sigframe size through the auxiliary
> vector and use it to allocate enough memory for signal context.
>
> Note that auxv always reports size of the sigframe as if V exists for
> all starting processes, whenever the kernel has CONFIG_RISCV_ISA_V. The
> reason is that users usually reference this value to allocate an
> alternative signal stack, and the user may use V anytime. So the user
> must reserve a space for V-context in sigframe in case that the signal
> handler invokes after the kernel allocating V.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/elf.h         |  9 +++++++++
>  arch/riscv/include/asm/processor.h   |  2 ++
>  arch/riscv/include/uapi/asm/auxvec.h |  1 +
>  arch/riscv/kernel/signal.c           | 20 +++++++++++++++-----
>  4 files changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index 30e7d2455960..ca23c4f6c440 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -105,6 +105,15 @@ do {								\
>  		get_cache_size(3, CACHE_TYPE_UNIFIED));		\
>  	NEW_AUX_ENT(AT_L3_CACHEGEOMETRY,			\
>  		get_cache_geometry(3, CACHE_TYPE_UNIFIED));	\
> +	/*							 \
> +	 * Should always be nonzero unless there's a kernel bug. \
> +	 * If we haven't determined a sensible value to give to	 \
> +	 * userspace, omit the entry:				 \
> +	 */							 \
> +	if (likely(signal_minsigstksz))				 \
> +		NEW_AUX_ENT(AT_MINSIGSTKSZ, signal_minsigstksz); \
> +	else							 \
> +		NEW_AUX_ENT(AT_IGNORE, 0);			 \
>  } while (0)
>  #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
>  struct linux_binprm;
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index f0ddf691ac5e..38ded8c5f207 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -7,6 +7,7 @@
>  #define _ASM_RISCV_PROCESSOR_H
>  
>  #include <linux/const.h>
> +#include <linux/cache.h>
>  
>  #include <vdso/processor.h>
>  
> @@ -81,6 +82,7 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
>  extern void riscv_fill_hwcap(void);
>  extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
>  
> +extern unsigned long signal_minsigstksz __ro_after_init;
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_RISCV_PROCESSOR_H */
> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
> index fb187a33ce58..2c50d9ca30e0 100644
> --- a/arch/riscv/include/uapi/asm/auxvec.h
> +++ b/arch/riscv/include/uapi/asm/auxvec.h
> @@ -35,5 +35,6 @@
>  
>  /* entries in ARCH_DLINFO */
>  #define AT_VECTOR_SIZE_ARCH	9
> +#define AT_MINSIGSTKSZ 51

Proper tab alignment missing.

>  
>  #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 76c0480ee4cd..aa8ee95dee2d 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -21,6 +21,8 @@
>  #include <asm/vector.h>
>  #include <asm/csr.h>
>  
> +unsigned long __ro_after_init signal_minsigstksz;

Nit: __ro_after_init placement insistent with the declaration above.


Bj?rn


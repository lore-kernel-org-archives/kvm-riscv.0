From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 26 Jan 2023 08:09:30 +0100
Subject: [PATCH v4 09/13] riscv: switch to relative alternative entries
In-Reply-To: <20230120183418.ngdppppvwzysqtcr@orel>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-10-jszhang@kernel.org>
 <20230120183418.ngdppppvwzysqtcr@orel>
Message-ID: <20230126070930.wvqsrrcmcuq5vv2x@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 20, 2023 at 07:34:18PM +0100, Andrew Jones wrote:
> On Sun, Jan 15, 2023 at 11:49:49PM +0800, Jisheng Zhang wrote:
> ...
> >  #define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
> > -	RISCV_PTR " " oldptr "\n"					\
> > -	RISCV_PTR " " newptr "\n"					\
> > -	REG_ASM " " vendor_id "\n"					\
> > -	REG_ASM " " newlen "\n"						\
> > -	".word " errata_id "\n"
> > +	".4byte	((" oldptr ") - .) \n"					\
> > +	".4byte	((" newptr ") - .) \n"					\
> > +	".2byte	" vendor_id "\n"					\
> > +	".2byte " newlen "\n"						\
> > +	".4byte	" errata_id "\n"
> >
> 
> Hi Jisheng,
> 
> This patch breaks loading the KVM module for me. I got "kvm: Unknown
> relocation type 34". My guess is that these 2 byte fields are inspiring
> the compiler to emit 16-bit relocation types. The patch below fixes
> things for me. If you agree with fixing it this way, rather than
> changing something in alternatives, like not using 2 byte fields,
> then please pick the below patch up in your series.

Hi Jisheng,

I'm poking again on this as I see this series is now working its way
to be merged into for-next. I'd rather avoid the bisection breakage
which will be present if we fix this issue afterwards by having a
v5 merged which addresses the issue in the correct patch order.

Thanks,
drew

> 
> From 4d203697aa745a0cd3a9217d547a9fb7fa2a87c7 Mon Sep 17 00:00:00 2001
> From: Andrew Jones <ajones@ventanamicro.com>
> Date: Fri, 20 Jan 2023 19:05:44 +0100
> Subject: [PATCH] riscv: module: Add ADD16 and SUB16 rela types
> Content-type: text/plain
> 
> To prepare for 16-bit relocation types to be emitted in alternatives
> add support for ADD16 and SUB16.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/module.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 76f4b9c2ec5b..7c651d55fcbd 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -268,6 +268,13 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
>  	return -EINVAL;
>  }
>  
> +static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u16 *)location += (u16)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -282,6 +289,13 @@ static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
>  	return 0;
>  }
>  
> +static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u16 *)location -= (u16)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -315,8 +329,10 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>  	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
>  	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
>  	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
> +	[R_RISCV_ADD16]			= apply_r_riscv_add16_rela,
>  	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
>  	[R_RISCV_ADD64]			= apply_r_riscv_add64_rela,
> +	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
>  	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
>  	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
>  };
> -- 
> 2.39.0
> 


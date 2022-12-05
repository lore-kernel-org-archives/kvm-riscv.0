From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 5 Dec 2022 16:25:41 +0100
Subject: [PATCH v2 08/13] riscv: module: move find_section to module.h
In-Reply-To: <20221204174632.3677-9-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-9-jszhang@kernel.org>
Message-ID: <20221205152541.5ahiqvlb7lt6np7w@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 05, 2022 at 01:46:27AM +0800, Jisheng Zhang wrote:
> Move it to the header so that the implementation can be shared
> by the alternatives code.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/module.h | 15 +++++++++++++++
>  arch/riscv/kernel/module.c      | 15 ---------------
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
> index 76aa96a9fc08..78722a79fc59 100644
> --- a/arch/riscv/include/asm/module.h
> +++ b/arch/riscv/include/asm/module.h
> @@ -111,4 +111,19 @@ static inline struct plt_entry *get_plt_entry(unsigned long val,
>  
>  #endif /* CONFIG_MODULE_SECTIONS */

Should probably add an explicit #include <linux/elf.h>

Otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

>  
> +static inline const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
> +					   const Elf_Shdr *sechdrs,
> +					   const char *name)
> +{
> +	const Elf_Shdr *s, *se;
> +	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
> +
> +	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
> +		if (strcmp(name, secstrs + s->sh_name) == 0)
> +			return s;
> +	}
> +
> +	return NULL;
> +}
> +
>  #endif /* _ASM_RISCV_MODULE_H */
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 91fe16bfaa07..76f4b9c2ec5b 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -429,21 +429,6 @@ void *module_alloc(unsigned long size)
>  }
>  #endif
>  
> -static const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
> -				    const Elf_Shdr *sechdrs,
> -				    const char *name)
> -{
> -	const Elf_Shdr *s, *se;
> -	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
> -
> -	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
> -		if (strcmp(name, secstrs + s->sh_name) == 0)
> -			return s;
> -	}
> -
> -	return NULL;
> -}
> -
>  int module_finalize(const Elf_Ehdr *hdr,
>  		    const Elf_Shdr *sechdrs,
>  		    struct module *me)
> -- 
> 2.37.2
> 


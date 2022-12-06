From: Conor Dooley <conor@kernel.org>
Date: Tue, 06 Dec 2022 20:44:30 -0000
Subject: [PATCH v2 08/13] riscv: module: move find_section to module.h
In-Reply-To: <20221204174632.3677-9-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-9-jszhang@kernel.org>
Message-ID: <Y4+pp6XEu3GSWCiE@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 05, 2022 at 01:46:27AM +0800, Jisheng Zhang wrote:
> Move it to the header so that the implementation can be shared
> by the alternatives code.

I'm not a super big fan of these perfunctory commit messages.
Maybe I'm being a bit ornery, but a few words about why the alternatives
could benefit from this would be nice. Also, s/it/find_section()/ please.

How about:
> Move find_section() to module.h so that the implementation can be shared
> by the alternatives code. This will allow us to use alternatives in
> the vdso.


> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/module.h | 15 +++++++++++++++
>  arch/riscv/kernel/module.c      | 15 ---------------

Silly question maybe, but is module.h the right place to put this?
But I have nothing better to suggest, and I hate bikeshedding stuff when
I have no suggestion to make.

Rationale behind the movement seems grand to me though, so I suppose:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
> index 76aa96a9fc08..78722a79fc59 100644
> --- a/arch/riscv/include/asm/module.h
> +++ b/arch/riscv/include/asm/module.h
> @@ -111,4 +111,19 @@ static inline struct plt_entry *get_plt_entry(unsigned long val,
>  
>  #endif /* CONFIG_MODULE_SECTIONS */
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
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20221206/09a0e220/attachment-0001.sig>

From: Guo Ren <guoren@kernel.org>
Date: Mon, 5 Dec 2022 09:56:37 +0800
Subject: [PATCH v2 10/13] riscv: alternative: patch alternatives in the vDSO
In-Reply-To: <20221204174632.3677-11-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org> <20221204174632.3677-11-jszhang@kernel.org>
Message-ID: <CAJF2gTR5VW0m=czqF2cQOcX5Vstow6EsuT044_E4WLo-NeVCOg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Are there any patches that depend on it? Any existing utilization? My
first idea is to let __vdso_flush_icache use it, the standard
implementation is so heavy for user space JIT scenario, maybe vendors
could give a custom one.

On Mon, Dec 5, 2022 at 1:57 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Make it possible to use alternatives in the vDSO, so that better
> implementations can be used if possible.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/vdso.h     |  4 ++++
>  arch/riscv/kernel/alternative.c   | 25 +++++++++++++++++++++++++
>  arch/riscv/kernel/vdso.c          |  5 -----
>  arch/riscv/kernel/vdso/vdso.lds.S |  7 +++++++
>  4 files changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index af981426fe0f..b6ff7473fb8a 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -28,8 +28,12 @@
>  #define COMPAT_VDSO_SYMBOL(base, name)                                         \
>         (void __user *)((unsigned long)(base) + compat__vdso_##name##_offset)
>
> +extern char compat_vdso_start[], compat_vdso_end[];
> +
>  #endif /* CONFIG_COMPAT */
>
> +extern char vdso_start[], vdso_end[];
> +
>  #endif /* !__ASSEMBLY__ */
>
>  #endif /* CONFIG_MMU */
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 9d88375624b5..eaf7ddaba54c 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -11,7 +11,9 @@
>  #include <linux/cpu.h>
>  #include <linux/uaccess.h>
>  #include <asm/alternative.h>
> +#include <asm/module.h>
>  #include <asm/sections.h>
> +#include <asm/vdso.h>
>  #include <asm/vendorid_list.h>
>  #include <asm/sbi.h>
>  #include <asm/csr.h>
> @@ -187,6 +189,27 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
>                                 stage);
>  }
>
> +static void __init apply_vdso_alternatives(void)
> +{
> +       const struct elf64_hdr *hdr;
> +       const struct elf64_shdr *shdr;
> +       const struct elf64_shdr *alt;
> +       struct alt_entry *begin, *end;
> +
> +       hdr = (struct elf64_hdr *)vdso_start;
> +       shdr = (void *)hdr + hdr->e_shoff;
> +       alt = find_section(hdr, shdr, ".alternative");
> +       if (!alt)
> +               return;
> +
> +       begin = (void *)hdr + alt->sh_offset,
> +       end = (void *)hdr + alt->sh_offset + alt->sh_size,
> +
> +       _apply_alternatives((struct alt_entry *)begin,
> +                           (struct alt_entry *)end,
> +                           RISCV_ALTERNATIVES_BOOT);
> +}
> +
>  void __init apply_boot_alternatives(void)
>  {
>         /* If called on non-boot cpu things could go wrong */
> @@ -195,6 +218,8 @@ void __init apply_boot_alternatives(void)
>         _apply_alternatives((struct alt_entry *)__alt_start,
>                             (struct alt_entry *)__alt_end,
>                             RISCV_ALTERNATIVES_BOOT);
> +
> +       apply_vdso_alternatives();
>  }
>
>  /*
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index 123d05255fcf..1f47bc6566cf 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -22,11 +22,6 @@ struct vdso_data {
>  };
>  #endif
>
> -extern char vdso_start[], vdso_end[];
> -#ifdef CONFIG_COMPAT
> -extern char compat_vdso_start[], compat_vdso_end[];
> -#endif
> -
>  enum vvar_pages {
>         VVAR_DATA_PAGE_OFFSET,
>         VVAR_TIMENS_PAGE_OFFSET,
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index 150b1a572e61..4a0606633290 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -40,6 +40,13 @@ SECTIONS
>         . = 0x800;
>         .text           : { *(.text .text.*) }          :text
>
> +       . = ALIGN(4);
> +       .alternative : {
> +               __alt_start = .;
> +               *(.alternative)
> +               __alt_end = .;
> +       }
> +
>         .data           : {
>                 *(.got.plt) *(.got)
>                 *(.data .data.* .gnu.linkonce.d.*)
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren


From: Guo Ren <guoren@kernel.org>
Date: Mon, 5 Dec 2022 08:53:20 +0800
Subject: [PATCH v2 13/13] riscv: remove riscv_isa_ext_keys[] array and
 related usage
In-Reply-To: <20221204174632.3677-14-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org> <20221204174632.3677-14-jszhang@kernel.org>
Message-ID: <CAJF2gTTn6UYpykLgq=ZcEd4PeFJeGfRBD9n28acZDxREBBErkg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 5, 2022 at 1:57 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> All users have switched to riscv_has_extension_*, removed unused
> definitions, vars and related setting code.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/include/asm/hwcap.h | 30 ------------------------------
>  arch/riscv/kernel/cpufeature.c |  9 ---------
>  2 files changed, 39 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index e2d3f6df7701..be00a4337578 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -60,18 +60,6 @@ enum {
>
>  extern unsigned long elf_hwcap;
>
> -/*
> - * This enum represents the logical ID for each RISC-V ISA extension static
> - * keys. We can use static key to optimize code path if some ISA extensions
> - * are available.
> - */
> -enum riscv_isa_ext_key {
> -       RISCV_ISA_EXT_KEY_FPU,          /* For 'F' and 'D' */
> -       RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
> -       RISCV_ISA_EXT_KEY_SVINVAL,
> -       RISCV_ISA_EXT_KEY_MAX,
> -};
> -
>  struct riscv_isa_ext_data {
>         /* Name of the extension displayed to userspace via /proc/cpuinfo */
>         char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
> @@ -79,24 +67,6 @@ struct riscv_isa_ext_data {
>         unsigned int isa_ext_id;
>  };
>
> -extern struct static_key_false riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_MAX];
> -
> -static __always_inline int riscv_isa_ext2key(int num)
> -{
> -       switch (num) {
> -       case RISCV_ISA_EXT_f:
> -               return RISCV_ISA_EXT_KEY_FPU;
> -       case RISCV_ISA_EXT_d:
> -               return RISCV_ISA_EXT_KEY_FPU;
> -       case RISCV_ISA_EXT_ZIHINTPAUSE:
> -               return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
> -       case RISCV_ISA_EXT_SVINVAL:
> -               return RISCV_ISA_EXT_KEY_SVINVAL;
> -       default:
> -               return -EINVAL;
> -       }
> -}
> -
Reviewed-by: Guo Ren <guoren@kernel.org>

>  static __always_inline bool
>  riscv_has_extension_likely(const unsigned long ext)
>  {
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index adeac90b1d8e..3240a2915bf1 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -28,9 +28,6 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>
> -DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> -EXPORT_SYMBOL(riscv_isa_ext_keys);
> -
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -243,12 +240,6 @@ void __init riscv_fill_hwcap(void)
>                 if (elf_hwcap & BIT_MASK(i))
>                         print_str[j++] = (char)('a' + i);
>         pr_info("riscv: ELF capabilities %s\n", print_str);
> -
> -       for_each_set_bit(i, riscv_isa, RISCV_ISA_EXT_MAX) {
> -               j = riscv_isa_ext2key(i);
> -               if (j >= 0)
> -                       static_branch_enable(&riscv_isa_ext_keys[j]);
> -       }
Reviewed-by: Guo Ren <guoren@kernel.org>

>  }
>
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren


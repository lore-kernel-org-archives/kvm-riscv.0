From: Conor Dooley <conor@kernel.org>
Date: Mon, 5 Jun 2023 17:24:53 +0100
Subject: [PATCH -next v21 20/27] riscv: hwcap: change ELF_HWCAP to a
 function
In-Reply-To: <20230605110724.21391-21-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-21-andy.chiu@sifive.com>
Message-ID: <20230605-embattled-navigator-408a7b60b2ab@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 05, 2023 at 11:07:17AM +0000, Andy Chiu wrote:
> Using a function is flexible to represent ELF_HWCAP. So the kernel may
> encode hwcap reflecting supported hardware features just at the moment of
> the start of each program.
> 
> This will be helpful when we introduce prctl/sysctl interface to control
> per-process availability of Vector extension in following patches.
> Programs started with V disabled should see V masked off in theirs
> ELF_HWCAP.

For the uninformed, like myself, this needs to be a function, rather
than open coding the masking of the V bit at the one user of ELF_HWCAP
this series adds, because the binfmt stuff needs to get the value in
create_elf_fdpic_tables() & co?

If that's your purpose,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

One minor comment below.

> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/elf.h   | 2 +-
>  arch/riscv/include/asm/hwcap.h | 2 ++
>  arch/riscv/kernel/cpufeature.c | 5 +++++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index ca23c4f6c440..c24280774caf 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -66,7 +66,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
>   * via a bitmap that coorespends to each single-letter ISA extension.  This is
>   * essentially defunct, but will remain for compatibility with userspace.
>   */
> -#define ELF_HWCAP	(elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1))
> +#define ELF_HWCAP	riscv_get_elf_hwcap()
>  extern unsigned long elf_hwcap;
>  
>  /*
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 574385930ba7..e6c288ac4581 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -61,6 +61,8 @@
>  
>  #include <linux/jump_label.h>
>  
> +unsigned long riscv_get_elf_hwcap(void);
> +
>  struct riscv_isa_ext_data {
>  	/* Name of the extension displayed to userspace via /proc/cpuinfo */
>  	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 28032b083463..29c0680652a0 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -293,6 +293,11 @@ void __init riscv_fill_hwcap(void)
>  	pr_info("riscv: ELF capabilities %s\n", print_str);
>  }
>  
> +unsigned long riscv_get_elf_hwcap(void)
> +{
> +	return (elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1));

If you respin for some other reason, could you drop the open coded mask
creation as part of these changes?

Cheers,
Conor.

> +}
> +
>  #ifdef CONFIG_RISCV_ALTERNATIVE
>  /*
>   * Alternative patch sites consider 48 bits when determining when to patch
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230605/9dd4e51c/attachment-0001.sig>

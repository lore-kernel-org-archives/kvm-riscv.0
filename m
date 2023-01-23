From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 23 Jan 2023 11:42:37 +0000
Subject: [PATCH v2 4/6] RISC-V: Use Zicboz in clear_page when available
In-Reply-To: <20230122191328.1193885-5-ajones@ventanamicro.com>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-5-ajones@ventanamicro.com>
Message-ID: <Y85yrUz+Ls6JNHaG@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 22, 2023 at 08:13:26PM +0100, Andrew Jones wrote:
> Using memset() to zero a 4K page takes 563 total instructions
> where 20 are branches. clear_page() with Zicboz takes 150 total
> instructions where 16 are branches. We could reduce the numbers
> by further unrolling, but, since the cboz block size isn't fixed,
> we'd need a Duff device to ensure we don't execute too many
> unrolled steps. Also, cbo.zero doesn't take an offset, so each
> unrolled step requires it and an add instruction. This increases
> the chance for icache misses if we unroll many times. For these
> reasons we only unroll four times. Unrolling four times should be
> safe as it supports cboz block sizes up to 1K when used with 4K
> pages and it's only 24 to 32 bytes of unrolled instructions.
> 
> Another note about the Duff device idea is that it would probably
> be best to store the number of steps needed at boot time and then
> load the value in clear_page(). Calculating it in clear_page(),
> particularly without the Zbb extension, would not be efficient.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                | 13 +++++++++++
>  arch/riscv/include/asm/insn-def.h |  4 ++++
>  arch/riscv/include/asm/page.h     |  6 +++++-
>  arch/riscv/lib/Makefile           |  1 +
>  arch/riscv/lib/clear_page.S       | 36 +++++++++++++++++++++++++++++++
>  5 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/lib/clear_page.S
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 33bbdc33cef8..3759a2f6edd5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -432,6 +432,19 @@ config RISCV_ISA_ZICBOM
>  
>  	   If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_ZICBOZ
> +	bool "Zicboz extension support for faster zeroing of memory"
> +	depends on !XIP_KERNEL && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
> +	   when available.
> +
> +	   The Zicboz extension is used for faster zeroing of memory.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZIHINTPAUSE
>  	bool
>  	default y
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index e01ab51f50d2..6960beb75f32 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -192,4 +192,8 @@
>  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
>  	       RS1(base), SIMM12(2))
>  
> +#define CBO_zero(base)						\
> +	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> +	       RS1(base), SIMM12(4))
> +

Since most of the patch is the clear page implementation that I have no
comments on:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230123/3f8f6643/attachment.sig>

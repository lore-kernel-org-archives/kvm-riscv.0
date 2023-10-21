From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 21 Oct 2023 18:35:29 +0200
Subject: [PATCH v3 6/9] RISC-V: Add stubs for
 sbi_console_putchar/getchar()
In-Reply-To: <20231020072140.900967-7-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-7-apatel@ventanamicro.com>
Message-ID: <2023102113-harsh-trout-be8f@gregkh>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 20, 2023 at 12:51:37PM +0530, Anup Patel wrote:
> The functions sbi_console_putchar() and sbi_console_getchar() are
> not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
> stub of these functions to avoid "#ifdef" on user side.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 12dfda6bb924..cbcefa344417 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg3, unsigned long arg4,
>  			unsigned long arg5);
>  
> +#ifdef CONFIG_RISCV_SBI_V01
>  void sbi_console_putchar(int ch);
>  int sbi_console_getchar(void);
> +#else
> +static inline void sbi_console_putchar(int ch) { }
> +static inline int sbi_console_getchar(void) { return -1; }

Why not return a real error, "-1" isn't that :)

thanks,

greg k-h


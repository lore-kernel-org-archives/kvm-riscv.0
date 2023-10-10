From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 10 Oct 2023 19:16:07 +0200
Subject: [PATCH 4/6] tty/serial: Add RISC-V SBI debug console based
 earlycon
In-Reply-To: <20231010170503.657189-5-apatel@ventanamicro.com>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-5-apatel@ventanamicro.com>
Message-ID: <2023101053-scholar-resolute-a9a0@gregkh>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 10, 2023 at 10:35:01PM +0530, Anup Patel wrote:
> We extend the existing RISC-V SBI earlycon support to use the new
> RISC-V SBI debug console extension.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/tty/serial/Kconfig              |  2 +-
>  drivers/tty/serial/earlycon-riscv-sbi.c | 35 ++++++++++++++++++++++---
>  2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index bdc568a4ab66..cec46091a716 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -87,7 +87,7 @@ config SERIAL_EARLYCON_SEMIHOST
>  
>  config SERIAL_EARLYCON_RISCV_SBI
>  	bool "Early console using RISC-V SBI"
> -	depends on RISCV_SBI_V01
> +	depends on RISCV_SBI
>  	select SERIAL_CORE
>  	select SERIAL_CORE_CONSOLE
>  	select SERIAL_EARLYCON
> diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
> index 27afb0b74ea7..b1da34e8d8cd 100644
> --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> @@ -10,22 +10,49 @@
>  #include <linux/serial_core.h>
>  #include <asm/sbi.h>
>  
> +#ifdef CONFIG_RISCV_SBI_V01
>  static void sbi_putc(struct uart_port *port, unsigned char c)
>  {
>  	sbi_console_putchar(c);
>  }
>  
> -static void sbi_console_write(struct console *con,
> -			      const char *s, unsigned n)
> +static void sbi_0_1_console_write(struct console *con,
> +				  const char *s, unsigned int n)
>  {
>  	struct earlycon_device *dev = con->data;
>  	uart_console_write(&dev->port, s, n, sbi_putc);
>  }
> +#endif
> +
> +static void sbi_dbcn_console_write(struct console *con,
> +				   const char *s, unsigned int n)
> +{
> +	phys_addr_t pa = __pa(s);
> +
> +	sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +#ifdef CONFIG_32BIT
> +		  n, pa, (u64)pa >> 32,
> +#else
> +		  n, pa, 0,
> +#endif

Again, no #ifdef in .c files please.

thanks,

greg k-h


From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 18:40:35 +0530
Subject: [PATCH v3 7/9] tty/serial: Add RISC-V SBI debug console based earlycon
In-Reply-To: <2023102120-unleveled-composed-45a2@gregkh>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-8-apatel@ventanamicro.com> <2023102120-unleveled-composed-45a2@gregkh>
Message-ID: <CAAhSdy00LaD0OLJ1ANtyAm41cCLfRX7SPM=A=4WrG_6bB=9xng@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 21, 2023 at 10:16?PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 20, 2023 at 12:51:38PM +0530, Anup Patel wrote:
> > We extend the existing RISC-V SBI earlycon support to use the new
> > RISC-V SBI debug console extension.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  drivers/tty/serial/Kconfig              |  2 +-
> >  drivers/tty/serial/earlycon-riscv-sbi.c | 32 +++++++++++++++++++++----
> >  2 files changed, 29 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> > index bdc568a4ab66..cec46091a716 100644
> > --- a/drivers/tty/serial/Kconfig
> > +++ b/drivers/tty/serial/Kconfig
> > @@ -87,7 +87,7 @@ config SERIAL_EARLYCON_SEMIHOST
> >
> >  config SERIAL_EARLYCON_RISCV_SBI
> >       bool "Early console using RISC-V SBI"
> > -     depends on RISCV_SBI_V01
> > +     depends on RISCV_SBI
> >       select SERIAL_CORE
> >       select SERIAL_CORE_CONSOLE
> >       select SERIAL_EARLYCON
> > diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
> > index 27afb0b74ea7..c21cdef254e7 100644
> > --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> > +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> > @@ -15,17 +15,41 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
> >       sbi_console_putchar(c);
> >  }
> >
> > -static void sbi_console_write(struct console *con,
> > -                           const char *s, unsigned n)
> > +static void sbi_0_1_console_write(struct console *con,
> > +                               const char *s, unsigned int n)
> >  {
> >       struct earlycon_device *dev = con->data;
> >       uart_console_write(&dev->port, s, n, sbi_putc);
> >  }
> >
> > +static void sbi_dbcn_console_write(struct console *con,
> > +                                const char *s, unsigned int n)
> > +{
> > +     phys_addr_t pa = __pa(s);
> > +
> > +     if (IS_ENABLED(CONFIG_32BIT))
> > +             sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> > +                       n, lower_32_bits(pa), upper_32_bits(pa), 0, 0, 0);
> > +     else
> > +             sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> > +                       n, pa, 0, 0, 0, 0);
>
> This is still a bit hard to follow, and I guarantee it will be a pain to
> maintain over time, trying to keep both calls in sync, right?
>
> Why not fix up sbi_ecall() to get this correct instead?  It should be
> handling phys_addr_t values, not forcing you to do odd bit masking every
> single time you call it, right?  That would make things much easier
> overall, and this patch simpler, as well as the next one.

On RV32 systems, the physical address can be 34bits wide hence
the on RV32 we have to pass physical address as two parameters
whereas on RV64 entier physical address can be passed as single
parameter.

>
> Oh wait, sbi_ecall() is crazy, and just a pass-through, so that's not
> going to work, you need a wrapper function for this mess to do that bit
> twiddeling for you instead of forcing you to do it each time, I guess
> that's what you are trying to do here, but ick, is it correct?

Yes, it is better to have a wrapper function to hide the differences
of RV32 and RV64 systems. I will update.

>
> thanks,
>
> greg k-h
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

Regards,
Anup


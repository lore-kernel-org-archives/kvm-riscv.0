From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 11:21:17 +0530
Subject: [PATCH 5/6] tty: Add SBI debug console support to HVC SBI driver
In-Reply-To: <2023101045-hazard-popcorn-7d19@gregkh>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-6-apatel@ventanamicro.com> <2023101045-hazard-popcorn-7d19@gregkh>
Message-ID: <CAK9=C2WvfPg1tCpNLgDteaQGBVAsPL3S+vdvgEsBb8PCx2W8xw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 10, 2023 at 10:42?PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 10, 2023 at 10:35:02PM +0530, Anup Patel wrote:
> > --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> > +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> > @@ -15,6 +15,7 @@
> >
> >  #include "hvc_console.h"
> >
> > +#ifdef CONFIG_RISCV_SBI_V01
>
> Please no #ifdef in a .c file, that's not a good style for Linux code at
> all.
>
> And what if you want to build the driver for both options here?  What
> will happen?

Okay, I will remove all #ifdef from .c file

>
> > +static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
> >  {
> > -     return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
> > +     phys_addr_t pa;
> > +     struct sbiret ret;
> > +
> > +     if (is_vmalloc_addr(buf))
> > +             pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
> > +     else
> > +             pa = __pa(buf);
> > +
> > +     ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> > +#ifdef CONFIG_32BIT
> > +               count, pa, (u64)pa >> 32,
> > +#else
> > +               count, pa, 0,
> > +#endif
>
> This is not how to do an api, sorry, again, please no #ifdef if you want
> to support this code for the next 20+ years.

Sure, I will update like you suggested.

>
> thanks,
>
> gre gk-h

Thanks,
Anup


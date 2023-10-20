From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 20 Oct 2023 15:36:25 +0530
Subject: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI driver
In-Reply-To: <87mswdbot2.fsf@all.your.base.are.belong.to.us>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com> <87mswdbot2.fsf@all.your.base.are.belong.to.us>
Message-ID: <CAK9=C2XrDCpq6cGCJu2CVowiksxunGwfF4JxwEZ_k85+3bU1+Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 20, 2023 at 3:25?PM Bj?rn T?pel <bjorn@kernel.org> wrote:
>
> Anup Patel <apatel@ventanamicro.com> writes:
>
> > From: Atish Patra <atishp@rivosinc.com>
> >
> > RISC-V SBI specification supports advanced debug console
> > support via SBI DBCN extension.
> >
> > Extend the HVC SBI driver to support it.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  drivers/tty/hvc/Kconfig         |  2 +-
> >  drivers/tty/hvc/hvc_riscv_sbi.c | 82 ++++++++++++++++++++++++++++++---
> >  2 files changed, 76 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
> > index 4f9264d005c0..6e05c5c7bca1 100644
> > --- a/drivers/tty/hvc/Kconfig
> > +++ b/drivers/tty/hvc/Kconfig
> > @@ -108,7 +108,7 @@ config HVC_DCC_SERIALIZE_SMP
> >
> >  config HVC_RISCV_SBI
> >       bool "RISC-V SBI console support"
> > -     depends on RISCV_SBI_V01
> > +     depends on RISCV_SBI
> >       select HVC_DRIVER
> >       help
> >         This enables support for console output via RISC-V SBI calls, which
> > diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
> > index 31f53fa77e4a..56da1a4b5aca 100644
> > --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> > +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> > @@ -39,21 +39,89 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
> >       return i;
> >  }
> >
> > -static const struct hv_ops hvc_sbi_ops = {
> > +static const struct hv_ops hvc_sbi_v01_ops = {
> >       .get_chars = hvc_sbi_tty_get,
> >       .put_chars = hvc_sbi_tty_put,
> >  };
> >
> > -static int __init hvc_sbi_init(void)
> > +static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
> >  {
> > -     return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
> > +     phys_addr_t pa;
> > +     struct sbiret ret;
> > +
> > +     if (is_vmalloc_addr(buf)) {
> > +             pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
> > +             if (PAGE_SIZE < (offset_in_page(buf) + count))
> > +                     count = PAGE_SIZE - offset_in_page(buf);
>
> Thanks for fixing the cross-page issue. Now you're cutting the buffer
> off. What about doing two SBI calls instead? (Dito on the get side)

We don't need to handle that because the hvc_console framework
will ensure remaining characters are sent-out. Same applies to
get side as well.

Regards,
Anup


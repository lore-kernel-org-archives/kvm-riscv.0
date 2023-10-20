From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 20 Oct 2023 19:17:03 +0530
Subject: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI driver
In-Reply-To: <20231020-f1ec2b7e384a4cfeae39966f@orel>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com> <20231020-f1ec2b7e384a4cfeae39966f@orel>
Message-ID: <CAK9=C2Vg8O_6OaND_s1MhpBHpm1petoU7DNXOOaSOxXYUY1iAw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 20, 2023 at 4:16?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Oct 20, 2023 at 12:51:39PM +0530, Anup Patel wrote:
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
>
> I thought checkpatch complained about uppercase constants being on the
> left in comparisons.

Nope checkpatch does not complain about this.

>
> > +                     count = PAGE_SIZE - offset_in_page(buf);
> > +     } else {
> > +             pa = __pa(buf);
> > +     }
> > +
> > +     if (IS_ENABLED(CONFIG_32BIT))
> > +             ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> > +                             count, lower_32_bits(pa), upper_32_bits(pa),
> > +                             0, 0, 0);
> > +     else
> > +             ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> > +                             count, pa, 0, 0, 0, 0);
> > +     if (ret.error)
> > +             return 0;
> > +
> > +     return count;
>
> Shouldn't we return ret.value here in case it's less than count? I see we
> already do that below in get().

Ahh, yes. Good catch, I will update.

>
> >  }
> > -device_initcall(hvc_sbi_init);
> >
> > -static int __init hvc_sbi_console_init(void)
> > +static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
> >  {
> > -     hvc_instantiate(0, 0, &hvc_sbi_ops);
> > +     phys_addr_t pa;
> > +     struct sbiret ret;
> > +
> > +     if (is_vmalloc_addr(buf)) {
> > +             pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
> > +             if (PAGE_SIZE < (offset_in_page(buf) + count))
> > +                     count = PAGE_SIZE - offset_in_page(buf);
> > +     } else {
> > +             pa = __pa(buf);
> > +     }
> > +
> > +     if (IS_ENABLED(CONFIG_32BIT))
> > +             ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
> > +                             count, lower_32_bits(pa), upper_32_bits(pa),
> > +                             0, 0, 0);
> > +     else
> > +             ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
> > +                             count, pa, 0, 0, 0, 0);
> > +     if (ret.error)
> > +             return 0;
> > +
> > +     return ret.value;
> > +}
> > +
> > +static const struct hv_ops hvc_sbi_dbcn_ops = {
> > +     .put_chars = hvc_sbi_dbcn_tty_put,
> > +     .get_chars = hvc_sbi_dbcn_tty_get,
> > +};
> > +
> > +static int __init hvc_sbi_init(void)
> > +{
> > +     int err;
> > +
> > +     if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
> > +         (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
> > +             err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 16));
>
> Why an outbuf size of only 16?

The output buffer size of 16 is a very common choice across
HVC drivers. The next best choice is 256.

I guess 256 is better so I will go with that.

>
> > +             if (err)
> > +                     return err;
> > +             hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
> > +     } else {
> > +             if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
> > +                     err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 16));
> > +                     if (err)
> > +                             return err;
> > +                     hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
> > +             } else {
> > +                     return -ENODEV;
> > +             }
> > +     }
> >
> >       return 0;
> >  }
> > -console_initcall(hvc_sbi_console_init);
> > +device_initcall(hvc_sbi_init);
> > --
> > 2.34.1
> >
>
> Thanks,
> drew

Regards,
Anup


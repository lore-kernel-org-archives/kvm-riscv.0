From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 18:34:27 +0530
Subject: [PATCH v3 6/9] RISC-V: Add stubs for sbi_console_putchar/getchar()
In-Reply-To: <2023102113-harsh-trout-be8f@gregkh>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-7-apatel@ventanamicro.com> <2023102113-harsh-trout-be8f@gregkh>
Message-ID: <CAAhSdy1Beq-Qnio3E+Am0jVQ7ECaWa1HH2A1JkWRPN5y8tsgAQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 21, 2023 at 10:05?PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 20, 2023 at 12:51:37PM +0530, Anup Patel wrote:
> > The functions sbi_console_putchar() and sbi_console_getchar() are
> > not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
> > stub of these functions to avoid "#ifdef" on user side.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/sbi.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 12dfda6bb924..cbcefa344417 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> >                       unsigned long arg3, unsigned long arg4,
> >                       unsigned long arg5);
> >
> > +#ifdef CONFIG_RISCV_SBI_V01
> >  void sbi_console_putchar(int ch);
> >  int sbi_console_getchar(void);
> > +#else
> > +static inline void sbi_console_putchar(int ch) { }
> > +static inline int sbi_console_getchar(void) { return -1; }
>
> Why not return a real error, "-1" isn't that :)

As-per SBI spec, the legacy sbi_console_getchar() returns
-1 upon failure hence the code.

Refer, section 5.3 of the latest SBI spec
https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/commit-fe4562532a9cc57e5743b6466946c5e5c98c73ca/riscv-sbi.pdf

Although, the users of this function only expect a negative
value upon failure so better to return proper error code here.

I will update.

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


From: Anup Patel <anup@brainfault.org>
Date: Thu, 5 Oct 2023 11:20:48 +0530
Subject: [PATCH v3 2/6] RISC-V: Detect Zicond from ISA string
In-Reply-To: <mhng-4ec1093a-4542-429e-a9f0-8a976cff9ac4@palmer-ri-x1c9>
References: <20231003035226.1945725-3-apatel@ventanamicro.com> <mhng-4ec1093a-4542-429e-a9f0-8a976cff9ac4@palmer-ri-x1c9>
Message-ID: <CAAhSdy2CxWw9ny7vdBoEzsXkm_J882NGKTDQ7BfykrjuB1QR+w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 4, 2023 at 7:37?PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 02 Oct 2023 20:52:22 PDT (-0700), apatel at ventanamicro.com wrote:
> > The RISC-V integer conditional (Zicond) operation extension defines
> > standard conditional arithmetic and conditional-select/move operations
> > which are inspired from the XVentanaCondOps extension. In fact, QEMU
> > RISC-V also has support for emulating Zicond extension.
> >
> > Let us detect Zicond extension from ISA string available through
> > DT or ACPI.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 1 +
> >  arch/riscv/kernel/cpufeature.c | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 0f520f7d058a..6fc51c1b34cf 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -59,6 +59,7 @@
> >  #define RISCV_ISA_EXT_ZIFENCEI               41
> >  #define RISCV_ISA_EXT_ZIHPM          42
> >  #define RISCV_ISA_EXT_SMSTATEEN              43
> > +#define RISCV_ISA_EXT_ZICOND         44
> >
> >  #define RISCV_ISA_EXT_MAX            64
> >
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 3755a8c2a9de..e3803822ab5a 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -167,6 +167,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >       __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >       __RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> >       __RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> > +     __RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
> >       __RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> >       __RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
> >       __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Can we do a shared tag, though?  These will conflict.

Thanks Palmer.

I will provide a shared tag based on 6.6-rc5 sometime
next week. I hope this is okay for you.

Regards,
Anup

>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv


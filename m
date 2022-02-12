From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 12 Feb 2022 18:19:46 +0530
Subject: [PATCH v11 1/8] RISC-V: Enable CPU_IDLE drivers
In-Reply-To: <20220212114355.GF20866@duo.ucw.cz>
References: <20220210054947.170134-1-apatel@ventanamicro.com>
 <20220210054947.170134-2-apatel@ventanamicro.com>
 <20220212114355.GF20866@duo.ucw.cz>
Message-ID: <CAK9=C2VzzT=GDyuptuxQj0y++Rb0SaZXCuoL1+ncpGWcYHqr1g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Feb 12, 2022 at 5:13 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > We force select CPU_PM and provide asm/cpuidle.h so that we can
> > use CPU IDLE drivers for Linux RISC-V kernel.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Anup Patel <apatel@vetanamicro.com>
>
> This is quite... interesting. Normally we have one signoff per
> person...

I was working for Western Digital (WDC) when I first submitted this
series and recently I joined Ventana Micro Systems.

Regards,
Anup

>
> Best regards,
>                                                         Pavel
> --
> http://www.livejournal.com/~pavelmachek


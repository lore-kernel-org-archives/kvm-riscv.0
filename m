From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 14:30:10 +0200
Subject: Build regressions/improvements in v6.1-rc1
In-Reply-To: <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk>
References: <20221017145157.1866351-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg> <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk>
Message-ID: <CAMuHMdVbo0wMaVVhe4f4tC9-TW2+DsOVAB77TtLdnsG=us8Q2A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Maciej,

On Tue, Oct 18, 2022 at 12:39 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Mon, 17 Oct 2022, Geert Uytterhoeven wrote:
> > .> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/9abf2313adc1ca1b6180c508c25f22f9395cc780/ (all 149 configs)

> > >  + {standard input}: Error: branch to a symbol in another ISA mode: 1339 =>
> > > 2616, 2621
> >
> > mips-gcc11/micro32r2_defconfig
> > mips-gcc11/micro32r2el_defconfig
>
>  Where can these configs be obtained from?

By following the links in the URL above you removed while replying? ;-)

http://kisskb.ellerman.id.au/kisskb/buildresult/14818296/
http://kisskb.ellerman.id.au/kisskb/buildresult/14818298/

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


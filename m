From: Maciej W. Rozycki <macro@orcam.me.uk>
Date: Tue, 18 Oct 2022 14:28:17 +0100 (BST)
Subject: Build regressions/improvements in v6.1-rc1
In-Reply-To: <CAMuHMdVbo0wMaVVhe4f4tC9-TW2+DsOVAB77TtLdnsG=us8Q2A@mail.gmail.com>
References: <20221017145157.1866351-1-geert@linux-m68k.org> <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg> <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk> <CAMuHMdVbo0wMaVVhe4f4tC9-TW2+DsOVAB77TtLdnsG=us8Q2A@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2210181349060.50489@angie.orcam.me.uk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Geert,

> > > .> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/9abf2313adc1ca1b6180c508c25f22f9395cc780/ (all 149 configs)
> 
> > > >  + {standard input}: Error: branch to a symbol in another ISA mode: 1339 =>
> > > > 2616, 2621
> > >
> > > mips-gcc11/micro32r2_defconfig
> > > mips-gcc11/micro32r2el_defconfig
> >
> >  Where can these configs be obtained from?
> 
> By following the links in the URL above you removed while replying? ;-)
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/14818296/
> http://kisskb.ellerman.id.au/kisskb/buildresult/14818298/

 Thank you.

 The error message is due to the use of MT ASE code in a microMIPS 
compilation, specifically a handwritten machine instruction encoding via 
`.word' in `dmt' from <asm/mipsmtregs.h>.  A similar construct is made 
from `mftc0', but it isn't at a branch target, so no error is triggered.

 A `.insn' pseudo-op ought to precede such handwritten constructs to tell 
the assembler that what follows is really an instruction rather than data, 
which would then cause any preceding label to be correctly annotated.

 Now the MT ASE has been specified for the microMIPS ISA, but the machine 
instruction encodings are different, so merely adding `.insn' won't do any 
good.  Also we've never added support for the microMIPS MT ASE, and it's 
not clear to me if it's ever been used with real silicon.  Perhaps QEMU 
has it, but I suspect not.  Also no support has ever been added to 
binutils.

 So I think we want to just exclude the offending code from microMIPS 
configurations, perhaps by hardcoding `cpu_has_mipsmt' to 0 if 
CPU_MICROMIPS.

 On the other hand support for the MT ASE with the regular MIPS ISA has 
been added with binutils 2.17:

commit 61cc02671150a81ea68f25b8409b8ace18bda9ae
Author: Chao-ying Fu <fu@mips.com>
Date:   Tue Sep 6 18:46:57 2005 +0000

and according to Documentation/process/changes.rst we require version 2.23 
now.  So it looks to me like we want to discard the handwritten hacks and 
use proper assembly instruction mnemonics.  I do believe we did this for 
the DSP ASE already.

  Maciej


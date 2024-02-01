From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 1 Feb 2024 15:07:33 +0100
Subject: [kvm-unit-tests PATCH v2 02/24] riscv: Initial port, hello
 world
In-Reply-To: <b015765b-9833-4879-88fd-1c457b9c292f@redhat.com>
References: <20240126142324.66674-26-andrew.jones@linux.dev>
 <20240126142324.66674-28-andrew.jones@linux.dev>
 <b015765b-9833-4879-88fd-1c457b9c292f@redhat.com>
Message-ID: <20240201-404e7aa6ecc346953b825dc5@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 01, 2024 at 09:29:36AM +0100, Eric Auger wrote:
...
> > --- /dev/null
> > +++ b/riscv/cstart.S
> > @@ -0,0 +1,92 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Boot entry point and assembler functions for riscv.
> > + *
> > + * Copyright (C) 2023, Ventana Micro Systems Inc., Andrew Jones <ajones@ventanamicro.com>
> > + */
> > +#include <asm/csr.h>
> > +
> > +.macro zero_range, tmp1, tmp2
> For my education what were the tmp3/4 args used for on arm?
> > +9998:	beq	\tmp1, \tmp2, 9997f
> > +	sd	zero, 0(\tmp1)
> > +	addi	\tmp1, \tmp1, 8
> > +	j	9998b
> > +9997:
> > +.endm
> > +

arm doesn't have a zero register like arm64 and riscv32/64 have, so at
least one extra tmp register is needed to hold the zero stored to the
memory. We use two tmp registers because arm has a 'strd' instruction
allowing us to write two at once, as long as the first register is
an even-numbered register and the second is the immediately following
odd-numbered register. (We should probably write a comment about the
purpose and even/odd constraints of tmp3/4 above the zero_range macro
in arm/cstart.S)

Thanks,
drew


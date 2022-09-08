From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 8 Sep 2022 18:54:25 +0200
Subject: [PATCH v2 2/4] riscv: Introduce support for defining instructions
In-Reply-To: <3006889.o7ts2hSHzF@diego>
References: <20220831172500.752195-1-ajones@ventanamicro.com>
 <20220831172500.752195-3-ajones@ventanamicro.com>
 <3006889.o7ts2hSHzF@diego>
Message-ID: <20220908165425.ikiyrmhtbwkmko23@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 08, 2022 at 05:49:44PM +0200, Heiko St?bner wrote:
...
> > +#define OPCODE(v)	__ASM_STR(v)
> > +#define FUNC3(v)	__ASM_STR(v)
> > +#define FUNC7(v)	__ASM_STR(v)
> > +#define RD(v)		__ASM_STR(v)
> > +#define RS1(v)		__ASM_STR(v)
> > +#define RS2(v)		__ASM_STR(v)
> 
> you might want some sort of prefix here
> 	RISCV_RS1(v) ?
> 
> While trying to adapt this for the cmo stuff I ran into the issue
> of bpf complaining that "IMM" is already defined there.
> 
> And names above are generic enough that these also
> might conflict with other stuff.
> 

Ah, thanks for the heads up. Indeed, if this gets included in another
header, which gets widely included, then we have a good chance of
bumping into something. It's a pity, but, as you suggest, we probably
need prefixes and __ isn't likely enough alone. I also see __REG is
used elsewhere.

Thanks,
drew

> 
> 
> 
> > +#define __REG(v)	__ASM_STR(x ## v)
> > +#define __RD(v)		__REG(v)
> > +#define __RS1(v)	__REG(v)
> > +#define __RS2(v)	__REG(v)
> > +
> > +#endif /* __ASM_INSN_DEF_H */
> > 
> 
> 
> 
> 


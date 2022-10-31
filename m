From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 31 Oct 2022 09:18:27 +0100
Subject: [PATCH 3/9] RISC-V: insn-def: Define cbo.zero
In-Reply-To: <Y17n0xRqGPihGkRJ@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-4-ajones@ventanamicro.com>
 <Y17n0xRqGPihGkRJ@spud>
Message-ID: <20221031081827.ly5c2hdqjbxf3pwj@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 30, 2022 at 09:08:35PM +0000, Conor Dooley wrote:
...
> > +#define DEFINE_INSN_I							\
> > +	__DEFINE_ASM_GPR_NUMS						\
> > +"	.macro insn_i, opcode, func3, rd, rs1, simm12\n"		\
> > +"	.4byte	((\\opcode << " __stringify(INSN_I_OPCODE_SHIFT) ") |"	\
> > +"		 (\\func3 << " __stringify(INSN_I_FUNC3_SHIFT) ") |"	\
> > +"		 (.L__gpr_num_\\rd << " __stringify(INSN_I_RD_SHIFT) ") |"   \
> > +"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_I_RS1_SHIFT) ") |" \
> 
> It'd be nice if these macros had aligned \s. I know the file is pretty
> inconsistent in that regard and I'm not asking you to change those but I
> think it'd be nice to do so for stuff that's just being added now.

My approach has been to tab them out without crossing the 80 char "limit"
and then when the next tab would go past 80, I use minimum spaces instead.
I realize checkpatch has changed to 100, though, so maybe I should apply
the same approach but with 20 extra characters, which will hopefully mean
tab always works.

Thanks,
drew


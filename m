From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Aug 2022 08:42:20 +0530
Subject: [PATCH 3/4] riscv: KVM: Apply insn-def to hfence encodings
In-Reply-To: <20220829094739.pn7iltmtimpwpshf@kamzik>
References: <20220819140250.3892995-1-ajones@ventanamicro.com>
 <20220819140250.3892995-4-ajones@ventanamicro.com> <CAAhSdy0d8mjr5-5Um2DpLgnhPb3UnGggXvbu_=oqEHWYzMP1SQ@mail.gmail.com>
 <20220829094739.pn7iltmtimpwpshf@kamzik>
Message-ID: <CAAhSdy2OwNNq4PzFfHgVFYVGW3UQt3=geZGOGPojcA55c20rcA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 29, 2022 at 3:17 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Aug 29, 2022 at 02:07:59PM +0530, Anup Patel wrote:
> > On Fri, Aug 19, 2022 at 7:32 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > Introduce hfence instruction encodings and apply them to KVM's use.
> > > With the self-documenting nature of the instruction encoding macros,
> > > and a spec always within arm's reach, it's safe to remove the
> > > comments, so we do that too.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/insn-def.h |   8 ++
> > >  arch/riscv/kvm/tlb.c              | 117 ++++--------------------------
> > >  2 files changed, 21 insertions(+), 104 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > > index 4cd0208068dd..cd1c0d365f47 100644
> > > --- a/arch/riscv/include/asm/insn-def.h
> > > +++ b/arch/riscv/include/asm/insn-def.h
> > > @@ -79,4 +79,12 @@
> > >  #define RS1(v)         __REG(v)
> > >  #define RS2(v)         __REG(v)
> > >
> > > +#define OPCODE_SYSTEM  OPCODE(115)
> > > +
> > > +#define HFENCE_VVMA(vaddr, asid)       \
> > > +       INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(17), RD(0), vaddr, asid)
> > > +
> > > +#define HFENCE_GVMA(gaddr, vmid)       \
> > > +       INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49), RD(0), gaddr, vmid)
> > > +
> > >  #endif /* __ASM_INSN_DEF_H */
> > > diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> > > index 1a76d0b1907d..f742a0d888e1 100644
> > > --- a/arch/riscv/kvm/tlb.c
> > > +++ b/arch/riscv/kvm/tlb.c
> > > @@ -12,22 +12,7 @@
> > >  #include <linux/kvm_host.h>
> > >  #include <asm/cacheflush.h>
> > >  #include <asm/csr.h>
> > > -
> > > -/*
> > > - * Instruction encoding of hfence.gvma is:
> > > - * HFENCE.GVMA rs1, rs2
> > > - * HFENCE.GVMA zero, rs2
> > > - * HFENCE.GVMA rs1
> > > - * HFENCE.GVMA
> > > - *
> > > - * rs1!=zero and rs2!=zero ==> HFENCE.GVMA rs1, rs2
> > > - * rs1==zero and rs2!=zero ==> HFENCE.GVMA zero, rs2
> > > - * rs1!=zero and rs2==zero ==> HFENCE.GVMA rs1
> > > - * rs1==zero and rs2==zero ==> HFENCE.GVMA
> > > - *
> > > - * Instruction encoding of HFENCE.GVMA is:
> > > - * 0110001 rs2(5) rs1(5) 000 00000 1110011
> > > - */
> > > +#include <asm/insn-def.h>
> > >
> > >  void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
> > >                                           gpa_t gpa, gpa_t gpsz,
> > > @@ -41,31 +26,14 @@ void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
> > >         }
> > >
> > >         for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order)) {
> > > -               /*
> > > -                * rs1 = a0 (GPA >> 2)
> > > -                * rs2 = a1 (VMID)
> > > -                * HFENCE.GVMA a0, a1
> > > -                * 0110001 01011 01010 000 00000 1110011
> > > -                */
> > > -               asm volatile ("srli a0, %0, 2\n"
> > > -                             "add a1, %1, zero\n"
> > > -                             ".word 0x62b50073\n"
> > > -                             :: "r" (pos), "r" (vmid)
> > > -                             : "a0", "a1", "memory");
> > > +               asm volatile (HFENCE_GVMA("%0", "%1")
>
> Thank you for the review, Anup! I'd also like to get opinions on whether
> the caller should quote the register tokens or the call should be made as,
> e.g. HFENCE_GVMA(%0, %1), and then do the quoting inside the macro for
> C callers. I could go either way, but I'm starting to lean towards moving
> the quoting into the macros.

I am fine with the current approach but doing quoting inside macors will
certainly be more user friendly.

Regards,
Anup


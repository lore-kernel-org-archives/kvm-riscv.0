From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 9 Jun 2023 09:20:50 +0800
Subject: [PATCH v2 11/11] KVM: riscv: selftests: Add get-reg-list test
In-Reply-To: <20230608-344953a953eeb63ef6c26fb8@orel>
References: <cover.1684999824.git.haibo1.xu@intel.com> <da390e6200e838fce320a2a43b2f87951b4e0bbb.1684999824.git.haibo1.xu@intel.com>
 <20230525-2bab5376987792eab73507ac@orel> <CAJve8okR_iH4vF9DV9zTkDaeYe25kP7KUcKQphmjG5q-iVb-KA@mail.gmail.com>
 <20230608-344953a953eeb63ef6c26fb8@orel>
Message-ID: <CAJve8o=xhANzM7qPsyC-4rc8oB9TWTxBJKtiqNxe-w_+w_d-1g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 8, 2023 at 5:58?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Jun 08, 2023 at 05:45:21PM +0800, Haibo Xu wrote:
> > On Fri, May 26, 2023 at 1:18?AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> >
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CORE | KVM_REG_RISCV_CORE_REG(mode),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_REG(sstatus),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_REG(sie),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_REG(stvec),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_REG(sscratch),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_REG(sepc),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_REG(scause),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_REG(stval),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_REG(sip),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_REG(satp),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_REG(scounteren),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(frequency),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(time),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(compare),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(state),
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A,
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C,
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D,
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_F,
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_H,
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I,
> > > > +     KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M,
> > >
> > > I think all the above should have the size KVM_REG_SIZE_ULONG. Please also
> > > test with a 32-bit host.
> > >
> >
> > Hi Andrew,
> >
> > Just noticed the RISC-V 32-bit kvm selftests was not supported currently.
>
> Oh, right.
>
> > Even though I tried to remove the below check for 32-bit, there were
> > still many warning and error messages during compiling.
> > It seems 32-bit KVM selftests was not supported either for ARM/x86. Do
> > we have a plan to support it on risc-v?
>
> No plan and, if there was, it would be super low priority. So for stuff
> like using KVM_REG_SIZE_ULONG, we'll just have to try and get it right
> without testing. If somebody adds 32-bit support to these tests someday,
> then, hopefully, it'll just work (I'm allowed one overly optimistic
> comment per day).
>

Sure, Will try to get it right for a 32-bit system.

> Thanks,
> drew


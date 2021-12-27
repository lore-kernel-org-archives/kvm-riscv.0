From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 27 Dec 2021 10:43:48 +0800
Subject: [PATCH] KVM: RISC-V: Avoid spurious virtual interrupts after
 clearing hideleg CSR
In-Reply-To: <CAJF2gTTDiop+EPMjhrX8cbH+96N-wLJtyLC+yY_E3rtfA-o1Wg@mail.gmail.com>
References: <20211223031342.11993-1-vincent.chen@sifive.com>
 <CAJF2gTTDiop+EPMjhrX8cbH+96N-wLJtyLC+yY_E3rtfA-o1Wg@mail.gmail.com>
Message-ID: <CABvJ_xg9ckkv6OCYNJJEo3m2z0v7KS+fF4Y-2T6ybuae87x37Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 25, 2021 at 8:02 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Thu, Dec 23, 2021 at 11:13 AM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > When the last VM is terminated, the host kernel will invoke function
> > hardware_disable_nolock() on each CPU to disable the related virtualization
> > functions. Here, RISC-V currently only clears hideleg CSR and hedeleg CSR.
> > This behavior will cause the host kernel to receive spurious interrupts if
> > hvip CSR has pending interrupts and the corresponding enable bits in vsie
> > CSR are asserted. To avoid it, hvip CSR and vsie CSR shall be cleared
> > earlier than hideleg CSR.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  arch/riscv/kvm/main.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> > index 421ecf4e6360..31777d29e864 100644
> > --- a/arch/riscv/kvm/main.c
> > +++ b/arch/riscv/kvm/main.c
> > @@ -58,6 +58,14 @@ int kvm_arch_hardware_enable(void)
> >
> >  void kvm_arch_hardware_disable(void)
> >  {
> > +       /*
> > +        * After clearing the hideleg CSR, the host kernel will receive spurious
> > +        * interrupts if hvip CSR has pending interrupts and the corresponding
> > +        * enable bits in vsie CSR are asserted. To avoid it, hvip CSR and
> > +        * vsie CSR shall be cleared early than hideleg CSR.
> > +        */
> > +       csr_write(CSR_VSIE, 0);
> > +       csr_write(CSR_HVIP, 0);
> From hw design view, CSR_VSIE is enough, why apend CSR_HVIP clearing?

The CSR_HVIP is for the host OS to trigger virtual interrupts intended
for VS-mode. Because the host OS has terminated all guest OS at this
moment, I think the host OS also needs to clear CSR_HVIP as well.

>
> How can I reproduce it on qemu?

After booting a guest OS to the shell, if you are lucky enough, you
will see the console repeatedly prints "unexpected IRQ trap at vector
00" after using "halt -f" to terminate the guest OS.
(It is difficult to reproduce.  This is because this bug happens only
if $HVIP has pending interrupts whenever the guest OS is terminated)


>
> >         csr_write(CSR_HEDELEG, 0);
> >         csr_write(CSR_HIDELEG, 0);
> >  }
> > --
> > 2.17.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/


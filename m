From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 30 Jan 2023 16:18:27 +0800
Subject: [PATCH -next v13 18/19] riscv: kvm: redirect illegal instruction
 traps to guests
In-Reply-To: <CAK9=C2UWJ1qDfyfsKiznfFTVDHbjJm89m_6ymM=jpvYs7-qNcQ@mail.gmail.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-19-andy.chiu@sifive.com>
 <CAK9=C2UWJ1qDfyfsKiznfFTVDHbjJm89m_6ymM=jpvYs7-qNcQ@mail.gmail.com>
Message-ID: <CABgGipUPwnu1p14sc6GT+Agh-zx=cbwHanTsTRweR1ErtsX0kA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 7:28 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Wed, Jan 25, 2023 at 7:53 PM Andy Chiu <andy.chiu@sifive.com> wrote:
> >
> > Running below m-mode, an illegal instruction trap where m-mode could not
> > handle would be redirected back to s-mode. However, kvm running in hs-mode
> > terminates the vs-mode software when it receive such exception code.
> > Instead, it should redirect the trap back to vs-mode, and let vs-mode trap
> > handler decide the next step.
> >
> > Besides, hs-mode should run transparently to vs-mode. So terminating
> > guest OS breaks assumption for the kernel running in vs-mode.
> >
> > We use first-use trap to enable Vector for user space processes. This
> > means that the user process running in u- or vu- mode will take an
> > illegal instruction trap for the first time using V. Then the s- or vs-
> > mode kernel would allocate V for the process. Thus, we must redirect the
> > trap back to vs-mode in order to get the first-use trap working for guest
> > OSes here.
>
> In general, it is a good strategy to always redirect illegal instruction
> traps to VS-mode.
>
> >
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > ---
> >  arch/riscv/kvm/vcpu_exit.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> > index c9f741ab26f5..2a02cb750892 100644
> > --- a/arch/riscv/kvm/vcpu_exit.c
> > +++ b/arch/riscv/kvm/vcpu_exit.c
> > @@ -162,6 +162,16 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
> >         vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
> >  }
> >
> > +static int vcpu_trap_redirect_vs(struct kvm_vcpu *vcpu,
> > +                                struct kvm_cpu_trap *trap)
> > +{
> > +       /* set up trap handler and trap info when it gets back to vs */
> > +       kvm_riscv_vcpu_trap_redirect(vcpu, trap);
> > +       /* return to s-mode by setting vcpu's SPP */
> > +       vcpu->arch.guest_context.sstatus |= SR_SPP;
>
> Setting sstatus.SPP needs to be done in kvm_riscv_vcpu_trap_redirect()
> because for guest all traps are always taken by VS-mode.
NIce. Sorry that I didn't dig much into the kvm part so I thought it
was left to VU-mode on purpose.
>
> > +       return 1;
> > +}
> > +
> >  /*
> >   * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason) on
> >   * proper exit to userspace.
> > @@ -179,6 +189,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >         ret = -EFAULT;
> >         run->exit_reason = KVM_EXIT_UNKNOWN;
> >         switch (trap->scause) {
> > +       case EXC_INST_ILLEGAL:
> > +               if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
> > +                       ret = vcpu_trap_redirect_vs(vcpu, trap);
> > +               break;
> >         case EXC_VIRTUAL_INST_FAULT:
> >                 if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
> >                         ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
> > @@ -206,6 +220,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >                         vcpu->arch.guest_context.hstatus);
> >                 kvm_err("SCAUSE=0x%lx STVAL=0x%lx HTVAL=0x%lx HTINST=0x%lx\n",
> >                         trap->scause, trap->stval, trap->htval, trap->htinst);
> > +               asm volatile ("ebreak\n\t");
>
> This is not a related change.
>
Oops, that was a mistake.
> >         }
> >
> >         return ret;
> > --
> > 2.17.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Overall, this patch can be accepted independent of this series due
> to its usefulness.
>
> I send a v2 of this patch separately.
Thank you Anup. I will leave this patch there for the following
revision of the vector patches.

Cheers,
Andy


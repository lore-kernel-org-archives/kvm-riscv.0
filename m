From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 Mar 2023 10:24:19 +0530
Subject: [PATCH v6 8/8] RISC-V: KVM: Expose Zicboz to the guest
In-Reply-To: <mhng-f27eaa3e-34e3-4843-abdb-4b17cbe24ddb@palmer-ri-x1c9a>
References: <20230224162631.405473-9-ajones@ventanamicro.com> <mhng-f27eaa3e-34e3-4843-abdb-4b17cbe24ddb@palmer-ri-x1c9a>
Message-ID: <CAAhSdy1qOH25QdwkikwGU9xnhz_+UUGqAcXqU2Hd2d7RoaP9Vg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 15, 2023 at 10:08?AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 24 Feb 2023 08:26:31 PST (-0800), ajones at ventanamicro.com wrote:
> > Guests may use the cbo.zero instruction when the CPU has the Zicboz
> > extension and the hypervisor sets henvcfg.CBZE.
> >
> > Add Zicboz support for KVM guests which may be enabled and
> > disabled from KVM userspace using the ISA extension ONE_REG API.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Sorry, I guess I wasn't looking closely enough.  It's just a review, not
> an ack.
>
> Anup: is it OK if this goes along with the others?

Yes, no problem.

Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

>
> > ---
> >  arch/riscv/include/uapi/asm/kvm.h | 1 +
> >  arch/riscv/kvm/vcpu.c             | 4 ++++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index c1a1bb0fa91c..e44c1e90eaa7 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -106,6 +106,7 @@ enum KVM_RISCV_ISA_EXT_ID {
> >       KVM_RISCV_ISA_EXT_SVINVAL,
> >       KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
> >       KVM_RISCV_ISA_EXT_ZICBOM,
> > +     KVM_RISCV_ISA_EXT_ZICBOZ,
> >       KVM_RISCV_ISA_EXT_MAX,
> >  };
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index e5126cefbc87..198ee86cad38 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -63,6 +63,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
> >       KVM_ISA_EXT_ARR(SVPBMT),
> >       KVM_ISA_EXT_ARR(ZIHINTPAUSE),
> >       KVM_ISA_EXT_ARR(ZICBOM),
> > +     KVM_ISA_EXT_ARR(ZICBOZ),
> >  };
> >
> >  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> > @@ -865,6 +866,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
> >       if (riscv_isa_extension_available(isa, ZICBOM))
> >               henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
> >
> > +     if (riscv_isa_extension_available(isa, ZICBOZ))
> > +             henvcfg |= ENVCFG_CBZE;
> > +
> >       csr_write(CSR_HENVCFG, henvcfg);
> >  #ifdef CONFIG_32BIT
> >       csr_write(CSR_HENVCFGH, henvcfg >> 32);


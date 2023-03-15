From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 15 Mar 2023 12:05:00 +0800
Subject: [PATCH -next v14 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
In-Reply-To: <87r0u74dac.fsf@all.your.base.are.belong.to.us>
References: <20230224170118.16766-1-andy.chiu@sifive.com> <20230224170118.16766-9-andy.chiu@sifive.com>
 <87r0u74dac.fsf@all.your.base.are.belong.to.us>
Message-ID: <CABgGipXQcLvcSqHWoaZZEMW+7cwxEyOYPAEvr5cCtJMPFGva0w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 2, 2023 at 7:13?PM Bj?rn T?pel <bjorn@kernel.org> wrote:
>
> Andy Chiu <andy.chiu@sifive.com> writes:
>
> > diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> > index 692d3ee2d2d3..9c025f2efdc3 100644
> > --- a/arch/riscv/include/asm/vector.h
> > +++ b/arch/riscv/include/asm/vector.h
> > @@ -31,11 +54,72 @@ static __always_inline void riscv_v_disable(void)
> >       csr_clear(CSR_SSTATUS, SR_VS);
> >  }
> >
> > +static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)
> > +{
> > +     asm volatile (
> > +             "csrr   %0, " CSR_STR(CSR_VSTART) "\n\t"
> > +             "csrr   %1, " CSR_STR(CSR_VTYPE) "\n\t"
> > +             "csrr   %2, " CSR_STR(CSR_VL) "\n\t"
> > +             "csrr   %3, " CSR_STR(CSR_VCSR) "\n\t"
> > +             : "=r" (dest->vstart), "=r" (dest->vtype), "=r" (dest->vl),
> > +               "=r" (dest->vcsr) : :);
> > +}
> > +
> > +static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_state *src)
> > +{
> > +     asm volatile (
> > +             "vsetvl  x0, %2, %1\n\t"
> > +             "csrw   " CSR_STR(CSR_VSTART) ", %0\n\t"
> > +             "csrw   " CSR_STR(CSR_VCSR) ", %3\n\t"
> > +             : : "r" (src->vstart), "r" (src->vtype), "r" (src->vl),
> > +                 "r" (src->vcsr) :);
> > +}
> > +
> > +static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to, void *datap)
> > +{
> > +     riscv_v_enable();
> > +     __vstate_csr_save(save_to);
> > +     asm volatile (
> > +             "vsetvli        t4, x0, e8, m8, ta, ma\n\t"
> > +             "vse8.v         v0, (%0)\n\t"
> > +             "add            %0, %0, t4\n\t"
> > +             "vse8.v         v8, (%0)\n\t"
> > +             "add            %0, %0, t4\n\t"
> > +             "vse8.v         v16, (%0)\n\t"
> > +             "add            %0, %0, t4\n\t"
> > +             "vse8.v         v24, (%0)\n\t"
> > +             : : "r" (datap) : "t4", "memory");
> > +     riscv_v_disable();
> > +}
> > +
> > +static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
> > +                                 void *datap)
> > +{
> > +     riscv_v_enable();
> > +     asm volatile (
> > +             "vsetvli        t4, x0, e8, m8, ta, ma\n\t"
> > +             "vle8.v         v0, (%0)\n\t"
> > +             "add            %0, %0, t4\n\t"
> > +             "vle8.v         v8, (%0)\n\t"
> > +             "add            %0, %0, t4\n\t"
> > +             "vle8.v         v16, (%0)\n\t"
> > +             "add            %0, %0, t4\n\t"
> > +             "vle8.v         v24, (%0)\n\t"
> > +             : : "r" (datap) : "t4");
>
> Nit/question: For both enable/disable; Any reason to clobber t4, instead
> of using a scratch reg?
>

Yes, it is better to use a scratch register here in order to gain
benefit from inline asm.

> Bj?rn

Andy


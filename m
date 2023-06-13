From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 13 Jun 2023 22:19:08 +0800
Subject: [PATCH -next v21 09/27] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
In-Reply-To: <5271851.rBgCu3BfMA@basile.remlab.net>
References: <20230605110724.21391-1-andy.chiu@sifive.com> <20230605110724.21391-10-andy.chiu@sifive.com>
 <5271851.rBgCu3BfMA@basile.remlab.net>
Message-ID: <CABgGipX95PsavJ-Wrpc2ziJ5xj6nRTJ9QjddOyCp6Bn=fwP3mw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 12, 2023 at 10:36?PM R?mi Denis-Courmont <remi@remlab.net> wrote:
>
> Le maanantaina 5. kes?kuuta 2023, 14.07.06 EEST Andy Chiu a ?crit :
> > @@ -32,13 +54,86 @@ static __always_inline void riscv_v_disable(void)
> >       csr_clear(CSR_SSTATUS, SR_VS);
> >  }
> >
> > +static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state
> > *dest) +{
> > +     asm volatile (
> > +             "csrr   %0, " __stringify(CSR_VSTART) "\n\t"
> > +             "csrr   %1, " __stringify(CSR_VTYPE) "\n\t"
> > +             "csrr   %2, " __stringify(CSR_VL) "\n\t"
> > +             "csrr   %3, " __stringify(CSR_VCSR) "\n\t"
> > +             : "=r" (dest->vstart), "=r" (dest->vtype), "=r" (dest-
> >vl),
> > +               "=r" (dest->vcsr) : :);
> > +}
> > +
> > +static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_state
> > *src) +{
> > +     asm volatile (
> > +             ".option push\n\t"
> > +             ".option arch, +v\n\t"
> > +             "vsetvl  x0, %2, %1\n\t"
> > +             ".option pop\n\t"
> > +             "csrw   " __stringify(CSR_VSTART) ", %0\n\t"
> > +             "csrw   " __stringify(CSR_VCSR) ", %3\n\t"
> > +             : : "r" (src->vstart), "r" (src->vtype), "r" (src->vl),
> > +                 "r" (src->vcsr) :);
> > +}
> > +
> > +static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state
> > *save_to, +                                    void *datap)
> > +{
> > +     unsigned long vl;
> > +
> > +     riscv_v_enable();
> > +     __vstate_csr_save(save_to);
> > +     asm volatile (
> > +             ".option push\n\t"
> > +             ".option arch, +v\n\t"
> > +             "vsetvli        %0, x0, e8, m8, ta, ma\n\t"
> > +             "vse8.v         v0, (%1)\n\t"
> > +             "add            %1, %1, %0\n\t"
> > +             "vse8.v         v8, (%1)\n\t"
> > +             "add            %1, %1, %0\n\t"
> > +             "vse8.v         v16, (%1)\n\t"
> > +             "add            %1, %1, %0\n\t"
> > +             "vse8.v         v24, (%1)\n\t"
> > +             ".option pop\n\t"
> > +             : "=&r" (vl) : "r" (datap) : "memory");
> > +     riscv_v_disable();
> > +}
>
> Shouldn't this use `vs8r.v` rather than `vse8.v`, and do away with `vsetvli`?
> This seems like a textbook use case for the whole-register store instruction,
> no?

Yes, I think it is worth changing to whole-register load/store
instruction. Let me form a follow-up patch to improve it a bit.

>
> > +
> > +static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state
> > *restore_from, +                                          void
> *datap)
> > +{
> > +     unsigned long vl;
> > +
> > +     riscv_v_enable();
> > +     asm volatile (
> > +             ".option push\n\t"
> > +             ".option arch, +v\n\t"
> > +             "vsetvli        %0, x0, e8, m8, ta, ma\n\t"
> > +             "vle8.v         v0, (%1)\n\t"
> > +             "add            %1, %1, %0\n\t"
> > +             "vle8.v         v8, (%1)\n\t"
> > +             "add            %1, %1, %0\n\t"
> > +             "vle8.v         v16, (%1)\n\t"
> > +             "add            %1, %1, %0\n\t"
> > +             "vle8.v         v24, (%1)\n\t"
> > +             ".option pop\n\t"
> > +             : "=&r" (vl) : "r" (datap) : "memory");
> > +     __vstate_csr_restore(restore_from);
> > +     riscv_v_disable();
> > +}
> > +
>
> Ditto but `vl8r.v`.
>
> >  #else /* ! CONFIG_RISCV_ISA_V  */
> >
> >  struct pt_regs;
> >
> >  static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
> >  static __always_inline bool has_vector(void) { return false; }
> > +static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return
> > false; } #define riscv_v_vsize (0)
> > +#define riscv_v_vstate_off(regs)             do {} while (0)
> > +#define riscv_v_vstate_on(regs)                      do {} while (0)
> >
> >  #endif /* CONFIG_RISCV_ISA_V */
> >
>
>
> --
> ???? ????-??????
> http://www.remlab.net/
>
>
>

Thanks,
Andy


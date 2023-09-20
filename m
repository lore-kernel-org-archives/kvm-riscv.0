From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 20 Sep 2023 16:01:45 -0700
Subject: [PATCH 3/4] KVM: riscv: selftests: Fix ISA_EXT register handling
 in get-reg-list
In-Reply-To: <CAK9=C2UbjOGyxo8oP36Tinjhv1jRpCb+hVbZCOJ70G4-WiHw1g@mail.gmail.com>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-4-apatel@ventanamicro.com> <CAOnJCUJYDHtbYS4js7PSAeLqT4sL5zi7DT5xeSww+5Nvs2UhcA@mail.gmail.com>
 <CAK9=C2UbjOGyxo8oP36Tinjhv1jRpCb+hVbZCOJ70G4-WiHw1g@mail.gmail.com>
Message-ID: <CAOnJCULajHa6H6Rt75rNepYaT-3+Bo=1hQVb_oozPZK13N6yKQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 20, 2023 at 6:56?AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Wed, Sep 20, 2023 at 1:24?AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Mon, Sep 18, 2023 at 11:07?AM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > Same set of ISA_EXT registers are not present on all host because
> > > ISA_EXT registers are visible to the KVM user space based on the
> > > ISA extensions available on the host. Also, disabling an ISA
> > > extension using corresponding ISA_EXT register does not affect
> > > the visibility of the ISA_EXT register itself.
> > >
> > > Based on the above, we should filter-out all ISA_EXT registers.
> > >
> >
> > In that case, we don't need the switch case any more. Just a
> > conditional check with KVM_RISCV_ISA_EXT_MAX should be sufficient.
>
> If we compare against KVM_RISCV_ISA_EXT_MAX then we will forget
> adding test configs for newer ISA extensions.
>

I feel it just bloats the code as we may end up in hundreds of
extensions in the future
given the state of the extension scheme.

> >
> > > Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  .../selftests/kvm/riscv/get-reg-list.c        | 35 +++++++++++--------
> > >  1 file changed, 21 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > index d8ecacd03ecf..76c0ad11e423 100644
> > > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > @@ -14,17 +14,33 @@
> > >
> > >  bool filter_reg(__u64 reg)
> > >  {
> > > +       switch (reg & ~REG_MASK) {
> > >         /*
> > > -        * Some ISA extensions are optional and not present on all host,
> > > -        * but they can't be disabled through ISA_EXT registers when present.
> > > -        * So, to make life easy, just filtering out these kind of registers.
> > > +        * Same set of ISA_EXT registers are not present on all host because
> > > +        * ISA_EXT registers are visible to the KVM user space based on the
> > > +        * ISA extensions available on the host. Also, disabling an ISA
> > > +        * extension using corresponding ISA_EXT register does not affect
> > > +        * the visibility of the ISA_EXT register itself.
> > > +        *
> > > +        * Based on above, we should filter-out all ISA_EXT registers.
> > >          */
> > > -       switch (reg & ~REG_MASK) {
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_F:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_H:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVPBMT:
> > >         case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
> > >         case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
> > >         case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
> > >         case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
> > >         case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_V:
> > > +       case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVNAPOT:
> > >         case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
> > >         case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
> > >         case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
> > > @@ -50,12 +66,7 @@ static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> > >         unsigned long value;
> > >
> > >         ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> > > -       if (ret) {
> > > -               printf("Failed to get ext %d", ext);
> > > -               return false;
> > > -       }
> > > -
> > > -       return !!value;
> > > +       return (ret) ? false : !!value;
> > >  }
> > >
> > >  void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> > > @@ -506,10 +517,6 @@ static __u64 base_regs[] = {
> > >         KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(time),
> > >         KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(compare),
> > >         KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(state),
> > > -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A,
> > > -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C,
> > > -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I,
> > > -       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M,
> > >         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01,
> > >         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME,
> > >         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI,
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > Regards,
> > Atish
>
> Regards,
> Anup



-- 
Regards,
Atish


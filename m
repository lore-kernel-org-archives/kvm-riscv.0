From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Sep 2023 06:48:11 +0200
Subject: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA
 registers
In-Reply-To: <CAOnJCU+h-Y_i=HkCf194SLWp-7bqzMhRLC31q0xxQDMuLppapA@mail.gmail.com>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-5-apatel@ventanamicro.com>
 <CAOnJCU+h-Y_i=HkCf194SLWp-7bqzMhRLC31q0xxQDMuLppapA@mail.gmail.com>
Message-ID: <20230920-bc0e3956d144be651727e252@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 19, 2023 at 01:12:47PM -0700, Atish Patra wrote:
> On Mon, Sep 18, 2023 at 11:07?AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Currently the AIA ONE_REG registers are reported by get-reg-list
> > as new registers for various vcpu_reg_list configs whenever Ssaia
> > is available on the host because Ssaia extension can only be
> > disabled by Smstateen extension which is not always available.
> >
> > To tackle this, we should filter-out AIA ONE_REG registers only
> > when Ssaia can't be disabled for a VCPU.
> >
> > Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../selftests/kvm/riscv/get-reg-list.c        | 23 +++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > index 76c0ad11e423..85907c86b835 100644
> > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > @@ -12,6 +12,8 @@
> >
> >  #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK)
> >
> > +static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
> > +
> >  bool filter_reg(__u64 reg)
> >  {
> >         switch (reg & ~REG_MASK) {
> > @@ -48,6 +50,15 @@ bool filter_reg(__u64 reg)
> >         case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
> >         case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
> >                 return true;
> > +       /* AIA registers are always available when Ssaia can't be disabled */
> > +       case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
> > +       case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1):
> > +       case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2):
> > +       case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(sieh):
> > +       case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph):
> > +       case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
> > +       case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
> > +               return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA] ? true : false;
> 
> Ahh I guess. you do need the switch case for AIA CSRs but for ISA
> extensions can be avoided as it is contiguous.

I guess we could so something like

case KVM_REG_RISCV_ISA_EXT ... KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_MAX:

for the ISA extensions.

Thanks,
drew


From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 1 Feb 2023 00:58:54 -0800
Subject: [PATCH v3 11/14] RISC-V: KVM: Implement trap & emulate for hpmcounters
In-Reply-To: <CAOnJCU+=A1GXvaQis5RrDabPAvAZccmc9HF1KU4ReuRTSx5pCQ@mail.gmail.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-12-atishp@rivosinc.com>
 <CAAhSdy1+6AprOdzRRTG98p6swisNFO6MUKjXobxW3RWbixvjCg@mail.gmail.com> <CAOnJCU+=A1GXvaQis5RrDabPAvAZccmc9HF1KU4ReuRTSx5pCQ@mail.gmail.com>
Message-ID: <CAOnJCUL27aBGre7=mPX7BwMUkUN8CC_UFzmFh7W9LzCxktyGVg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 31, 2023 at 2:46 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sun, Jan 29, 2023 at 4:44 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
> > >
> > > As the KVM guests only see the virtual PMU counters, all hpmcounter
> > > access should trap and KVM emulates the read access on behalf of guests.
> > >
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >  arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 ++++++++++
> > >  arch/riscv/kvm/vcpu_insn.c            |  4 ++-
> > >  arch/riscv/kvm/vcpu_pmu.c             | 45 ++++++++++++++++++++++++++-
> > >  3 files changed, 63 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > index 3f43a43..022d45d 100644
> > > --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > @@ -43,6 +43,19 @@ struct kvm_pmu {
> > >  #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu)
> > >  #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
> > >
> > > +#if defined(CONFIG_32BIT)
> > > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > > +{ .base = CSR_CYCLEH,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm }, \
> > > +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> > > +#else
> > > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > > +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> > > +#endif
> > > +
> > > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > > +                               unsigned long *val, unsigned long new_val,
> > > +                               unsigned long wr_mask);
> > > +
> > >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata);
> > >  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
> > >                                 struct kvm_vcpu_sbi_ext_data *edata);
> > > @@ -65,6 +78,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
> > >  #else
> > >  struct kvm_pmu {
> > >  };
> > > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > > +{ .base = 0,      .count = 0, .func = NULL },
> > > +
> >
> > Redundant newline here.
> >
>
> Fixed.
>
> > >
> > >  static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> > >  {
> > > diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> > > index 0bb5276..f689337 100644
> > > --- a/arch/riscv/kvm/vcpu_insn.c
> > > +++ b/arch/riscv/kvm/vcpu_insn.c
> > > @@ -213,7 +213,9 @@ struct csr_func {
> > >                     unsigned long wr_mask);
> > >  };
> > >
> > > -static const struct csr_func csr_funcs[] = { };
> > > +static const struct csr_func csr_funcs[] = {
> > > +       KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
> > > +};
> > >
> > >  /**
> > >   * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
> > > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > > index 7713927..894053a 100644
> > > --- a/arch/riscv/kvm/vcpu_pmu.c
> > > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > > @@ -17,6 +17,44 @@
> > >
> > >  #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
> > >
> > > +static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > > +                       unsigned long *out_val)
> > > +{
> > > +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > > +       struct kvm_pmc *pmc;
> > > +       u64 enabled, running;
> > > +
> > > +       pmc = &kvpmu->pmc[cidx];
> > > +       if (!pmc->perf_event)
> > > +               return -EINVAL;
> > > +
> > > +       pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> > > +       *out_val = pmc->counter_val;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > > +                               unsigned long *val, unsigned long new_val,
> > > +                               unsigned long wr_mask)
> > > +{
> > > +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > > +       int cidx, ret = KVM_INSN_CONTINUE_NEXT_SEPC;
> > > +
> > > +       if (!kvpmu || !kvpmu->init_done)
> > > +               return KVM_INSN_EXIT_TO_USER_SPACE;
> >
> > As discussed previously, this should be KVM_INSN_ILLEGAL_TRAP.
> >

Thinking about it more, this results in a panic in guest S-mode which
is probably undesirable.
As per your earlier suggestion, we can return 0 for cycle/instret
counters if accessed.
This is only possible through legacy pmu drivers running in guests or
some other OS that access any hpmcounters
for random reasons.

I think we should return KVM_INSN_ILLEGAL_TRAP for other counters and
make the guest kernel panic.
This does separate the behavior between fixed and programmable
counters when everything is denied access in hcounteren.

The new code will look like this:

if (!kvpmu || !kvpmu->init_done) {
    if (csr_num == CSR_CYCLE || csr_num == CSR_INSTRET) {
        *val = 0;
        return ret;
    } else
         return KVM_INSN_ILLEGAL_TRAP;
}

Let me know if you think otherwise.

>
> Done.
> > > +
> > > +       if (wr_mask)
> > > +               return KVM_INSN_ILLEGAL_TRAP;
> > > +
> > > +       cidx = csr_num - CSR_CYCLE;
> > > +
> > > +       if (pmu_ctr_read(vcpu, cidx, val) < 0)
> > > +               return KVM_INSN_EXIT_TO_USER_SPACE;
> >
> > Same as above.
> >

We can get rid of this as pmu_ctr_read doesn't return errors anyways.

>
> Done.
>
> > > +
> > > +       return ret;
> > > +}
> > > +
> > >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata)
> > >  {
> > >         struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > > @@ -69,7 +107,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
> > >  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > >                                 struct kvm_vcpu_sbi_ext_data *edata)
> > >  {
> > > -       /* TODO */
> > > +       int ret;
> > > +
> > > +       ret = pmu_ctr_read(vcpu, cidx, &edata->out_val);
> > > +       if (ret == -EINVAL)
> > > +               edata->err_val = SBI_ERR_INVALID_PARAM;
> > > +
> > >         return 0;
> > >  }
> > >
> > > --
> > > 2.25.1
> > >
> >
> > Regards,
> > Anup
>
>
>
> --
> Regards,
> Atish



-- 
Regards,
Atish


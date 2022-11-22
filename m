From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Nov 2022 15:11:35 -0800
Subject: [RFC 7/9] RISC-V: KVM: Implement trap & emulate for hpmcounters
In-Reply-To: <20221101143548.plvlhedzt3oifa3u@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-8-atishp@rivosinc.com>
 <20221101143548.plvlhedzt3oifa3u@kamzik>
Message-ID: <CAOnJCU+ddtoJtdHYQXTH2_m57SEuFPj7ndpQJKM9v4JeYW=QnQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 1, 2022 at 7:35 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jul 18, 2022 at 10:02:03AM -0700, Atish Patra wrote:
> > As the KVM guests only see the virtual PMU counters, all hpmcounter
> > access should trap and KVM emulates the read access on behalf of guests.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 +++++++++
> >  arch/riscv/kvm/vcpu_insn.c            |  1 +
> >  arch/riscv/kvm/vcpu_pmu.c             | 47 +++++++++++++++++++++++----
> >  3 files changed, 57 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > index bffee052f2ae..5410236b62a8 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > @@ -39,6 +39,19 @@ struct kvm_pmu {
> >  #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
> >  #define pmc_to_pmu(pmc)   (&(pmc)->vcpu->arch.pmu)
> >
> > +#if defined(CONFIG_32BIT)
> > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > +{ .base = CSR_CYCLEH,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm }, \
> > +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> > +#else
> > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> > +#endif
> > +
> > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > +                             unsigned long *val, unsigned long new_val,
> > +                             unsigned long wr_mask);
> > +
> >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, unsigned long *out_val);
> >  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
> >                               unsigned long *ctr_info);
> > @@ -59,6 +72,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
> >  #else
> >  struct kvm_pmu {
> >  };
> > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > +{ .base = 0,      .count = 0, .func = NULL },
> > +
> >
> >  static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> >  {
> > diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> > index 0aa334f853c8..7c2a4b1a69f7 100644
> > --- a/arch/riscv/kvm/vcpu_insn.c
> > +++ b/arch/riscv/kvm/vcpu_insn.c
> > @@ -215,6 +215,7 @@ struct csr_func {
> >  };
> >
> >  static const struct csr_func csr_funcs[] = {
> > +     KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
> >  };
> >
> >  /**
> > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > index 3168ed740bdd..5434051f495d 100644
> > --- a/arch/riscv/kvm/vcpu_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > @@ -14,6 +14,46 @@
> >  #include <asm/kvm_vcpu_pmu.h>
> >  #include <linux/kvm_host.h>
> >
> > +int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > +                             unsigned long *out_val)
> > +{
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +     struct kvm_pmc *pmc;
> > +     u64 enabled, running;
> > +
> > +     if (!kvpmu)
> > +             return -EINVAL;
> > +
> > +     pmc = &kvpmu->pmc[cidx];
> > +     if (!pmc->perf_event)
> > +             return -EINVAL;
> > +
> > +     pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> > +     *out_val = pmc->counter_val;
> > +
> > +     return 0;
> > +}
> > +
> > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > +                             unsigned long *val, unsigned long new_val,
> > +                             unsigned long wr_mask)
> > +{
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +     int cidx, ret = KVM_INSN_CONTINUE_NEXT_SEPC;
> > +
> > +     if (!kvpmu)
> > +             return KVM_INSN_EXIT_TO_USER_SPACE;
> > +     //TODO: Should we check if vcpu pmu is initialized or not!
>
> I guess it depends on the path to this call. It'd be best to keep the
> checks to the minimum, so if this isn't a top level call then I'd say
> no, but we need to check in the top level.
>

Based on the discussion on PATCH 6 we won't require the initialization check
at these functions.

We can leave the paranoia sanity check at kvm_riscv_vcpu_pmu_num_ctrs and
kvm_riscv_vcpu_pmu_ctr_info though.

> > +     if (wr_mask)
> > +             return KVM_INSN_ILLEGAL_TRAP;
> > +     cidx = csr_num - CSR_CYCLE;
> > +
> > +     if (kvm_riscv_vcpu_pmu_ctr_read(vcpu, cidx, val) < 0)
> > +             return KVM_INSN_EXIT_TO_USER_SPACE;
> > +
> > +     return ret;
> > +}
> > +
> >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, unsigned long *out_val)
> >  {
> >       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > @@ -60,13 +100,6 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
> >       return 0;
> >  }
> >
> > -int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > -                             unsigned long *out_val)
> > -{
> > -     /* TODO */
> > -     return 0;
> > -}
> > -
> >  int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> >  {
> >       int i = 0, num_hw_ctrs, num_fw_ctrs, hpm_width;
> > --
> > 2.25.1
> >
>
> Thanks,
> drew



-- 
Regards,
Atish


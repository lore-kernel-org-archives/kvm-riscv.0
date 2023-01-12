From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 12 Jan 2023 10:09:59 -0800
Subject: [PATCH v2 06/11] RISC-V: KVM: Add skeleton support for perf
In-Reply-To: <20230112151038.vhpn5mzw6nqjwk7o@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com> <20221215170046.2010255-7-atishp@rivosinc.com>
 <20230112151038.vhpn5mzw6nqjwk7o@orel>
Message-ID: <CAHBxVyE+o2F5X4DGMaZ0BKrTZhisS7HWZefNLGMS5UKtE+XnCA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 7:10 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Dec 15, 2022 at 09:00:41AM -0800, Atish Patra wrote:
> > This patch only adds barebore structure of perf implementation. Most of
> > the function returns zero at this point and will be implemented
> > fully in the future.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h     |   3 +
> >  arch/riscv/include/asm/kvm_vcpu_pmu.h |  76 ++++++++++++++
> >  arch/riscv/kvm/Makefile               |   1 +
> >  arch/riscv/kvm/vcpu.c                 |   5 +
> >  arch/riscv/kvm/vcpu_insn.c            |   2 +-
> >  arch/riscv/kvm/vcpu_pmu.c             | 142 ++++++++++++++++++++++++++
> >  6 files changed, 228 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
> >  create mode 100644 arch/riscv/kvm/vcpu_pmu.c
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 93f43a3..f9874b4 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -18,6 +18,7 @@
> >  #include <asm/kvm_vcpu_insn.h>
> >  #include <asm/kvm_vcpu_sbi.h>
> >  #include <asm/kvm_vcpu_timer.h>
> > +#include <asm/kvm_vcpu_pmu.h>
> >
> >  #define KVM_MAX_VCPUS                        1024
> >
> > @@ -228,6 +229,8 @@ struct kvm_vcpu_arch {
> >
> >       /* Don't run the VCPU (blocked) */
> >       bool pause;
> > +
> > +     struct kvm_pmu pmu;
> >  };
> >
> >  static inline void kvm_arch_hardware_unsetup(void) {}
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > new file mode 100644
> > index 0000000..6a8c0f7
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > @@ -0,0 +1,76 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022 Rivos Inc
> > + *
> > + * Authors:
> > + *     Atish Patra <atishp@rivosinc.com>
> > + */
> > +
> > +#ifndef __KVM_VCPU_RISCV_PMU_H
> > +#define __KVM_VCPU_RISCV_PMU_H
> > +
> > +#include <linux/perf/riscv_pmu.h>
> > +#include <asm/kvm_vcpu_sbi.h>
> > +#include <asm/sbi.h>
> > +
> > +#ifdef CONFIG_RISCV_PMU_SBI
> > +#define RISCV_KVM_MAX_FW_CTRS 32
> > +#define RISCV_MAX_COUNTERS      64
> > +
> > +/* Per virtual pmu counter data */
> > +struct kvm_pmc {
> > +     u8 idx;
> > +     struct perf_event *perf_event;
> > +     uint64_t counter_val;
> > +     union sbi_pmu_ctr_info cinfo;
> > +     /* Event monitoring status */
> > +     bool started;
> > +};
> > +
> > +/* PMU data structure per vcpu */
> > +struct kvm_pmu {
> > +     struct kvm_pmc pmc[RISCV_MAX_COUNTERS];
> > +     /* Number of the virtual firmware counters available */
> > +     int num_fw_ctrs;
> > +     /* Number of the virtual hardware counters available */
> > +     int num_hw_ctrs;
> > +     /* A flag to indicate that pmu initialization is done */
> > +     bool init_done;
> > +     /* Bit map of all the virtual counter used */
> > +     DECLARE_BITMAP(pmc_in_use, RISCV_MAX_COUNTERS);
> > +};
> > +
> > +#define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu)
> > +#define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
> > +
> > +int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata);
> > +int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
> > +                             struct kvm_vcpu_sbi_ext_data *edata);
> > +int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> > +                              unsigned long ctr_mask, unsigned long flag, uint64_t ival,
> > +                              struct kvm_vcpu_sbi_ext_data *edata);
> > +int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> > +                             unsigned long ctr_mask, unsigned long flag,
> > +                             struct kvm_vcpu_sbi_ext_data *edata);
> > +int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> > +                                  unsigned long ctr_mask, unsigned long flag,
> > +                                  unsigned long eidx, uint64_t edata,
> > +                                  struct kvm_vcpu_sbi_ext_data *extdata);
>
> How about replacing 'edata' with 'evtdata' and then using 'edata' for the
> struct kvm_vcpu_sbi_ext_data pointer in order to keep the struct pointer
> name consistent with the other functions?
>

Sure.

> > +int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > +                             struct kvm_vcpu_sbi_ext_data *edata);
> > +int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
> > +void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
> > +void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
> > +
> > +#else
> > +struct kvm_pmu {
> > +};
> > +
> > +static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> > +{
> > +     return 0;
> > +}
> > +static inline void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu) {}
> > +static inline void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu) {}
> > +#endif
> > +#endif
>
> nit: it'd be nice to have
>
>  #endif /* CONFIG_RISCV_PMU_SBI */
>  #endif /* !__KVM_VCPU_RISCV_PMU_H */
>
> > diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> > index 019df920..5de1053 100644
> > --- a/arch/riscv/kvm/Makefile
> > +++ b/arch/riscv/kvm/Makefile
> > @@ -25,3 +25,4 @@ kvm-y += vcpu_sbi_base.o
> >  kvm-y += vcpu_sbi_replace.o
> >  kvm-y += vcpu_sbi_hsm.o
> >  kvm-y += vcpu_timer.o
> > +kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 7c08567..b746f21 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -137,6 +137,7 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
> >
> >       WRITE_ONCE(vcpu->arch.irqs_pending, 0);
> >       WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
> > +     kvm_riscv_vcpu_pmu_reset(vcpu);
> >
> >       vcpu->arch.hfence_head = 0;
> >       vcpu->arch.hfence_tail = 0;
> > @@ -194,6 +195,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> >       /* Setup VCPU timer */
> >       kvm_riscv_vcpu_timer_init(vcpu);
> >
> > +     /* setup performance monitoring */
> > +     kvm_riscv_vcpu_pmu_init(vcpu);
> > +
> >       /* Reset VCPU */
> >       kvm_riscv_reset_vcpu(vcpu);
> >
> > @@ -216,6 +220,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
> >       /* Cleanup VCPU timer */
> >       kvm_riscv_vcpu_timer_deinit(vcpu);
> >
> > +     kvm_riscv_vcpu_pmu_deinit(vcpu);
> >       /* Free unused pages pre-allocated for G-stage page table mappings */
> >       kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
> >  }
> > diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> > index 0bb5276..1ff2649 100644
> > --- a/arch/riscv/kvm/vcpu_insn.c
> > +++ b/arch/riscv/kvm/vcpu_insn.c
> > @@ -213,7 +213,7 @@ struct csr_func {
> >                   unsigned long wr_mask);
> >  };
> >
> > -static const struct csr_func csr_funcs[] = { };
> > +static const struct csr_func csr_funcs[] = {};
>
> Stray change
>
> >
> >  /**
> >   * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
> > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > new file mode 100644
> > index 0000000..0f0748f1
> > --- /dev/null
> > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > @@ -0,0 +1,142 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2022 Rivos Inc
> > + *
> > + * Authors:
> > + *     Atish Patra <atishp@rivosinc.com>
> > + */
> > +
> > +#include <linux/errno.h>
> > +#include <linux/err.h>
> > +#include <linux/kvm_host.h>
> > +#include <linux/perf/riscv_pmu.h>
> > +#include <asm/csr.h>
> > +#include <asm/kvm_vcpu_sbi.h>
> > +#include <asm/kvm_vcpu_pmu.h>
> > +#include <linux/kvm_host.h>
> > +
> > +#define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
> > +
> > +int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata)
> > +{
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +
> > +     edata->out_val = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
>
>  edata->out_val = kvm_pmu_num_counters(kvpmu);
>

ok.

> > +
> > +     return 0;
> > +}
> > +
> > +int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
> > +                             struct kvm_vcpu_sbi_ext_data *edata)
> > +{
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +
> > +     if ((cidx > RISCV_MAX_COUNTERS) || (cidx == 1)) {
>
> nit: No need for () around the expressions
>
> > +             edata->err_val = SBI_ERR_INVALID_PARAM;
> > +             return 0;
> > +     }
> > +
> > +     edata->out_val = kvpmu->pmc[cidx].cinfo.value;
> > +
> > +     return 0;
> > +}
> > +
> > +int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> > +                              unsigned long ctr_mask, unsigned long flag, uint64_t ival,
> > +                              struct kvm_vcpu_sbi_ext_data *edata)
> > +{
> > +     /* TODO */
> > +     return 0;
> > +}
> > +
> > +int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> > +                             unsigned long ctr_mask, unsigned long flag,
> > +                             struct kvm_vcpu_sbi_ext_data *edata)
> > +{
> > +     /* TODO */
> > +     return 0;
> > +}
> > +
> > +int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> > +                                  unsigned long ctr_mask, unsigned long flag,
> > +                                  unsigned long eidx, uint64_t edata,
> > +                                  struct kvm_vcpu_sbi_ext_data *extdata)
> > +{
> > +     /* TODO */
> > +     return 0;
> > +}
> > +
> > +int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > +                             struct kvm_vcpu_sbi_ext_data *edata)
> > +{
> > +     /* TODO */
> > +     return 0;
> > +}
> > +
> > +int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> > +{
> > +     int i = 0, num_fw_ctrs, ret, num_hw_ctrs = 0, hpm_width = 0;
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +
> > +     ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (!hpm_width || !num_hw_ctrs) {
> > +             pr_err("Can not initialize PMU for vcpu with NULL hpmcounter width/count\n");
>                         ^ Cannot                   ^ VCPU                         ^ or number counters
>
> > +             return -EINVAL;
> > +     }
> > +
> > +     if ((num_hw_ctrs + RISCV_KVM_MAX_FW_CTRS) > RISCV_MAX_COUNTERS)
>
> Shouldn't we warn about this condition? Presumably it means Linux selected
> RISCV_MAX_COUNTERS too small, so a warning would let us know we need to
> bump it up.
>

ok. I will leave a warning message. We are unlikely to hit that
scenario as RISCV_MAX_COUNTERS(64) unless
we add bunch of firmware counters for kvm. At that point both
RISCV_MAX_COUNTERS &
RISCV_FW_MAX_COUNTERS need to be increased.

> > +             num_fw_ctrs = RISCV_MAX_COUNTERS - num_hw_ctrs;
> > +     else
> > +             num_fw_ctrs = RISCV_KVM_MAX_FW_CTRS;
> > +
> > +     kvpmu->num_hw_ctrs = num_hw_ctrs;
> > +     kvpmu->num_fw_ctrs = num_fw_ctrs;
>
> nit: add blank line here
>
> > +     /*
> > +      * There is no corelation betwen the logical hardware counter and virtual counters.
>
> correlation
>
> > +      * However, we need to encode a hpmcounter CSR in the counter info field so that
> > +      * KVM can trap n emulate the read. This works well in the migraiton usecase as
>
> migration
>

Thanks for the review. I will address all other comments as well.

> > +      * KVM doesn't care if the actual hpmcounter is available in the hardware or not.
> > +      */
> > +     for (i = 0; i < kvm_pmu_num_counters(kvpmu); i++) {
> > +             /* TIME CSR shouldn't be read from perf interface */
> > +             if (i == 1)
> > +                     continue;
> > +             kvpmu->pmc[i].idx = i;
> > +             if (i < kvpmu->num_hw_ctrs) {
> > +                     kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_HW;
> > +                     if (i < 3)
> > +                             /* CY, IR counters */
> > +                             kvpmu->pmc[i].cinfo.width = 63;
> > +                     else
> > +                             kvpmu->pmc[i].cinfo.width = hpm_width;
> > +                     /*
> > +                      * The CSR number doesn't have any relation with the logical
> > +                      * hardware counters. The CSR numbers are encoded sequentially
> > +                      * to avoid maintaining a map between the virtual counter
> > +                      * and CSR number.
> > +                      */
> > +                     kvpmu->pmc[i].cinfo.csr = CSR_CYCLE + i;
> > +             } else {
> > +                     kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_FW;
> > +                     kvpmu->pmc[i].cinfo.width = BITS_PER_LONG - 1;
> > +             }
> > +     }
> > +
> > +     kvpmu->init_done = true;
> > +
> > +     return 0;
> > +}
> > +
> > +void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
> > +{
> > +     /* TODO */
> > +}
> > +
> > +void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
> > +{
> > +     /* TODO */
> > +}
> > +
> > --
> > 2.25.1
> >
>
> Thanks,
> drew


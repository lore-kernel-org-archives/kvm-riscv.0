From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 1 Apr 2024 17:03:10 -0700
Subject: [PATCH v4 10/15] RISC-V: KVM: Support 64 bit firmware counters on RV32
In-Reply-To: <20240302-7679c8f67984ccae734926ba@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com> <20240229010130.1380926-11-atishp@rivosinc.com>
 <20240302-7679c8f67984ccae734926ba@orel>
Message-ID: <CAOnJCUKrjiT7DNdhVCVGsX4vHVUHX53P9vVMLcvQ1EKcEogB5w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 2, 2024 at 2:52?AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Feb 28, 2024 at 05:01:25PM -0800, Atish Patra wrote:
> > The SBI v2.0 introduced a fw_read_hi function to read 64 bit firmware
> > counters for RV32 based systems.
> >
> > Add infrastructure to support that.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_pmu.h |  4 ++-
> >  arch/riscv/kvm/vcpu_pmu.c             | 37 ++++++++++++++++++++++++++-
> >  arch/riscv/kvm/vcpu_sbi_pmu.c         |  6 +++++
> >  3 files changed, 45 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > index 8cb21a4f862c..e0ad27dea46c 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > @@ -20,7 +20,7 @@ static_assert(RISCV_KVM_MAX_COUNTERS <= 64);
> >
> >  struct kvm_fw_event {
> >       /* Current value of the event */
> > -     unsigned long value;
> > +     u64 value;
> >
> >       /* Event monitoring status */
> >       bool started;
> > @@ -91,6 +91,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
> >                                    struct kvm_vcpu_sbi_return *retdata);
> >  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> >                               struct kvm_vcpu_sbi_return *retdata);
> > +int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> > +                                   struct kvm_vcpu_sbi_return *retdata);
> >  void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
> >  int kvm_riscv_vcpu_pmu_setup_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
> >                                     unsigned long saddr_high, unsigned long flags,
> > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > index a02f7b981005..469bb430cf97 100644
> > --- a/arch/riscv/kvm/vcpu_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > @@ -196,6 +196,29 @@ static int pmu_get_pmc_index(struct kvm_pmu *pmu, unsigned long eidx,
> >       return kvm_pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
> >  }
> >
> > +static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> > +                           unsigned long *out_val)
> > +{
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +     struct kvm_pmc *pmc;
> > +     int fevent_code;
> > +
> > +     if (!IS_ENABLED(CONFIG_32BIT))
>
> Let's remove the CONFIG_32BIT check in kvm_sbi_ext_pmu_handler() and then
> set *out_val to zero here and return success. Either that, or we should
> WARN or something here since it's a KVM bug to get here with
> !CONFIG_32BIT.
>

I added a warning here to prevent any sort of kvm bug. Returning
silently with out_val to zero from here may hide that.

The CONFIG_32BIT check in kvm_sbi_ext_pmu_handler also avoids
unnecessary code execution
(even though they are few) in case the lower privilege mode software
invokes the read_hi by mistake
for non RV32.


> > +             return -EINVAL;
> > +
> > +     pmc = &kvpmu->pmc[cidx];
>
> Uh oh! We're missing range validation of cidx! And I see we're missing it
> in pmu_ctr_read() too. We need the same check we have in
> kvm_riscv_vcpu_pmu_ctr_info(). I think the other SBI functions are OK,
> but it's worth a triple check.
>

Good catch. Thanks. Fixed it.

> > +
> > +     if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
> > +             return -EINVAL;
> > +
> > +     fevent_code = get_event_code(pmc->event_idx);
> > +     pmc->counter_val = kvpmu->fw_event[fevent_code].value;
> > +
> > +     *out_val = pmc->counter_val >> 32;
> > +
> > +     return 0;
> > +}
> > +
> >  static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> >                       unsigned long *out_val)
> >  {
> > @@ -702,6 +725,18 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
> >       return 0;
> >  }
> >
> > +int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> > +                                   struct kvm_vcpu_sbi_return *retdata)
> > +{
> > +     int ret;
> > +
> > +     ret = pmu_fw_ctr_read_hi(vcpu, cidx, &retdata->out_val);
> > +     if (ret == -EINVAL)
> > +             retdata->err_val = SBI_ERR_INVALID_PARAM;
> > +
> > +     return 0;
>
> I see this follows the pattern we have with kvm_riscv_vcpu_pmu_ctr_read
> and pmu_ctr_read, but I wonder if we really need the
> kvm_riscv_vcpu_pmu_ctr_read() and kvm_riscv_vcpu_pmu_fw_ctr_read_hi()
> wrapper functions?
>

pmu_ctr_read is invoked from kvm_riscv_vcpu_pmu_read_hpm as well.
That's why I have a wrapper to read the counters in the SBI path.
kvm_riscv_vcpu_pmu_ctr_read

kvm_riscv_vcpu_pmu_fw_ctr_read_hi just followed the pattern.

If we refactor the firmware counter read and hpmcounter read to be
separate functions,
we won't need the wrapper though. But I am not sure if it will
actually improve the code readability.

If you think it's better that way, I will modify it.

Looking at this code, we should definitely change the
kvm_riscv_vcpu_pmu_ctr_read
to kvm_riscv_vcpu_pmu_fw_ctr_read to reflect the real purpose.

> > +}
> > +
> >  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> >                               struct kvm_vcpu_sbi_return *retdata)
> >  {
> > @@ -775,7 +810,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> >                       pmc->cinfo.csr = CSR_CYCLE + i;
> >               } else {
> >                       pmc->cinfo.type = SBI_PMU_CTR_TYPE_FW;
> > -                     pmc->cinfo.width = BITS_PER_LONG - 1;
> > +                     pmc->cinfo.width = 63;
> >               }
> >       }
> >
> > diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > index 9f61136e4bb1..58a0e5587e2a 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > @@ -64,6 +64,12 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >       case SBI_EXT_PMU_COUNTER_FW_READ:
> >               ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
> >               break;
> > +     case SBI_EXT_PMU_COUNTER_FW_READ_HI:
> > +             if (IS_ENABLED(CONFIG_32BIT))
> > +                     ret = kvm_riscv_vcpu_pmu_fw_ctr_read_hi(vcpu, cp->a0, retdata);
> > +             else
> > +                     retdata->out_val = 0;
> > +             break;
> >       case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
> >               ret = kvm_riscv_vcpu_pmu_setup_snapshot(vcpu, cp->a0, cp->a1, cp->a2, retdata);
> >               break;
> > --
> > 2.34.1
> >
>
> Thanks,
> drew



-- 
Regards,
Atish


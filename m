From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 4 Apr 2024 14:16:01 +0200
Subject: [PATCH v4 07/15] RISC-V: KVM: No need to exit to the user space
 if perf event failed
In-Reply-To: <CAOnJCUJCQjBfLZFW-3iLUB6ygyRmz1Anu+fhfrT4Lpoj2iNB5Q@mail.gmail.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-8-atishp@rivosinc.com>
 <20240302-1a3c0df25f2422e1e6abecf3@orel>
 <CAOnJCUJCQjBfLZFW-3iLUB6ygyRmz1Anu+fhfrT4Lpoj2iNB5Q@mail.gmail.com>
Message-ID: <20240404-ea40bc0237635d671e64fef6@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 01, 2024 at 03:37:01PM -0700, Atish Patra wrote:
> On Sat, Mar 2, 2024 at 12:16?AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Wed, Feb 28, 2024 at 05:01:22PM -0800, Atish Patra wrote:
> > > Currently, we return a linux error code if creating a perf event failed
> > > in kvm. That shouldn't be necessary as guest can continue to operate
> > > without perf profiling or profiling with firmware counters.
> > >
> > > Return appropriate SBI error code to indicate that PMU configuration
> > > failed. An error message in kvm already describes the reason for failure.
> >
> > I don't know enough about the perf subsystem to know if there may be
> > a concern that resources are temporarily unavailable. If so, then this
> 
> Do you mean the hardware resources unavailable because the host is using it ?

Yes (I think). The issue I'm thinking of is if kvm_pmu_create_perf_event
(perf_event_create_kernel_counter) returns something like EBUSY and then
we translate that to SBI_ERR_NOT_SUPPORTED. I'm not sure guests would
interpret not-supported as an error which means they can retry. Or if
they retry and get something other than not-supported if they'd be
confused.

Thanks,
drew
  

> 
> > patch would make it possible for a guest to do the exact same thing,
> > but sometimes succeed and sometimes get SBI_ERR_NOT_SUPPORTED.
> > sbi_pmu_counter_config_matching doesn't currently have any error types
> > specified that say "unsupported at the moment, maybe try again", which
> > would be more appropriate in that case. I do see
> > perf_event_create_kernel_counter() can return ENOMEM when memory isn't
> > available, but if the kernel isn't able to allocate a small amount of
> > memory, then we're in bigger trouble anyway, so the concern would be
> > if there are perf resource pools which may temporarily be exhausted at
> > the time the guest makes this request.
> >
> 
> For other cases, this patch ensures that guests continue to run without failure
> which allows the user in the guest to try again if this fails due to a temporary
> resource availability.
> 
> > One comment below.
> >
> > >
> > > Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >  arch/riscv/kvm/vcpu_pmu.c     | 14 +++++++++-----
> > >  arch/riscv/kvm/vcpu_sbi_pmu.c |  6 +++---
> > >  2 files changed, 12 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > > index b1574c043f77..29bf4ca798cb 100644
> > > --- a/arch/riscv/kvm/vcpu_pmu.c
> > > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > > @@ -229,8 +229,9 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
> > >       return 0;
> > >  }
> > >
> > > -static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
> > > -                                  unsigned long flags, unsigned long eidx, unsigned long evtdata)
> > > +static long kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
> > > +                                   unsigned long flags, unsigned long eidx,
> > > +                                   unsigned long evtdata)
> > >  {
> > >       struct perf_event *event;
> > >
> > > @@ -454,7 +455,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
> > >                                    unsigned long eidx, u64 evtdata,
> > >                                    struct kvm_vcpu_sbi_return *retdata)
> > >  {
> > > -     int ctr_idx, ret, sbiret = 0;
> > > +     int ctr_idx, sbiret = 0;
> > > +     long ret;
> > >       bool is_fevent;
> > >       unsigned long event_code;
> > >       u32 etype = kvm_pmu_get_perf_event_type(eidx);
> > > @@ -513,8 +515,10 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
> > >                       kvpmu->fw_event[event_code].started = true;
> > >       } else {
> > >               ret = kvm_pmu_create_perf_event(pmc, &attr, flags, eidx, evtdata);
> > > -             if (ret)
> > > -                     return ret;
> > > +             if (ret) {
> > > +                     sbiret = SBI_ERR_NOT_SUPPORTED;
> > > +                     goto out;
> > > +             }
> > >       }
> > >
> > >       set_bit(ctr_idx, kvpmu->pmc_in_use);
> > > diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > > index 7eca72df2cbd..b70179e9e875 100644
> > > --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> > > +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > > @@ -42,9 +42,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> > >  #endif
> > >               /*
> > >                * This can fail if perf core framework fails to create an event.
> > > -              * Forward the error to userspace because it's an error which
> > > -              * happened within the host kernel. The other option would be
> > > -              * to convert to an SBI error and forward to the guest.
> > > +              * No need to forward the error to userspace and exit the guest
> >
> > Period after guest
> >
> >
> > > +              * operation can continue without profiling. Forward the
> >
> > The operation
> >
> 
> Fixed the above two.
> 
> 
> > > +              * appropriate SBI error to the guest.
> > >                */
> > >               ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
> > >                                                      cp->a2, cp->a3, temp, retdata);
> > > --
> > > 2.34.1
> > >
> >
> > Thanks,
> > drew
> 
> 
> 
> --
> Regards,
> Atish


From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 24 Nov 2022 02:18:26 -0800
Subject: [RFC 6/9] RISC-V: KVM: Add SBI PMU extension support
In-Reply-To: <20221123135842.uyw46kbybgb7unm2@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-7-atishp@rivosinc.com>
 <20221101142631.du54p4kyhlgf54cr@kamzik> <CAOnJCUJfakcoiWh4vFk5_BcTKfoSDbx+wtmh7MW4cPYog7q4BQ@mail.gmail.com>
 <20221123135842.uyw46kbybgb7unm2@kamzik>
Message-ID: <CAOnJCUKZV+0Xts6C4QY7X+Wak0ZR_f8wPtEAtH4PEmh2-_AcWw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 23, 2022 at 5:58 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Nov 22, 2022 at 03:08:34PM -0800, Atish Patra wrote:
> > On Tue, Nov 1, 2022 at 7:26 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Mon, Jul 18, 2022 at 10:02:02AM -0700, Atish Patra wrote:
> ...
> > > > +static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> > > > +                                unsigned long *out_val,
> > > > +                                struct kvm_cpu_trap *utrap,
> > > > +                                bool *exit)
> > > > +{
> > > > +     int ret = -EOPNOTSUPP;
> > > > +     struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> > > > +     unsigned long funcid = cp->a6;
> > > > +     uint64_t temp;
> > >
> > > I think we need something like
> > >
> > >    if (!vcpu_to_pmu(vcpu)->enabled)
> > >       return -EOPNOTSUPP;
> > >
> > > here. Where 'enabled' is only true when we successfully initialize
> > > the pmu. And, successful initialization depends on
> >
> > Yes. I have added the flag. But should we do the check here or
> > respective function
> > as a paranoia sanity check ?
>
> I think something like above that returns a not-supported error should be
> in all the entry points, like the top level SBI call handler. Functions
> that should never be called unless the PMU is active could have WARNs
> added for sanity checks.
>

Sure. Will add those checks.

> >
> > > IS_ENABLED(CONFIG_RISCV_PMU_SBI) and
> >
> > Why do we need to guard under CONFIG_RISCV_PMU_SBI ?
> > vcpu_sbi_pmu.c is only compiled under CONFIG_RISCV_PMU_SBI
> >
> > If CONFIG_RISCV_PMU_SBI is not enabled, probe function will return failure.
>
> You're right. We don't need explicit config checks for things that can't
> exist without the config.
>
> >
> > In fact, I think we should also add the pmu enabled check in the probe function
> > itself. Probe function(kvm_sbi_ext_pmu_probe) should only true when
> > both vcpu_to_pmu(vcpu)->enabled and
> > riscv_isa_extension_available(NULL, SSCOFPMF) are true.
> >
> > Thoughts?
>
> Agreed.
>
> >
> > > riscv_isa_extension_available(NULL, SSCOFPMF) as well as not
> > > failing other things. And, KVM userspace should be able to
> > > disable the pmu, which keep enabled from being set as well.
> > >
> > We already have provisions for disabling sscofpmf from guests via ISA
> > one reg interface.
> > Do you mean disable the entire PMU from userspace ?
>
> Yes. We may need to configure a VM without a PMU to increase its
> migratability, workaround errata, or just for testing/debugging purposes.
>
> >
> > Currently, ARM64 enables pmu from user space using device control APIs
> > on vcpu fd.
> > Are you suggesting we should do something like that ?
>
> Yes. Although choosing which KVM API should be used could probably be
> thought-out again. x86 uses VM ioctls.
>

How does it handle hetergenous systems in per VM ioctls ?

> >
> > If PMU needs to have device control APIs (either via vcpu fd or its
> > own), we can retrieve
> > the hpmcounter width and count from there as well.
>
> Right. We need to decide how the VM/VCPU + PMU user interface should look.
> A separate PMU device, like arm64 has, sounds good, but the ioctl
> sequences for initialization may get more tricky.
>

Do we really need a per VM interface ? I was thinking we can just
continue to use
one reg interface for PMU as well. We probably need two of them.

1. To enable/disable SBI extension
    -- The probe function will depend on this
2. PMU specific get/set
    -- Number of hpmcounters
    -- hpmcounter width
    -- enable PMU


> Thanks,
> drew



-- 
Regards,
Atish


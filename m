From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 24 Nov 2022 11:50:51 +0100
Subject: [RFC 6/9] RISC-V: KVM: Add SBI PMU extension support
In-Reply-To: <CAOnJCUKZV+0Xts6C4QY7X+Wak0ZR_f8wPtEAtH4PEmh2-_AcWw@mail.gmail.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-7-atishp@rivosinc.com>
 <20221101142631.du54p4kyhlgf54cr@kamzik>
 <CAOnJCUJfakcoiWh4vFk5_BcTKfoSDbx+wtmh7MW4cPYog7q4BQ@mail.gmail.com>
 <20221123135842.uyw46kbybgb7unm2@kamzik>
 <CAOnJCUKZV+0Xts6C4QY7X+Wak0ZR_f8wPtEAtH4PEmh2-_AcWw@mail.gmail.com>
Message-ID: <20221124105051.hbsavj3bgf4mvlzb@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 24, 2022 at 02:18:26AM -0800, Atish Patra wrote:
> On Wed, Nov 23, 2022 at 5:58 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Tue, Nov 22, 2022 at 03:08:34PM -0800, Atish Patra wrote:
...
> > > Currently, ARM64 enables pmu from user space using device control APIs
> > > on vcpu fd.
> > > Are you suggesting we should do something like that ?
> >
> > Yes. Although choosing which KVM API should be used could probably be
> > thought-out again. x86 uses VM ioctls.
> >
> 
> How does it handle hetergenous systems in per VM ioctls ?

I don't think it does, but neither does arm64. Afaik, the only way to run
KVM VMs on heterogeneous systems is to pin the VM to one set of the CPUs,
i.e. make sure the system it runs on is homogeneous.

I agree we shouldn't paint ourselves into a homogeneous-only corner for
riscv, though, so if it's possible to use VCPU APIs, then I guess we
should. Although, one thing to keep in mind is that if the same ioctl
needs to be run on each VCPU, then, when we start building VMs with
hundreds of VCPUs, we'll see slow VM starts.

> 
> > >
> > > If PMU needs to have device control APIs (either via vcpu fd or its
> > > own), we can retrieve
> > > the hpmcounter width and count from there as well.
> >
> > Right. We need to decide how the VM/VCPU + PMU user interface should look.
> > A separate PMU device, like arm64 has, sounds good, but the ioctl
> > sequences for initialization may get more tricky.
> >
> 
> Do we really need a per VM interface ? I was thinking we can just
> continue to use
> one reg interface for PMU as well. We probably need two of them.
> 
> 1. To enable/disable SBI extension
>     -- The probe function will depend on this
> 2. PMU specific get/set
>     -- Number of hpmcounters
>     -- hpmcounter width
>     -- enable PMU

ONE_REG is good for registers and virtual registers, which means the
number of hpmcounters and the hpmcounter width are probably good
candidates, but I'm not sure we should use it for enable/init types of
purposes.

Thanks,
drew


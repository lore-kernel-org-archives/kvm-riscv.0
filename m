From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 24 Nov 2022 01:09:03 -0800
Subject: [RFC 5/9] RISC-V: KVM: Add skeleton support for perf
In-Reply-To: <20221123131104.zglb3osa5tsgkkkb@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-6-atishp@rivosinc.com>
 <20221101141329.j4qtvjf6kmqixt2r@kamzik> <CAOnJCULMbTp6WhVRWHxzFnUgCJJV01hcyukQxSEih-sYt5TJWg@mail.gmail.com>
 <20221123131104.zglb3osa5tsgkkkb@kamzik>
Message-ID: <CAOnJCUK0PcSXxt-Qvomy-4UoP5993-bVfPvWn_Rd5=ELC9n1gA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 23, 2022 at 5:11 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Nov 22, 2022 at 04:46:14PM -0800, Atish Patra wrote:
> ...
> > > > +     kvpmu->num_hw_ctrs = num_hw_ctrs;
> > > > +     kvpmu->num_fw_ctrs = num_fw_ctrs;
> > >
> > > Maybe it's coming later, but we need to give KVM userspace control over
> > > the number of counters to allow it to migrate to a larger set of hosts.
> > > Also, a previous patch said the virtual width must be the same as the
> > > host width for the hw counters, so we need userspace to know what that
> > > is in order to determine to which hosts it can migrate a guest.
> > >
> >
> > Yes. The entire user space access control needs to be sketched out.
> > We probably need another one reg interface to set/get the number of
> > counters/width.
> >
> > However, Is it a common to migrate a guest between different hosts
> > with different PMU capabilities ?
> >
>
> Ideally we'd be able to define a virtual CPU+PMU which represents the
> least common denominator of a set of hosts, allowing VMs which use that
> VCPU model to migrate among all the hosts. x86 pulls this off pretty well,
> but arm64 doesn't. In the least, I think a goal should be to enable
> migration of VMs from hosts with less extensions and less PMU counters to
> hosts with more, as that would support host upgrades without having to
> recreate VMs.
>

We also have hpmwidth to worry about. I guess the policy details will be
VMM specific one. We need to think through the parameters that can be
varied between
hosts. As you pointed out earlier,

1. hpmcounter wdith
2. Number of hpmcounters
3. PMU related ISA extension - this will be applicable for all the extensions.

Anything else ?


> Thanks,
> drew



--
Regards,
Atish


From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 6 Feb 2023 12:39:45 +0100
Subject: [PATCH v4 07/14] RISC-V: KVM: Add skeleton support for perf
In-Reply-To: <20230206092204.aiyo43uxlm4xdmgn@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-8-atishp@rivosinc.com>
 <20230202170345.uwi72dauzunlzxex@orel>
 <CAOnJCUJfc8y729GiUdtqhv+PZu8v9rH+kfpwPwdW=GQPEs9FNw@mail.gmail.com>
 <CAOnJCUKn_pLKqYO71S6MrZd=rnTdSShZk+XksX2uxTiVtthmTA@mail.gmail.com>
 <20230206092204.aiyo43uxlm4xdmgn@orel>
Message-ID: <20230206113945.vcnrokltvzgifsqu@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 06, 2023 at 10:22:04AM +0100, Andrew Jones wrote:
> On Sat, Feb 04, 2023 at 11:37:47PM -0800, Atish Patra wrote:
> > On Fri, Feb 3, 2023 at 12:47 AM Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > On Thu, Feb 2, 2023 at 9:03 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > >
> > > > On Wed, Feb 01, 2023 at 03:12:43PM -0800, Atish Patra wrote:
> > > > > This patch only adds barebone structure of perf implementation. Most of
> > > > > the function returns zero at this point and will be implemented
> > > > > fully in the future.
> > > > >
> > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > > ---
> > > > >  arch/riscv/include/asm/kvm_host.h     |   4 +
> > > > >  arch/riscv/include/asm/kvm_vcpu_pmu.h |  78 +++++++++++++++
> > > > >  arch/riscv/kvm/Makefile               |   1 +
> > > > >  arch/riscv/kvm/vcpu.c                 |   7 ++
> > > > >  arch/riscv/kvm/vcpu_pmu.c             | 136 ++++++++++++++++++++++++++
> > > > >  5 files changed, 226 insertions(+)
> > > > >  create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > >  create mode 100644 arch/riscv/kvm/vcpu_pmu.c
> > > > >
> > > > > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > > > > index 93f43a3..b90be9a 100644
> > > > > --- a/arch/riscv/include/asm/kvm_host.h
> > > > > +++ b/arch/riscv/include/asm/kvm_host.h
> > > > > @@ -18,6 +18,7 @@
> > > > >  #include <asm/kvm_vcpu_insn.h>
> > > > >  #include <asm/kvm_vcpu_sbi.h>
> > > > >  #include <asm/kvm_vcpu_timer.h>
> > > > > +#include <asm/kvm_vcpu_pmu.h>
> > > > >
> > > > >  #define KVM_MAX_VCPUS                        1024
> > > > >
> > > > > @@ -228,6 +229,9 @@ struct kvm_vcpu_arch {
> > > > >
> > > > >       /* Don't run the VCPU (blocked) */
> > > > >       bool pause;
> > > > > +
> > > > > +     /* Performance monitoring context */
> > > > > +     struct kvm_pmu pmu_context;
> > > > >  };
> > > > >
> > > > >  static inline void kvm_arch_hardware_unsetup(void) {}
> > > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > > new file mode 100644
> > > > > index 0000000..e2b4038
> > > > > --- /dev/null
> > > > > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > > @@ -0,0 +1,78 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > +/*
> > > > > + * Copyright (c) 2023 Rivos Inc
> > > > > + *
> > > > > + * Authors:
> > > > > + *     Atish Patra <atishp@rivosinc.com>
> > > > > + */
> > > > > +
> > > > > +#ifndef __KVM_VCPU_RISCV_PMU_H
> > > > > +#define __KVM_VCPU_RISCV_PMU_H
> > > > > +
> > > > > +#include <linux/perf/riscv_pmu.h>
> > > > > +#include <asm/kvm_vcpu_sbi.h>
> > > > > +#include <asm/sbi.h>
> > > > > +
> > > > > +#ifdef CONFIG_RISCV_PMU_SBI
> > > > > +#define RISCV_KVM_MAX_FW_CTRS        32
> > > > > +
> > > > > +#if RISCV_KVM_MAX_FW_CTRS > 32
> > > > > +#error "Maximum firmware counter can't exceed 32 without increasing the RISCV_MAX_COUNTERS"
> > > >
> > > > "The number of firmware counters cannot exceed 32 without increasing RISCV_MAX_COUNTERS"
> > > >
> > > > > +#endif
> > > > > +
> > > > > +#define RISCV_MAX_COUNTERS      64
> > > >
> > > > But instead of that message, what I think we need is something like
> > > >
> > > >  #define RISCV_KVM_MAX_HW_CTRS  32
> > > >  #define RISCV_KVM_MAX_FW_CTRS  32
> > > >  #define RISCV_MAX_COUNTERS     (RISCV_KVM_MAX_HW_CTRS + RISCV_KVM_MAX_FW_CTRS)
> > > >
> > > >  static_assert(RISCV_MAX_COUNTERS <= 64)
> > > >
> > > > And then in pmu_sbi_device_probe() should ensure
> > > >
> > > >   num_counters <= RISCV_MAX_COUNTERS
> > > >
> > > > and pmu_sbi_get_ctrinfo() should ensure
> > > >
> > > >   num_hw_ctr <= RISCV_KVM_MAX_HW_CTRS
> > > >   num_fw_ctr <= RISCV_KVM_MAX_FW_CTRS
> > > >
> > > > which has to be done at runtime.
> > > >
> > >
> > > Sure. I will add the additional sanity checks.
> > >
> > 
> > As explained above, I feel we shouldn't mix the firmware number of
> > counters that the host gets and it exposes to a guest.
> > So I have not included this suggestion in the v5.
> > I have changed the num_fw_ctrs to PMU_FW_MAX though to accurately
> > reflect the firmware counters KVM is actually using.
> 
> Sounds good

I just looked at v5. IMO, much of what I proposed above still makes
sense, since what I'm proposing is that the relationship between
RISCV_KVM_MAX_HW_CTRS, RISCV_KVM_MAX_FW_CTRS, RISCV_MAX_COUNTERS, and 64
(our current max bitmap size) be explicitly checked. So, even if we want
RISCV_KVM_MAX_FW_CTRS to be SBI_PMU_FW_MAX, it'd be good to have

#define RISCV_KVM_MAX_HW_CTRS  32

(And a runtime check confirming num_hw_ctrs + 1 <= RISCV_KVM_MAX_HW_CTRS,
 and then either silently capping or issuing a warning and capping)

And, to be sure the sum of RISCV_KVM_MAX_FW_CTRS and RISCV_KVM_MAX_HW_CTRS
doesn't exceed the size of the bitmap

#define RISCV_KVM_MAX_FW_CTRS	SBI_PMU_FW_MAX
#define RISCV_MAX_COUNTERS	(RISCV_KVM_MAX_HW_CTRS + RISCV_KVM_MAX_FW_CTRS)
static_assert(RISCV_MAX_COUNTERS <= 64)

Thanks,
drew

> 
> > I don't know if there is any benefit of static_assert over #error.
> > Please let me know if you feel strongly about that.
> 
> One "normal" line vs. three #-lines?
> 
> Thanks,
> drew


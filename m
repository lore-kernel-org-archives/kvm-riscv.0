From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 3 Feb 2023 00:04:00 -0800
Subject: [PATCH v4 07/14] RISC-V: KVM: Add skeleton support for perf
In-Reply-To: <Y9ufoeZ/4obZDJz6@wendy>
References: <20230201231250.3806412-1-atishp@rivosinc.com> <20230201231250.3806412-8-atishp@rivosinc.com>
 <Y9ufoeZ/4obZDJz6@wendy>
Message-ID: <CAOnJCUKVXGXsFBUE753-HOr_CtN-5Nsq+yBQj1eT13WyU2r54g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 2, 2023 at 3:34 AM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Wed, Feb 01, 2023 at 03:12:43PM -0800, Atish Patra wrote:
> > This patch only adds barebone structure of perf implementation. Most of
> > the function returns zero at this point and will be implemented
> > fully in the future.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > +/* Per virtual pmu counter data */
> > +struct kvm_pmc {
> > +     u8 idx;
> > +     struct perf_event *perf_event;
> > +     uint64_t counter_val;
>
> CI also complained that here, and elsewhere, you used uint64_t rather
> than u64. Am I missing a reason for not using the regular types?
>

Nope. It was a simple oversight. I will fix it.
Do you have a link to the CI report so that I can address them all in v5 ?

> Thanks,
> Conor.
>
> > +     union sbi_pmu_ctr_info cinfo;
> > +     /* Event monitoring status */
> > +     bool started;



-- 
Regards,
Atish


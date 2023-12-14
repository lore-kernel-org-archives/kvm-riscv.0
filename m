From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 17:45:48 +0530
Subject: [RFC 2/9] drivers/perf: riscv: Add a flag to indicate SBI v2.0 support
In-Reply-To: <20231207-professed-component-84128c06befa@wendy>
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-3-atishp@rivosinc.com>
 <20231207-professed-component-84128c06befa@wendy>
Message-ID: <CAAhSdy1vqGHeEMStu8Ft2Cz-_c=9e8ciwo9nBh=CDnEejEvp9w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 7, 2023 at 5:39?PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Mon, Dec 04, 2023 at 06:43:03PM -0800, Atish Patra wrote:
> > SBI v2.0 added few functions to improve SBI PMU extension. In order
> > to be backward compatible, the driver must use these functions only
> > if SBI v2.0 is available.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> IMO this does not make sense in a patch of its own and should probably
> be squashed with the first user for it.

I agree. This patch should be squashed into patch4 where the
flag is first used.

Regards,
Anup

>
> > ---
> >  drivers/perf/riscv_pmu_sbi.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 16acd4dcdb96..40a335350d08 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -35,6 +35,8 @@
> >  PMU_FORMAT_ATTR(event, "config:0-47");
> >  PMU_FORMAT_ATTR(firmware, "config:63");
> >
> > +static bool sbi_v2_available;
> > +
> >  static struct attribute *riscv_arch_formats_attr[] = {
> >       &format_attr_event.attr,
> >       &format_attr_firmware.attr,
> > @@ -1108,6 +1110,9 @@ static int __init pmu_sbi_devinit(void)
> >               return 0;
> >       }
> >
> > +     if (sbi_spec_version >= sbi_mk_version(2, 0))
> > +             sbi_v2_available = true;
> > +
> >       ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
> >                                     "perf/riscv/pmu:starting",
> >                                     pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
> > --
> > 2.34.1
> >


From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 2 Dec 2024 16:15:23 -0800
Subject: [PATCH 3/8] drivers/perf: riscv: Add raw event v2 support
In-Reply-To: <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com> <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
Message-ID: <CAHBxVyEwkPUcut0L7K9eewcmhOOidU16WnGRiPiP3D7-OS7HvQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 2, 2024 at 2:37?PM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Hi Atish,
>
> On 2024-11-19 2:29 PM, Atish Patra wrote:
> > SBI v3.0 introduced a new raw event type that allows wider
> > mhpmeventX width to be programmed via CFG_MATCH.
> >
> > Use the raw event v2 if SBI v3.0 is available.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/sbi.h |  4 ++++
> >  drivers/perf/riscv_pmu_sbi.c | 18 ++++++++++++------
> >  2 files changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 9be38b05f4ad..3ee9bfa5e77c 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -159,7 +159,10 @@ struct riscv_pmu_snapshot_data {
> >
> >  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
> >  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
> > +/* SBI v3.0 allows extended hpmeventX width value */
> > +#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
> >  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
> > +#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
> >  #define RISCV_PLAT_FW_EVENT  0xFFFF
> >
> >  /** General pmu event codes specified in SBI PMU extension */
> > @@ -217,6 +220,7 @@ enum sbi_pmu_event_type {
> >       SBI_PMU_EVENT_TYPE_HW = 0x0,
> >       SBI_PMU_EVENT_TYPE_CACHE = 0x1,
> >       SBI_PMU_EVENT_TYPE_RAW = 0x2,
> > +     SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
> >       SBI_PMU_EVENT_TYPE_FW = 0xf,
> >  };
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 50cbdbf66bb7..f0e845ff6b79 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(                                           \
> >  #define PERF_EVENT_FLAG_USER_ACCESS  BIT(SYSCTL_USER_ACCESS)
> >  #define PERF_EVENT_FLAG_LEGACY               BIT(SYSCTL_LEGACY)
> >
> > -PMU_FORMAT_ATTR(event, "config:0-47");
> > +PMU_FORMAT_ATTR(event, "config:0-55");
> >  PMU_FORMAT_ATTR(firmware, "config:62-63");
> >
> >  static bool sbi_v2_available;
> > @@ -527,18 +527,24 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
> >               break;
> >       case PERF_TYPE_RAW:
> >               /*
> > -              * As per SBI specification, the upper 16 bits must be unused
> > -              * for a hardware raw event.
> > +              * As per SBI v0.3 specification,
> > +              *  -- the upper 16 bits must be unused for a hardware raw event.
> > +              * As per SBI v3.0 specification,
> > +              *  -- the upper 8 bits must be unused for a hardware raw event.
> >                * Bits 63:62 are used to distinguish between raw events
> >                * 00 - Hardware raw event
> >                * 10 - SBI firmware events
> >                * 11 - Risc-V platform specific firmware event
> >                */
> > -
> >               switch (config >> 62) {
> >               case 0:
> > -                     ret = RISCV_PMU_RAW_EVENT_IDX;
> > -                     *econfig = config & RISCV_PMU_RAW_EVENT_MASK;
> > +                     if (sbi_v3_available) {
> > +                             *econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
> > +                             ret = RISCV_PMU_RAW_EVENT_V2_IDX;
> > +                     } else {
> > +                             *econfig = config & RISCV_PMU_RAW_EVENT_MASK;
> > +                             ret = RISCV_PMU_RAW_EVENT_IDX;
>
> Shouldn't we check to see if any of bits 48-55 are set and return an error,
> instead of silently requesting the wrong event?
>

We can. I did not add it originally as we can't do much validation for
the raw events for anyways.
If the encoding is not supported the user will get the error anyways
as it can't find a counter.
We will just save 1 SBI call if the kernel doesn't allow requesting an
event if bits 48-55 are set.

> Regards,
> Samuel
>
> > +                     }
> >                       break;
> >               case 2:
> >                       ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
> >
>


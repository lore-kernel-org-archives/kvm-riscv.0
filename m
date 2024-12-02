From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 2 Dec 2024 10:26:13 -0800
Subject: [PATCH 2/8] drivers/perf: riscv: Fix Platform firmware event data
In-Reply-To: <77b7b44f-e05a-4845-8d45-0e0d831bb8e7@ghiti.fr>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-2-a4f9691421f8@rivosinc.com> <77b7b44f-e05a-4845-8d45-0e0d831bb8e7@ghiti.fr>
Message-ID: <CAHBxVyHZvLrKNCAPJfHxYYn30Mm++J=mff+tVU9GZ_8rt3WnEg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 28, 2024 at 5:10?AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Atish,
>
> On 19/11/2024 21:29, Atish Patra wrote:
> > Platform firmware event data field is allowed to be 62 bits for
> > Linux as uppper most two bits are reserved to indicate SBI fw or
> > platform specific firmware events.
> > However, the event data field is masked as per the hardware raw
> > event mask which is not correct.
> >
> > Fix the platform firmware event data field with proper mask.
> >
> > Fixes: f0c9363db2dd ("perf/riscv-sbi: Add platform specific firmware event handling")
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/sbi.h |  1 +
> >   drivers/perf/riscv_pmu_sbi.c | 12 +++++-------
> >   2 files changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 98f631b051db..9be38b05f4ad 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -158,6 +158,7 @@ struct riscv_pmu_snapshot_data {
> >   };
> >
> >   #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
> > +#define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
> >   #define RISCV_PMU_RAW_EVENT_IDX 0x20000
> >   #define RISCV_PLAT_FW_EVENT 0xFFFF
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index cb98efa9b106..50cbdbf66bb7 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -508,7 +508,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
> >   {
> >       u32 type = event->attr.type;
> >       u64 config = event->attr.config;
> > -     u64 raw_config_val;
> >       int ret;
> >
> >       /*
> > @@ -529,21 +528,20 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
> >       case PERF_TYPE_RAW:
> >               /*
> >                * As per SBI specification, the upper 16 bits must be unused
> > -              * for a raw event.
> > +              * for a hardware raw event.
> >                * Bits 63:62 are used to distinguish between raw events
> >                * 00 - Hardware raw event
> >                * 10 - SBI firmware events
> >                * 11 - Risc-V platform specific firmware event
> >                */
> > -             raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
> > +
> >               switch (config >> 62) {
> >               case 0:
> >                       ret = RISCV_PMU_RAW_EVENT_IDX;
> > -                     *econfig = raw_config_val;
> > +                     *econfig = config & RISCV_PMU_RAW_EVENT_MASK;
> >                       break;
> >               case 2:
> > -                     ret = (raw_config_val & 0xFFFF) |
> > -                             (SBI_PMU_EVENT_TYPE_FW << 16);
> > +                     ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
> >                       break;
> >               case 3:
> >                       /*
> > @@ -552,7 +550,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
> >                        * Event data - raw event encoding
> >                        */
> >                       ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
> > -                     *econfig = raw_config_val;
> > +                     *econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
> >                       break;
> >               }
> >               break;
> >
>
> It seems independent from the other patches, so I guess we should take
> it for 6.13 rcX.
>

Yes. This patch doesn't have any SBI v3.0 dependencies. I will send
this patch separately
so that it can be applied for 6.13 rcX

> Let me know if that's not the case.
>
> Thanks,
>
> Alex
>


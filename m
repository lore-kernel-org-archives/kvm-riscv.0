From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 16 Dec 2023 15:33:52 -0800
Subject: [RFC 5/9] RISC-V: Add SBI PMU snapshot definitions
In-Reply-To: <20231207-unpleased-landlord-8383b4c50aca@wendy>
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-6-atishp@rivosinc.com>
 <20231207-unpleased-landlord-8383b4c50aca@wendy>
Message-ID: <CAOnJCU+x43E4LdNsRspCuS0WRdfejo-B_L+k1zugDftKMJ3yNg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 7, 2023 at 4:34?AM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Mon, Dec 04, 2023 at 06:43:06PM -0800, Atish Patra wrote:
> > SBI PMU Snapshot function optimizes the number of traps to
> > higher privilege mode by leveraging a shared memory between the S/VS-mode
> > and the M/HS mode. Add the definitions for that extension
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/sbi.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index f3eeca79a02d..29821addb9b7 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -122,6 +122,7 @@ enum sbi_ext_pmu_fid {
> >       SBI_EXT_PMU_COUNTER_STOP,
> >       SBI_EXT_PMU_COUNTER_FW_READ,
> >       SBI_EXT_PMU_COUNTER_FW_READ_HI,
> > +     SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> >  };
> >
> >  union sbi_pmu_ctr_info {
> > @@ -138,6 +139,13 @@ union sbi_pmu_ctr_info {
> >       };
> >  };
> >
> > +/* Data structure to contain the pmu snapshot data */
> > +struct riscv_pmu_snapshot_data {
> > +     uint64_t ctr_overflow_mask;
> > +     uint64_t ctr_values[64];
> > +     uint64_t reserved[447];
> > +};
> > +
> >  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
> >  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
> >
> > @@ -234,9 +242,11 @@ enum sbi_pmu_ctr_type {
> >
> >  /* Flags defined for counter start function */
> >  #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
> > +#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT (1 << 1)
> >
> >  /* Flags defined for counter stop function */
> >  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> > +#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT (1 << 1)
>
> If we can use GENMASK in this file, why can we not use BIT()?
>

Sure. Done. I will change the other ones in a separate patch as well.

> >
> >  enum sbi_ext_dbcn_fid {
> >       SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> > --
> > 2.34.1
> >



-- 
Regards,
Atish


From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 1 Mar 2024 11:30:00 -0800
Subject: [PATCH v4 04/15] RISC-V: Add SBI PMU snapshot definitions
In-Reply-To: <20240301-1a1aa2a2c04640c34749cb5f@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com> <20240229010130.1380926-5-atishp@rivosinc.com>
 <20240301-1a1aa2a2c04640c34749cb5f@orel>
Message-ID: <CAHBxVyHCB+GJXyn1TjhXKFD=GNhRzMuRUUx1LjJMxV+3W=y7TQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 1, 2024 at 3:14?AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Feb 28, 2024 at 05:01:19PM -0800, Atish Patra wrote:
> > SBI PMU Snapshot function optimizes the number of traps to
> > higher privilege mode by leveraging a shared memory between the S/VS-mode
> > and the M/HS mode. Add the definitions for that extension and new error
> > codes.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/sbi.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index ef8311dafb91..dfa830f7d54b 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -132,6 +132,7 @@ enum sbi_ext_pmu_fid {
> >       SBI_EXT_PMU_COUNTER_STOP,
> >       SBI_EXT_PMU_COUNTER_FW_READ,
> >       SBI_EXT_PMU_COUNTER_FW_READ_HI,
> > +     SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> >  };
> >
> >  union sbi_pmu_ctr_info {
> > @@ -148,6 +149,13 @@ union sbi_pmu_ctr_info {
> >       };
> >  };
> >
> > +/* Data structure to contain the pmu snapshot data */
> > +struct riscv_pmu_snapshot_data {
> > +     u64 ctr_overflow_mask;
> > +     u64 ctr_values[64];
> > +     u64 reserved[447];
> > +};
> > +
> >  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
> >  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
> >
> > @@ -244,9 +252,11 @@ enum sbi_pmu_ctr_type {
> >
> >  /* Flags defined for counter start function */
> >  #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
>
> A patch before this which changes all flags to use BIT() instead of shifts
> would be good, since otherwise the new flags are inconsistent.
>

Done.

>
> > +#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)
>
> This is named SBI_PMU_START_FLAG_INIT_SNAPSHOT in the spec.
>

Fixed.

>
> >
> >  /* Flags defined for counter stop function */
> >  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> > +#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
> >
> >  enum sbi_ext_dbcn_fid {
> >       SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> > @@ -285,6 +295,7 @@ struct sbi_sta_struct {
> >  #define SBI_ERR_ALREADY_AVAILABLE -6
> >  #define SBI_ERR_ALREADY_STARTED -7
> >  #define SBI_ERR_ALREADY_STOPPED -8
> > +#define SBI_ERR_NO_SHMEM     -9
> >
> >  extern unsigned long sbi_spec_version;
> >  struct sbiret {
> > --
> > 2.34.1
> >
>
> Thanks,
> drew


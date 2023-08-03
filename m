From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 3 Aug 2023 10:20:32 +0300
Subject: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
In-Reply-To: <ZMrnoBAHO0Iaj6b/@gmail.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com>
 <ZMrnoBAHO0Iaj6b/@gmail.com>
Message-ID: <20230803-73f12efe1a16517072404251@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 02, 2023 at 07:32:48PM -0400, Guo Ren wrote:
> On Mon, Apr 17, 2023 at 12:33:50PM +0200, Andrew Jones wrote:
> > The SBI STA extension enables steal-time accounting. Add the
> > definitions it specifies.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/sbi.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 945b7be249c1..485b9ec20399 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -30,6 +30,7 @@ enum sbi_ext_id {
> >  	SBI_EXT_HSM = 0x48534D,
> >  	SBI_EXT_SRST = 0x53525354,
> >  	SBI_EXT_PMU = 0x504D55,
> > +	SBI_EXT_STA = 0x535441,
> >  
> >  	/* Experimentals extensions must lie within this range */
> >  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> > @@ -236,6 +237,20 @@ enum sbi_pmu_ctr_type {
> >  /* Flags defined for counter stop function */
> >  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> >  
> > +/* SBI STA (steal-time accounting) extension */
> > +enum sbi_ext_sta_fid {
> > +	SBI_EXT_STA_SET_STEAL_TIME_SHMEM = 0,
> > +};
> > +
> > +struct sbi_sta_struct {
> > +	__le32 sequence;
> > +	__le32 flags;
> > +	__le64 steal;
> Could we wrap the "sequence & steal" into one 64-bit variable? Then only
> rv32 needs double READs, and only one ld instruction for rv64 ISA.

That's possible, but we'd have to reduce the size of steal by whatever
size we decide is sufficient for sequence. In order to do that we'll
need to discuss the size reduction proposals and their justifications
at the spec level. If you'd like to make that proposal, then please
create an issue at [1]. But, I don't think it should be necessary.
There's non-normative text in the spec that says "This sequence field
enables the value of the steal field to be read by supervisor-mode
software executing in a 32-bit environment.", which implies to me
that we could optimize the read in a 64-bit environment by neglecting
to read sequence at all.

[1] https://github.com/riscv-non-isa/riscv-sbi-doc

Thanks,
drew

> 
> > +	u8 preempted;
> > +	u8 pad[47];
> > +} __packed;
> > +
> > +/* SBI spec version fields */
> >  #define SBI_SPEC_VERSION_DEFAULT	0x1
> >  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> >  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> > -- 
> > 2.39.2
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 


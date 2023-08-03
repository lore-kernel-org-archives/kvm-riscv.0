From: Guo Ren <guoren@kernel.org>
Date: Wed, 2 Aug 2023 21:27:51 -0400
Subject: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
In-Reply-To: <bl7i54kgkzvxzhritql4vtzpymepx7hmtio7pjnbmipv3dxwgi@dtmqpnkdlwl5>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com>
 <20230418-elliptic-headboard-6a18fcccdf07@spud>
 <bl7i54kgkzvxzhritql4vtzpymepx7hmtio7pjnbmipv3dxwgi@dtmqpnkdlwl5>
Message-ID: <ZMsCl9LaMvx38zMY@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 19, 2023 at 10:15:54AM +0200, Andrew Jones wrote:
> On Tue, Apr 18, 2023 at 07:43:51PM +0100, Conor Dooley wrote:
> > On Mon, Apr 17, 2023 at 12:33:50PM +0200, Andrew Jones wrote:
> > > The SBI STA extension enables steal-time accounting. Add the
> > > definitions it specifies.
> > > 
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/sbi.h | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > > 
> > > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > > index 945b7be249c1..485b9ec20399 100644
> > > --- a/arch/riscv/include/asm/sbi.h
> > > +++ b/arch/riscv/include/asm/sbi.h
> > > @@ -30,6 +30,7 @@ enum sbi_ext_id {
> > >  	SBI_EXT_HSM = 0x48534D,
> > >  	SBI_EXT_SRST = 0x53525354,
> > >  	SBI_EXT_PMU = 0x504D55,
> > > +	SBI_EXT_STA = 0x535441,
> > 
> > What is the sort order of this? Matching the spec ordering, or just
> > append-at-the-end?
> 
> I don't believe there's an established order. I've been going for spec
> order, I think.
> 
> > 
> > Unrelated, but in checking that I saw that your SUSP stuff is in
> > master - you planning on resending that series?
> 
> I think I need to wait until it's been ratified.
Did you discuss the SBI_EXT_STA number of the SBI spec? Could you share
the link to me? Thx.

> 
> > 
> > Anyways, this does match the docs - but I'm quite hesitant to leave an
> > R-b when it's not merged yet.
> 
> I could take your R-b now, and then if the spec changes, I'd drop it
> when reposting the PoC after reworking it.
> 
> Thanks,
> drew
> 
> > 
> > Cheers,
> > Conor.
> > 
> > >  
> > >  	/* Experimentals extensions must lie within this range */
> > >  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> > > @@ -236,6 +237,20 @@ enum sbi_pmu_ctr_type {
> > >  /* Flags defined for counter stop function */
> > >  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> > >  
> > > +/* SBI STA (steal-time accounting) extension */
> > > +enum sbi_ext_sta_fid {
> > > +	SBI_EXT_STA_SET_STEAL_TIME_SHMEM = 0,
> > > +};
> > > +
> > > +struct sbi_sta_struct {
> > > +	__le32 sequence;
> > > +	__le32 flags;
> > > +	__le64 steal;
> > > +	u8 preempted;
> > > +	u8 pad[47];
> > > +} __packed;
> > > +
> > > +/* SBI spec version fields */
> > >  #define SBI_SPEC_VERSION_DEFAULT	0x1
> > >  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> > >  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> > > -- 
> > > 2.39.2
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


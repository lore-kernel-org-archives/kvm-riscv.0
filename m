From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 3 Aug 2023 09:48:26 +0300
Subject: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
In-Reply-To: <ZMsCl9LaMvx38zMY@gmail.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com>
 <20230418-elliptic-headboard-6a18fcccdf07@spud>
 <bl7i54kgkzvxzhritql4vtzpymepx7hmtio7pjnbmipv3dxwgi@dtmqpnkdlwl5>
 <ZMsCl9LaMvx38zMY@gmail.com>
Message-ID: <20230803-12cf578826747ddb63046bff@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 02, 2023 at 09:27:51PM -0400, Guo Ren wrote:
> On Wed, Apr 19, 2023 at 10:15:54AM +0200, Andrew Jones wrote:
> > On Tue, Apr 18, 2023 at 07:43:51PM +0100, Conor Dooley wrote:
> > > On Mon, Apr 17, 2023 at 12:33:50PM +0200, Andrew Jones wrote:
> > > > The SBI STA extension enables steal-time accounting. Add the
> > > > definitions it specifies.
> > > > 
> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/include/asm/sbi.h | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > > > index 945b7be249c1..485b9ec20399 100644
> > > > --- a/arch/riscv/include/asm/sbi.h
> > > > +++ b/arch/riscv/include/asm/sbi.h
> > > > @@ -30,6 +30,7 @@ enum sbi_ext_id {
> > > >  	SBI_EXT_HSM = 0x48534D,
> > > >  	SBI_EXT_SRST = 0x53525354,
> > > >  	SBI_EXT_PMU = 0x504D55,
> > > > +	SBI_EXT_STA = 0x535441,
> > > 
> > > What is the sort order of this? Matching the spec ordering, or just
> > > append-at-the-end?
> > 
> > I don't believe there's an established order. I've been going for spec
> > order, I think.
> > 
> > > 
> > > Unrelated, but in checking that I saw that your SUSP stuff is in
> > > master - you planning on resending that series?
> > 
> > I think I need to wait until it's been ratified.
> Did you discuss the SBI_EXT_STA number of the SBI spec? Could you share
> the link to me? Thx.
>

The number is just "STA" in hex, as all SBI extensions are numbered. All
discussion of the spec was on the tech-prs mailing list[1]. Searching for
"steal" in the archives appears to pull up relevant threads.

[1] https://lists.riscv.org/g/tech-prs/messages

Thanks,
drew




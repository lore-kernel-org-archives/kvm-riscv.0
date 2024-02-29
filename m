From: Carlos Maiolino <cem@kernel.org>
Date: Thu, 29 Feb 2024 16:31:49 +0100
Subject: [PATCH 0/6] Add riscv tests to cover the base extension specs
In-Reply-To: <20240229-7081fb0fa170de37f254f6b8@orel>
References: <20240229124246.309304-1-cem@kernel.org>
 <YPaCLPKnRgVMHoCO1FCFWsIYotL_gRICyvKtNALFIezC-byyw4PcLczgHxIfYVo8Li3C5WsZGPmQjo2k5xIHGA==@protonmail.internalid>
 <20240229-24c619ea4927156d28f68f74@orel>
 <btmnh47fa7yakmuujg55peexqht3ijz6wbmph6r6aoph2zyss6@svynqxgo4xzg>
 <rHtbV5G6_4eRy9i0mSBVCRPeGQ8YzO5F78UzQZKJSPQpggOjMFDU4RNC870hvBkrrUP81BVhQkmfmUV1JvfUPQ==@protonmail.internalid>
 <20240229-7081fb0fa170de37f254f6b8@orel>
Message-ID: <rgbei4s7zhvzafpoq4petzokk2c3fxpi3id2xoquutpfldqk7e@y5xxv3kvpozw>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > > >   riscv: Factor out environment variable check
> > > >   riscv: Implement test for architecture ID register
> > > >   riscv: Enable gen_report() to print the wrong value in case of test
> > > >     failure
> > > >   riscv: Test for specific SBI implementation ID
> > > >   riscv: Test for a SBI implementation ID range
> > > >
> > > >  riscv/sbi.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++-------
> > > >  1 file changed, 83 insertions(+), 12 deletions(-)
> > > >
> > > > --
> > > > 2.43.2
> > >
> > > Hi Carlos,
> > >
> > > If you can, please CC tech-prs at lists.riscv.org when posting SBI tests.
> >
> > Ok, will do, should I resend this series?
> 
> Might as well, or at least pick up the CC when posting v2.

Sounds good, I'll wait for reviews, and post a V2 CC'ing tech-prs.

Carlos

> 
> Thanks,
> drew


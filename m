From: Andrew Jones <ajones@ventanamicro.com>
Date: Sun, 12 Feb 2023 17:26:27 +0100
Subject: [PATCH v4 5/8] RISC-V: cpufeature: Put vendor_id to work
In-Reply-To: <Y+apG/nVSLJY8nsN@spud>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-6-ajones@ventanamicro.com>
 <Y+VD2/owMIvqzOx8@spud>
 <20230210075818.chh5myc2tmcvjplc@orel>
 <Y+apG/nVSLJY8nsN@spud>
Message-ID: <20230212162627.4k76d7y3b3rgezkw@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 10, 2023 at 08:29:15PM +0000, Conor Dooley wrote:
> On Fri, Feb 10, 2023 at 08:58:18AM +0100, Andrew Jones wrote:
> > On Thu, Feb 09, 2023 at 07:04:59PM +0000, Conor Dooley wrote:
> > > On Thu, Feb 09, 2023 at 04:26:25PM +0100, Andrew Jones wrote:
> 
> > > > +static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> > > > +{
> > > > +	return data == 0;
> > > > +}
> > > > +
> > > >  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > > >  						  struct alt_entry *end,
> > > >  						  unsigned int stage)
> > > > @@ -289,8 +294,6 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > > >  		return;
> > > >  
> > > >  	for (alt = begin; alt < end; alt++) {
> > > > -		if (alt->vendor_id != 0)
> > > > -			continue;
> > > 
> > > Can you remind me what makes this "safe"?
> > > My understanding was that a vendor_id of zero was safe, as zero is
> > > reserved in JEDEC.
> > > What is stopping someone stuffing this with a given value and
> > > colliding with a real vendor's errata?
> > > 
> > > 	for (alt = begin; alt < end; alt++) {
> > > 		if (alt->vendor_id != A_VENDOR_ID)
> > > 			continue;
> > > 		if (alt->errata_id >= ERRATA_A_NUMBER)
> > > 			continue;
> > > 
> > > 		tmp = (1U << alt->errata_id);
> > > 		if (cpu_req_errata & tmp) {
> > > 			oldptr = ALT_OLD_PTR(alt);
> > > 			altptr = ALT_ALT_PTR(alt);
> > > 
> > > 			/* On vm-alternatives, the mmu isn't running yet */
> > > 			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > > 				memcpy((void *)__pa_symbol(oldptr),
> > > 				       (void *)__pa_symbol(altptr),
> > > 				       alt->alt_len);
> > > 			else
> > > 				patch_text_nosync(oldptr, altptr, alt->alt_len);
> > > 		}
> > > 	}
> > > 
> > > I've probably just missing something, my brain swapped out alternatives
> > > the other week. Hopefully whatever I missed isn't embarrassingly obvious!
> > 
> > You're right. I was assuming the errata_id space for errata didn't overlap
> > with the errata_id space for cpufeatures. It doesn't, atm, but by luck,
> > not design. I could try to ensure that somehow, but probably the better
> > approach would be to use the upper bits of errata_id for the application
> > data and to leave vendor_id alone. Thanks for catching my oversight!
> 
> Sounds like a better idea at least.
> I suppose the ideal would be to add another arg and not abuse things,
> but maybe that's one for the future, idk.

We could add another arg without too much trouble and even use some macro
trickier to only pass it when it's needed. OTOH, the errata_id is 32-bits,
which is overkill, since errata are assigned increasing integers from
zero, and I don't want to over-bloat this structure. Maybe I can split
errata_id into two 16-bit parameters to avoid completely adding yet
another.

> Is this somewhere that an assertion should be used to make sure that
> we don't grow the list of extensions such that the regions collide?

It's probably best to split errata_id for the application data and not
worry about collisions.

Thanks,
drew


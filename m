From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 10 Feb 2023 09:05:15 +0100
Subject: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
In-Reply-To: <Y+VFAUZ2smkKO0EZ@spud>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-7-ajones@ventanamicro.com>
 <Y+VFAUZ2smkKO0EZ@spud>
Message-ID: <20230210080515.lbguxxg4efxudjzg@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 09, 2023 at 07:09:53PM +0000, Conor Dooley wrote:
> On Thu, Feb 09, 2023 at 04:26:26PM +0100, Andrew Jones wrote:
> > Using memset() to zero a 4K page takes 563 total instructions, where
> > 20 are branches. clear_page(), with Zicboz and a 64 byte block size,
> > takes 169 total instructions, where 4 are branches and 33 are nops.
> > Even though the block size is a variable, thanks to alternatives, we
> > can still implement a Duff device without having to do any preliminary
> > calculations. This is achieved by taking advantage of 'vendor_id'
> > being used as application-specific data for alternatives, enabling us
> > to stop patching / unrolling when 4K bytes have been zeroed (we would
> > loop and continue after 4K if the page size would be larger)
> > 
> > For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
> > only loop a few times and larger block sizes to not loop at all. Since
> > cbo.zero doesn't take an offset, we also need an 'add' after each
> > instruction, making the loop body 112 to 160 bytes. Hopefully this
> > is small enough to not cause icache misses.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 74736b4f0624..42246bbfa532 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -280,6 +280,17 @@ void __init riscv_fill_hwcap(void)
> >  #ifdef CONFIG_RISCV_ALTERNATIVE
> >  static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> >  {
> > +	switch (feature) {
> > +	case RISCV_ISA_EXT_ZICBOZ:
> > +		/*
> > +		 * Zicboz alternative applications provide the maximum
> 
> I like the comment, rather than this being some wizardry.
> I find the word "applications" to be a little unclear, perhaps, iff this
> series needs a respin, this would work better as "Users of the Zicboz
> alternative provide..." (or s/Users/Callers)?

Right, "applications" is an overloaded word. "users" is probably a better
choice. "callers" isn't quite right, to me, since it's a code patching
"application" / "use". Do you think the function name should change as
well?

Thanks,
drew

> 
> > +		 * supported block size order, or zero when it doesn't
> > +		 * matter. If the current block size exceeds the maximum,
> > +		 * then the alternative cannot be applied.
> > +		 */
> > +		return data == 0 || riscv_cboz_block_size <= (1U << data);
> > +	}
> > +
> >  	return data == 0;
> >  }




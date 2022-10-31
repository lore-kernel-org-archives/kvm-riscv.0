From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 31 Oct 2022 09:11:13 +0100
Subject: [PATCH 1/9] RISC-V: Factor out body of riscv_init_cbom_blocksize
 loop
In-Reply-To: <Y17fMkRRkTIbEX+r@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-2-ajones@ventanamicro.com>
 <Y17fMkRRkTIbEX+r@spud>
Message-ID: <20221031081113.um77mqvtr36toorz@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 30, 2022 at 08:31:46PM +0000, Conor Dooley wrote:
> On Thu, Oct 27, 2022 at 03:02:39PM +0200, Andrew Jones wrote:
> > Refactor riscv_init_cbom_blocksize() to prepare for it to be used
> > for both cbom block size and cboz block size.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/mm/cacheflush.c | 45 +++++++++++++++++++++-----------------
> >  1 file changed, 25 insertions(+), 20 deletions(-)
> > 
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 57b40a350420..f096b9966cae 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -91,34 +91,39 @@ void flush_icache_pte(pte_t pte)
> >  unsigned int riscv_cbom_block_size;
> >  EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> >  
> > +static void cbo_get_block_size(struct device_node *node,
> > +			       const char *name, u32 *blksz,
> 
> Is there a reason you called this "blksz" when we are using the spelt
> out "block_size" everywhere else in this code? My OCD would appreciate
> the consistency :s

I just tend to prefer shorter names for local, short-lived variables
as it sometimes helps avoid line wrapping, but I'm fine with naming it
block_size as well and can do the rename for v2 if you'd like.

> 
> Other than that:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

> 
> > +			       unsigned long *first_hartid)
> > +{
> > +	unsigned long hartid;
> > +	u32 val;
> > +
> > +	if (riscv_of_processor_hartid(node, &hartid))
> > +		return;
> > +
> > +	if (of_property_read_u32(node, name, &val))
> > +		return;
> > +
> > +	if (!*blksz) {
> > +		*blksz = val;
> > +		*first_hartid = hartid;
> > +	} else if (*blksz != val) {
> > +		pr_warn("%s mismatched between harts %lu and %lu\n",
> > +			name, *first_hartid, hartid);
> > +	}
> > +}
> > +
> >  void riscv_init_cbom_blocksize(void)
> >  {
> >  	struct device_node *node;
> >  	unsigned long cbom_hartid;
> > -	u32 val, probed_block_size;
> > -	int ret;
> > +	u32 probed_block_size;
> >  
> >  	probed_block_size = 0;
> >  	for_each_of_cpu_node(node) {
> > -		unsigned long hartid;
> > -
> > -		ret = riscv_of_processor_hartid(node, &hartid);
> > -		if (ret)
> > -			continue;
> > -
> >  		/* set block-size for cbom extension if available */
> > -		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> > -		if (ret)
> > -			continue;
> > -
> > -		if (!probed_block_size) {
> > -			probed_block_size = val;
> > -			cbom_hartid = hartid;
> > -		} else {
> > -			if (probed_block_size != val)
> > -				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> > -					cbom_hartid, hartid);
> > -		}
> > +		cbo_get_block_size(node, "riscv,cbom-block-size",
> > +				   &probed_block_size, &cbom_hartid);
> >  	}
> >  
> >  	if (probed_block_size)
> > -- 
> > 2.37.3
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv


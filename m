From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 1 Feb 2024 15:21:50 +0100
Subject: [kvm-unit-tests PATCH v2 16/24] arm/arm64: Share memregions
In-Reply-To: <730ca018-cb7b-4ef8-b544-7afdfce03bc8@redhat.com>
References: <20240126142324.66674-26-andrew.jones@linux.dev>
 <20240126142324.66674-42-andrew.jones@linux.dev>
 <730ca018-cb7b-4ef8-b544-7afdfce03bc8@redhat.com>
Message-ID: <20240201-522cd6aa1f8162c0c50f63b0@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 01, 2024 at 01:03:54PM +0100, Eric Auger wrote:
> Hi Drew,
> 
> On 1/26/24 15:23, Andrew Jones wrote:
...
> > -static void mem_regions_add_assumed(void)
> > -{
> > -	phys_addr_t code_end = (phys_addr_t)(unsigned long)&_etext;
> > -	struct mem_region *r;
> > -
> > -	r = mem_region_find(code_end - 1);
> > -	assert(r);
> > +	struct mem_region *code, *data;
> >  
> >  	/* Split the region with the code into two regions; code and data */
> > -	mem_region_add(&(struct mem_region){
> > -		.start = code_end,
> > -		.end = r->end,
> > -	});
> > -	*r = (struct mem_region){
> > -		.start = r->start,
> > -		.end = code_end,
> > -		.flags = MR_F_CODE,
> > -	};
> > +	memregions_split((unsigned long)&_etext, &code, &data);
> > +	assert(code);
> > +	code->flags |= MR_F_CODE;
> I think this would deserve to be split into several patches, esp. this
> change in the implementation of
> 
> mem_regions_add_assumed and the init changes. At the moment this is pretty difficult to review
>

Darn, you called me out on this one :-) I had a feeling I should split out
the introduction of memregions_split(), since it was sneaking a bit more
into the patch than just code motion as advertised, but then I hoped I
get away with putting a bit more burden on the reviewer instead. If you
haven't already convinced yourself that the new function is equivalent to
the old code, then I'll respin with the splitting and also create a new
patch for the 'mem_region' to 'memregions' rename while at it (so there
will be three patches instead of one). But, if you're already good with
it, then I'll leave it as is, since patch splitting is a pain...

Thanks,
drew


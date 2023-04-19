From: Conor Dooley <conor@kernel.org>
Date: Wed, 19 Apr 2023 16:42:03 -0000
Subject: [RFC PATCH 03/14] RISC-V: paravirt: Implement steal-time support
In-Reply-To: <stn3ql2b5s6fkfo7udn4dcylyidbayiodfqvccrbgno2vylqwt@bi2ft2lv6crd>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-4-ajones@ventanamicro.com>
 <20230418-earthlike-estrogen-a8ca785b382a@spud>
 <stn3ql2b5s6fkfo7udn4dcylyidbayiodfqvccrbgno2vylqwt@bi2ft2lv6crd>
Message-ID: <20230419-manned-rephrase-3c87ca95b434@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 19, 2023 at 10:24:27AM +0200, Andrew Jones wrote:
> On Tue, Apr 18, 2023 at 08:02:06PM +0100, Conor Dooley wrote:
> > On Mon, Apr 17, 2023 at 12:33:51PM +0200, Andrew Jones wrote:
> > 
> > > +static int pv_time_cpu_online(unsigned int cpu)
> > > +{
> > > +	struct sbi_sta_struct *st = this_cpu_ptr(&steal_time);
> > > +	phys_addr_t pa = __pa(st);
> > > +	unsigned long lo = (unsigned long)pa;
> > > +	unsigned long hi = IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)pa) : 0;
> > > +
> > > +	return sbi_sta_set_steal_time_shmem(lo, hi, 0);
> > > +}
> > > +
> > >  static int pv_time_cpu_down_prepare(unsigned int cpu)
> > >  {
> > > -	return 0;
> > > +	return sbi_sta_set_steal_time_shmem(-1, -1, 0);
> > 
> > I'm not really a fan of this -1s without an explanation of what passing
> > -1 to the ecall does.
> > 
> > >  }
> > >  
> > >  static u64 pv_time_steal_clock(int cpu)
> > >  {
> > > -	return 0;
> > > +	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
> > > +	u32 sequence;
> > > +	u64 steal;
> > > +
> > > +	do {
> > > +		sequence = st->sequence;
> > > +		virt_rmb();
> > > +		steal = st->steal;
> > > +		virt_rmb();
> > > +	} while ((sequence & 1) || (sequence != st->sequence));
> > 
> > Call me a bit anal, but should we yoink your:
> > | The supervisor-mode software MUST check this field
> > | before and after reading the `steal` field, and
> > | repeat the read if they are different or odd
> > and add it here so that is it immediately obvious without reading the
> > SBI spec what is going on here? Or it is a case of "go read the SBI spec
> > if you have questions about what the kernel is doing w/ SBI stuff?
> > 
> > (sidenote, s/they are/it is/?)
> 
> Thanks, I updated the spec for its v3 posting. Before posting v3,
> I'd be happy to take more comments on it over on its v2 posting.

I did read it last week or whenever you sent it, but didn't feel
qualified to give an opinion on the content nor did I notice that
grammaro.

I'd have replied there, but I was too lazy to dump your mail from there
into a format readable by a decent mail client. I should just sign up
there with this email address instead.

> > Guess both of my comments are in the same vein, but would make
> > at-a-glance understanding easier IMO.
> 
> I'm inclined to say "go read the spec" for everything, since the KVM
> implementation would otherwise also require several comments which
> duplicate the spec, but I'm also OK with adding the comments you've
> suggested here. I'll do that for rfc-v2.

I don't really have strong feelings, the magic -1s can be explained away
with a define so they're sortable without cogging stuff from the spec.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230419/2c748fe9/attachment-0001.sig>

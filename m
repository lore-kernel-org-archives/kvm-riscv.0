From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 27 Apr 2023 12:17:02 +0200
Subject: [PATCH] RISC-V: Align SBI probe implementation with spec
In-Reply-To: <20230427-property-barracuda-631a14371df0@wendy>
References: <20230426172254.70342-1-ajones@ventanamicro.com>
 <20230427-property-barracuda-631a14371df0@wendy>
Message-ID: <ryknbllu75eliur7v6tzei6jvqgwayuhej5icobxxrqwabymhz@lnnqmlrqxvex>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 27, 2023 at 10:42:11AM +0100, Conor Dooley wrote:
> On Wed, Apr 26, 2023 at 07:22:54PM +0200, Andrew Jones wrote:
> > sbi_probe_extension() is specified with "Returns 0 if the given SBI
> > extension ID (EID) is not available, or 1 if it is available unless
> > defined as any other non-zero value by the implementation."
> > Additionally, sbiret.value is a long. Fix the implementation to
> > ensure any nonzero long value is considered a success, rather
> > than only positive int values.
> 
> Does this need a fixes tag (or tags) then, since we could easily return
> a negative value as things stand if the SBI implementation decides to
> return 0b1...1 for success?

Nothing is getting fixed when only considering the current generic opensbi
platform, but there could be other SBI implementations Linux isn't
handling correctly by only considering success to be greater than zero
or by truncating the return value from long to int. I suppose that
possibility does warrant a fix tag, which would be

Fixes: b9dcd9e41587 ("RISC-V: Add basic support for SBI v0.2")

> 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/sbi.h        |  2 +-
> >  arch/riscv/kernel/cpu_ops.c         |  2 +-
> >  arch/riscv/kernel/sbi.c             | 17 ++++++++---------
> >  arch/riscv/kvm/main.c               |  2 +-
> >  drivers/cpuidle/cpuidle-riscv-sbi.c |  2 +-
> >  drivers/perf/riscv_pmu_sbi.c        |  2 +-
> >  6 files changed, 13 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 945b7be249c1..119355485703 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -296,7 +296,7 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
> >  				unsigned long start,
> >  				unsigned long size,
> >  				unsigned long asid);
> > -int sbi_probe_extension(int ext);
> > +long sbi_probe_extension(int ext);
> >  
> >  /* Check if current SBI specification version is 0.1 or not */
> >  static inline int sbi_spec_is_0_1(void)
> > diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> > index 8275f237a59d..eb479a88a954 100644
> > --- a/arch/riscv/kernel/cpu_ops.c
> > +++ b/arch/riscv/kernel/cpu_ops.c
> > @@ -27,7 +27,7 @@ const struct cpu_operations cpu_ops_spinwait = {
> >  void __init cpu_set_ops(int cpuid)
> >  {
> >  #if IS_ENABLED(CONFIG_RISCV_SBI)
> > -	if (sbi_probe_extension(SBI_EXT_HSM) > 0) {
> > +	if (sbi_probe_extension(SBI_EXT_HSM)) {
> >  		if (!cpuid)
> >  			pr_info("SBI HSM extension detected\n");
> >  		cpu_ops[cpuid] = &cpu_ops_sbi;
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index 5c87db8fdff2..015ce8eef2de 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -581,19 +581,18 @@ static void sbi_srst_power_off(void)
> >   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
> >   * @extid: The extension ID to be probed.
> >   *
> > - * Return: Extension specific nonzero value f yes, -ENOTSUPP otherwise.
> > + * Return: 1 or an extension specific nonzero value if yes, 0 otherwise.
> >   */
> > -int sbi_probe_extension(int extid)
> > +long sbi_probe_extension(int extid)
> >  {
> >  	struct sbiret ret;
> >  
> >  	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
> >  			0, 0, 0, 0, 0);
> >  	if (!ret.error)
> > -		if (ret.value)
> > -			return ret.value;
> > +		return ret.value;
> >  
> > -	return -ENOTSUPP;
> > +	return 0;
> 
> Why not make it return -ENOTSUPP for failures and 0 for success instead,
> as it does not appear that any users actually care what the return value
> is, once it is not an error?

Just to prepare for theoretical new uses.

> Concerned that it'll look weird to have
> 	if(!sbi_probe_extension(foo))
> 		print(foo is available!)
> since it looks a bit weird that the !case is success?

No, that's pretty par for the course in the kernel. I'd just prefer
that sbi_probe_extension() be a simple wrapper around the SBI call,
one that doesn't change the SBI call's return value semantics.

> 
> If so, perhaps it could just return a bool instead, unless of course I
> am missing some pending user that make some decision on the actual value
> returned here is.

No pending user that I'm aware of, but it's not too awkward, IMO, to
implement this as the spec says, so any pending user that comes along
will be happy from the start. If a boolean function seems better for
everyone, then I'd probably extend this patch to also rename this
sbi_probe_extension to __sbi_probe_extension, make it static, and
then add

 bool sbi_probe_extension(int extid)
 {
   return __sbi_probe_extension(extid);
 }

just to feel good about the wrapper!

Thanks,
drew


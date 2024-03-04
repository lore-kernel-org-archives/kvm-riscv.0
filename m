From: Carlos Maiolino <cem@kernel.org>
Date: Mon, 4 Mar 2024 11:52:21 +0100
Subject: [PATCH 2/6] riscv: Factor out environment variable check
In-Reply-To: <20240301-69d98d6c8972be7aef0bdcf1@orel>
References: <20240229124246.309304-1-cem@kernel.org>
 <20240229124246.309304-3-cem@kernel.org>
 <sgz2rVSuyDltLq-P3bBani55wl9oJHEyQLVArtG4cFe1hb4rmcpMjaGNkZt1_Q0-BziLUOVraqW3-ciwuGvimg==@protonmail.internalid>
 <20240301-69d98d6c8972be7aef0bdcf1@orel>
Message-ID: <dn7ifj2qcyhzvgkc5tql2enfdnx2c255nxw36irqn2ygggpl62@l6v3nshcpwy3>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 01, 2024 at 09:28:58AM +0100, Andrew Jones wrote:
> On Thu, Feb 29, 2024 at 01:42:08PM +0100, cem at kernel.org wrote:
> > From: Carlos Maiolino <cem@kernel.org>
> >
> > Environment variables are checked all the time, so use a helper for that
> >
> > Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> > ---
> >  riscv/sbi.c | 49 +++++++++++++++++++++++++++++--------------------
> >  1 file changed, 29 insertions(+), 20 deletions(-)
> >
> > diff --git a/riscv/sbi.c b/riscv/sbi.c
> > index 9dc82ecb..636f907a 100644
> > --- a/riscv/sbi.c
> > +++ b/riscv/sbi.c
> > @@ -14,6 +14,23 @@ static void help(void)
> >  	puts("An environ must be provided where expected values are given.\n");
> >  }
> >
> > +static bool env_is_defined(const char *env)
> 
> The function name doesn't imply anything about the report_skip side
> effect, which is actually the important part of the function. Maybe
> name it something like env_or_skip()?
> 
> > +{
> > +
> > +	if (!getenv(env)) {
> > +		report_skip("missing %s environment variable", env);
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static void gen_report(struct sbiret *ret, long expected)
> > +{
> > +	report(!ret->error, "no sbi.error");
> > +	report(ret->value == expected, "expected sbi.value");
> > +}
> 
> This refactoring isn't called out in the commit message.

Sorry, I did this in a separated patch, and through a few rebases I accidentally
squashed the patch together on this one. I don't think this needs a new patch,
so I'll just update the commit message to also mention this refactoring.

I'll fix it and send it on the V2.

Thanks for the reviews.
Carlos

> 
> > +
> >  static void check_base(void)
> >  {
> >  	struct sbiret ret;
> > @@ -21,34 +38,26 @@ static void check_base(void)
> >
> >  	report_prefix_push("base");
> >
> > -	if (!getenv("MVENDORID")) {
> > -		report_skip("mvendorid: missing MVENDORID environment variable");
> > -		return;
> > -	}
> > -
> >  	report_prefix_push("mvendorid");
> > -	expected = strtol(getenv("MVENDORID"), NULL, 0);
> > +	if (env_is_defined("MVENDORID")) {
> > +		expected = strtol(getenv("MVENDORID"), NULL, 0);
> >
> > -	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID,
> > -			0, 0, 0, 0, 0, 0);
> > +		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID,
> > +				0, 0, 0, 0, 0, 0);
> >
> > -	report(!ret.error, "no sbi.error");
> > -	report(ret.value == expected, "expected sbi.value");
> > -	report_prefix_pop();
> > -
> > -	if (!getenv("PROBE_EXT")) {
> > -		report_skip("probe_ext: missing PROBE_EXT environment variable");
> > -		return;
> > +		gen_report(&ret, expected);
> >  	}
> > +	report_prefix_pop();
> >
> >  	report_prefix_push("probe_ext");
> > -	expected = strtol(getenv("PROBE_EXT"), NULL, 0);
> > +	if (env_is_defined("PROBE_EXT")) {
> > +		expected = strtol(getenv("PROBE_EXT"), NULL, 0);
> >
> > -	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT,
> > -			SBI_EXT_BASE, 0, 0, 0, 0, 0);
> > +		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT,
> > +				SBI_EXT_BASE, 0, 0, 0, 0, 0);
> >
> > -	report(!ret.error, "no sbi.error");
> > -	report(ret.value == expected, "expected sbi.value");
> > +		gen_report(&ret, expected);
> > +	}
> >  	report_prefix_pop();
> >
> >  	report_prefix_pop();
> > --
> > 2.43.2
> >
> 
> Thanks,
> drew
> 
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv


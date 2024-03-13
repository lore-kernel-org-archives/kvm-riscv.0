From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Mar 2024 12:28:38 +0100
Subject: [PATCH V2 5/6] riscv: Test for specific SBI implementation ID
In-Reply-To: <20240313-852a2b0acf59e8205d0ec9d0@orel>
References: <20240313084644.277426-1-cem@kernel.org>
 <20240313084644.277426-6-cem@kernel.org>
 <20240313-852a2b0acf59e8205d0ec9d0@orel>
Message-ID: <20240313-3a53954ccc7c366414e6b93b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 13, 2024 at 12:23:38PM +0100, Andrew Jones wrote:
> On Wed, Mar 13, 2024 at 09:46:23AM +0100, cem at kernel.org wrote:
> > From: Carlos Maiolino <cem@kernel.org>
> > 
> > Retrieve the ID from the SBI, and test it against the SBI_IMPLID
> > enviroment variable.
> > 
> > Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> > V2:
> > 	- Update commit description to fit 70 chars
> > 	- Move sbi_ecall() after expected assignment to make consistent with
> > 	  other tests
> > 
> >  riscv/sbi.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/riscv/sbi.c b/riscv/sbi.c
> > index bc0f5c68..65492fd6 100644
> > --- a/riscv/sbi.c
> > +++ b/riscv/sbi.c
> > @@ -51,6 +51,15 @@ static void check_base(void)
> >  	}
> >  	report_prefix_pop();
> >  
> > +	report_prefix_push("sbi_impl_id");
> > +	if (env_or_skip("SBI_IMPLID")) {
> 
> Let's spell this SBI_IMPL_ID (just like its report prefix)

Actually, let's drop the SBI_ from the name (both report prefix and
environment variable) to be consistent with the other tests. Or, only
drop sbi_ from the report prefix (since we have the 'sbi' prefix already)
and add SBI_ to all the other environment variables.

> 
> > +		expected = strtol(getenv("SBI_IMPLID"), NULL, 0);
> > +		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID,
> > +				SBI_EXT_BASE, 0, 0, 0, 0, 0);
> 
> This should be
> 
>   sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID, 0, ...)
> 
> > +		gen_report(&ret, 0, expected);
> > +	}
> > +	report_prefix_pop();
> > +
> >  	report_prefix_push("probe_ext");
> >  	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
> >  	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE, 0, 0, 0, 0, 0);
> > -- 
> > 2.44.0
> >
> 
> Thanks,
> drew


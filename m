From: Carlos Maiolino <cem@kernel.org>
Date: Thu, 14 Mar 2024 09:59:22 +0100
Subject: [PATCH V4 6/6] riscv: Test for specific SBI implementation ID
In-Reply-To: <20240314-5051124b0a3f37a605e09671@orel>
References: <20240313215106.325766-1-cem@kernel.org>
 <20240313215106.325766-7-cem@kernel.org>
 <tuafCvSh6xKdIyQHp60pHS4MSq-KAymqaMZWCszycPQN-0ZVQekBgV9ctIi5QtygZyaOIBS-FxNbGZTQcIsfQw==@protonmail.internalid>
 <20240314-5051124b0a3f37a605e09671@orel>
Message-ID: <boexdc2prnsugsfhmksryld27pl5ueb7agtgy3v35x5h3elk26@iqtw7diy2l7e>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 14, 2024 at 09:46:02AM +0100, Andrew Jones wrote:
> On Wed, Mar 13, 2024 at 10:50:57PM +0100, cem at kernel.org wrote:
> > From: Carlos Maiolino <cem@kernel.org>
> >
> > Retrieve the ID from the SBI, and test it against the IMPL_ID
> > enviroment variable.
> >
> > Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> >
> > ---
> > V4:
> > 	- Definitely update to use __base_sbi_ecall
> > V3:
> > 	- Update to use __base_sbi_ecall (also fixes the correct paramenters)
> > 	- Rename env var to IMPL_ID to match the other tests
> > V2:
> > 	- Update commit description to fit 70 chars
> > 	- Move sbi_ecall() after expected assignment to make consistent with
> > 	  other tests
> >
> >  riscv/sbi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/riscv/sbi.c b/riscv/sbi.c
> > index 043beb04..2a4002df 100644
> > --- a/riscv/sbi.c
> > +++ b/riscv/sbi.c
> > @@ -58,6 +58,14 @@ static void check_base(void)
> >  	}
> >  	report_prefix_pop();
> >
> > +	report_prefix_push("impl_id");
> > +	if (env_or_skip("IMPL_ID")) {
> > +		expected = strtol(getenv("IMPL_ID"), NULL, 0);
> > +		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_IMP_ID, 0);
> > +		gen_report(&ret, 0, expected);
> > +	}
> > +	report_prefix_pop();
> > +
> >  	report_prefix_push("probe_ext");
> >  	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
> >  	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE);
> > --
> > 2.44.0
> >
> 
> I adjusted the order of the tests to match the function order in the spec
> while queuing.
> 

Sounds good, thanks!
Carlos


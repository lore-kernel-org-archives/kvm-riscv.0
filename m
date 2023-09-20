From: Xu, Haibo1 <haibo1.xu@intel.com>
Date: Wed, 20 Sep 2023 15:41:41 +0000
Subject: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should
 never fail
In-Reply-To: <20230920-326d0d84a57240dcebca6277@orel>
References: <20230920143713.6896-2-ajones@ventanamicro.com>
 <BY5PR11MB3909D011A5633AF7496CFFDCB0F9A@BY5PR11MB3909.namprd11.prod.outlook.com>
 <20230920-326d0d84a57240dcebca6277@orel>
Message-ID: <BY5PR11MB39096DF33476CEED1BCAF879B0F9A@BY5PR11MB3909.namprd11.prod.outlook.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Wednesday, September 20, 2023 11:28 PM
> To: Xu, Haibo1 <haibo1.xu@intel.com>
> Cc: kvm-riscv at lists.infradead.org; linux-riscv at lists.infradead.org;
> anup at brainfault.org; atishp at atishpatra.org; paul.walmsley at sifive.com;
> palmer at dabbelt.com; aou at eecs.berkeley.edu
> Subject: Re: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should never
> fail
> 
> On Wed, Sep 20, 2023 at 02:59:07PM +0000, Xu, Haibo1 wrote:
> > > -----Original Message-----
> > > From: Andrew Jones <ajones@ventanamicro.com>
> > > Sent: Wednesday, September 20, 2023 10:37 PM
> > > To: kvm-riscv at lists.infradead.org; linux-riscv at lists.infradead.org
> > > Cc: anup at brainfault.org; atishp at atishpatra.org; Xu, Haibo1
> > > <haibo1.xu@intel.com>; paul.walmsley at sifive.com; palmer at dabbelt.com;
> > > aou at eecs.berkeley.edu
> > > Subject: [PATCH] KVM: riscv: selftests: get-reg-list print_reg
> > > should never fail
> > >
> > > When outputting the "new" register list we want to print all of the
> > > new registers, decoding as much as possible of each of them. Also,
> > > we don't want to assert while listing registers with '--list'. We
> > > output
> > > "/* UNKNOWN */" after each new register (which we were already doing
> > > for some), which should be enough.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  .../selftests/kvm/riscv/get-reg-list.c        | 93 +++++++++----------
> > >  1 file changed, 42 insertions(+), 51 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > index 85907c86b835..054706538b9e 100644
> > > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > @@ -112,11 +112,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu,
> > > struct vcpu_reg_list *c)
> > >  	}
> > >  }
> > >
> > > -static const char *config_id_to_str(__u64 id)
> > > +static const char *config_id_to_str(const char *prefix, __u64 id)
> > >  {
> > >  	/* reg_off is the offset into struct kvm_riscv_config */
> > >  	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CONFIG);
> > >
> > > +	assert((id & KVM_REG_RISCV_TYPE_MASK) ==
> > > KVM_REG_RISCV_CONFIG);
> > > +
> >
> > I think we can skip this kind of assert test since the function was reached by:
> >
> > switch (id & KVM_REG_RISCV_TYPE_MASK) {
> >      case KVM_REG_RISCV_CONFIG:
> 
> The assert is to ensure developers don't call it from anywhere else, where they
> may not have already confirmed the register type. And, that's why it's an
> 'assert' instead of a 'TEST_ASSERT'. It's for developers, not test results.
> 

Yes, it's helpful to avoid abusing this kind of APIs.
 
Reviewed-by: Haibo Xu <haibo1.xu@intel.com>

> Thanks,
> drew


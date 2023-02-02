From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 2 Feb 2023 16:16:41 +0100
Subject: [PATCH v4 04/14] RISC-V: KVM: Define a probe function for SBI
 extension data structures
In-Reply-To: <20230202151433.kspo2g7cqsccoqsq@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-5-atishp@rivosinc.com>
 <20230202151433.kspo2g7cqsccoqsq@orel>
Message-ID: <20230202151641.6edhtlf7fz7xsmdy@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 02, 2023 at 04:14:35PM +0100, Andrew Jones wrote:
> On Wed, Feb 01, 2023 at 03:12:40PM -0800, Atish Patra wrote:
> > Currently the probe function just checks if an SBI extension is
> > registered or not. However, the extension may not want to advertise
> > itself depending on some other condition.
> > An additional extension specific probe function will allow
> > extensions to decide if they want to be advertised to the caller or
> > not. Any extension that does not require additional dependency checks
> > can avoid implementing this function.
> > 
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
> >  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > index f79478a..45ba341 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > @@ -29,6 +29,9 @@ struct kvm_vcpu_sbi_extension {
> >  	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >  		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
> >  		       bool *exit);
> > +
> > +	/* Extension specific probe function */
> > +	unsigned long (*probe)(struct kvm_vcpu *vcpu);
> >  };
> >  
> >  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> > diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> > index 5d65c63..846d518 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_base.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> > @@ -19,6 +19,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >  {
> >  	int ret = 0;
> >  	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> > +	const struct kvm_vcpu_sbi_extension *sbi_ext;
> >  
> >  	switch (cp->a6) {
> >  	case SBI_EXT_BASE_GET_SPEC_VERSION:
> > @@ -43,8 +44,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >  			 */
> >  			kvm_riscv_vcpu_sbi_forward(vcpu, run);
> >  			*exit = true;
> > -		} else
> > -			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
> > +		} else {
> > +			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
> > +			if (sbi_ext) {
> > +				if (sbi_ext->probe)
> > +					*out_val = sbi_ext->probe(vcpu);
> > +				else
> > +					*out_val = 1;
> > +			} else
> > +				*out_val = 0;
> 
> Conor points out elsewhere that we need {} on both arms if one arm needs
> it. We actually don't need {} on either arm, though, or even the if, if
> we rewrite as
> 
>  *out_val = sbi_ext && sbi_ext->probe ? sbi_ext->probe(vcpu) : !!sbi_ext;

I sent too soon, I meant to add

In any case,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


> 
> Thanks,
> drew
> 
> > +		}
> >  		break;
> >  	case SBI_EXT_BASE_GET_MVENDORID:
> >  		*out_val = vcpu->arch.mvendorid;
> > -- 
> > 2.25.1
> > 


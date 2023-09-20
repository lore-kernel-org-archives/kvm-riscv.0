From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Sep 2023 09:10:19 +0200
Subject: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA
 registers
In-Reply-To: <20230920-d524c40b616536d0ad8213c3@orel>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-5-apatel@ventanamicro.com>
 <20230920-d524c40b616536d0ad8213c3@orel>
Message-ID: <20230920-c1362aebecf7ef8e36489efa@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 20, 2023 at 07:24:16AM +0200, Andrew Jones wrote:
> On Mon, Sep 18, 2023 at 11:36:46PM +0530, Anup Patel wrote:
> > Currently the AIA ONE_REG registers are reported by get-reg-list
> > as new registers for various vcpu_reg_list configs whenever Ssaia
> > is available on the host because Ssaia extension can only be
> > disabled by Smstateen extension which is not always available.
> > 
> > To tackle this, we should filter-out AIA ONE_REG registers only
> > when Ssaia can't be disabled for a VCPU.
> > 
> > Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../selftests/kvm/riscv/get-reg-list.c        | 23 +++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > index 76c0ad11e423..85907c86b835 100644
> > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > @@ -12,6 +12,8 @@
> >  
> >  #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK)
> >  
> > +static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
> > +
> >  bool filter_reg(__u64 reg)
> >  {
> >  	switch (reg & ~REG_MASK) {
> > @@ -48,6 +50,15 @@ bool filter_reg(__u64 reg)
> >  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
> >  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
> >  		return true;
> > +	/* AIA registers are always available when Ssaia can't be disabled */
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(sieh):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
> > +		return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA] ? true : false;
> 
> No need for the '? true : false'
> 
> >  	default:
> >  		break;
> >  	}
> > @@ -71,14 +82,22 @@ static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> >  
> >  void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> >  {
> > +	int rc;
> >  	struct vcpu_reg_sublist *s;
> > +	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
> 
> nit: I think we prefer reverse xmas tree in kselftests, but whatever.
> 
> > +
> > +	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
> > +		__vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(i), &isa_ext_state[i]);
> >  
> >  	/*
> >  	 * Disable all extensions which were enabled by default
> >  	 * if they were available in the risc-v host.
> >  	 */
> > -	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
> > -		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
> > +	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
> > +		rc = __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
> > +		if (rc && isa_ext_state[i])
> 
> How helpful is it to check that isa_ext_state[i] isn't zero? The value of
> the register could be zero, right? Shouldn't we instead capture the return
> values from __vcpu_get_reg and if the return value is zero for a get,
> but nonzero for a set, then we know we have it, but can't disable it.

Eh, never mind. After sending this, I felt like there was something fishy
about my interpretation of how this works, so I took a second look. The
patch is correct as is, since we're checking for when the ISA extension
is present, but we can't disable it (just like it says it's doing :-) I
was thinking too much about AIA registers and not ISA extension registers.

> 
> > +			isa_ext_cant_disable[i] = true;
> > +	}
> >  
> >  	for_each_sublist(c, s) {
> >  		if (!s->feature)
> > -- 
> > 2.34.1
> >
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


From: Oliver Upton <oupton@google.com>
Date: Thu, 24 Feb 2022 19:21:50 +0000
Subject: [PATCH v3 03/19] KVM: arm64: Reject invalid addresses for CPU_ON
 PSCI call
In-Reply-To: <87zgmg30qu.wl-maz@kernel.org>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-4-oupton@google.com>
 <87zgmg30qu.wl-maz@kernel.org>
Message-ID: <YhfaztgV0GHzyh24@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Marc,

On Thu, Feb 24, 2022 at 12:30:49PM +0000, Marc Zyngier wrote:
> On Wed, 23 Feb 2022 04:18:28 +0000,
> Oliver Upton <oupton@google.com> wrote:
> > 
> > DEN0022D.b 5.6.2 "Caller responsibilities" states that a PSCI
> > implementation may return INVALID_ADDRESS for the CPU_ON call if the
> > provided entry address is known to be invalid. There is an additional
> > caveat to this rule. Prior to PSCI v1.0, the INVALID_PARAMETERS error
> > is returned instead. Check the guest's PSCI version and return the
> > appropriate error if the IPA is invalid.
> > 
> > Reported-by: Reiji Watanabe <reijiw@google.com>
> > Signed-off-by: Oliver Upton <oupton@google.com>
> > ---
> >  arch/arm64/kvm/psci.c | 24 ++++++++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> > index a0c10c11f40e..de1cf554929d 100644
> > --- a/arch/arm64/kvm/psci.c
> > +++ b/arch/arm64/kvm/psci.c
> > @@ -12,6 +12,7 @@
> >  
> >  #include <asm/cputype.h>
> >  #include <asm/kvm_emulate.h>
> > +#include <asm/kvm_mmu.h>
> >  
> >  #include <kvm/arm_psci.h>
> >  #include <kvm/arm_hypercalls.h>
> > @@ -70,12 +71,31 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
> >  	struct vcpu_reset_state *reset_state;
> >  	struct kvm *kvm = source_vcpu->kvm;
> >  	struct kvm_vcpu *vcpu = NULL;
> > -	unsigned long cpu_id;
> > +	unsigned long cpu_id, entry_addr;
> >  
> >  	cpu_id = smccc_get_arg1(source_vcpu);
> >  	if (!kvm_psci_valid_affinity(source_vcpu, cpu_id))
> >  		return PSCI_RET_INVALID_PARAMS;
> >  
> > +	/*
> > +	 * Basic sanity check: ensure the requested entry address actually
> > +	 * exists within the guest's address space.
> > +	 */
> > +	entry_addr = smccc_get_arg2(source_vcpu);
> > +	if (!kvm_ipa_valid(kvm, entry_addr)) {
> > +
> > +		/*
> > +		 * Before PSCI v1.0, the INVALID_PARAMETERS error is returned
> > +		 * instead of INVALID_ADDRESS.
> > +		 *
> > +		 * For more details, see ARM DEN0022D.b 5.6 "CPU_ON".
> > +		 */
> > +		if (kvm_psci_version(source_vcpu) < KVM_ARM_PSCI_1_0)
> > +			return PSCI_RET_INVALID_PARAMS;
> > +		else
> > +			return PSCI_RET_INVALID_ADDRESS;
> > +	}
> > +
> 
> If you're concerned with this, should you also check for the PC
> alignment, or the presence of a memslot covering the address you are
> branching to?  Le latter is particularly hard to implement reliably.

Andrew, Reiji and I had a conversation regarding exactly this on the
last run of this series, and concluded that checking against the IPA is
probably the best KVM can do [1]. That said, alignment is also an easy
thing to check.

> So far, my position has been that the guest is free to shoot itself in
> the foot if that's what it wants to do, and that babysitting it was a
> waste of useful bits! ;-)
>

Agreed -- there are plenty of spectacular/hilarious ways in which the
guest can mess up :-)

> Or have you identified something that makes it a requirement to handle
> this case (and possibly others)  in the hypervisor?

It is a lot easier to tell a guest that their software is broken if they
get an error back from the hypercall, whereas a vCPU off in the weeds
might need to be looked at before concluding there's a guest issue.


[1]: http://lore.kernel.org/r/20211005190153.dc2befzcisvznxq5 at gator.home

--
Oliver


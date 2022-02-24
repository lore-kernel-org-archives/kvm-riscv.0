From: Oliver Upton <oupton@google.com>
Date: Thu, 24 Feb 2022 22:08:15 +0000
Subject: [PATCH v3 06/19] KVM: arm64: Track vCPU power state using MP
 state values
In-Reply-To: <87y2202y8f.wl-maz@kernel.org>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-7-oupton@google.com>
 <87y2202y8f.wl-maz@kernel.org>
Message-ID: <YhgBz1/cgpoS3HuD@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Marc,

On Thu, Feb 24, 2022 at 01:25:04PM +0000, Marc Zyngier wrote:

[...]

> > @@ -190,7 +190,7 @@ static void kvm_prepare_system_event(struct kvm_vcpu *vcpu, u32 type)
> >  	 * re-initialized.
> >  	 */
> >  	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
> > -		tmp->arch.power_off = true;
> > +		tmp->arch.mp_state = KVM_MP_STATE_STOPPED;
> >  	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
> >  
> >  	memset(&vcpu->run->system_event, 0, sizeof(vcpu->run->system_event));
> 
> You also may want to initialise the mp_state to RUNNABLE by default in
> kvm_arch_vcpu_create(). We are currently relying on power_off to be
> false thanks to the vcpu struct being zeroed, but we may as well make
> it clearer (RUNNABLE is also 0, so there is no actual bug here).

We unconditionally initialize power_off in
kvm_arch_vcpu_ioctl_vcpu_init(), and do the same in this patch for mp_state,
depending on if KVM_ARM_VCPU_POWER_OFF is set.

Any objections to leaving that as-is? I can move the RUNNABLE case into
kvm_arch_vcpu_create() as you've suggested, too.

--
Thanks,
Oliver


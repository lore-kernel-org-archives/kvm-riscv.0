From: Marc Zyngier <maz@kernel.org>
Date: Thu, 24 Feb 2022 13:25:04 +0000
Subject: [PATCH v3 06/19] KVM: arm64: Track vCPU power state using MP
 state values
In-Reply-To: <20220223041844.3984439-7-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-7-oupton@google.com>
Message-ID: <87y2202y8f.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 23 Feb 2022 04:18:31 +0000,
Oliver Upton <oupton@google.com> wrote:
> 
> A subsequent change to KVM will add support for additional power states.
> Store the MP state by value rather than keeping track of it as a
> boolean.
> 
> No functional change intended.
> 
> Signed-off-by: Oliver Upton <oupton@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h |  5 +++--
>  arch/arm64/kvm/arm.c              | 22 ++++++++++++----------
>  arch/arm64/kvm/psci.c             | 10 +++++-----
>  3 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index cacc9efd2e70..3e8bfecaa95b 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -350,8 +350,8 @@ struct kvm_vcpu_arch {
>  		u32	mdscr_el1;
>  	} guest_debug_preserved;
>  
> -	/* vcpu power-off state */
> -	bool power_off;
> +	/* vcpu power state */
> +	u32 mp_state;

nit: why don't you just carry a kvm_mp_state structure instead of
open-coding a u32? Same size, stronger typing.

>  
>  	/* Don't run the guest (internal implementation need) */
>  	bool pause;
> @@ -800,5 +800,6 @@ static inline void kvm_hyp_reserve(void) { }
>  #endif
>  
>  void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
> +bool kvm_arm_vcpu_powered_off(struct kvm_vcpu *vcpu);
>  
>  #endif /* __ARM64_KVM_HOST_H__ */
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 07c6a176cdcc..b4987b891f38 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -428,18 +428,20 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  
>  void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
>  {
> -	vcpu->arch.power_off = true;
> +	vcpu->arch.mp_state = KVM_MP_STATE_STOPPED;
>  	kvm_make_request(KVM_REQ_SLEEP, vcpu);
>  	kvm_vcpu_kick(vcpu);
>  }
>  
> +bool kvm_arm_vcpu_powered_off(struct kvm_vcpu *vcpu)
> +{
> +	return vcpu->arch.mp_state == KVM_MP_STATE_STOPPED;

nit: if we're fully embracing the MP_STATE concept, just renamed this
to kvm_arm_vcpu_stopped().

> +}
> +
>  int kvm_arch_vcpu_ioctl_get_mpstate(struct kvm_vcpu *vcpu,
>  				    struct kvm_mp_state *mp_state)
>  {
> -	if (vcpu->arch.power_off)
> -		mp_state->mp_state = KVM_MP_STATE_STOPPED;
> -	else
> -		mp_state->mp_state = KVM_MP_STATE_RUNNABLE;
> +	mp_state->mp_state = vcpu->arch.mp_state;
>
>  	return 0;
>  }
> @@ -451,7 +453,7 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
>  
>  	switch (mp_state->mp_state) {
>  	case KVM_MP_STATE_RUNNABLE:
> -		vcpu->arch.power_off = false;
> +		vcpu->arch.mp_state = mp_state->mp_state;
>  		break;
>  	case KVM_MP_STATE_STOPPED:
>  		kvm_arm_vcpu_power_off(vcpu);
> @@ -474,7 +476,7 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *v)
>  {
>  	bool irq_lines = *vcpu_hcr(v) & (HCR_VI | HCR_VF);
>  	return ((irq_lines || kvm_vgic_vcpu_pending_irq(v))
> -		&& !v->arch.power_off && !v->arch.pause);
> +		&& !kvm_arm_vcpu_powered_off(v) && !v->arch.pause);
>  }
>  
>  bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
> @@ -668,10 +670,10 @@ static void vcpu_req_sleep(struct kvm_vcpu *vcpu)
>  	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
>  
>  	rcuwait_wait_event(wait,
> -			   (!vcpu->arch.power_off) &&(!vcpu->arch.pause),
> +			   (!kvm_arm_vcpu_powered_off(vcpu)) && (!vcpu->arch.pause),
>  			   TASK_INTERRUPTIBLE);
>  
> -	if (vcpu->arch.power_off || vcpu->arch.pause) {
> +	if (kvm_arm_vcpu_powered_off(vcpu) || vcpu->arch.pause) {
>  		/* Awaken to handle a signal, request we sleep again later. */
>  		kvm_make_request(KVM_REQ_SLEEP, vcpu);
>  	}
> @@ -1181,7 +1183,7 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
>  	if (test_bit(KVM_ARM_VCPU_POWER_OFF, vcpu->arch.features))
>  		kvm_arm_vcpu_power_off(vcpu);
>  	else
> -		vcpu->arch.power_off = false;
> +		vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
>  
>  	return 0;
>  }
> diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> index e3f93b7f8d38..77a00913cdfd 100644
> --- a/arch/arm64/kvm/psci.c
> +++ b/arch/arm64/kvm/psci.c
> @@ -97,7 +97,7 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
>  	 */
>  	if (!vcpu)
>  		return PSCI_RET_INVALID_PARAMS;
> -	if (!vcpu->arch.power_off) {
> +	if (!kvm_arm_vcpu_powered_off(vcpu)) {
>  		if (kvm_psci_version(source_vcpu) != KVM_ARM_PSCI_0_1)
>  			return PSCI_RET_ALREADY_ON;
>  		else
> @@ -122,11 +122,11 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
>  
>  	/*
>  	 * Make sure the reset request is observed if the change to
> -	 * power_off is observed.
> +	 * mp_state is observed.

You want to expand this comment a bit, as this is not strictly a
binary state anymore.

>  	 */
>  	smp_wmb();
>  
> -	vcpu->arch.power_off = false;
> +	vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
>  	kvm_vcpu_wake_up(vcpu);
>  
>  	return PSCI_RET_SUCCESS;
> @@ -164,7 +164,7 @@ static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
>  		mpidr = kvm_vcpu_get_mpidr_aff(tmp);
>  		if ((mpidr & target_affinity_mask) == target_affinity) {
>  			matching_cpus++;
> -			if (!tmp->arch.power_off)
> +			if (!kvm_arm_vcpu_powered_off(tmp))
>  				return PSCI_0_2_AFFINITY_LEVEL_ON;
>  		}
>  	}
> @@ -190,7 +190,7 @@ static void kvm_prepare_system_event(struct kvm_vcpu *vcpu, u32 type)
>  	 * re-initialized.
>  	 */
>  	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
> -		tmp->arch.power_off = true;
> +		tmp->arch.mp_state = KVM_MP_STATE_STOPPED;
>  	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
>  
>  	memset(&vcpu->run->system_event, 0, sizeof(vcpu->run->system_event));

You also may want to initialise the mp_state to RUNNABLE by default in
kvm_arch_vcpu_create(). We are currently relying on power_off to be
false thanks to the vcpu struct being zeroed, but we may as well make
it clearer (RUNNABLE is also 0, so there is no actual bug here).

Otherwise, looks good.

	M.

-- 
Without deviation from the norm, progress is not possible.


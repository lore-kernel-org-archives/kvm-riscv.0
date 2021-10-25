From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Oct 2021 15:31:48 +0200
Subject: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out
 arch callback hook
In-Reply-To: <20211009021236.4122790-11-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-11-seanjc@google.com>
Message-ID: <9236e715-c471-e1c8-6117-6f37b908a6bd@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/10/21 04:12, Sean Christopherson wrote:
> Move the put and reload of the vGIC out of the block/unblock callbacks
> and into a dedicated WFI helper.  Functionally, this is nearly a nop as
> the block hook is called at the very beginning of kvm_vcpu_block(), and
> the only code in kvm_vcpu_block() after the unblock hook is to update the
> halt-polling controls, i.e. can only affect the next WFI.
> 
> Back when the arch (un)blocking hooks were added by commits 3217f7c25bca
> ("KVM: Add kvm_arch_vcpu_{un}blocking callbacks) and d35268da6687
> ("arm/arm64: KVM: arch_timer: Only schedule soft timer on vcpu_block"),
> the hooks were invoked only when KVM was about to "block", i.e. schedule
> out the vCPU.  The use case at the time was to schedule a timer in the
> host based on the earliest timer in the guest in order to wake the
> blocking vCPU when the emulated guest timer fired.  Commit accb99bcd0ca
> ("KVM: arm/arm64: Simplify bg_timer programming") reworked the timer
> logic to be even more precise, by waiting until the vCPU was actually
> scheduled out, and so move the timer logic from the (un)blocking hooks to
> vcpu_load/put.
> 
> In the meantime, the hooks gained usage for enabling vGIC v4 doorbells in
> commit df9ba95993b9 ("KVM: arm/arm64: GICv4: Use the doorbell interrupt
> as an unblocking source"), and added related logic for the VMCR in commit
> 5eeaf10eec39 ("KVM: arm/arm64: Sync ICH_VMCR_EL2 back when about to block").
> 
> Finally, commit 07ab0f8d9a12 ("KVM: Call kvm_arch_vcpu_blocking early
> into the blocking sequence") hoisted the (un)blocking hooks so that they
> wrapped KVM's halt-polling logic in addition to the core "block" logic.
> 
> In other words, the original need for arch hooks to take action _only_
> in the block path is long since gone.
> 
> Cc: Oliver Upton <oupton@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

This needs a word on why kvm_psci_vcpu_suspend does not need the hooks. 
  Or it needs to be changed to also use kvm_vcpu_wfi in the PSCI code, I 
don't know.

Marc, can you review and/or advise?

Thanks,

Paolo

> ---
>   arch/arm64/include/asm/kvm_emulate.h |  2 ++
>   arch/arm64/kvm/arm.c                 | 52 +++++++++++++++++++---------
>   arch/arm64/kvm/handle_exit.c         |  3 +-
>   3 files changed, 38 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index fd418955e31e..de8b4f5922b7 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -41,6 +41,8 @@ void kvm_inject_vabt(struct kvm_vcpu *vcpu);
>   void kvm_inject_dabt(struct kvm_vcpu *vcpu, unsigned long addr);
>   void kvm_inject_pabt(struct kvm_vcpu *vcpu, unsigned long addr);
>   
> +void kvm_vcpu_wfi(struct kvm_vcpu *vcpu);
> +
>   static __always_inline bool vcpu_el1_is_32bit(struct kvm_vcpu *vcpu)
>   {
>   	return !(vcpu->arch.hcr_el2 & HCR_RW);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 7838e9fb693e..1346f81b34df 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -359,27 +359,12 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>   
>   void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
>   {
> -	/*
> -	 * If we're about to block (most likely because we've just hit a
> -	 * WFI), we need to sync back the state of the GIC CPU interface
> -	 * so that we have the latest PMR and group enables. This ensures
> -	 * that kvm_arch_vcpu_runnable has up-to-date data to decide
> -	 * whether we have pending interrupts.
> -	 *
> -	 * For the same reason, we want to tell GICv4 that we need
> -	 * doorbells to be signalled, should an interrupt become pending.
> -	 */
> -	preempt_disable();
> -	kvm_vgic_vmcr_sync(vcpu);
> -	vgic_v4_put(vcpu, true);
> -	preempt_enable();
> +
>   }
>   
>   void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
>   {
> -	preempt_disable();
> -	vgic_v4_load(vcpu);
> -	preempt_enable();
> +
>   }
>   
>   void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> @@ -662,6 +647,39 @@ static void vcpu_req_sleep(struct kvm_vcpu *vcpu)
>   	smp_rmb();
>   }
>   
> +/**
> + * kvm_vcpu_wfi - emulate Wait-For-Interrupt behavior
> + * @vcpu:	The VCPU pointer
> + *
> + * Suspend execution of a vCPU until a valid wake event is detected, i.e. until
> + * the vCPU is runnable.  The vCPU may or may not be scheduled out, depending
> + * on when a wake event arrives, e.g. there may already be a pending wake event.
> + */
> +void kvm_vcpu_wfi(struct kvm_vcpu *vcpu)
> +{
> +	/*
> +	 * Sync back the state of the GIC CPU interface so that we have
> +	 * the latest PMR and group enables. This ensures that
> +	 * kvm_arch_vcpu_runnable has up-to-date data to decide whether
> +	 * we have pending interrupts, e.g. when determining if the
> +	 * vCPU should block.
> +	 *
> +	 * For the same reason, we want to tell GICv4 that we need
> +	 * doorbells to be signalled, should an interrupt become pending.
> +	 */
> +	preempt_disable();
> +	kvm_vgic_vmcr_sync(vcpu);
> +	vgic_v4_put(vcpu, true);
> +	preempt_enable();
> +
> +	kvm_vcpu_block(vcpu);
> +	kvm_clear_request(KVM_REQ_UNHALT, vcpu);
> +
> +	preempt_disable();
> +	vgic_v4_load(vcpu);
> +	preempt_enable();
> +}
> +
>   static int kvm_vcpu_initialized(struct kvm_vcpu *vcpu)
>   {
>   	return vcpu->arch.target >= 0;
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index 275a27368a04..4794563a506b 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -95,8 +95,7 @@ static int kvm_handle_wfx(struct kvm_vcpu *vcpu)
>   	} else {
>   		trace_kvm_wfx_arm64(*vcpu_pc(vcpu), false);
>   		vcpu->stat.wfi_exit_stat++;
> -		kvm_vcpu_block(vcpu);
> -		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
> +		kvm_vcpu_wfi(vcpu);
>   	}
>   
>   	kvm_incr_pc(vcpu);
> 



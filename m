From: Sean Christopherson <seanjc@google.com>
Date: Fri, 8 Oct 2021 15:02:04 +0000
Subject: [PATCH v3 5/5] RISC-V: Add SBI HSM extension in KVM
In-Reply-To: <20211008032036.2201971-6-atish.patra@wdc.com>
References: <20211008032036.2201971-1-atish.patra@wdc.com>
 <20211008032036.2201971-6-atish.patra@wdc.com>
Message-ID: <YWBdbCNQdikbhhBq@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 07, 2021, Atish Patra wrote:
> SBI HSM extension allows OS to start/stop harts any time. It also allows
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index c44cabce7dd8..278b4d643e1b 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -133,6 +133,13 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>  	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
>  	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
>  	struct kvm_cpu_context *reset_cntx = &vcpu->arch.guest_reset_context;
> +	bool loaded;
> +
> +	/* Disable preemption to avoid race with preempt notifiers */

Stating what the code literally does is not a helpful comment, as it doesn't
help the reader understand _why_ preemption needs to be disabled.

> +	preempt_disable();
> +	loaded = (vcpu->cpu != -1);
> +	if (loaded)
> +		kvm_arch_vcpu_put(vcpu);

Oof.  Looks like this pattern was taken from arm64.  Is there really no better
approach to handling this?  I don't see anything in kvm_riscv_reset_vcpu() that
will obviously break if the vCPU is loaded.  If the goal is purely to effect a
CSR reset via kvm_arch_vcpu_load(), then why not just factor out a helper to do
exactly that?

>  
>  	memcpy(csr, reset_csr, sizeof(*csr));
>  
> @@ -144,6 +151,11 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>  
>  	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
>  	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
> +
> +	/* Reset the guest CSRs for hotplug usecase */
> +	if (loaded)
> +		kvm_arch_vcpu_load(vcpu, smp_processor_id());

If the preempt shenanigans really have to stay, at least use get_cpu()/put_cpu().

> +	preempt_enable();
>  }
>  
>  int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
> @@ -180,6 +192,13 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>  
>  void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>  {
> +	/**
> +	 * vcpu with id 0 is the designated boot cpu.
> +	 * Keep all vcpus with non-zero cpu id in power-off state so that they
> +	 * can brought to online using SBI HSM extension.
> +	 */
> +	if (vcpu->vcpu_idx != 0)
> +		kvm_riscv_vcpu_power_off(vcpu);

Why do this in postcreate?

>  }
>  
>  void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index dadee5e61a46..db54ef21168b 100644

...

> +static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_cpu_context *reset_cntx;
> +	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	struct kvm_vcpu *target_vcpu;
> +	unsigned long target_vcpuid = cp->a0;
> +
> +	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
> +	if (!target_vcpu)
> +		return -EINVAL;
> +	if (!target_vcpu->arch.power_off)
> +		return -EALREADY;
> +
> +	reset_cntx = &target_vcpu->arch.guest_reset_context;
> +	/* start address */
> +	reset_cntx->sepc = cp->a1;
> +	/* target vcpu id to start */
> +	reset_cntx->a0 = target_vcpuid;
> +	/* private data passed from kernel */
> +	reset_cntx->a1 = cp->a2;
> +	kvm_make_request(KVM_REQ_VCPU_RESET, target_vcpu);
> +
> +	/* Make sure that the reset request is enqueued before power on */
> +	smp_wmb();

What does this pair with?  I suspect nothing, because AFAICT the code was taken
from arm64.

arm64 has the smp_wmb() in kvm_psci_vcpu_on() to ensure that the vCPU sees the
request if the vCPU sees the change in vcpu->arch.power_off, and so has a
smp_rmb() in kvm_reset_vcpu().

Side topic, how much of arm64 and RISC-V is this similar?  Would it make sense
to find some way for them to share code?

> +	kvm_riscv_vcpu_power_on(target_vcpu);
> +
> +	return 0;
> +}
> +
> +static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
> +{
> +	if ((!vcpu) || (vcpu->arch.power_off))

Too many parentheses, and the NULL vCPU check is unnecessary.

> +		return -EINVAL;
> +
> +	kvm_riscv_vcpu_power_off(vcpu);
> +
> +	return 0;
> +}
> +


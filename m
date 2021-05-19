From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 May 2021 12:24:41 +0300
Subject: [PATCH v18 02/18] RISC-V: Add initial skeletal KVM support
In-Reply-To: <20210519033553.1110536-3-anup.patel@wdc.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <20210519033553.1110536-3-anup.patel@wdc.com>
Message-ID: <20210519092441.GQ1955@kadam>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 19, 2021 at 09:05:37AM +0530, Anup Patel wrote:
> +int kvm_arch_hardware_enable(void)
> +{
> +	unsigned long hideleg, hedeleg;
> +
> +	hedeleg = 0;
> +	hedeleg |= (1UL << EXC_INST_MISALIGNED);

You may as well use BIT_UL(EXC_INST_MISALIGNED) for all of these.
There is a Coccinelle script to convert these so please just make it
standard like everyone else.

> +	hedeleg |= (1UL << EXC_BREAKPOINT);
> +	hedeleg |= (1UL << EXC_SYSCALL);
> +	hedeleg |= (1UL << EXC_INST_PAGE_FAULT);
> +	hedeleg |= (1UL << EXC_LOAD_PAGE_FAULT);
> +	hedeleg |= (1UL << EXC_STORE_PAGE_FAULT);
> +	csr_write(CSR_HEDELEG, hedeleg);
> +
> +	hideleg = 0;
> +	hideleg |= (1UL << IRQ_VS_SOFT);
> +	hideleg |= (1UL << IRQ_VS_TIMER);
> +	hideleg |= (1UL << IRQ_VS_EXT);
> +	csr_write(CSR_HIDELEG, hideleg);
> +
> +	csr_write(CSR_HCOUNTEREN, -1UL);
> +
> +	csr_write(CSR_HVIP, 0);
> +
> +	return 0;
> +}
> +
> +void kvm_arch_hardware_disable(void)
> +{
> +	csr_write(CSR_HEDELEG, 0);
> +	csr_write(CSR_HIDELEG, 0);
> +}
> +
> +int kvm_arch_init(void *opaque)
> +{
> +	if (!riscv_isa_extension_available(NULL, h)) {
> +		kvm_info("hypervisor extension not available\n");
> +		return -ENODEV;
> +	}
> +
> +	if (sbi_spec_is_0_1()) {
> +		kvm_info("require SBI v0.2 or higher\n");
> +		return -ENODEV;
> +	}
> +
> +	if (sbi_probe_extension(SBI_EXT_RFENCE) <= 0) {

sbi_probe_extension() never returns zero.


> +		kvm_info("require SBI RFENCE extension\n");
> +		return -ENODEV;
> +	}
> +
> +	kvm_info("hypervisor extension available\n");
> +
> +	return 0;
> +}
> +
> +void kvm_arch_exit(void)
> +{
> +}
> +
> +static int riscv_kvm_init(void)
> +{
> +	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> +}
> +module_init(riscv_kvm_init);


[ snip ]

> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> +{
> +	int ret;
> +	struct kvm_cpu_trap trap;
> +	struct kvm_run *run = vcpu->run;
> +
> +	vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +
> +	/* Process MMIO value returned from user-space */
> +	if (run->exit_reason == KVM_EXIT_MMIO) {
> +		ret = kvm_riscv_vcpu_mmio_return(vcpu, vcpu->run);
> +		if (ret) {
> +			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
> +			return ret;
> +		}
> +	}
> +
> +	if (run->immediate_exit) {
> +		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
> +		return -EINTR;
> +	}
> +
> +	vcpu_load(vcpu);
> +
> +	kvm_sigset_activate(vcpu);
> +
> +	ret = 1;
> +	run->exit_reason = KVM_EXIT_UNKNOWN;
> +	while (ret > 0) {
> +		/* Check conditions before entering the guest */
> +		cond_resched();
> +
> +		kvm_riscv_check_vcpu_requests(vcpu);
> +
> +		preempt_disable();
> +
> +		local_irq_disable();
> +
> +		/*
> +		 * Exit if we have a signal pending so that we can deliver
> +		 * the signal to user space.
> +		 */
> +		if (signal_pending(current)) {
> +			ret = -EINTR;
> +			run->exit_reason = KVM_EXIT_INTR;
> +		}
> +
> +		/*
> +		 * Ensure we set mode to IN_GUEST_MODE after we disable
> +		 * interrupts and before the final VCPU requests check.
> +		 * See the comment in kvm_vcpu_exiting_guest_mode() and
> +		 * Documentation/virtual/kvm/vcpu-requests.rst
> +		 */
> +		vcpu->mode = IN_GUEST_MODE;
> +
> +		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
> +		smp_mb__after_srcu_read_unlock();
> +
> +		if (ret <= 0 ||

ret can never be == 0@this point.

> +		    kvm_request_pending(vcpu)) {
> +			vcpu->mode = OUTSIDE_GUEST_MODE;
> +			local_irq_enable();
> +			preempt_enable();
> +			vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +			continue;
> +		}
> +
> +		guest_enter_irqoff();
> +
> +		__kvm_riscv_switch_to(&vcpu->arch);
> +
> +		vcpu->mode = OUTSIDE_GUEST_MODE;
> +		vcpu->stat.exits++;
> +
> +		/*
> +		 * Save SCAUSE, STVAL, HTVAL, and HTINST because we might
> +		 * get an interrupt between __kvm_riscv_switch_to() and
> +		 * local_irq_enable() which can potentially change CSRs.
> +		 */
> +		trap.sepc = 0;
> +		trap.scause = csr_read(CSR_SCAUSE);
> +		trap.stval = csr_read(CSR_STVAL);
> +		trap.htval = csr_read(CSR_HTVAL);
> +		trap.htinst = csr_read(CSR_HTINST);
> +
> +		/*
> +		 * We may have taken a host interrupt in VS/VU-mode (i.e.
> +		 * while executing the guest). This interrupt is still
> +		 * pending, as we haven't serviced it yet!
> +		 *
> +		 * We're now back in HS-mode with interrupts disabled
> +		 * so enabling the interrupts now will have the effect
> +		 * of taking the interrupt again, in HS-mode this time.
> +		 */
> +		local_irq_enable();
> +
> +		/*
> +		 * We do local_irq_enable() before calling guest_exit() so
> +		 * that if a timer interrupt hits while running the guest
> +		 * we account that tick as being spent in the guest. We
> +		 * enable preemption after calling guest_exit() so that if
> +		 * we get preempted we make sure ticks after that is not
> +		 * counted as guest time.
> +		 */
> +		guest_exit();
> +
> +		preempt_enable();
> +
> +		vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +
> +		ret = kvm_riscv_vcpu_exit(vcpu, run, &trap);
> +	}
> +
> +	kvm_sigset_deactivate(vcpu);
> +
> +	vcpu_put(vcpu);
> +
> +	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
> +
> +	return ret;
> +}

regards,
dan carpenter


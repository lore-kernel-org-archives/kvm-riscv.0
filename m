From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 5 Apr 2024 13:36:06 +0200
Subject: [PATCH v5 13/22] RISC-V: KVM: Add perf sampling support for
 guests
In-Reply-To: <20240403080452.1007601-14-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-14-atishp@rivosinc.com>
Message-ID: <20240405-5b84abdbf55142d40410fec8@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 03, 2024 at 01:04:42AM -0700, Atish Patra wrote:
> KVM enables perf for guest via counter virtualization. However, the
> sampling can not be supported as there is no mechanism to enabled
> trap/emulate scountovf in ISA yet. Rely on the SBI PMU snapshot
> to provide the counter overflow data via the shared memory.
> 
> In case of sampling event, the host first sets the guest's LCOFI
> interrupt and injects to the guest via irq filtering mechanism defined
> in AIA specification. Thus, ssaia must be enabled in the host in order
> to use perf sampling in the guest. No other AIA dependency w.r.t kernel
> is required.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h          |  3 +-
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
>  arch/riscv/include/uapi/asm/kvm.h     |  1 +
>  arch/riscv/kvm/aia.c                  |  5 ++
>  arch/riscv/kvm/vcpu.c                 | 15 ++++--
>  arch/riscv/kvm/vcpu_onereg.c          |  5 ++
>  arch/riscv/kvm/vcpu_pmu.c             | 68 +++++++++++++++++++++++++--
>  7 files changed, 92 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 9d1b07932794..25966995da04 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -168,7 +168,8 @@
>  #define VSIP_TO_HVIP_SHIFT	(IRQ_VS_SOFT - IRQ_S_SOFT)
>  #define VSIP_VALID_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
>  				 (_AC(1, UL) << IRQ_S_TIMER) | \
> -				 (_AC(1, UL) << IRQ_S_EXT))
> +				 (_AC(1, UL) << IRQ_S_EXT) | \
> +				 (_AC(1, UL) << IRQ_PMU_OVF))
>  
>  /* AIA CSR bits */
>  #define TOPI_IID_SHIFT		16
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 77a1fc4d203d..257f17641e00 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -36,6 +36,7 @@ struct kvm_pmc {
>  	bool started;
>  	/* Monitoring event ID */
>  	unsigned long event_idx;
> +	struct kvm_vcpu *vcpu;
>  };
>  
>  /* PMU data structure per vcpu */
> @@ -50,6 +51,8 @@ struct kvm_pmu {
>  	bool init_done;
>  	/* Bit map of all the virtual counter used */
>  	DECLARE_BITMAP(pmc_in_use, RISCV_KVM_MAX_COUNTERS);
> +	/* Bit map of all the virtual counter overflown */
> +	DECLARE_BITMAP(pmc_overflown, RISCV_KVM_MAX_COUNTERS);
>  	/* The address of the counter snapshot area (guest physical address) */
>  	gpa_t snapshot_addr;
>  	/* The actual data of the snapshot */
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index b1c503c2959c..e878e7cc3978 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZFA,
>  	KVM_RISCV_ISA_EXT_ZTSO,
>  	KVM_RISCV_ISA_EXT_ZACAS,
> +	KVM_RISCV_ISA_EXT_SSCOFPMF,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index a944294f6f23..0f0a9d11bb5f 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -545,6 +545,9 @@ void kvm_riscv_aia_enable(void)
>  	enable_percpu_irq(hgei_parent_irq,
>  			  irq_get_trigger_type(hgei_parent_irq));
>  	csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
> +	/* Enable IRQ filtering for overflow interrupt only if sscofpmf is present */
> +	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
> +		csr_write(CSR_HVIEN, BIT(IRQ_PMU_OVF));
>  }
>  
>  void kvm_riscv_aia_disable(void)
> @@ -558,6 +561,8 @@ void kvm_riscv_aia_disable(void)
>  		return;
>  	hgctrl = get_cpu_ptr(&aia_hgei);
>  
> +	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
> +		csr_clear(CSR_HVIEN, BIT(IRQ_PMU_OVF));
>  	/* Disable per-CPU SGEI interrupt */
>  	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
>  	disable_percpu_irq(hgei_parent_irq);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index b5ca9f2e98ac..bb10771b2b18 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -365,6 +365,13 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
>  		}
>  	}
>  
> +	/* Sync up the HVIP.LCOFIP bit changes (only clear) by the guest */
> +	if ((csr->hvip ^ hvip) & (1UL << IRQ_PMU_OVF)) {
> +		if (!(hvip & (1UL << IRQ_PMU_OVF)) &&
> +		    !test_and_set_bit(IRQ_PMU_OVF, v->irqs_pending_mask))
> +			clear_bit(IRQ_PMU_OVF, v->irqs_pending);
> +	}
> +
>  	/* Sync-up AIA high interrupts */
>  	kvm_riscv_vcpu_aia_sync_interrupts(vcpu);
>  
> @@ -382,7 +389,8 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
>  	if (irq < IRQ_LOCAL_MAX &&
>  	    irq != IRQ_VS_SOFT &&
>  	    irq != IRQ_VS_TIMER &&
> -	    irq != IRQ_VS_EXT)
> +	    irq != IRQ_VS_EXT &&
> +	    irq != IRQ_PMU_OVF)
>  		return -EINVAL;
>  
>  	set_bit(irq, vcpu->arch.irqs_pending);
> @@ -397,14 +405,15 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
>  int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
>  {
>  	/*
> -	 * We only allow VS-mode software, timer, and external
> +	 * We only allow VS-mode software, timer, counter overflow and external
>  	 * interrupts when irq is one of the local interrupts
>  	 * defined by RISC-V privilege specification.
>  	 */
>  	if (irq < IRQ_LOCAL_MAX &&
>  	    irq != IRQ_VS_SOFT &&
>  	    irq != IRQ_VS_TIMER &&
> -	    irq != IRQ_VS_EXT)
> +	    irq != IRQ_VS_EXT &&
> +	    irq != IRQ_PMU_OVF)
>  		return -EINVAL;
>  
>  	clear_bit(irq, vcpu->arch.irqs_pending);
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f4a6124d25c9..4da4ed899104 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -36,6 +36,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	/* Multi letter extensions (alphabetically sorted) */
>  	KVM_ISA_EXT_ARR(SMSTATEEN),
>  	KVM_ISA_EXT_ARR(SSAIA),
> +	KVM_ISA_EXT_ARR(SSCOFPMF),
>  	KVM_ISA_EXT_ARR(SSTC),
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
> @@ -101,6 +102,9 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
>  		return false;
>  	case KVM_RISCV_ISA_EXT_V:
>  		return riscv_v_vstate_ctrl_user_allowed();
> +	case KVM_RISCV_ISA_EXT_SSCOFPMF:

nit: this case which starts with 'S' should come before the 'V' case since
we tend to alphabetize these things.

> +		/* Sscofpmf depends on interrupt filtering defined in ssaia */
> +		return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
>  	default:
>  		break;
>  	}
> @@ -116,6 +120,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_C:
>  	case KVM_RISCV_ISA_EXT_I:
>  	case KVM_RISCV_ISA_EXT_M:
> +	case KVM_RISCV_ISA_EXT_SSCOFPMF:

Since we can choose not to inject overflow interrupts for the guest, then
the VMM could be allowed to disable this. Returning false from this
function means that there's no way for KVM to turn off the behavior (or
that KVM doesn't want to maintain code allowing the behavior to be turned
off). Extensions that provides instructions which are unconditionally
exposed to VS-mode can't be disabled, but anything KVM emulates, like this
overflow can be. Is disabling Sscofpmf something that KVM would rather not
maintain?

Thanks,
drew


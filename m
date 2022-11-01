From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 1 Nov 2022 15:13:29 +0100
Subject: [RFC  5/9] RISC-V: KVM: Add skeleton support for perf
In-Reply-To: <20220718170205.2972215-6-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-6-atishp@rivosinc.com>
Message-ID: <20221101141329.j4qtvjf6kmqixt2r@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 18, 2022 at 10:02:01AM -0700, Atish Patra wrote:
> This patch only adds barebore structure of perf implementation. Most of
                       a bare bones         ^ the

> the function returns zero at this point and will be implemented
      functions

> fully in the future.

s/the future/later patches/

> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_host.h     |   3 +
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  70 +++++++++++++
>  arch/riscv/kvm/Makefile               |   1 +
>  arch/riscv/kvm/main.c                 |   3 +-
>  arch/riscv/kvm/vcpu.c                 |   5 +
>  arch/riscv/kvm/vcpu_insn.c            |   3 +-
>  arch/riscv/kvm/vcpu_pmu.c             | 136 ++++++++++++++++++++++++++
>  7 files changed, 219 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
>  create mode 100644 arch/riscv/kvm/vcpu_pmu.c
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 59a0cf2ca7b9..5d2312828bb2 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -18,6 +18,7 @@
>  #include <asm/kvm_vcpu_fp.h>
>  #include <asm/kvm_vcpu_insn.h>
>  #include <asm/kvm_vcpu_timer.h>
> +#include <asm/kvm_vcpu_pmu.h>
>  
>  #define KVM_MAX_VCPUS			1024
>  
> @@ -226,6 +227,8 @@ struct kvm_vcpu_arch {
>  
>  	/* Don't run the VCPU (blocked) */
>  	bool pause;
> +
> +	struct kvm_pmu pmu;
>  };
>  
>  static inline void kvm_arch_hardware_unsetup(void) {}
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> new file mode 100644
> index 000000000000..bffee052f2ae
> --- /dev/null
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022 Rivos Inc
> + *
> + * Authors:
> + *     Atish Patra <atishp@rivosinc.com>
> + */
> +
> +#ifndef _KVM_VCPU_RISCV_PMU_H
> +#define _KVM_VCPU_RISCV_PMU_H

The convention seems to be to leading underscores for these types of
defines, i.e. __KVM_VCPU_RISCV_PMU_H

> +
> +#include <linux/perf/riscv_pmu.h>
> +#include <asm/sbi.h>
> +
> +#ifdef CONFIG_RISCV_PMU_SBI
> +#define RISCV_KVM_MAX_FW_CTRS 32
> +
> +/* Per virtual pmu counter data */
> +struct kvm_pmc {
> +	u8 idx;
> +	struct kvm_vcpu *vcpu;

I'm not sure we need a vcpu pointer here. If it's just to implement
pmc_to_pmu(), then we can instead implement a pmc_to_vcpu(), like
arm64's kvm_pmc_to_vcpu(). x86 might be able to do that too, since
it appears the conversion macros below originated there.

> +	struct perf_event *perf_event;
> +	uint64_t counter_val;
> +	union sbi_pmu_ctr_info cinfo;
> +};
> +
> +/* PMU data structure per vcpu */
> +struct kvm_pmu {
> +	struct kvm_pmc pmc[RISCV_MAX_COUNTERS];
> +	/* Number of the virtual firmware counters available */
> +	int num_fw_ctrs;
> +	/* Number of the virtual hardware counters available */
> +	int num_hw_ctrs;
> +	/* Bit map of all the virtual counter used */
                                      counters

> +	DECLARE_BITMAP(used_pmc, RISCV_MAX_COUNTERS);

How about naming this pmc_in_use like x86?

> +};
> +
> +#define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu)
> +#define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
> +#define pmc_to_pmu(pmc)   (&(pmc)->vcpu->arch.pmu)
> +
> +int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, unsigned long *out_val);
> +int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
> +				unsigned long *ctr_info);
> +

nit: no need for this blank line

> +int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> +				 unsigned long ctr_mask, unsigned long flag, uint64_t ival);
> +int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> +				 unsigned long ctr_mask, unsigned long flag);
> +int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> +				     unsigned long ctr_mask, unsigned long flag,
> +				     unsigned long eidx, uint64_t edata);
> +int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> +				unsigned long *out_val);
> +int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
> +
> +#else
> +struct kvm_pmu {
> +};
> +
> +static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> +{
> +	return 0;
> +}
> +static inline void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu) {}
> +static inline void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu) {}
> +#endif
> +#endif
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 019df9208bdd..342d7199e89d 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -25,3 +25,4 @@ kvm-y += vcpu_sbi_base.o
>  kvm-y += vcpu_sbi_replace.o
>  kvm-y += vcpu_sbi_hsm.o
>  kvm-y += vcpu_timer.o
> +kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_sbi_pmu.o vcpu_pmu.o
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 1549205fe5fe..d41ab6d1987d 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -49,7 +49,8 @@ int kvm_arch_hardware_enable(void)
>  	hideleg |= (1UL << IRQ_VS_EXT);
>  	csr_write(CSR_HIDELEG, hideleg);
>  
> -	csr_write(CSR_HCOUNTEREN, -1UL);
> +	/* VS should access only TM bit. Everything else should trap */
> +	csr_write(CSR_HCOUNTEREN, 0x02);

This looks like something that should be broken out into a separate patch
with a description of what happens now when guests try to access the newly
trapping counter registers. We should probably also create a TM define.

>  
>  	csr_write(CSR_HVIP, 0);
>  
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 3c95924d38c7..4cc964aaf2ad 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -122,6 +122,7 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>  
>  	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
>  	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
> +	kvm_riscv_vcpu_pmu_reset(vcpu);
>  
>  	vcpu->arch.hfence_head = 0;
>  	vcpu->arch.hfence_tail = 0;
> @@ -174,6 +175,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>  	/* Setup VCPU timer */
>  	kvm_riscv_vcpu_timer_init(vcpu);
>  
> +	/* setup performance monitoring */
> +	kvm_riscv_vcpu_pmu_init(vcpu);
> +
>  	/* Reset VCPU */
>  	kvm_riscv_reset_vcpu(vcpu);
>  
> @@ -196,6 +200,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>  	/* Cleanup VCPU timer */
>  	kvm_riscv_vcpu_timer_deinit(vcpu);
>  
> +	kvm_riscv_vcpu_pmu_deinit(vcpu);
>  	/* Free unused pages pre-allocated for G-stage page table mappings */
>  	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
>  }
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index 7eb90a47b571..0aa334f853c8 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -214,7 +214,8 @@ struct csr_func {
>  		    unsigned long wr_mask);
>  };
>  
> -static const struct csr_func csr_funcs[] = { };
> +static const struct csr_func csr_funcs[] = {
> +};

stray change

>  
>  /**
>   * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> new file mode 100644
> index 000000000000..3168ed740bdd
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 Rivos Inc
> + *
> + * Authors:
> + *     Atish Patra <atishp@rivosinc.com>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/kvm_host.h>
> +#include <linux/perf/riscv_pmu.h>
> +#include <asm/csr.h>
> +#include <asm/kvm_vcpu_pmu.h>
> +#include <linux/kvm_host.h>
> +
> +int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, unsigned long *out_val)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +
> +	if (!kvpmu)
> +		return -EINVAL;

kvpmu can never be null because arch.pmu isn't a pointer. We probably
shouldn't be making calls to kvm_riscv_vcpu_pmu_num_ctrs() without knowing
we have an initialized pmu anyway, though.

> +
> +	*out_val = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
> +	return 0;
> +}
> +
> +int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
> +				unsigned long *ctr_info)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +
> +	if (!kvpmu || (cidx > RISCV_MAX_COUNTERS) || (cidx == 1))

nit: unnecessary ()

> +		return -EINVAL;
> +
> +	*ctr_info = kvpmu->pmc[cidx].cinfo.value;
> +
> +	return 0;
> +}
> +
> +int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> +				 unsigned long ctr_mask, unsigned long flag, uint64_t ival)
> +{
> +	/* TODO */
> +	return 0;
> +}
> +
> +int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> +				 unsigned long ctr_mask, unsigned long flag)
> +{
> +	/* TODO */
> +	return 0;
> +}
> +
> +int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
> +				     unsigned long ctr_mask, unsigned long flag,
> +				     unsigned long eidx, uint64_t edata)
> +{
> +	/* TODO */
> +	return 0;
> +}
> +
> +int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> +				unsigned long *out_val)
> +{
> +	/* TODO */
> +	return 0;
> +}
> +
> +int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> +{
> +	int i = 0, num_hw_ctrs, num_fw_ctrs, hpm_width;
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +
> +	if (!kvpmu)
> +		return -EINVAL;
> +
> +	num_hw_ctrs = riscv_pmu_sbi_get_num_hw_ctrs();
> +	if ((num_hw_ctrs + RISCV_KVM_MAX_FW_CTRS) > RISCV_MAX_COUNTERS)
> +		num_fw_ctrs = RISCV_MAX_COUNTERS - num_hw_ctrs;
> +	else
> +		num_fw_ctrs = RISCV_KVM_MAX_FW_CTRS;

Why do we need RISCV_KVM_MAX_FW_CTRS? Can't we just always get the number
with RISCV_MAX_COUNTERS - num_hw_ctrs ?

> +
> +	hpm_width = riscv_pmu_sbi_hpmc_width();
> +	if (hpm_width <= 0) {
> +		pr_err("Can not initialize PMU for vcpu as hpmcounter width is not available\n");
> +		return -EINVAL;
> +	}
> +
> +	kvpmu->num_hw_ctrs = num_hw_ctrs;
> +	kvpmu->num_fw_ctrs = num_fw_ctrs;

Maybe it's coming later, but we need to give KVM userspace control over
the number of counters to allow it to migrate to a larger set of hosts.
Also, a previous patch said the virtual width must be the same as the
host width for the hw counters, so we need userspace to know what that
is in order to determine to which hosts it can migrate a guest.

> +	/*
> +	 * There is no corelation betwen the logical hardware counter and virtual counters.
> +	 * However, we need to encode a hpmcounter CSR in the counter info field so that
> +	 * KVM can trap n emulate the read. This works well in the migraiton usecase as well

s/well//

> +	 * KVM doesn't care if the actual hpmcounter is available in the hardware or not.
> +	 */
> +	for (i = 0; i < num_hw_ctrs + num_fw_ctrs; i++) {

Maybe we need a helper macro like

 #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)

if we're going to loop over all counters frequently.

> +		/* TIME CSR shouldn't be read from perf interface */
> +		if (i == 1)
> +			continue;
> +		kvpmu->pmc[i].idx = i;
> +		kvpmu->pmc[i].vcpu = vcpu;
> +		if (i < kvpmu->num_hw_ctrs) {
> +			kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_HW;
> +			if (i < 3)
> +				/* CY, IR counters */
> +				kvpmu->pmc[i].cinfo.width = 63;
> +			else
> +				kvpmu->pmc[i].cinfo.width = hpm_width;
> +			/*
> +			 * The CSR number doesn't have any relation with the logical
> +			 * hardware counters. The CSR numbers are encoded sequentially
> +			 * to avoid maintaining a map between the virtual counter
> +			 * and CSR number.
> +			 */
> +			kvpmu->pmc[i].cinfo.csr = CSR_CYCLE + i;
> +		} else {
> +			kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_FW;
> +			kvpmu->pmc[i].cinfo.width = BITS_PER_LONG - 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
> +{
> +	/* TODO */
> +}
> +
> +void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
> +{
> +	/* TODO */
> +}
> +
> -- 
> 2.25.1
>

Thanks,
drew


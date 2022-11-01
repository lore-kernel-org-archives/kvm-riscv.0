From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 1 Nov 2022 15:26:31 +0100
Subject: [RFC  6/9] RISC-V: KVM: Add SBI PMU extension support
In-Reply-To: <20220718170205.2972215-7-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-7-atishp@rivosinc.com>
Message-ID: <20221101142631.du54p4kyhlgf54cr@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 18, 2022 at 10:02:02AM -0700, Atish Patra wrote:
> SBI PMU extension allows KVM guests to configure/start/stop/query about
> the PMU counters in virtualized enviornment as well.
> 
> In order to allow that, KVM implements the entire SBI PMU extension.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
>  arch/riscv/kvm/vcpu_sbi_pmu.c | 81 +++++++++++++++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index d45e7da3f0d3..da9f7959340e 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -50,6 +50,16 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>  
> +#ifdef CONFIG_RISCV_PMU_SBI
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> +#else
> +static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
> +	.extid_start = -1UL,
> +	.extid_end = -1UL,
> +	.handler = NULL,
> +};
> +#endif
> +
>  static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>  	&vcpu_sbi_ext_v01,
>  	&vcpu_sbi_ext_base,
> @@ -58,6 +68,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>  	&vcpu_sbi_ext_rfence,
>  	&vcpu_sbi_ext_srst,
>  	&vcpu_sbi_ext_hsm,
> +	&vcpu_sbi_ext_pmu,
>  	&vcpu_sbi_ext_experimental,
>  	&vcpu_sbi_ext_vendor,
>  };
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> new file mode 100644
> index 000000000000..90c51a95d4f4
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -0,0 +1,81 @@
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
> +#include <asm/csr.h>
> +#include <asm/sbi.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +
> +static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +				   unsigned long *out_val,
> +				   struct kvm_cpu_trap *utrap,
> +				   bool *exit)
> +{
> +	int ret = -EOPNOTSUPP;
> +	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	unsigned long funcid = cp->a6;
> +	uint64_t temp;

I think we need something like

   if (!vcpu_to_pmu(vcpu)->enabled)
      return -EOPNOTSUPP;

here. Where 'enabled' is only true when we successfully initialize
the pmu. And, successful initialization depends on 
IS_ENABLED(CONFIG_RISCV_PMU_SBI) and
riscv_isa_extension_available(NULL, SSCOFPMF) as well as not
failing other things. And, KVM userspace should be able to
disable the pmu, which keep enabled from being set as well.

> +
> +	switch (funcid) {
> +	case SBI_EXT_PMU_NUM_COUNTERS:
> +		ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, out_val);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_GET_INFO:
> +		ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, out_val);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
> +#if defined(CONFIG_32BIT)
> +		temp = ((uint64_t)cp->a5 << 32) | cp->a4;
> +#else
> +		temp = cp->a4;
> +#endif
> +		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, temp);
> +		if (ret >= 0) {
> +			*out_val = ret;
> +			ret = 0;
> +		}
> +		break;
> +	case SBI_EXT_PMU_COUNTER_START:
> +#if defined(CONFIG_32BIT)
> +		temp = ((uint64_t)cp->a4 << 32) | cp->a3;
> +#else
> +		temp = cp->a3;
> +#endif
> +		ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2, temp);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_STOP:
> +		ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2);
> +		break;
> +	case SBI_EXT_PMU_COUNTER_FW_READ:
> +		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, out_val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
> +	return ret;
> +}
> +
> +unsigned long kvm_sbi_ext_pmu_probe(unsigned long extid)
> +{
> +	/*
> +	 * PMU Extension is only available to guests if privilege mode filtering
> +	 * is available. Otherwise, guest will always count events while the
> +	 * execution is in hypervisor mode.
> +	 */
> +	return riscv_isa_extension_available(NULL, SSCOFPMF);
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
> +	.extid_start = SBI_EXT_PMU,
> +	.extid_end = SBI_EXT_PMU,
> +	.handler = kvm_sbi_ext_pmu_handler,
> +	.probe = kvm_sbi_ext_pmu_probe,
> +};
> -- 
> 2.25.1
>

Thanks,
drew


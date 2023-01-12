From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 12 Jan 2023 11:06:08 +0100
Subject: [PATCH v2 01/11] RISC-V: Define helper functions expose hpm
 counter width and count
In-Reply-To: <20221215170046.2010255-2-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-2-atishp@rivosinc.com>
Message-ID: <20230112100608.d7tnvhbotjfctlgk@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 15, 2022 at 09:00:36AM -0800, Atish Patra wrote:
> KVM module needs to know how many hardware counters and the counter
> width that the platform supports. Otherwise, it will not be able to show
> optimal value of virtual counters to the guest. The virtual hardware
> counters also need to have the same width as the logical hardware
> counters for simplicity. However, there shouldn't be mapping between
> virtual hardware counters and logical hardware counters. As we don't
> support hetergeneous harts or counters with different width as of now,
> the implementation relies on the counter width of the first available
> programmable counter.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 35 +++++++++++++++++++++++++++++++++-
>  include/linux/perf/riscv_pmu.h |  3 +++
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 3852c18..65d4aa4 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -49,6 +49,9 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
>  static union sbi_pmu_ctr_info *pmu_ctr_list;
>  static unsigned int riscv_pmu_irq;
>  
> +/* Cache the available counters in a bitmask */
> +unsigned long cmask;

I presume this can be static since it's not getting added to the header.
And don't we need this to be a long long for rv32? We should probably
just use u64.

> +
>  struct sbi_pmu_event_data {
>  	union {
>  		union {
> @@ -264,6 +267,37 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
>  	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
>  }
>  
> +/*
> + * Returns the counter width of a programmable counter and number of hardware
> + * counters. As we don't support heterneous CPUs yet, it is okay to just

heterogeneous

> + * return the counter width of the first programmable counter.
> + */
> +int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
> +{
> +	int i;
> +	union sbi_pmu_ctr_info *info;
> +	u32 hpm_width = 0, hpm_count = 0;
> +
> +	if (!cmask)
> +		return -EINVAL;
> +
> +	for_each_set_bit(i, &cmask, RISCV_MAX_COUNTERS) {
> +		info = &pmu_ctr_list[i];
> +		if (!info)
> +			continue;
> +		if (!hpm_width && (info->csr != CSR_CYCLE) && (info->csr != CSR_INSTRET))

nit: No need for () around the != expressions

> +			hpm_width = info->width;
> +		if (info->type == SBI_PMU_CTR_TYPE_HW)
> +			hpm_count++;
> +	}
> +
> +	*hw_ctr_width = hpm_width;
> +	*num_hw_ctr = hpm_count;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(riscv_pmu_get_hpm_info);

EXPORT_SYMBOL_GPL ?

> +
>  static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  {
>  	struct hw_perf_event *hwc = &event->hw;
> @@ -798,7 +832,6 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
>  static int pmu_sbi_device_probe(struct platform_device *pdev)
>  {
>  	struct riscv_pmu *pmu = NULL;
> -	unsigned long cmask = 0;
>  	int ret = -ENODEV;
>  	int num_counters;
>  
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index e17e86a..a1c3f77 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -73,6 +73,9 @@ void riscv_pmu_legacy_skip_init(void);
>  static inline void riscv_pmu_legacy_skip_init(void) {};
>  #endif
>  struct riscv_pmu *riscv_pmu_alloc(void);
> +#ifdef CONFIG_RISCV_PMU_SBI
> +int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
> +#endif
>  
>  #endif /* CONFIG_RISCV_PMU */
>  
> -- 
> 2.25.1
> 

Thanks,
drew


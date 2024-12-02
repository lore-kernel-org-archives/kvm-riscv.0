From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 2 Dec 2024 16:49:09 -0600
Subject: [PATCH 5/8] drivers/perf: riscv: Implement PMU event info
 function
In-Reply-To: <20241119-pmu_event_info-v1-5-a4f9691421f8@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-5-a4f9691421f8@rivosinc.com>
Message-ID: <0a4a569e-dfab-4aed-90df-2fe9719a3803@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Atish,

On 2024-11-19 2:29 PM, Atish Patra wrote:
> With the new SBI PMU event info function, we can query the availability
> of the all standard SBI PMU events at boot time with a single ecall.
> This improves the bootime by avoiding making an SBI call for each
> standard PMU event. Since this function is defined only in SBI v3.0,
> invoke this only if the underlying SBI implementation is v3.0 or higher.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h |  7 +++++
>  drivers/perf/riscv_pmu_sbi.c | 71 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 3ee9bfa5e77c..c04f64fbc01d 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -134,6 +134,7 @@ enum sbi_ext_pmu_fid {
>  	SBI_EXT_PMU_COUNTER_FW_READ,
>  	SBI_EXT_PMU_COUNTER_FW_READ_HI,
>  	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> +	SBI_EXT_PMU_EVENT_GET_INFO,
>  };
>  
>  union sbi_pmu_ctr_info {
> @@ -157,6 +158,12 @@ struct riscv_pmu_snapshot_data {
>  	u64 reserved[447];
>  };
>  
> +struct riscv_pmu_event_info {
> +	u32 event_idx;
> +	u32 output;
> +	u64 event_data;
> +};
> +
>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
>  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
>  /* SBI v3.0 allows extended hpmeventX width value */
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index f0e845ff6b79..2a6527cc9d97 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
>  /* Cache the available counters in a bitmask */
>  static unsigned long cmask;
>  
> +static int pmu_event_find_cache(u64 config);

This new declaration does not appear to be used.

>  struct sbi_pmu_event_data {
>  	union {
>  		union {
> @@ -299,6 +300,68 @@ static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
>  	},
>  };
>  
> +static int pmu_sbi_check_event_info(void)
> +{
> +	int num_events = ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_CACHE_MAX *
> +			 PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE_RESULT_MAX;
> +	struct riscv_pmu_event_info *event_info_shmem;
> +	phys_addr_t base_addr;
> +	int i, j, k, result = 0, count = 0;
> +	struct sbiret ret;
> +
> +	event_info_shmem = (struct riscv_pmu_event_info *)
> +			   kcalloc(num_events, sizeof(*event_info_shmem), GFP_KERNEL);

Please drop the unnecessary cast.

> +	if (!event_info_shmem) {
> +		pr_err("Can not allocate memory for event info query\n");

Usually there's no need to print an error for allocation failure, since the
allocator already warns. And this isn't really an error, since we can (and do)
fall back to the existing way of checking for events.

> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
> +		event_info_shmem[count++].event_idx = pmu_hw_event_map[i].event_idx;
> +
> +	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> +		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
> +			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
> +				event_info_shmem[count++].event_idx =
> +							pmu_cache_event_map[i][j][k].event_idx;
> +		}
> +	}
> +
> +	base_addr = __pa(event_info_shmem);
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, lower_32_bits(base_addr),
> +				upper_32_bits(base_addr), count, 0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, base_addr, 0,
> +				count, 0, 0, 0);
> +	if (ret.error) {
> +		result = -EOPNOTSUPP;
> +		goto free_mem;
> +	}
> +	/* Do we need some barriers here or priv mode transition will ensure that */

No barrier is needed -- the SBI implementation is running on the same hart, so
coherency isn't even a consideration.

> +	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
> +		if (!(event_info_shmem[i].output & 0x01))

This bit mask should probably use a macro.

> +			pmu_hw_event_map[i].event_idx = -ENOENT;
> +	}
> +
> +	count = ARRAY_SIZE(pmu_hw_event_map);
> +
> +	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> +		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
> +			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++) {
> +				if (!(event_info_shmem[count].output & 0x01))

Same comment applies here.

Regards,
Samuel

> +					pmu_cache_event_map[i][j][k].event_idx = -ENOENT;
> +				count++;
> +			}
> +		}
> +	}
> +
> +free_mem:
> +	kfree(event_info_shmem);
> +
> +	return result;
> +}
> +
>  static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>  {
>  	struct sbiret ret;
> @@ -316,6 +379,14 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>  
>  static void pmu_sbi_check_std_events(struct work_struct *work)
>  {
> +	int ret;
> +
> +	if (sbi_v3_available) {
> +		ret = pmu_sbi_check_event_info();
> +		if (!ret)
> +			return;
> +	}
> +
>  	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
>  		pmu_sbi_check_event(&pmu_hw_event_map[i]);
>  
> 



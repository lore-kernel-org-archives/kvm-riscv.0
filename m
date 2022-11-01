From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 1 Nov 2022 13:51:20 +0100
Subject: [RFC  4/9] RISC-V: KVM: Improve privilege mode filtering for perf
In-Reply-To: <20220718170205.2972215-5-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-5-atishp@rivosinc.com>
Message-ID: <20221101125120.lkd3n3yybihjhzyk@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 18, 2022 at 10:02:00AM -0700, Atish Patra wrote:
> Currently, the host driver doesn't have any method to identify if the
> requested perf event is from kvm or bare metal. As KVM runs in HS
> mode, there are no separate hypervisor privilege mode to distinguish
> between the attributes for guest/host.
> 
> Improve the privilege mode filtering by using the event specific
> config1 field.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 27 ++++++++++++++++++++++-----
>  include/linux/perf/riscv_pmu.h |  2 ++
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 5d0eef3ef136..34f9fcc221a8 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -275,6 +275,27 @@ int riscv_pmu_sbi_hpmc_width(void)
>  }
>  EXPORT_SYMBOL(riscv_pmu_sbi_hpmc_width);
>  
> +static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
> +{
> +	unsigned long cflags = 0;
> +	bool guest_events = false;
> +
> +	if (event->attr.config1 & RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS)
> +		guest_events = true;
> +	if (event->attr.exclude_kernel)
> +		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VSINH : SBI_PMU_CFG_FLAG_SET_SINH;
> +	if (event->attr.exclude_user)
> +		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VUINH : SBI_PMU_CFG_FLAG_SET_UINH;
> +	if (guest_events && event->attr.exclude_hv)
> +		cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> +	if (event->attr.exclude_host)
> +		cflags |= SBI_PMU_CFG_FLAG_SET_UINH | SBI_PMU_CFG_FLAG_SET_SINH;
> +	if (event->attr.exclude_guest)
> +		cflags |= SBI_PMU_CFG_FLAG_SET_VSINH | SBI_PMU_CFG_FLAG_SET_VUINH;
> +
> +	return cflags;
> +}
> +
>  static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  {
>  	struct hw_perf_event *hwc = &event->hw;
> @@ -286,11 +307,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters - 1, 0);
>  	unsigned long cflags = 0;
>  
> -	if (event->attr.exclude_kernel)
> -		cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> -	if (event->attr.exclude_user)
> -		cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
> -
> +	cflags = pmu_sbi_get_filter_flags(event);
>  	/* retrieve the available counter index */
>  #if defined(CONFIG_32BIT)
>  	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index 6fee211c27b5..825b95253bc5 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -26,6 +26,8 @@
>  
>  #define RISCV_PMU_STOP_FLAG_RESET 1
>  
> +#define RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS 0x1
> +
>  struct cpu_hw_events {
>  	/* currently enabled events */
>  	int			n_events;
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


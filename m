From: Conor Dooley <conor@kernel.org>
Date: Thu, 15 Dec 2022 20:17:52 +0000
Subject: [PATCH v2 05/11] RISC-V: KVM: Improve privilege mode filtering
 for perf
In-Reply-To: <20221215170046.2010255-6-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-6-atishp@rivosinc.com>
Message-ID: <Y5uA8CEoTKzIGoSy@dizzy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Atish,

On Thu, Dec 15, 2022 at 09:00:40AM -0800, Atish Patra wrote:
> RISC-V: KVM: Improve privilege mode filtering for perf

I almost marked this as "not applicable" in patchwork as I was mislead
by the $subject. I know our perf driver is a real mixed bag, but should
it not be something more like:
"perf: RISC-V: Improve privilege mode filtering for KVM"?
It was only when I noticed that the rest of the series had been marked
as "Handled Elsewhere" that I realised that this must not be a KVM patch
;)

Thanks,
Conor

> Currently, the host driver doesn't have any method to identify if the
> requested perf event is from kvm or bare metal. As KVM runs in HS
> mode, there are no separate hypervisor privilege mode to distinguish
> between the attributes for guest/host.
> 
> Improve the privilege mode filtering by using the event specific
> config1 field.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 27 ++++++++++++++++++++++-----
>  include/linux/perf/riscv_pmu.h |  2 ++
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 65d4aa4..df795b7 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -298,6 +298,27 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
>  }
>  EXPORT_SYMBOL(riscv_pmu_get_hpm_info);
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
> @@ -308,11 +329,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  	uint64_t cbase = 0;
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
>  	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index a1c3f77..1c42146 100644
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
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20221215/0c08422f/attachment-0001.sig>

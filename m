From: Conor Dooley <conor@kernel.org>
Date: Tue, 9 Jan 2024 18:30:11 +0000
Subject: [v2 05/10] drivers/perf: riscv: Implement SBI PMU snapshot
 function
In-Reply-To: <20231229214950.4061381-6-atishp@rivosinc.com>
References: <20231229214950.4061381-1-atishp@rivosinc.com>
 <20231229214950.4061381-6-atishp@rivosinc.com>
Message-ID: <20240109-vice-trash-89a4e1a171b2@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 29, 2023 at 01:49:45PM -0800, Atish Patra wrote:
> +static noinline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_evt,
> +						     unsigned long ctr_ovf_mask)
> +{
> +	int idx = 0;
> +	struct perf_event *event;
> +	unsigned long flag = SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT;
> +	u64 max_period, init_val = 0;
> +	struct hw_perf_event *hwc;
> +	unsigned long ctr_start_mask = 0;
> +	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
> +
> +	for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
> +		if (ctr_ovf_mask & (1 << idx)) {
> +			event = cpu_hw_evt->events[idx];
> +			hwc = &event->hw;
> +			max_period = riscv_pmu_ctr_get_width_mask(event);
> +			init_val = local64_read(&hwc->prev_count) & max_period;
> +			sdata->ctr_values[idx] = init_val;
> +		}
> +		/* We donot need to update the non-overflow counters the previous
> +		 * value should have been there already.
> +		 */

One nit for if this is resent, you've got the wrong comment style here.
Otherwise, looks like the things we discussed before got addressed:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240109/8dcfc173/attachment.sig>

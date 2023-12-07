From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 7 Dec 2023 12:32:19 +0000
Subject: [RFC 4/9] drivers/perf: riscv: Read upper bits of a firmware
 counter
In-Reply-To: <20231205024310.1593100-5-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
 <20231205024310.1593100-5-atishp@rivosinc.com>
Message-ID: <20231207-fidgeting-plywood-8347d9d346be@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 04, 2023 at 06:43:05PM -0800, Atish Patra wrote:
> SBI v2.0 introduced a explicit function to read the upper bits
> for any firmwar counter width that is longer than XLEN. Currently,
> this is only applicable for RV32 where firmware counter can be
> 64 bit.

The v2.0 spec explicitly says that this function returns the upper
32 bits of the counter for rv32 and will always return 0 for rv64
or higher. The commit message here seems overly generic compared to
the actual definition in the spec, and makes it seem like it could
be used with a 128 bit counter on rv64 to get the upper 64 bits.

I tried to think about what "generic" situation the commit message
had been written for, but the things I came up with would all require
changes to the spec to define behaviour for FID #5 and/or FID #1, so
in the end I couldn't figure out the rationale behind the non-committal
wording used here.

> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 40a335350d08..1c9049e6b574 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -490,16 +490,23 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
>  	struct hw_perf_event *hwc = &event->hw;
>  	int idx = hwc->idx;
>  	struct sbiret ret;
> -	union sbi_pmu_ctr_info info;
>  	u64 val = 0;
> +	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
>  
>  	if (pmu_sbi_is_fw_event(event)) {
>  		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
>  				hwc->idx, 0, 0, 0, 0, 0);
>  		if (!ret.error)
>  			val = ret.value;
> +#if defined(CONFIG_32BIT)

Why is this not IS_ENABLED()? The code below uses one. You could then
fold it into the if statement below.

> +		if (sbi_v2_available && info.width >= 32) {

 >= 32? I know it is from the spec, but why does the spec define it as
 "One less than number of bits in CSR"? Saving bits in the structure I
 guess?

> +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
> +					hwc->idx, 0, 0, 0, 0, 0);

> +			if (!ret.error)
> +				val = val | ((u64)ret.value << 32);

If the first ecall fails but the second one doesn't won't we corrupt
val by only setting the upper bits? If returning val == 0 is the thing
to do in the error case (which it is in the existing code) should the
first `if (!ret.error)` become `if (ret.error)` -> `return 0`?


> +				val = val | ((u64)ret.value << 32);

Also, |= ?

Cheers,
Conor.

> +		}
> +#endif
>  	} else {
> -		info = pmu_ctr_list[idx];
>  		val = riscv_pmu_ctr_read_csr(info.csr);
>  		if (IS_ENABLED(CONFIG_32BIT))
>  			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
> -- 
> 2.34.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20231207/42fcb6de/attachment.sig>

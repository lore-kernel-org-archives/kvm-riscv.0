From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 7 Dec 2023 12:07:58 +0000
Subject: [RFC 2/9] drivers/perf: riscv: Add a flag to indicate SBI v2.0
 support
In-Reply-To: <20231205024310.1593100-3-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
 <20231205024310.1593100-3-atishp@rivosinc.com>
Message-ID: <20231207-professed-component-84128c06befa@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 04, 2023 at 06:43:03PM -0800, Atish Patra wrote:
> SBI v2.0 added few functions to improve SBI PMU extension. In order
> to be backward compatible, the driver must use these functions only
> if SBI v2.0 is available.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

IMO this does not make sense in a patch of its own and should probably
be squashed with the first user for it.

> ---
>  drivers/perf/riscv_pmu_sbi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 16acd4dcdb96..40a335350d08 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -35,6 +35,8 @@
>  PMU_FORMAT_ATTR(event, "config:0-47");
>  PMU_FORMAT_ATTR(firmware, "config:63");
>  
> +static bool sbi_v2_available;
> +
>  static struct attribute *riscv_arch_formats_attr[] = {
>  	&format_attr_event.attr,
>  	&format_attr_firmware.attr,
> @@ -1108,6 +1110,9 @@ static int __init pmu_sbi_devinit(void)
>  		return 0;
>  	}
>  
> +	if (sbi_spec_version >= sbi_mk_version(2, 0))
> +		sbi_v2_available = true;
> +
>  	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>  				      "perf/riscv/pmu:starting",
>  				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
> -- 
> 2.34.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20231207/ab4498b2/attachment.sig>

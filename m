From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 2 Feb 2023 11:40:58 +0000
Subject: [PATCH v4 13/14] RISC-V: KVM: Support firmware events
In-Reply-To: <20230201231250.3806412-14-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-14-atishp@rivosinc.com>
Message-ID: <Y9uhSoOvodeQRO6G@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Atish,

On Wed, Feb 01, 2023 at 03:12:49PM -0800, Atish Patra wrote:
> SBI PMU extension defines a set of firmware events which can provide
> useful information to guests about the number of SBI calls. As
> hypervisor implements the SBI PMU extension, these firmware events
> correspond to ecall invocations between VS->HS mode. All other firmware
> events will always report zero if monitored as KVM doesn't implement them.
> 
> This patch adds all the infrastructure required to support firmware
> events.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 473ad80..dd16e60 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -202,12 +202,15 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>  	struct kvm_pmc *pmc;
>  	u64 enabled, running;
> +	int fevent_code;
>  
>  	pmc = &kvpmu->pmc[cidx];
> -	if (!pmc->perf_event)
> -		return -EINVAL;
>  
> -	pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> +	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +		fevent_code = get_event_code(pmc->event_idx);
> +		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
> +	} else if (pmc->perf_event)
> +		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);

Here, and elsewhere, all branches of an if/else must use {} if one
branch needs them.
Patches 4 & 12 have similar issues, which checkpatch in the patchwork
CI stuff also complained about.

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230202/6bf08187/attachment-0001.sig>

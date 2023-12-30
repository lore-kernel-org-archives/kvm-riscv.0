From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Dec 2023 13:30:17 +0530
Subject: [v2 06/10] RISC-V: KVM: No need to update the counter value
 during reset
In-Reply-To: <20231229214950.4061381-7-atishp@rivosinc.com>
References: <20231229214950.4061381-1-atishp@rivosinc.com> <20231229214950.4061381-7-atishp@rivosinc.com>
Message-ID: <CAAhSdy2sce_joq3g230npQ5mHOL48bekzS2ChTsvtT=wGZVCvw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 30, 2023 at 3:20?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The virtual counter value is updated during pmu_ctr_read. There is no need
> to update it in reset case. Otherwise, it will be counted twice which is
> incorrect.
>
> Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_pmu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 86391a5061dd..8c44f26e754d 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -432,12 +432,9 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>                                 sbiret = SBI_ERR_ALREADY_STOPPED;
>                         }
>
> -                       if (flags & SBI_PMU_STOP_FLAG_RESET) {
> -                               /* Relase the counter if this is a reset request */
> -                               pmc->counter_val += perf_event_read_value(pmc->perf_event,
> -                                                                         &enabled, &running);
> +                       if (flags & SBI_PMU_STOP_FLAG_RESET)
> +                               /* Release the counter if this is a reset request */
>                                 kvm_pmu_release_perf_event(pmc);
> -                       }
>                 } else {
>                         sbiret = SBI_ERR_INVALID_PARAM;
>                 }
> --
> 2.34.1
>


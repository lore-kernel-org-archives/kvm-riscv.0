From: Anup Patel <anup@brainfault.org>
Date: Sat, 28 Jan 2023 20:17:59 +0530
Subject: [PATCH v3 02/14] perf: RISC-V: Improve privilege mode filtering
 for perf
In-Reply-To: <20230127182558.2416400-3-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-3-atishp@rivosinc.com>
Message-ID: <CAAhSdy3pCcbscpYa82Daji4bXT0EdosmH3Xn7MjeJPk-zTA_Yg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
>
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
> index 6b53adc..e862b13 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -301,6 +301,27 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
>  }
>  EXPORT_SYMBOL_GPL(riscv_pmu_get_hpm_info);
>
> +static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
> +{
> +       unsigned long cflags = 0;
> +       bool guest_events = false;
> +
> +       if (event->attr.config1 & RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS)
> +               guest_events = true;
> +       if (event->attr.exclude_kernel)
> +               cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VSINH : SBI_PMU_CFG_FLAG_SET_SINH;
> +       if (event->attr.exclude_user)
> +               cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VUINH : SBI_PMU_CFG_FLAG_SET_UINH;
> +       if (guest_events && event->attr.exclude_hv)
> +               cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> +       if (event->attr.exclude_host)
> +               cflags |= SBI_PMU_CFG_FLAG_SET_UINH | SBI_PMU_CFG_FLAG_SET_SINH;
> +       if (event->attr.exclude_guest)
> +               cflags |= SBI_PMU_CFG_FLAG_SET_VSINH | SBI_PMU_CFG_FLAG_SET_VUINH;
> +
> +       return cflags;
> +}
> +
>  static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  {
>         struct hw_perf_event *hwc = &event->hw;
> @@ -311,11 +332,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>         uint64_t cbase = 0;
>         unsigned long cflags = 0;
>
> -       if (event->attr.exclude_kernel)
> -               cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> -       if (event->attr.exclude_user)
> -               cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
> -
> +       cflags = pmu_sbi_get_filter_flags(event);
>         /* retrieve the available counter index */
>  #if defined(CONFIG_32BIT)
>         ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index a1c3f77..1c42146 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -26,6 +26,8 @@
>
>  #define RISCV_PMU_STOP_FLAG_RESET 1
>
> +#define RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS 0x1

For consistency other defines in this header:
s/RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS/RISCV_PMU_CONFIG1_GUEST_EVENTS/

> +
>  struct cpu_hw_events {
>         /* currently enabled events */
>         int                     n_events;
> --
> 2.25.1
>

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


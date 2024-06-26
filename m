From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 26 Jun 2024 08:24:38 -0500
Subject: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to hpmevent
 mapping while starting cpus
In-Reply-To: <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
Message-ID: <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-06-26 2:23 AM, Atish Patra wrote:
> From: Samuel Holland <samuel.holland@sifive.com>
> 
> Currently, we stop all the counters while a new cpu is brought online.
> However, the hpmevent to counter mappings are not reset. The firmware may
> have some stale encoding in their mapping structure which may lead to
> undesirable results. We have not encountered such scenario though.
> 

This needs:

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

otherwise your commit message looks fine to me.

> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index a2e4005e1fd0..94bc369a3454 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -762,7 +762,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>  	 * which may include counters that are not enabled yet.
>  	 */
>  	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -		  0, pmu->cmask, 0, 0, 0, 0);
> +		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
>  }
>  
>  static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> 



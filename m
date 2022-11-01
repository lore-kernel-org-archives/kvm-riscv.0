From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 1 Nov 2022 13:30:08 +0100
Subject: [RFC  1/9] RISC-V: Define a helper function to probe number of
 hardware counters
In-Reply-To: <20220718170205.2972215-2-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-2-atishp@rivosinc.com>
Message-ID: <20221101123008.e3bwen6f2yxi3whi@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 18, 2022 at 10:01:57AM -0700, Atish Patra wrote:
> KVM module needs to know how many hardware counters the platform supports.
> Otherwise, it will not be able to show optimal value of virtual
                                        ^ the
> counters to the guest.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 23 +++++++++++++++++------
>  include/linux/perf/riscv_pmu.h |  4 ++++
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 24124546844c..1723af68ffa1 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -27,6 +27,7 @@
>   */
>  static union sbi_pmu_ctr_info *pmu_ctr_list;
>  static unsigned int riscv_pmu_irq;
> +static struct riscv_pmu *rvpmu;

Do we really need rvpmu? From a quick scan of the series it's only used
for num_hw_counters, which has to be added to struct riscv_pmu, and
num_counters. How about instead creating a static global for num_counters
and then getting num_hw_counters by iterating pmu_ctr_list. If we want
riscv_pmu_sbi_get_num_hw_ctrs() to be faster, then we can cache the value
in a static variable in the function.

Thanks,
drew


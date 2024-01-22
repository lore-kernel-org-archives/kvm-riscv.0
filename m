From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 22 Jan 2024 13:21:33 +0100
Subject: [PATCH v5 02/12] KVM: arm64: selftests: Data type cleanup for
 arch_timer test
In-Reply-To: <173c9b64c4c43cd585f6b177a7d434dcedc905fa.1705916069.git.haibo1.xu@intel.com>
References: <cover.1705916069.git.haibo1.xu@intel.com>
 <173c9b64c4c43cd585f6b177a7d434dcedc905fa.1705916069.git.haibo1.xu@intel.com>
Message-ID: <20240122-0ddedacdeb64808477a7911d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 22, 2024 at 05:58:32PM +0800, Haibo Xu wrote:
> Change signed type to unsigned in test_args struct which
> only make sense for unsigned value.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/aarch64/arch_timer.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/aarch64/arch_timer.c b/tools/testing/selftests/kvm/aarch64/arch_timer.c
> index 274b8465b42a..3260fefcc1b3 100644
> --- a/tools/testing/selftests/kvm/aarch64/arch_timer.c
> +++ b/tools/testing/selftests/kvm/aarch64/arch_timer.c
> @@ -42,10 +42,10 @@
>  #define TIMER_TEST_MIGRATION_FREQ_MS	2
>  
>  struct test_args {
> -	int nr_vcpus;
> -	int nr_iter;
> -	int timer_period_ms;
> -	int migration_freq_ms;
> +	uint32_t nr_vcpus;
> +	uint32_t nr_iter;
> +	uint32_t timer_period_ms;
> +	uint32_t migration_freq_ms;
>  	struct kvm_arm_counter_offset offset;
>  };
>  
> @@ -57,7 +57,7 @@ static struct test_args test_args = {
>  	.offset = { .reserved = 1 },
>  };
>  
> -#define msecs_to_usecs(msec)		((msec) * 1000LL)
> +#define msecs_to_usecs(msec)		((msec) * 1000ULL)
>  
>  #define GICD_BASE_GPA			0x8000000ULL
>  #define GICR_BASE_GPA			0x80A0000ULL
> @@ -72,7 +72,7 @@ enum guest_stage {
>  
>  /* Shared variables between host and guest */
>  struct test_vcpu_shared_data {
> -	int nr_iter;
> +	uint32_t nr_iter;
>  	enum guest_stage guest_stage;
>  	uint64_t xcnt;
>  };
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


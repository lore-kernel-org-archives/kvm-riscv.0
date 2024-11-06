From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 6 Nov 2024 13:22:31 +0100
Subject: [kvm-unit-tests PATCH v2 3/3] riscv: sbi: Add two in hart_mask
 IPI test
In-Reply-To: <20241106113814.42992-8-andrew.jones@linux.dev>
References: <20241106113814.42992-5-andrew.jones@linux.dev>
 <20241106113814.42992-8-andrew.jones@linux.dev>
Message-ID: <20241106-7a94a002553733a6983389a0@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 06, 2024 at 12:38:18PM +0100, Andrew Jones wrote:
> We should ensure that when hart_mask has more than one hartid
> that both harts get IPIs with a single call of the IPI function.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  riscv/sbi.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index cdf8d13cc9cf..8ccdf42f902a 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -364,10 +364,11 @@ static void check_ipi(void)
>  	int nr_cpus_present = cpumask_weight(&cpu_present_mask);
>  	int me = smp_processor_id();
>  	unsigned long max_hartid = 0;
> +	unsigned long hartid1, hartid2;
>  	cpumask_t ipi_receivers;
>  	static prng_state ps;
>  	struct sbiret ret;
> -	int cpu;
> +	int cpu, cpu2;
>  
>  	ps = prng_init(0xDEADBEEF);
>  
> @@ -398,6 +399,42 @@ static void check_ipi(void)
>  	ipi_hart_check(&ipi_receivers);
>  	report_prefix_pop();
>  
> +	report_prefix_push("two in hart_mask");
> +
> +	if (nr_cpus_present < 3) {
> +		report_skip("3 cpus required");
> +		goto end_two;
> +	}
> +
> +	cpu = rand_online_cpu(&ps);
> +	hartid1 = cpus[cpu].hartid;
> +	hartid2 = 0;
> +	for_each_present_cpu(cpu2) {
> +		if (cpu2 == cpu || cpu2 == me)
> +			continue;
> +		hartid2 = cpus[cpu2].hartid;
> +		if (__builtin_labs(hartid2 - hartid1) < BITS_PER_LONG)

clang is complaining about these __builtin_labs calls not taking signed
input. I'll add this wrapper

 static long __labs(long a)
 {
    return __builtin_labs@;
 }

> +			break;
> +	}
> +	if (cpu2 == nr_cpus) {
> +		report_skip("hartids are too sparse");
> +		goto end_two;
> +	}
> +
> +	cpumask_clear(&ipi_done);
> +	cpumask_clear(&ipi_receivers);
> +	cpumask_set_cpu(cpu, &ipi_receivers);
> +	cpumask_set_cpu(cpu2, &ipi_receivers);
> +	on_cpu_async(cpu, ipi_hart_wait, (void *)d);
> +	on_cpu_async(cpu2, ipi_hart_wait, (void *)d);
> +	ret = sbi_send_ipi((1UL << __builtin_labs(hartid2 - hartid1)) | 1UL, hartid1 < hartid2 ? hartid1 : hartid2);
> +	report(ret.error == SBI_SUCCESS, "ipi returned success");
> +	while (!cpumask_equal(&ipi_done, &ipi_receivers))
> +		cpu_relax();
> +	ipi_hart_check(&ipi_receivers);
> +end_two:
> +	report_prefix_pop();
> +
>  	report_prefix_push("broadcast");
>  	cpumask_clear(&ipi_done);
>  	cpumask_copy(&ipi_receivers, &cpu_present_mask);
> -- 
> 2.47.0
> 


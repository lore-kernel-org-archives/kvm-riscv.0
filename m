From: Eric Auger <eric.auger@redhat.com>
Date: Thu, 7 Nov 2024 18:55:59 +0100
Subject: [kvm-unit-tests PATCH v2 3/3] lib/on-cpus: Fix on_cpumask
In-Reply-To: <20241031123948.320652-8-andrew.jones@linux.dev>
References: <20241031123948.320652-5-andrew.jones@linux.dev>
 <20241031123948.320652-8-andrew.jones@linux.dev>
Message-ID: <69196410-be02-4957-a871-a599dafe32d6@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Drew,

On 10/31/24 13:39, Andrew Jones wrote:
> on_cpumask should wait until the cpus in the mask, not including
> the calling cpu, are idle. Checking the weight against nr_cpus
> minus 1 only works when the mask is the same as the present mask.
>
> Fixes: d012cfd5d309 ("lib/on-cpus: Introduce on_cpumask and on_cpumask_async")
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>

looks good to me as well

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  lib/cpumask.h | 14 ++++++++++++++
>  lib/on-cpus.c | 17 ++++++++---------
>  2 files changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/lib/cpumask.h b/lib/cpumask.h
> index e1e92aacd1f1..37d360786573 100644
> --- a/lib/cpumask.h
> +++ b/lib/cpumask.h
> @@ -58,6 +58,20 @@ static inline void cpumask_clear(cpumask_t *mask)
>  	memset(mask, 0, sizeof(*mask));
>  }
>  
> +/* true if src1 is a subset of src2 */
> +static inline bool cpumask_subset(const struct cpumask *src1, const struct cpumask *src2)
> +{
> +	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
> +	int i;
> +
> +	for (i = 0; i < BIT_WORD(nr_cpus); ++i) {
> +		if (cpumask_bits(src1)[i] & ~cpumask_bits(src2)[i])
> +			return false;
> +	}
> +
> +	return !lastmask || !((cpumask_bits(src1)[i] & ~cpumask_bits(src2)[i]) & lastmask);
> +}
> +
>  static inline bool cpumask_empty(const cpumask_t *mask)
>  {
>  	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
> diff --git a/lib/on-cpus.c b/lib/on-cpus.c
> index 356f284be61b..889b6bc8a186 100644
> --- a/lib/on-cpus.c
> +++ b/lib/on-cpus.c
> @@ -127,24 +127,23 @@ void on_cpumask_async(const cpumask_t *mask, void (*func)(void *data), void *dat
>  void on_cpumask(const cpumask_t *mask, void (*func)(void *data), void *data)
>  {
>  	int cpu, me = smp_processor_id();
> +	cpumask_t tmp;
>  
> -	for_each_cpu(cpu, mask) {
> -		if (cpu == me)
> -			continue;
> +	cpumask_copy(&tmp, mask);
> +	cpumask_clear_cpu(me, &tmp);
> +
> +	for_each_cpu(cpu, &tmp)
>  		on_cpu_async(cpu, func, data);
> -	}
>  	if (cpumask_test_cpu(me, mask))
>  		func(data);
>  
> -	for_each_cpu(cpu, mask) {
> -		if (cpu == me)
> -			continue;
> +	for_each_cpu(cpu, &tmp) {
>  		cpumask_set_cpu(me, &on_cpu_info[cpu].waiters);
>  		deadlock_check(me, cpu);
>  	}
> -	while (cpumask_weight(&cpu_idle_mask) < nr_cpus - 1)
> +	while (!cpumask_subset(&tmp, &cpu_idle_mask))
>  		smp_wait_for_event();
> -	for_each_cpu(cpu, mask)
> +	for_each_cpu(cpu, &tmp)
>  		cpumask_clear_cpu(me, &on_cpu_info[cpu].waiters);
>  	smp_rmb(); /* pairs with the smp_wmb() in do_idle() */
>  }



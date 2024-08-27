From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue, 27 Aug 2024 17:21:43 +0200
Subject: [kvm-unit-tests PATCH] Changed cpumask_next to wrap instead of
 terminating after nr_cpus.
In-Reply-To: <20240826054038.11584-1-cade.richard@berkeley.edu>
References: <20240826054038.11584-1-cade.richard@berkeley.edu>
Message-ID: <20240827-a3f2014b839d6c39c110e15b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Patch summaries shouldn't have periods and they should be concise.

On Sun, Aug 25, 2024 at 10:40:38PM GMT, Cade Richard wrote:
> Changed cpumask_next() to wrap instead of terminating after nr_cpus.
> 
> Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
> ---
>  lib/cpumask.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/cpumask.h b/lib/cpumask.h
> index be191923..5105c3bd 100644
> --- a/lib/cpumask.h
> +++ b/lib/cpumask.h
> @@ -109,8 +109,10 @@ static inline void cpumask_copy(cpumask_t *dst, const cpumask_t *src)
>  
>  static inline int cpumask_next(int cpu, const cpumask_t *mask)
>  {
> -	while (++cpu < nr_cpus && !cpumask_test_cpu(cpu, mask))
> -		;
> +	do {
> +		if (++cpu > nr_cpus)

Should be ++cpu == nr_cpus, but...

> +			cpu = 0;
> +	} while (!cpumask_test_cpu(cpu, mask));

...this will break everything. See for_each_cpu().

Nack

drew

>  	return cpu;
>  }
>  
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

